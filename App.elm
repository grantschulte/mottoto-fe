module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http exposing (..)
import Json.Encode as Encode
import Messages.Main exposing (..)
import Models.Main exposing (Author, Model, Motto, decodeAuthorString)
import Navigation exposing (..)
import String.Extra exposing (..)
import UrlParser exposing ((</>), int, parseHash, parsePath, s, string)
import Views.Header exposing (..)
import Views.Motto exposing (..)
import Views.Welcome exposing (..)


-- MODEL


initModel : Model
initModel =
    { author = ""
    , motto = ""
    }


init : Location -> ( Model, Cmd Msg )
init location =
    ( parseModelFromUrl location, Cmd.none )



-- VIEW


view : Model -> Html Msg
view model =
    div [ pageWrapperStyle ]
        [ Views.Header.view model
        , div [ contentWrapperStyle ]
            [ page model ]
        ]


page : Model -> Html Msg
page model =
    case model.author of
        "" ->
            Views.Welcome.view model

        _ ->
            Views.Motto.view model



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


contentWrapperStyle : Attribute msg
contentWrapperStyle =
    style
        [ ( "position", "fixed" )
        , ( "display", "flex" )
        , ( "align-items", "center" )
        , ( "justify-content", "center" )
        , ( "top", "60px" )
        , ( "left", "0" )
        , ( "width", "100%" )
        , ( "height", "calc(100% - 60px)" )
        , ( "margin", "0 auto" )
        , ( "padding", "40px 20px" )
        , ( "box-sizing", "border-box" )
        ]



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
