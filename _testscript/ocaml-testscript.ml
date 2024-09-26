(* test_main.ml *)

open OUnit2
open Main

let tests = "test suite for main" >::: [
  "test_add_positive" >:: (fun _ -> assert_equal 2 (add 1 1));
  "test_add_negative" >:: (fun _ -> assert_equal 0 (add (-1) 1));
  "test_add_zero" >:: (fun _ -> assert_equal 0 (add 0 0));
]

let () = run_test_tt_main tests

(* Run tests using: 
   ocamlfind ocamlc -o test_main -package oUnit -linkpkg -g main.ml test_main.ml
   ./test_main
   
   Make sure to install OUnit:
   opam install ounit
*)
