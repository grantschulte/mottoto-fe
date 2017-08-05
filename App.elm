module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http exposing (..)
import Json.Encode as Encode
import Navigation exposing (..)
import String.Extra exposing (..)
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
    = UrlChange Navigation.Location



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
        [ quotationMarkSpan "&ldquo;"
        , span [ mottoStyle ] [ text (decodeMotto model.motto) ]
        , quotationMarkSpan "&rdquo;"
        ]


authorContent : Model -> Html Msg
authorContent model =
    div [ class "author", sectionStyle ]
        [ p [ authorStyle ]
            [ text (formatAuthorString model.author) ]
        ]


encodeEntityToInnerHtml : String -> Attribute msg
encodeEntityToInnerHtml entity =
    property "innerHTML" (Encode.string entity)


quotationMarkSpan : String -> Html Msg
quotationMarkSpan entity =
    span [ quotationMarkStyle, encodeEntityToInnerHtml entity ] []


formatAuthorString : String -> String
formatAuthorString author =
    "-" ++ String.Extra.toSentenceCase author


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
        [ ( "background-color", "#7E5A9B" )
        , ( "color", "#E4B7E5" )
        , ( "font-family", "Georgia, Times New Roman, serif" )
        , ( "height", "100%" )
        , ( "position", "absolute" )
        , ( "width", "100%" )
        ]


mottoStyle : Attribute msg
mottoStyle =
    style
        [ ( "font-size", "56px" ) ]


authorStyle : Attribute msg
authorStyle =
    style
        [ ( "font-size", "46px" )
        , ( "text-align", "right" )
        ]


quotationMarkStyle : Attribute msg
quotationMarkStyle =
    style
        [ ( "font-size", "56px" ) ]


sectionStyle : Attribute msg
sectionStyle =
    style
        [ ( "margin", "80px" ) ]


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
