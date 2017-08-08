module Views.Profile exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (Msg)
import Models exposing (Model, UserId)
import Styles exposing (..)
import Utils exposing (authorHandleString, decodeString)


-- VIEW


view : Model -> UserId -> Html Msg
view model userId =
    div [ Styles.pageWrapper ]
        [ div []
            [ text "Profile "
            , text (authorHandleString (decodeString userId))
            ]
        ]
