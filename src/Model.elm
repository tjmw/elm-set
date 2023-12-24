module Model exposing (Model(..), Msg(..))

import Game exposing (Card, Deck)


type Msg
    = ShuffleDeck
    | ShuffledDeck Deck
    | DrawCards Deck


type Model
    = Initialising
    | GameInProgress Deck (List Card)
