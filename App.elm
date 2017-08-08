module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (..)
import Models exposing (Author, Model, Motto)
import Navigation exposing (..)
import Routes exposing (parseLocation)
import Views.Author exposing (view)
import Views.Compose exposing (view)
import Views.Header exposing (view)
import Views.Login exposing (view)
import Views.NewHandle exposing (view)
import Views.Profile exposing (view)
import Views.Welcome exposing (view)


-- MODEL


initModel : Model
initModel =
    { user = Nothing
    , author = Nothing
    , motto = "Keep it right, keep it tight."
    , page = Models.WelcomePage
    }


init : Location -> ( Model, Cmd Msg )
init location =
    ( { initModel | page = Routes.parseLocation location }, Cmd.none )



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
        Models.WelcomePage ->
            Views.Welcome.view model

        Models.AuthorPage authorId ->
            Views.Author.view model authorId

        Models.NewHandlePage ->
            Views.NewHandle.view model

        Models.LoginPage ->
            Views.Login.view model

        Models.ComposePage ->
            Views.Compose.view model

        Models.ProfilePage userId ->
            Views.Profile.view model userId



-- STYLES


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
            ( { model | page = Routes.parseLocation location }, Cmd.none )



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
