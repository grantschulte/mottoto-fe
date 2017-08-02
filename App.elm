module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


-- MODEL


type alias Model =
    { content : String
    , emoji : String
    , inputContent : String
    }


type alias InputContent =
    String


type alias MottoContent =
    String


initModel : Model
initModel =
    { content = "My name is Alex."
    , emoji = "smiley"
    }


init : ( Model, Cmd Msg )
init =
    ( initModel, Cmd.none )



-- MESSAGES


type Msg
    = NoOp
    | UpdateMottoContent MottoContent
    | UpdateInputContent InputContent



-- VIEW


view : Model -> Html Msg
view model =
    div [ pageWrapperStyle ]
        [ h1 []
            [ text "Motto" ]
        , div []
            [ text model.content ]
        , h1 []
            [ text "Emoji class" ]
        , div []
            [ text model.emoji ]
        , div [ formWrapperStyle ]
            [ input [ inputStyle, placeholder "Enter motto", onInput UpdateInput ] []
            , button [ onClick (Update "Hello") ] [ text "Update" ]
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
            ( { model | inputContent = inputContent }, Cmd.none )

        UpdateContent mottoContent ->
            ( { model | mottoContent = mottoContent }, Cmd.none )



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
