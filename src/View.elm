module View exposing (view)

import Browser
import Html exposing (div, h1, span, text)
import Model exposing (Model(..), Msg)


view : Model -> Browser.Document Msg
view model =
    { title = "Set"
    , body =
        case model of
            Initialising ->
                [ div [] [ span [] [ text "Loading..." ] ] ]

            GameInProgress deck cards ->
                [ div [] [ h1 [] [] ] ]
    }
