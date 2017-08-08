module Utils exposing (..)

import Http exposing (decodeUri)
import Models exposing (UserHandle)
import String.Extra exposing (decapitalize)


authorHandleString : UserHandle -> String
authorHandleString handle =
    case handle of
        "" ->
            "No handle."

        _ ->
            String.Extra.decapitalize handle


decodeString : String -> String
decodeString string =
    case decodeUri string of
        Nothing ->
            ""

        Just decoded ->
            decoded
