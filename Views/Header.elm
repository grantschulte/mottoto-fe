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
            [ a [ href "#/", logoStyle ] [ text "Mottoto" ] ]
        , div [ columnStyle, linkStyle ]
            [ userActions model ]
        ]


userActions : Model -> Html Msg
userActions model =
    case model.user of
        Nothing ->
            let
                loginLink =
                    a [ href "#/login", linkStyle ] [ text "Login" ]

                createHandleLink =
                    a [ href "#/handle", linkStyle ] [ text "Create Handle" ]
            in
            if model.page == Models.LoginPage then
                createHandleLink
            else if model.page == Models.NewHandlePage then
                loginLink
            else
                div [] [ loginLink, text " - ", createHandleLink ]

        Just user ->
            text "userHandle"



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
        [ ( "text-align", "right" )
        , ( "text-decoration", "none" )
        , ( "font-size", "18px" )
        , ( "color", "#E4B7E5" )
        , ( "font-weight", "normal" )
        ]
