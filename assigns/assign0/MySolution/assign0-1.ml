
#use "./../assign0.ml";;

let rec
fact(x: int): int =
if x > 0 then fact(x-1) * x  else 1 (* multiply x by (x-1) until x = 1 *)
;;

let rec
myloop(x: int): int =
if fact(x) = 0 then x else myloop(x+1) (* return the first x in fact(x) that returns 0 *)
;;

let myans = myloop(0)
;;