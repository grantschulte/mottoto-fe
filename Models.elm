module Models exposing (..)

import Http exposing (decodeUri)
import String.Extra exposing (decapitalize)


type alias Motto =
    String


type alias UserId =
    String


type alias UserHandle =
    String


type alias Author =
    { handle : UserHandle
    , id : UserId
    }


type alias User =
    { handle : UserHandle
    , id : UserId
    }


type alias Model =
    { user : Maybe User
    , author : Maybe Author
    , motto : Motto
    , page : Page
    }


type Page
    = AuthorPage UserId
    | LoginPage
    | ComposePage
    | NewHandlePage
    | ProfilePage UserId
    | WelcomePage
