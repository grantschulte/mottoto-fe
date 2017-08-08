module Views.Welcome exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (Msg)
import Models exposing (Model)
import Styles exposing (..)


-- VIEW


view : Model -> Html Msg
view model =
    div [ Styles.pageWrapper ]
        [ div [ welcomeWrapper ]
            [ h1 [ Styles.formHeading ] [ text "mot·to" ]
            , p [ pStyle, italicStyle ] [ text "noun" ]
            , p [ pStyle ] [ text "a short sentence or phrase chosen as encapsulating the beliefs or ideals guiding an individual, family, or institution." ]
            , a [ Styles.formButton, buttonStyle, href "#/login" ] [ text "Compose" ]
            ]
        ]


welcomeWrapper : Attribute msg
welcomeWrapper =
    style
        [ ( "max-width", "500px" )
        , ( "margin", "0 auto" )
        ]


buttonStyle : Attribute msg
buttonStyle =
    style
        [ ( "width", "200px" )
        , ( "height", "45px" )
        , ( "margin", "40px auto 0" )
        , ( "font-size", "18px" )
        , ( "text-decoration", "none" )
        ]


pStyle : Attribute msg
pStyle =
    style
        [ ( "line-height", "1.4" )
        ]


italicStyle : Attribute msg
italicStyle =
    style
        [ ( "font-style", "italic" )
        ]
