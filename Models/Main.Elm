module Models.Main exposing (..)

import Http exposing (..)
import String.Extra exposing (..)


type alias Motto =
    String


type alias AuthorId =
    String


type alias Author =
    { name : String
    , id : AuthorId
    }


type Page
    = AuthorPage AuthorId
    | Login
    | Motto
    | NewAccount
    | Profile
    | WelcomePage


type alias Model =
    { author : Maybe Author
    , motto : Motto
    , page : Page
    }


authorString : String -> String
authorString author =
    "- " ++ String.Extra.decapitalize author


decodeString : String -> String
decodeString string =
    case decodeUri string of
        Nothing ->
            ""

        Just decoded ->
            decoded
