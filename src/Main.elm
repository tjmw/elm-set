module Main exposing (main)

import Browser
import Html exposing (Html, div, h1, text)


main : Program () Int Msg
main =
    Browser.sandbox { init = 0, update = update, view = view }


type Msg
    = NoOp


update : Msg -> number -> number
update msg model =
    case msg of
        NoOp ->
            model


view : Int -> Html Msg
view _ =
    div [] [ h1 [] [ text "Welcome" ] ]
