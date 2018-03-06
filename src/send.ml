open Lwt.Infix
open Astring

(* ghetto smtp! TODO: use https://opam.ocaml.org/packages/smtp/ instead *)
let rec wait_for_250 ic =
  Lwt_io.read_line ic >>= fun resp ->
  if String.is_prefix ~affix:"250 " resp then
    Lwt.return_unit
  else
    Lwt_io.printlf "DEBUG: got %S" resp >>= fun _ ->
    wait_for_250 ic
    
let smtp_send (ic, oc) lines =
  let f _ elem =
    Lwt_io.write_line oc elem >>= fun _ ->
    wait_for_250 ic in
  Lwt_list.fold_left_s f () lines (* TOOO: handle errors *)
  
let send_email email_address body =
  let inet_addr = Unix.ADDR_INET (Unix.inet_addr_of_string "127.0.0.1", 1025) in
  Lwt_io.with_connection inet_addr begin fun (channels) ->
    smtp_send channels ["ehlo example.com";
                        "mail from: <test@example.com>";
                        "rcpt to: <" ^ email_address ^ ">";
                        "data";
                        body;
                        "."]
  end
      
(* let () = *)
(*   let dest = "neubyi@4711.se" in *)
(*   print_endline ("Sending email to " ^ dest); *)
(*   Lwt_main.run (send_email dest "This is a test message") *)
