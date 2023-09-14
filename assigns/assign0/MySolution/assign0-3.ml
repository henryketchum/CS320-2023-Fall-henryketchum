
#use "./../assign0.ml";;

let string_length = String.length
let string_init = String.init
let chr = Char.chr
;;

let int2str(i0: int): string =
  string_init( intLength(x) ) ( intAtPoint(i) )
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
This code doesn't pass the autograder, but I think the logic is sound.
It takes uses string_init with seperate functions to get the length of the int and the int at the current point
intLength: simply uses repeatedly dividing by 10 to find the number of digits in the int
intAtPoint: uses dividing by a power of 10 (there is a seperate function for this) and mod to find the current int 
*)








(*
PROGRAMMING NOTES:
124/10 (+1)
12/10 (+1)
2/10 (+1)

return 3



i = 1
curr = 2
when curr = i, return # at i

2 124%10 -> 4,  1 12%10 -> 2, 0 return 1%10 -> 1
*)