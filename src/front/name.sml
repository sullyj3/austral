(*
    Copyright 2018–2019 Fernando Borretti <fernando@borretti.me>

    This file is part of Austral.

    Austral is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Austral is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Austral.  If not, see <http://www.gnu.org/licenses/>.
*)

structure Name : NAME = struct
    (* Alphabet definition utilities *)

    val alpha = "abcdefghijklmnopqrstuvwxyz"
    val alphaup = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    val num = "0123456789"

    (* Module names *)

    val moduleNameAlphabet =
        let val sym = "-."
        in
            alpha ^ alphaup ^ num ^ sym
        end

    (* Identifiers *)

    datatype ident = Identifier of string

    val identAlphabet =
        let val sym = "$#?@~^'."
        in
            alpha ^ alphaup ^ num ^ sym
        end

    fun isValidIdent s =
        let val sigma = explode identAlphabet
        in
            List.all (fn c => Util.member c sigma) (explode s)
        end

    fun mkIdent s =
        if isValidIdent s then
            SOME (Identifier s)
        else
            NONE

    fun mkIdentEx s =
        if isValidIdent s then
            Identifier s
        else
            raise Fail "Not a valid identifier. This is an internal compiler bug stemming from a different between the Ident structure's definition of an identifier and the parser's definition."

    fun identString (Identifier s) = s
end
