module Views.Header exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (Msg)
import Models exposing (Author, Model)
import Utils exposing (authorHandleString)


-- VIEW


view : Model -> Html Msg
view model =
    header [ headerStyle ]
        [ div [ columnStyle ]
            [ a [ href "#/", logoStyle ] [ text "mottoto" ] ]
        , div [ columnStyle, style [ ( "text-align", "right" ) ] ]
            [ userActions model ]
        ]


userActions : Model -> Html Msg
userActions model =
    case model.user of
        Nothing ->
            let
                loginLink =
                    a [ href "#/login", buttonStyle ] [ text "L" ]

                createHandleLink =
                    a [ href "#/handle", buttonStyle ] [ text "H" ]
            in
            if model.page == Models.LoginPage then
                createHandleLink
            else if model.page == Models.NewHandlePage then
                loginLink
            else
                div [] [ loginLink, createHandleLink ]

        Just user ->
            div []
                [ a [ href "#/compose", buttonStyle ] [ text "C" ]
                , a [ href "#/profile", buttonStyle ] [ text "U" ]
                ]



-- STYLES


headerStyle : Attribute msg
headerStyle =
    style
        [ ( "position", "fixed" )
        , ( "display", "flex" )
        , ( "height", "60px" )
        , ( "width", "100%" )
        , ( "line-height", "60px" )
        , ( "font-size", "21px" )
        , ( "font-weight", "bold" )
        , ( "margin", "0 auto" )
        , ( "box-sizing", "border-box" )
        , ( "padding", "0 20px" )
        ]


columnStyle : Attribute msg
columnStyle =
    style
        [ ( "width", "50%" ) ]


logoStyle : Attribute msg
logoStyle =
    style
        [ ( "text-decoration", "none" )
        , ( "color", "#E4B7E5" )
        ]


linkStyle : Attribute msg
linkStyle =
    style
        [ ( "text-decoration", "none" )
        , ( "font-size", "12px" )
        , ( "font-family", "Helvetica" )
        , ( "color", "#E4B7E5" )
        , ( "font-weight", "normal" )
        ]


buttonStyle : Attribute msg
buttonStyle =
    style
        [ ( "display", "inline-block" )
        , ( "text-decoration", "none" )
        , ( "font-size", "16px" )
        , ( "font-family", "Georgia" )
        , ( "font-weight", "bold" )
        , ( "border", "1px solid #E4B7E5" )
        , ( "color", "#E4B7E5" )
        , ( "background-color", "transparent" )
        , ( "height", "32px" )
        , ( "width", "32px" )
        , ( "line-height", "32px" )
        , ( "text-align", "center" )
        , ( "box-shadow", "none" )
        , ( "font-weight", "normal" )
        , ( "border-radius", "3px" )
        , ( "margin", "0 0 0 5px" )
        ]
