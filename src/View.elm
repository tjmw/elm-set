module View exposing (view)

import Browser
import Html exposing (div, h1, text)
import Model exposing (Model, Msg)


view : Model -> Browser.Document Msg
view _ =
    { title = "Set"
    , body = [ div [] [ h1 [] [ text "Welcome" ] ] ]
    }
