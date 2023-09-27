#use "/home/henryk/CS320-2023-Fall/CS320-2023-Fall-henryketchum/assigns/assign2/assign2.ml"
#use "/home/henryk/CS320-2023-Fall/CS320-2023-Fall-henryketchum/assigns/assign2/MySolution/OCaml/MyOCaml.ml";;

let rec
mylist_length(xs: 'a mylist): int =
  match xs with
  | MyNil -> 0
  | MyCons (_, xs) -> 1 + mylist_length xs
  | MySnoc (xs, _) -> 1 + mylist_length xs
  | MyReverse (xs) -> 1 + mylist_length xs
  | MyAppend2 (_, _) -> 1 + mylist_length xs
;;

let mylist_length =
fun xs -> foreach_to_length(mylist_foreach)
