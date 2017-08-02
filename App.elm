module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


-- MODEL


type alias Model =
    { emoji : String
    , input : String
    , motto : String
    }


type alias InputContent =
    String


type alias MottoContent =
    String


initModel : Model
initModel =
    { emoji = "smiley"
    , input = ""
    , motto = "My name is Alex."
    }


init : ( Model, Cmd Msg )
init =
    ( initModel, Cmd.none )



-- MESSAGES


type Msg
    = NoOp
    | UpdateMotto MottoContent
    | UpdateInput InputContent



-- VIEW


view : Model -> Html Msg
view model =
    div [ pageWrapperStyle ]
        [ h1 []
            [ text "Motto" ]
        , div []
            [ text model.motto ]
        , h1 []
            [ text "Emoji class" ]
        , div []
            [ text model.emoji ]
        , div [ formWrapperStyle ]
            [ input [ inputStyle, placeholder "Enter motto", onInput UpdateInput ] []
            , button [ onClick (UpdateMotto model.input) ] [ text "Update" ]
            ]
        ]



-- STYLE ATTRIBUTES


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
