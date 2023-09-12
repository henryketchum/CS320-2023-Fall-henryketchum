
#use "./../assign0.ml";;

let string_length = String.length
let string_init = String.init
let chr = Char.chr

;;

let int2str(i0: int): string =
  string_init( intLength(0) ) ( intAtPoint(0) )
;;

let rec
intLength(x: int): int =
  if i0 > 0 then (i0/10) intLength(x+1) else x
;;

let rec
intAtPoint(i: int): char = (*i starts at 0!*)
  if i <= intLength(i0) then chr((divByTen(0)%10)) else intAtPoint(i+1) (*exponent will not work here*)
;;

let rec
divByTen(y: int): int
  if i < y then i0 else ((i0 = i0 / 10)) divByTen(y+1)
;;

in int2str(124)


(*
124/10 (+1)
12/10 (+1)
2/10 (+1)

return 3



i = 1
curr = 2
when curr = i, return # at i

2 124%10 -> 4,  1 12%10 -> 2, 0 return 1%10 -> 1
*)