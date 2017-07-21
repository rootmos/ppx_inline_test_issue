open Core_kernel.Std

let%test_unit _ =
  [%test_result: int]
  (2 + 2)
  ~expect:5

let () = Ppx_inline_test_lib.Runtime.exit ()
