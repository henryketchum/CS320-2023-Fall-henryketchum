
#use "./../assign0.ml";;

let string_get(cs, i0) = String.get cs i0
let ord = Char.code

;;

fun str2int(cs: string): int
  string_get(cs, i0)
  ord(i0)
;;