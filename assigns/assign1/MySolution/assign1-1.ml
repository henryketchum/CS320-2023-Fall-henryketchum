(* ****** ****** *)
#use "MyOCaml.ml";;
(* ****** ****** *)

let rec (* get the length of the inputted number (from one of the lecture-09-12 notes on GitHub) *)
getLen(n0: int): int =
if n0 < 10 then 1 else 1+getLen(n0/10)

let intrev10(n: int): int =
  let rec
  loop(n0: int)(output: int)(exponent: int): int = (* three inputs: the number, the output
     (the reversed int), and the exponent that will be 10 multiplied by. *)
    if n0 <= 0 then output (* if the number is less than 0, that is if we've looped through all the digits, then return the output.*)
    else loop(n0/10) (output + (n0 mod 10)* int_of_float(10. ** float_of_int(exponent))) (exponent - 1) in
    (* loop(number/10 to get to the next digit) (the output is the (number mod 10)*10^exponent) (decrement minus)*)
  loop (n) (0) ((getLen n)-1)

  (*
    HOW THIS WORKS:
    this loop takes in a number, eg 54321 and outputs 12345 by using mod, for example:
    54321 mod 10 * 10^4 (4 is getLen-1) = 10000
    Divide the int by 10 to get 5432
    5432 mod 10 * 10^3 = 2000
    ...

    if we add up 10000, 2000, 300, 40, and 5, we get 12345, which is the reversed int.
  *)