#use "MyOCaml.ml";;

let rec
mylist_length(xs: 'a mylist): int =
  match xs with
  | [] -> 0
  | h :: t -> 1 + mylist_length(t)


let mylist_length =
fun xs -> foreach_to_length(mylist_foreach)
