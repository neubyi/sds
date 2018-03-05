#!/usr/bin/env ocaml
#use "topfind"
#require "topkg"
open Topkg

let () =
  Pkg.describe "sds" @@ fun c ->
  Ok [ Pkg.bin "src/send";
       Pkg.bin "src/recv";
       Pkg.mllib "src/sds.mllib";
       Pkg.test "test/test"; ]
