#use "MyOCaml.ml";;

let _ =
  int1_foreach 5 (fun i -> print_int i)

(*
  PYTHON:
  for i in range(5):
    print(i)
*)


let x0 = int1_forall 5 (fun i -> i = 5) (* do all numbers in the bound = 5? *)
(*
   PYTHON:
   for i in range(5):
    b = b & (i==5)
*)


let x1 = int1_forall 5 (fun i -> i > -1)


let isPrime x =
int1_forall x (fun i ->
  if i <= 1 then true
  else
    if x mod i = 0 then false
    else true)

let isPrimeClean x =
  int1_forall x (fun i ->
    if i <= 1 then true
    else not (x mod i =0))

(*
    PYTHON:
    def isPrime(x):
      if i <= 1:
        b = b && (x % i == 0)
      else:
        b = b && (x % i == 0)
      return b
*)



let s0 =
  string_make_fwork (fun work ->
    work 'c')

let s1 =
  string_make_fwork (fun work ->
    work 'a'; work 'b') (* semicolon means you execute LHS for the side effects then execute RHS for output *)

let string_init len f =
  string_make_fwork (fun work ->
    int1_foreach len (fun i ->
      work (f i)))

(*
    PYTHON:
    for i in range(len):
      print(f(i))
*)


let s2 =
  string_make_fwork (fun work ->
    int1_foreach 5 (fun i ->
      work '[';
      int1_foreach (i+1) (fun _ ->
        work 'x'
  );
      work ']'))

(*
    PYTHON:
    for i in range(5):
      print('[')
      for _ in range(i+1)
        print('x')
      print(']')
*)


let
string_cons
(c0:char)(cs:string): string =
string_make_fwork
(fun work ->
 (work(c0); string_foreach(cs)(work)))


let rec order(cs): string =
string_get_at(cs)(0);;
let
string_append
(cs1:string)
(cs2:string): string =
string_make_fwork
(fun work ->
 (string_foreach(cs1)(work); string_foreach(cs2)(work))) in
 string_get_at()(1) (* THIS DOESN'T WORK; CAN DELETE IF NEEDED *)


let rectangle h w =
  string_make_fwork (fun work ->
  int1_foreach h (fun _ -> 
  int1_foreach w (fun _ ->
    work 'x'
    
    );
    work '\n'
    ))

(*
  PYTHON:
  for _ in range(h):
    for _ in rage(w):
      print('x')
    print('\n')
*)


let triangle h w =
  let k = (float_of_int w) /. (float_of_int h) in
  string_make_fwork (fun work ->
    int1_foreach h (fun i ->
      int1_foreach (int_of_float(k *. float_of_int(i+1))) (fun _ ->
        work 'x'
    );
    work '\n'
  ))

(*
  PYTHON:
  def triangle(h, w):
    k= w / h
    for in in range(h):
      for _ in range(k * (i+1)):
        print('x'):
      print('\n')
    return
*)