module Views.NewHandle exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Messages.Main exposing (Msg)
import Models.Main exposing (Model)


view : Model -> Html Msg
view model =
    div [ pageWrapperStyle ]
        [ div [ headingStyle ]
            [ text "Create your author handle" ]
        ]


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
