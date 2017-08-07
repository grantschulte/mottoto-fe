module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http exposing (..)
import Json.Encode as Encode
import Messages.Main exposing (..)
import Models.Main exposing (Author, Model, Motto, Page)
import Navigation exposing (..)
import String.Extra exposing (..)
import UrlParser exposing ((</>), Parser, int, oneOf, parseHash, parsePath, s, string, top)
import Views.Author exposing (..)
import Views.Header exposing (..)
import Views.Login exposing (..)
import Views.Motto exposing (..)
import Views.NewHandle exposing (..)
import Views.Welcome exposing (..)


-- MODEL


initModel : Model
initModel =
    { author = Nothing
    , motto = "Keep it right, keep it tight."
    , page = Models.Main.WelcomePage
    }


init : Location -> ( Model, Cmd Msg )
init location =
    ( { initModel | page = parseLocation location }, Cmd.none )



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
    case model.page of
        Models.Main.WelcomePage ->
            Views.Welcome.view model

        Models.Main.AuthorPage authorId ->
            Views.Author.view model authorId

        Models.Main.NewHandlePage ->
            Views.NewHandle.view model

        Models.Main.LoginPage ->
            Views.Login.view model

        Models.Main.MottoPage ->
            Views.Motto.view model

        _ ->
            div []
                [ text "Not found" ]



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
            ( { model | page = parseLocation location }, Cmd.none )


routeMatchers : Parser (Page -> a) a
routeMatchers =
    oneOf
        [ UrlParser.map Models.Main.WelcomePage top
        , UrlParser.map Models.Main.NewHandlePage (UrlParser.s "handle")
        , UrlParser.map Models.Main.LoginPage (UrlParser.s "login")
        , UrlParser.map Models.Main.MottoPage (UrlParser.s "motto")
        , UrlParser.map Models.Main.AuthorPage (UrlParser.s "author" </> string)
        ]


parseLocation : Location -> Page
parseLocation location =
    case parseHash routeMatchers location of
        Just route ->
            route

        Nothing ->
            Models.Main.WelcomePage



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
