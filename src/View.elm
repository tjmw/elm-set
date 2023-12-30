module View exposing (view)

import Browser
import Game exposing (Card, Shading(..), Shape(..), cardColourToString, cardCountToInteger, cardSelectionFull, cardShadingToString, getShape, isCardSelected)
import Html exposing (Html, div, span, text)
import Html.Attributes exposing (class, classList)
import Html.Events exposing (onClick)
import List exposing (repeat)
import Model exposing (Model(..), Msg(..))


view : Model -> Browser.Document Msg
view model =
    { title = "Set"
    , body =
        case model of
            Initialising ->
                [ div [] [ span [] [ text "Loading..." ] ] ]

            GameInProgress _ cards maybeCard1 maybeCard2 maybeCard3 ->
                [ div [ class "board" ] (List.map (renderCard [ maybeCard1, maybeCard2, maybeCard3 ]) cards) ]
    }


renderCard : List (Maybe Card) -> Card -> Html Msg
renderCard selectedCards card =
    div [ cardClasses card selectedCards, cardOnClick card selectedCards ] [ div [ class "symbol-container" ] (repeat (cardCountToInteger card) (renderSymbol <| getShape card)) ]


cardClasses : Card -> List (Maybe Card) -> Html.Attribute msg
cardClasses card selectedCards =
    classList
        [ ( "card", True )
        , ( "selected", isCardSelected card selectedCards )
        , ( cardColourToString card, True )
        , ( cardShadingToString card, True )
        , ( "disabled", (not <| isCardSelected card selectedCards) && cardSelectionFull selectedCards )
        ]


cardOnClick : Card -> List (Maybe Card) -> Html.Attribute Msg
cardOnClick card selectedCards =
    if isCardSelected card selectedCards then
        onClick <| DeselectCard card

    else if cardSelectionFull selectedCards then
        onClick <| NoOp

    else
        onClick <| SelectCard card


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
