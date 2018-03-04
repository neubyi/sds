type config = {
  version : int ;
  dest_email_addrs : string list ;
  from_email_addr : string ;
  mta_hostname : string ;
  mta_port : string ;
}

val load : string -> config
