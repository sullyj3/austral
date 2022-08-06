open Identifier

type compiler

val empty_compiler : compiler

val compiler_code : compiler -> string

type module_source =
  | TwoFileModuleSource of {
      int_filename: string;
      int_code: string;
      body_filename: string;
      body_code: string
    }
  | BodyModuleSource of {
      body_filename: string;
      body_code: string
    }

val compile_mod : compiler -> module_source -> compiler

val compile_multiple : compiler -> module_source list -> compiler

val compile_entrypoint : compiler -> module_name -> identifier -> compiler
