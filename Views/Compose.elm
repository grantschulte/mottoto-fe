module Views.Compose exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (Msg)
import Models exposing (Model)
import Styles exposing (..)


-- VIEW


view : Model -> Html Msg
view model =
    div [ Styles.pageWrapper ]
        [ div [ Styles.form ]
            [ h1 [ Styles.formHeading ] [ text "Compose a Motto" ]
            , textarea [ Styles.formTextarea ] [ text model.motto ]
            , button [ Styles.formButton ] [ text "Publish" ]
            ]
        ]
