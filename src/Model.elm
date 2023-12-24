module Model exposing (Model(..), Msg(..))

import Game exposing (Board, Deck)


type Msg
    = ShuffleDeck
    | ShuffledDeck Deck
    | DrawCards Deck


type Model
    = Initialising
    | GameInProgress Deck Board
