(* ****** ****** *)
(*
 MyOCaml.ml is a library
 built for CS320, Fall, 2023
*)
(* ****** ****** *)
exception False;;
(* ****** ****** *)

let chr = Char.chr
let ord = Char.code
let str(c0) = String.make 1 c0
;;
(* ****** ****** *)

let
char_islower(ch: char) =
(ch >= 'a' && ch <= 'z')
let
char_isupper(ch: char) =
(ch >= 'A' && ch <= 'Z')

let
char_isletter(ch: char) =
(ch >= 'a' && ch <= 'z')
||
(ch >= 'A' && ch <= 'Z')

(* ****** ****** *)

let
char_tolower(ch: char) =
if
char_isupper(ch)
then
chr(ord(ch) - ord('A') + ord('a')) else ch

let
char_toupper(ch: char) =
if
char_islower(ch)
then
chr(ord(ch) - ord('a') + ord('A')) else ch

(* ****** ****** *)

let
char_of_digit
(d0: int): char =
let
() = assert(d0 >= 0) in
let
() = assert(d0 <= 9) in chr(ord('0') + d0)
;;(* end of [char_of_digit] *)

(* ****** ****** *)

let
digit_of_char
(ch: char): int =
let
() = assert(ch >= '0') in
let
() = assert(ch <= '9') in ord(ch) - ord('0')
;;(* end of [digit_of_char] *)

(* ****** ****** *)

type
('xs, 'x0) forall =
'xs -> ('x0 -> bool) -> bool

type
('xs, 'x0) foreach =
'xs -> ('x0 -> unit) -> unit
type
('xs, 'x0) rforeach =
'xs -> ('x0 -> unit) -> unit

type
('xs, 'x0) listize = 'xs -> 'x0 list
type
('xs, 'x0) arrnize = 'xs -> 'x0 array

type
('xs, 'x0) rlistize = 'xs -> 'x0 list
type
('xs, 'x0) rarrnize = 'xs -> 'x0 array

type
('xs, 'x0, 'y0) map_list =
'xs -> ('x0 -> 'y0) -> 'y0 list
type
('xs, 'x0, 'y0) maprev_list =
'xs -> ('x0 -> 'y0) -> 'y0 list

type
('xs, 'x0, 'r0) foldleft =
'xs -> 'r0 -> ('r0 -> 'x0 -> 'r0) -> 'r0
type
('xs, 'x0, 'r0) foldright =
'xs -> 'r0 -> ('x0 -> 'r0 -> 'r0) -> 'r0

(* ****** ****** *)

let
int1_foreach
(n0:int)
(work: int -> unit): unit =
for i0 = 0 to n0-1 do work(i0) done

let
int1_rforeach
(n0:int)
(work: int -> unit): unit =
for i0 = 0 to n0-1 do work(n0-1-i0) done

(* ****** ****** *)

let
string_init = String.init;;

(* ****** ****** *)

let
string_length = String.length
;;
let
string_get_at
(cs:string)(i0:int): char = String.get cs i0
;;
(* ****** ****** *)

let
string_cons
(c0: char)(cs: string): string =
string_init
(string_length(cs) + 1)
(fun i ->
 if i <= 0
 then c0 else string_get_at cs (i-1))
;;
(* ****** ****** *)

let
string_toupper
(cs: string): string =
string_init
(string_length(cs))
(fun i0 ->
 char_toupper(string_get_at(cs)(i0)))

let
string_tolower
(cs: string): string =
string_init
(string_length(cs))
(fun i0 ->
 char_tolower(string_get_at(cs)(i0)))

(* ****** ****** *)

let
string_foreach
(cs: string)
(work: char -> unit) =
int1_foreach
(string_length(cs))
(fun i0 -> work(string_get_at(cs)(i0)))

let
string_rforeach
(cs: string)
(work: char -> unit) =
int1_rforeach
(string_length(cs))
(fun i0 -> work(string_get_at(cs)(i0)))

(* ****** ****** *)

let
string_tabulate = String.init
;;
(* ****** ****** *)

let
list_arrnize
(xs: 'a list): 'a array = Array.of_list(xs)

(* ****** ****** *)

let rec
list_revapp
(xs: 'a list)
(ys: 'a list): 'a list =
match xs with
| [] -> ys
| x1 :: xs -> list_revapp(xs)(x1 :: ys)

let
list_reverse
(xs: 'a list): 'a list = list_revapp(xs)([])

(* ****** ****** *)

let rec
list_forall
(xs: 'a list)
(test: 'a -> bool): bool =
(
match xs with
  [] -> true
| x1 :: xs -> test(x1) && list_forall(xs)(test))

let rec
list_exists
(xs: 'a list)
(test: 'a -> bool): bool =
(
match xs with
  [] -> false
| x1 :: xs -> test(x1) || list_exists(xs)(test))

(* ****** ****** *)

let rec
list_foreach
(xs: 'a list)
(work: 'a -> unit): unit =
(
match xs with
  [] -> ()
| x1 :: xs -> (work(x1); list_foreach(xs)(work)))
;;
(* ****** ****** *)
(* ****** ****** *)
(* ****** ****** *)

let
forall_to_foreach
( forall
: ('xs, 'x0) forall): ('xs, 'x0) foreach =
fun(xs)(work) ->
let _ =
  forall(xs)(fun(x0) -> (work(x0); true)) in ()
;;
(* ****** ****** *)

let
foreach_to_forall
( foreach
: ('xs, 'x0) foreach): ('xs, 'x0) forall =
fun(xs)(test) ->
try
let
() = foreach(xs)
(
fun(x0) ->
if test(x0) then () else raise False)
in
  ( true )
with False(*void*) -> (false) 
;;(* end of [foreach_to_forall]: let *)

(* ****** ****** *)

let
foreach_to_foldleft
( foreach
: ('xs, 'x0) foreach)
: 'xs -> 'r0 -> ('r0 -> 'x0 -> 'r0) -> 'r0 =
fun
(xs)(r0)(fopr) ->
let
res = ref(r0) in
foreach(xs)
(fun(x0) -> res := fopr(!res)(x0)); !res
;;(* end of [foreach_to_foldleft]: let *)

(* ****** ****** *)

let rec
foreach_to_map_list
( foreach
: ('xs, 'x0) foreach)
: ('xs, 'x0, 'y0) map_list =
fun(xs)(fopr) ->
list_reverse
(foreach_to_maprev_list(foreach)(xs)(fopr))

and
foreach_to_maprev_list
( foreach
: ('xs, 'x0) foreach)
: ('xs, 'x0, 'y0) maprev_list =
fun
(xs)(fopr) ->
let
res = ref([]) in
foreach(xs)
(fun(x0) -> res := fopr(x0) :: !res); !res
;;(* end of [foreach_to_maprev_list]: let *)

(* ****** ****** *)

let rec
foreach_to_listize
( foreach
: ('xs, 'x0) foreach
) : ('xs, 'x0) listize =
fun(xs) ->
foreach_to_map_list(foreach)(xs)(fun x -> x)

let rec
foreach_to_rlistize
( foreach
: ('xs, 'x0) foreach
) : ('xs, 'x0) rlistize =
fun(xs) ->
foreach_to_maprev_list(foreach)(xs)(fun x -> x)

(* ****** ****** *)

let rec
foreach_to_arrnize
( foreach
: ('xs, 'x0) foreach
) : ('xs, 'x0) arrnize =
(
 fun xs ->
 list_arrnize(foreach_to_listize(foreach)(xs)))

let rec
foreach_to_rarrnize
( foreach
: ('xs, 'x0) foreach
) : ('xs, 'x0) rarrnize =
(
 fun xs ->
 list_arrnize(foreach_to_rlistize(foreach)(xs)))

(* ****** ****** *)

let rec
foreach_to_length
( foreach
: ('xs, 'x0) foreach): 'xs -> int =
foldleft_to_length(foreach_to_foldleft(foreach))

and
foldleft_to_length
( foldleft
: ('xs,'x0,'r0) foldleft): 'xs -> int =
(
fun(xs) -> foldleft(xs)(0)(fun(r0)(x0) -> r0+1))
;;
(* ****** ****** *)

let
rforeach_to_foldright
( rforeach
: ('xs, 'x0) rforeach)
: ('xs, 'x0, 'r0) foldright =
fun
(xs)(r0)(fopr) ->
let
res = ref(r0) in
rforeach(xs)
(fun(x0) -> res := fopr(x0)(!res)); !res
;;(* end of [rforeach_to_foldright]: let *)

(* ****** ****** *)
(* ****** ****** *)
(* ****** ****** *)

let
int1_forall(n0) =
foreach_to_forall(int1_foreach)(n0)
;;
let
string_forall(cs) =
foreach_to_forall(string_foreach)(cs)
;;

(* ****** ****** *)
(* ****** ****** *)
(* ****** ****** *)

let
int1_listize(n0) =
foreach_to_listize(int1_foreach)(n0)
let
int1_rlistize(n0) =
foreach_to_rlistize(int1_foreach)(n0)

let
string_listize(cs) =
foreach_to_listize(string_foreach)(cs)
let
string_rlistize(cs) =
foreach_to_rlistize(string_foreach)(cs)

(* ****** ****** *)

let
int1_foldleft(n0) =
foreach_to_foldleft(int1_foreach)(n0)
let
string_foldleft(cs) =
foreach_to_foldleft(string_foreach)(cs)
;;
let
int1_foldright(n0) =
rforeach_to_foldright(int1_rforeach)(n0)
let
string_foldright(cs) =
rforeach_to_foldright(string_rforeach)(cs)
;;

(* ****** ****** *)
(* ****** ****** *)
(* ****** ****** *)

let
list_make_foreach
( xs: 'xs)
( foreach
: ('xs, 'x0) foreach): 'x0 list =
(
  foreach_to_listize(foreach)(xs))
let
list_make_rforeach
( xs: 'xs)
( rforeach
: ('xs, 'x0) rforeach): 'x0 list =
(
  foreach_to_rlistize(rforeach)(xs))
;;
(* ****** ****** *)

let
string_make_foreach
( xs: 'xs)
( foreach
: ('xs, char) foreach): string =
let
xs =
foreach_to_arrnize(foreach)(xs) in
String.init (Array.length(xs)) (fun i -> xs.(i))
;;
let
string_make_rforeach
( xs: 'xs)
( rforeach
: ('xs, char) rforeach): string =
let
xs =
foreach_to_rarrnize(rforeach)(xs) in
String.init (Array.length(xs)) (fun i -> xs.(i))
;;
(* ****** ****** *)
(* ****** ****** *)
(* ****** ****** *)

let
list_append
(xs: 'a list)
(ys: 'a list): 'a list =
list_make_foreach
(xs,ys)
(
fun(xs, ys) work ->
(list_foreach xs work; list_foreach ys work))

let
list_concat
(xss: 'a list list): 'a list =
list_make_foreach
( xss )
(
fun xss work ->
list_foreach xss (fun xs -> list_foreach xs work))

(* ****** ****** *)
(* ****** ****** *)
(* ****** ****** *)

(* end of [CS320-2023-Fall-classlib-MyOCaml.ml] *)
