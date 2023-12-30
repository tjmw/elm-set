module Model exposing (Model(..), Msg(..), attemptToSelectCard, deselectCard, handleSet)

import Game exposing (Board, Card, Deck, isSet)


type Msg
    = ShuffleDeck
    | ShuffledDeck Deck
    | DrawCards Deck
    | SelectCard Card
    | DeselectCard Card
    | NoOp


type Model
    = Initialising
    | GameInProgress Deck Board (Maybe Card) (Maybe Card) (Maybe Card)


attemptToSelectCard : Model -> Card -> Model
attemptToSelectCard model card =
    case model of
        Initialising ->
            model

        GameInProgress deck board selectedCard1 selectedCard2 selectedCard3 ->
            case ( selectedCard1, selectedCard2, selectedCard3 ) of
                ( Nothing, _, _ ) ->
                    GameInProgress deck board (Just card) selectedCard2 selectedCard3

                ( Just _, Nothing, _ ) ->
                    GameInProgress deck board selectedCard1 (Just card) selectedCard3

                ( Just _, Just _, Nothing ) ->
                    GameInProgress deck board selectedCard1 selectedCard2 (Just card)

                ( Just _, Just _, Just _ ) ->
                    model


deselectCard : Model -> Card -> Model
deselectCard model card =
    case model of
        Initialising ->
            model

        GameInProgress deck board selectedCard1 selectedCard2 selectedCard3 ->
            if selectedCard1 == Just card then
                GameInProgress deck board Nothing selectedCard2 selectedCard3

            else if selectedCard2 == Just card then
                GameInProgress deck board selectedCard1 Nothing selectedCard3

            else if selectedCard3 == Just card then
                GameInProgress deck board selectedCard1 selectedCard2 Nothing

            else
                model


handleSet : Model -> Model
handleSet model =
    case model of
        GameInProgress deck board (Just selectedCard1) (Just selectedCard2) (Just selectedCard3) ->
            if isSet selectedCard1 selectedCard2 selectedCard3 then
                GameInProgress deck board Nothing Nothing Nothing

            else
                model

        _ ->
            model
