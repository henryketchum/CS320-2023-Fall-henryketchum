#use "MyOCaml.ml";;

let
string_merge (cs1:string) (cs2:string): string =
string_make_fwork
(fun work ->
 (string_foreach(cs1)(work); string_foreach(cs2)(work)));;

let rec order(cs:string) (strLen:int): string =
  x = string_get_at(cs) (strLen)
  y = string_get_at(cs) (strLen - 1)
  if strLen = 0 then x
  else if x < y then y=x
  else order(cs) (strLen - 1)



(*
  This code doesn't work, however I believe the logic is correct (I just couldn't figure out how to implement it in OCaml)
*)