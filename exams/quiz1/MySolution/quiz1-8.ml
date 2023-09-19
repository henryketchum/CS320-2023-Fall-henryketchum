(* ************************************************ *)

(*

 Question 8: 20 points
 Please give a NON-RECURSIVE implementation of sort5
 that takes 5 integers and returns a tuple that consists
 exactly of the 5 given integers ordered increasingly

 For instance, sort5(1, 2, 1, 2, 1) = (1, 1, 1, 2, 2)
 For instance, sort5(1, 3, 4, 5, 2) = (1, 2, 3, 4, 5)
 For instance, sort5(1, 3, 5, 4, 2) = (1, 2, 3, 4, 5)

 You can implement your own helper functions as long as
 you do not make use of recursion.

*)

let sort5: int*int*int*int*int -> int*int*int*int*int =
  (* YOUR CODE *)
  compare(index(0)) (index(1))
  compare(index(0)) (index (2))
  compare(index(0)) (index (3))
  compare(index(0)) (index (4))
  compare(index(1)) (index (2))
  compare(index(1)) (index (3))
  compare(index(1)) (index (4))
  compare(index(2)) (index (3))
  compare(index(2)) (index (4))
  compare(index(3)) (index (4))

  let compare(x:int)(y:int): int =
  if x>y then temp=index(y); index(y)=index(x); index(x)=temp
  else x y

  let index(i:int): int =
  sort5[i]
;;
(* ************************************************ *)
