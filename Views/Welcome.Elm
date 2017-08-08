module Views.Welcome exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (Msg)
import Models exposing (Model)


-- VIEW


view : Model -> Html Msg
view model =
    div [ welcomeMessageStyle ]
        [ div [ headingStyle ]
            [ text "What's your motto? "
            , a [ href "#/login", createStyle ] [ text "Create." ]
            ]
        ]



-- STYLES


welcomeMessageStyle : Attribute msg
welcomeMessageStyle =
    style
        [ ( "font-size", "18px" )
        , ( "width", "100%" )
        , ( "text-align", "center" )
        ]


createStyle : Attribute msg
createStyle =
    style
        [ ( "text-decoration", "underline" )
        , ( "cursor", "pointer" )
        ]


headingStyle : Attribute msg
headingStyle =
    style
        [ ( "font-weight", "normal" )
        , ( "font-size", "56px" )
        ]
