module View exposing (view)

import Browser
import Game exposing (Card, Shading(..), Shape(..), cardColourToString, cardCountToInteger, cardShadingToString, getShape)
import Html exposing (Html, div, span, text)
import Html.Attributes exposing (class)
import List exposing (repeat)
import Model exposing (Model(..), Msg)


view : Model -> Browser.Document Msg
view model =
    { title = "Set"
    , body =
        case model of
            Initialising ->
                [ div [] [ span [] [ text "Loading..." ] ] ]

            GameInProgress _ cards ->
                [ div [ class "board" ] (List.map renderCard cards) ]
    }


renderCard : Card -> Html Msg
renderCard card =
    div [ class "card", class <| cardColourToString card, class <| cardShadingToString card ] [ div [ class "symbol-container" ] (repeat (cardCountToInteger card) (renderSymbol <| getShape card)) ]


renderSymbol : Shape -> Html Msg
renderSymbol shape =
    div [ class "symbol" ]
        [ text
            (case shape of
                Diamond ->
                    "♢"

                Squiggle ->
                    "〰"

                Oval ->
                    "⎚"
            )
        ]
