module Views.Login exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (Msg)
import Models exposing (Model)


-- VIEW


view : Model -> Html Msg
view model =
    div [ pageWrapperStyle ]
        [ div [ headingStyle ]
            [ text "Login with your handle" ]
        ]



-- STYLES


pageWrapperStyle : Attribute msg
pageWrapperStyle =
    style
        [ ( "font-size", "18px" )
        , ( "width", "100%" )
        , ( "text-align", "center" )
        ]


headingStyle : Attribute msg
headingStyle =
    style
        [ ( "font-weight", "normal" )
        , ( "font-size", "56px" )
        ]
