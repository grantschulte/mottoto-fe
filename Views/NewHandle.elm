module Views.NewHandle exposing (..)

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
            [ h1 [ Styles.formHeading ] [ text "Make a Handle" ]
            , input [ Styles.formInput, type_ "text", value "johnkennedy" ] []
            , input [ Styles.formInput, type_ "password", value "********" ] []
            , button [ Styles.formButton ] [ text "Submit" ]
            ]
        ]
