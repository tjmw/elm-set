module Main exposing (main)

import Browser
import Model exposing (Model, Msg)
import Update
import View


main : Program Update.Flags Model Msg
main =
    Browser.document
        { init = Update.init
        , update = Update.update
        , view = View.view
        , subscriptions = \_ -> Sub.none
        }
