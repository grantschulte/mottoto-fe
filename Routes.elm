module Routes exposing (..)

import Models exposing (..)
import Navigation exposing (Location)
import UrlParser exposing ((</>), Parser, int, oneOf, parseHash, s, string, top)


routeMatchers : Parser (Page -> a) a
routeMatchers =
    oneOf
        [ UrlParser.map Models.WelcomePage top
        , UrlParser.map Models.NewHandlePage (UrlParser.s "handle")
        , UrlParser.map Models.LoginPage (UrlParser.s "login")
        , UrlParser.map Models.ComposePage (UrlParser.s "compose")
        , UrlParser.map Models.ProfilePage (UrlParser.s "profile" </> string)
        , UrlParser.map Models.AuthorPage (UrlParser.s "author" </> string)
        ]


parseLocation : Location -> Page
parseLocation location =
    case parseHash routeMatchers location of
        Just route ->
            route

        Nothing ->
            Models.WelcomePage
