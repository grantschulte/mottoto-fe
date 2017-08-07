module Views.Header exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Messages.Main exposing (Msg)
import Models.Main exposing (Author, Model, authorString, decodeString)


view : Model -> Html Msg
view model =
    header [ headerStyle ]
        [ div [ columnStyle ] [ text "Mottoto" ]
        , div [ columnStyle, authorStyle ]
            [ userActions model ]
        ]


userActions : Model -> Html Msg
userActions model =
    case model.author of
        Nothing ->
            a [ href "/#/create" ] [ text "Create Motto" ]

        Just author ->
            text (authorString (decodeString author.name))


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


authorStyle : Attribute msg
authorStyle =
    style
        [ ( "text-align", "right" )
        , ( "font-weight", "normal" )
        ]
