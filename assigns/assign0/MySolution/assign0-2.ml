
#use "./../assign0.ml";;

let isPrime(n0: int): bool =
  let rec
  divideCheck(x: int): bool =
    if ((x < n0) && (x > 1)) && (n0 mod x = 0) then false
    else if x>=n0 then true
    else divideCheck(x+1)
  in
  divideCheck(2)
;;
