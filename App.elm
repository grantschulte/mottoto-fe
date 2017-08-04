module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Json.Encode as Encode
import UrlParser exposing ((</>), int, parseHash, parsePath, s, string)


-- MODEL,


type alias Model =
    { author : String
    , input : String
    , motto : String
    }


type alias Input =
    String


type alias Motto =
    String


type alias Author =
    String


type Route
    = Author String
    | Motto String


initModel : Model
initModel =
    { author = "Alex"
    , input = ""
    , motto = "Keep it right. Keep it tight."
    }


init : ( Model, Cmd Msg )
init =
    ( initModel, Cmd.none )



-- MESSAGES


type Msg
    = NoOp
    | UpdateMotto Motto
    | UpdateInput Input



-- VIEW


view : Model -> Html Msg
view model =
    div [ pageWrapperStyle ]
        [ h1 []
            [ text "Motto" ]
        , div []
            [ quotationMarkSpan "&ldquo;"
            , span [ mottoStyle ] [ text model.motto ]
            , quotationMarkSpan "&rdquo;"
            ]
        , h2 []
            [ text "Author" ]
        , div []
            [ text model.author ]
        , div [ formWrapperStyle ]
            [ input [ inputStyle, placeholder "Enter motto", onInput UpdateInput ] []
            , button [ onClick (UpdateMotto model.input) ] [ text "Update" ]
            ]
        ]


quotationMarkSpan : String -> Html Msg
quotationMarkSpan entity =
    span [ quotationMarkStyle, encodeEntityToInnerHtml entity ] []


encodeEntityToInnerHtml : String -> Attribute msg
encodeEntityToInnerHtml entity =
    property "innerHTML" (Encode.string entity)



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
        NoOp ->
            ( model, Cmd.none )

        UpdateInput inputContent ->
            ( { model | input = inputContent }, Cmd.none )

        UpdateMotto mottoContent ->
            ( { model | motto = mottoContent }, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- MAIN


main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
