#use "MyOCaml.ml";;

(*
int1_foldleft: int -> 'a -> ('a -> int -> 'a) -> 'a
                n     init  acc    i     'acc   return acc
int1_foldleft IN PYTHON:
acc = init
for i in range(n):
  acc = work(acc,i)
return acc

int1_foldleft is basically a for loop with a built in range
*)



let foo3 n =
  int1_foldleft n 0 (fun acc i -> acc + i)
(*
PYTHON:
acc = 0
for i in range(10):
  acc=acc+i
return acc
*)


let rec fact0 n =
  if n <=0 then 1
  else n * fact0(n-1)
(*
PYTHON:
def fact(n):
  acc = 1
  for i in range(n):
    acc = i * acc
  return acc
*)

let fact n =
int1_foldleft n 1 (fun acc i -> (i + 1) * acc)



let rec fibo0 n =
  if n = 0 then 0
  else if n = 1 then 1
  else fibo0 (n-1) + fibo0 (n-2)
(*
PYTHON:
def fibo(n):
  a=0
  b=1
  for _ in range(n):
    tmp = a
    a = b
    b = tmp + b
  return a
*)

let fibo n =
  let a, _ =
    int1_foldleft n (0,1) (fun (a,b) _ -> (b, a+b))
  in a
;;


let xs0 =
  int1_foldleft 100 [] (fun acc i -> i :: acc)
(*
let xs1 =
  int1_foldright 100 [] (fun acc i -> i :: acc) (* '::' is adding an element to front of list *)
*)
let sum xs = list_foldleft xs 0 (fun acc x -> acc + x)
(*
PYTHON:
def sum(xs):
  acc=0
  for x in xs:
    acc = acc + x
  return acc
*)


let rev xs =
  list_foldleft xs [] (fun acc x -> x :: acc) (* this reverses xs *)
(*
PYTHON:
def rev(xs):
  acc = []
  for x in xs:
    acc = cons(x, acc)
  return acc
*)





(* ASSIGN 2 TESTING: *)
type 'a mylist =
  | MyNil
  | MyCons of 'a * 'a mylist
  | MySnoc of 'a mylist * 'a
  | MyReverse of 'a mylist
  | MyAppend2 of 'a mylist * 'a mylist

(* ****** ****** *)
exception MySubscript;;


let rec
mylist_foreach
(xs: 'a mylist)
(work: 'a -> unit): unit =
match xs with
| MyNil -> ()
| MyCons(x1, xs) ->
  (work(x1); mylist_foreach(xs)(work))
| MySnoc(xs, x1) ->
  (mylist_foreach(xs)(work); work(x1))
| MyReverse(xs) -> mylist_rforeach(xs)(work)
| MyAppend2(xs1, xs2) ->
  (mylist_foreach(xs1)(work); mylist_foreach(xs2)(work))

and
mylist_rforeach
(xs: 'a mylist)
(work: 'a -> unit): unit =
match xs with
| MyNil -> ()
| MyCons(x1, xs) ->
  (mylist_rforeach(xs)(work); work(x1))
| MySnoc(xs, x1) ->
  (work(x1); mylist_rforeach(xs)(work))
| MyReverse(xs) -> mylist_foreach(xs)(work)
| MyAppend2(xs1, xs2) ->
  (mylist_rforeach(xs2)(work); mylist_rforeach(xs1)(work))
;;