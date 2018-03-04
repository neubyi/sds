module Test = struct
  let parse fn = Conf.load fn
end

open Conf

let config_err =
  let module M = struct
    type t = Conf.config
    let pp ppf c =
      Fmt.pf ppf "%d %a %s %s %s"
        c.version
        (Fmt.list ~sep:Fmt.nop Fmt.string) c.dest_email_addrs
        c.from_email_addr
        c.mta_hostname
        c.mta_port
    let equal c c' =
      c.version = c'.version &&
      c.dest_email_addrs = c'.dest_email_addrs &&
      c.from_email_addr = c'.from_email_addr &&
      c.mta_hostname = c'.mta_hostname &&
      c.mta_port = c'.mta_port
  end in
  (module M: Alcotest.TESTABLE with type t = M.t)
        
let parse () =
  let r = {
    version = 0 ;
    dest_email_addrs = ["test_to_1@example.com"; "test_to_2@example.com"] ;
    from_email_addr = "test_from@example.com" ;
    mta_hostname = "localhost" ;
    mta_port = "1025" ;
  } in
  Alcotest.(check config_err) "same config" r (Test.parse "test/test.conf")

let tests = [
  "Load config from file", `Quick, parse;
]

let () =
  Alcotest.run "config" [
    "test_set", tests;
  ]
