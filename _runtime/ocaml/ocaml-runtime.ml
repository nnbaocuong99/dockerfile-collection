let () =
  Printf.printf "OCaml Runtime Environment\n";
  Printf.printf "OCaml version: %s\n" Sys.ocaml_version;
  Printf.printf "Current working directory: %s\n" (Sys.getcwd ());
  Printf.printf "Operating System: %s\n" Sys.os_type;

  (* Measure execution time *)
  let start_time = Sys.time () in

  (* Add your application logic here *)
  (* For example: *)
  (* App.start (); *)

  let end_time = Sys.time () in
  Printf.printf "Execution time: %f seconds\n" (end_time -. start_time)

(* To compile: ocamlc runtime.ml -o runtime *)
(* To run: ./runtime *)
