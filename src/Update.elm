module Update exposing (Flags, init, update)

import Game exposing (getDeck)
import Model exposing (Model(..), Msg(..))
import Random
import Random.List


type alias Flags =
    {}


init : Flags -> ( Model, Cmd Msg )
init _ =
    update ShuffleDeck Initialising


update : Msg -> Model -> ( Model, Cmd Msg )
update msg _ =
    case msg of
        ShuffleDeck ->
            ( Initialising, Random.generate ShuffledDeck (Random.List.shuffle getDeck) )

        ShuffledDeck deck ->
            update (DrawCards deck) Initialising

        DrawCards deck ->
            ( GameInProgress (List.drop 12 deck) (List.take 12 deck), Cmd.none )
