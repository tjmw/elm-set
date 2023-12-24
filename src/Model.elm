module Model exposing (Model, Msg)

import Game exposing (Card)


type Msg
    = NoOp


type alias Model =
    { deck : List Card
    }
