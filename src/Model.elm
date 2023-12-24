module Model exposing (Model(..), Msg(..))

import Game exposing (Deck)


type Msg
    = Initialise
    | ShuffledDeck Deck


type Model
    = Initialising
    | GameState Deck
