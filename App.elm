module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http exposing (..)
import Json.Encode as Encode
import Navigation exposing (..)
import UrlParser exposing ((</>), int, parseHash, parsePath, s, string)


-- MODEL


type alias Model =
    { author : Author
    , motto : Motto
    }


type alias Motto =
    String


type alias Author =
    String


initModel : Model
initModel =
    { author = ""
    , motto = ""
    }


init : Location -> ( Model, Cmd Msg )
init location =
    ( parseModelFromUrl location, Cmd.none )



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


mottoContent : Model -> Html Msg
mottoContent model =
    div [ class "motto", sectionStyle ]
        [ h1 [ marginBottom "5px" ]
            [ text "Motto" ]
        , p []
            [ quotationMarkSpan "&ldquo;"
            , span [ mottoStyle ] [ text (decodeMotto model.motto) ]
            , quotationMarkSpan "&rdquo;"
            ]
        ]


authorContent : Model -> Html Msg
authorContent model =
    div [ class "author", sectionStyle ]
        [ h2 [ marginBottom "5px" ]
            [ text "Author" ]
        , p []
            [ text model.author ]
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



-- STYLE


pageWrapperStyle : Attribute msg
pageWrapperStyle =
    style
        [ ( "backgroundColor", "#F9F9F9" )
        , ( "padding", "40px" )
        , ( "font-size", "16px" )
        , ( "font-family", "Helvetica" )
        ]


mottoStyle : Attribute msg
mottoStyle =
    style
        [ ( "font-size", "18px" ) ]


quotationMarkStyle : Attribute msg
quotationMarkStyle =
    style
        [ ( "font-size", "18px" ) ]


sectionStyle : Attribute msg
sectionStyle =
    style
        [ ( "margin", "30px 0px" ) ]


marginBottom : String -> Attribute msg
marginBottom value =
    style
        [ ( "margin-bottom", value ) ]



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UrlChange location ->
            ( parseModelFromUrl location, Cmd.none )

        _ ->
            ( model, Cmd.none )


parseModelFromUrl : Location -> Model
parseModelFromUrl location =
    case parseHash urlModel location of
        Nothing ->
            initModel

        Just newModel ->
            newModel


rawModelFromUrl : UrlParser.Parser (Author -> Motto -> a) a
rawModelFromUrl =
    UrlParser.s "author" </> string </> UrlParser.s "motto" </> string


urlModel : UrlParser.Parser (Model -> a) a
urlModel =
    UrlParser.map Model rawModelFromUrl



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
