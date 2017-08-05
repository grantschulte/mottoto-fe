module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Json.Encode as Encode
import Navigation exposing (..)
import UrlParser exposing ((</>), int, parseHash, parsePath, s, string)


-- MODEL


type alias Model =
    { author : String
    , motto : String
    }


type alias Motto =
    String


type alias Author =
    String


initModel : Model
initModel =
    { author = "Alex"
    , motto = "Keep it right. Keep it tight."
    }


init : Location -> ( Model, Cmd Msg )
init location =
    ( initModel, Cmd.none )



-- MESSAGES


type Msg
    = NoOp
    | UrlChange Navigation.Location



-- VIEW


view : Model -> Html Msg
view model =
    div [ pageWrapperStyle ]
        [ mottoContent model
        , authorContent model
        ]


encodeEntityToInnerHtml : String -> Attribute msg
encodeEntityToInnerHtml entity =
    property "innerHTML" (Encode.string entity)


mottoContent : Model -> Html Msg
mottoContent model =
    div [ class "motto" ]
        [ h1 []
            [ text "Motto" ]
        , div []
            [ quotationMarkSpan "&ldquo;"
            , span [ mottoStyle ] [ text model.motto ]
            , quotationMarkSpan "&rdquo;"
            ]
        ]


authorContent : Model -> Html Msg
authorContent model =
    div [ class "author" ]
        [ h2 []
            [ text "Author" ]
        , div []
            [ text model.author ]
        ]


quotationMarkSpan : String -> Html Msg
quotationMarkSpan entity =
    span [ quotationMarkStyle, encodeEntityToInnerHtml entity ] []



-- STYLE


pageWrapperStyle : Attribute msg
pageWrapperStyle =
    style
        [ ( "backgroundColor", "#F9F9F9" )
        , ( "padding", "40px" )
        , ( "font-size", "16px" )
        , ( "font-family", "Helvetica" )
        ]


formWrapperStyle : Attribute msg
formWrapperStyle =
    style
        [ ( "margin-top", "40px" ) ]


inputStyle : Attribute msg
inputStyle =
    style
        [ ( "height", "40px" )
        , ( "width", "200px" )
        , ( "font-size", "16px" )
        , ( "font-family", "Helvetica" )
        , ( "padding", "5px" )
        ]


mottoStyle : Attribute msg
mottoStyle =
    style
        [ ( "font-size", "18px" ) ]


quotationMarkStyle : Attribute msg
quotationMarkStyle =
    style
        [ ( "font-size", "18px" ) ]



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UrlChange location ->
            ( model, Cmd.none )

        _ ->
            ( model, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- MAIN


main : Program Never Model Msg
main =
    Navigation.program UrlChange
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
