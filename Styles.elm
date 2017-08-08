module Styles exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


form : Attribute msg
form =
    style
        [ ( "max-width", "400px" )
        , ( "width", "100%" )
        , ( "margin", "0 auto" )
        ]


formInput : Attribute msg
formInput =
    style
        [ ( "display", "block" )
        , ( "height", "60px" )
        , ( "width", "100%" )
        , ( "border", "none" )
        , ( "padding", "0 10px" )
        , ( "margin", "0 0 20px 0" )
        , ( "font-size", "20px" )
        , ( "font-family", "Georgia" )
        , ( "border-radius", "4px" )
        , ( "background-color", "#E4B7E5" )
        , ( "color", "#7E5A9B" )
        , ( "box-sizing", "border-box" )
        ]


formTextarea : Attribute msg
formTextarea =
    style
        [ ( "display", "block" )
        , ( "height", "200px" )
        , ( "width", "100%" )
        , ( "border", "none" )
        , ( "padding", "20px" )
        , ( "margin", "0 0 20px 0" )
        , ( "font-size", "18px" )
        , ( "line-height", "1.6" )
        , ( "font-family", "Georgia" )
        , ( "border-radius", "4px" )
        , ( "background-color", "#E4B7E5" )
        , ( "color", "#7E5A9B" )
        , ( "box-sizing", "border-box" )
        ]


formButton : Attribute msg
formButton =
    style
        [ ( "display", "block" )
        , ( "height", "60px" )
        , ( "width", "100%" )
        , ( "border", "none" )
        , ( "padding", "10px" )
        , ( "margin", "25px 0 0 0" )
        , ( "font-size", "20px" )
        , ( "font-family", "Georgia" )
        , ( "border-radius", "4px" )
        , ( "background-color", "transparent" )
        , ( "color", "#E4B7E5" )
        , ( "border", "1px solid #E4B7E5" )
        , ( "box-sizing", "border-box" )
        ]


formHeading : Attribute msg
formHeading =
    style
        [ ( "font-weight", "normal" )
        , ( "font-size", "36px" )
        , ( "margin-top", "0" )
        , ( "margin-bottom", "30px" )
        ]


pageWrapper : Attribute msg
pageWrapper =
    style
        [ ( "font-size", "18px" )
        , ( "width", "100%" )
        , ( "text-align", "center" )
        , ( "margin-top", "-60px" )
        ]
