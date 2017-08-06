module Models.Main exposing (..)

import Http exposing (..)
import String.Extra exposing (..)


type alias Motto =
    String


type alias Author =
    String


type alias Model =
    { author : Author
    , motto : Motto
    }


authorString : String -> String
authorString author =
    case author of
        "" ->
            "create"

        _ ->
            "- " ++ String.Extra.decapitalize author


decodeAuthorString : Author -> Author
decodeAuthorString author =
    case decodeUri author of
        Nothing ->
            author

        Just decoded ->
            authorString decoded
