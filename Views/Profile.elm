module Views.Profile exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (Msg)
import Models exposing (Model, UserId)
import Utils exposing (authorHandleString, decodeString)


-- VIEW


view : Model -> UserId -> Html Msg
view model userId =
    div [ pageWrapperStyle ]
        [ div [ headingStyle ]
            [ text "Profile "
            , text (authorHandleString (decodeString userId))
            ]
        ]



-- STYLES


pageWrapperStyle : Attribute msg
pageWrapperStyle =
    style
        [ ( "font-size", "18px" )
        , ( "width", "100%" )
        , ( "text-align", "center" )
        ]


headingStyle : Attribute msg
headingStyle =
    style
        [ ( "font-weight", "normal" )
        , ( "font-size", "56px" )
        ]
