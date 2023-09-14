
#use "./../assign0.ml";;

let isPrime(n0: int): bool =
  let rec
  divideCheck(x: int): bool =
    if ((x < n0) && (x > 1)) && (n0 mod x = 0) then false (* if n0 has other divisors apart from 1 and itself*)
    else if x>=n0 then true (* else if n0 has no other divisor apart from 1 and itself*)
    else divideCheck(x+1)
  in
  divideCheck(2)
;;