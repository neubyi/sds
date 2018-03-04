open Sexplib.Conv

type config = {
  version : int ;
  dest_email_addrs : string list ;
  from_email_addr : string ;
  mta_hostname : string ;
  mta_port : string ;
} [@@deriving sexp]

let current_version = 0

let load fn =
  config_of_sexp @@ Sexplib.Sexp.load_sexp fn

(* let () = *)
(*   let c = load "test.conf" in *)
(*   print_endline (Sexplib.Sexp.to_string c); *)
(*   List.iter print_endline (config_of_sexp c).dest_email_addrs *)
