module Views.Author exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Http exposing (decodeUri)
import Json.Encode as Encode
import Messages exposing (Msg)
import Models exposing (Author, Model, Motto)


-- VIEW


view : Model -> String -> Html Msg
view model authorId =
    div [ mottoWrapperStyle ]
        [ div [] [ text authorId ]
        , quotationMarkSpan "&ldquo;"
        , span [ mottoStyle ] [ text model.motto ]
        , quotationMarkSpan "&rdquo;"
        ]


encodeEntityToInnerHtml : String -> Attribute msg
encodeEntityToInnerHtml entity =
    property "innerHTML" (Encode.string entity)


quotationMarkSpan : String -> Html Msg
quotationMarkSpan entity =
    span [ quotationMarkStyle, encodeEntityToInnerHtml entity ] []



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
