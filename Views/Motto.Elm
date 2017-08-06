module Views.Motto exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Http exposing (decodeUri)
import Json.Encode as Encode
import Messages.Main exposing (Msg)
import Models.Main exposing (Model, Motto)


-- VIEW


view : Model -> Html Msg
view model =
    div [ mottoWrapperStyle ]
        [ quotationMarkSpan "&ldquo;"
        , span [ mottoStyle ] [ text (decodeMotto model.motto) ]
        , quotationMarkSpan "&rdquo;"
        ]


encodeEntityToInnerHtml : String -> Attribute msg
encodeEntityToInnerHtml entity =
    property "innerHTML" (Encode.string entity)


quotationMarkSpan : String -> Html Msg
quotationMarkSpan entity =
    span [ quotationMarkStyle, encodeEntityToInnerHtml entity ] []


decodeMotto : Motto -> Motto
decodeMotto motto =
    case decodeUri motto of
        Nothing ->
            motto

        Just decoded ->
            decoded



-- STYLES


mottoWrapperStyle : Attribute msg
mottoWrapperStyle =
    style
        [ ( "margin", "-60px 0 0 0" ) ]


mottoStyle : Attribute msg
mottoStyle =
    style
        [ ( "font-size", "56px" ) ]


quotationMarkStyle : Attribute msg
quotationMarkStyle =
    style
        [ ( "font-size", "56px" ) ]
