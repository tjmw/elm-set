module Update exposing (Flags, init, update)

import Game exposing (getDeck)
import Model exposing (Model(..), Msg(..))
import Random
import Random.List


type alias Flags =
    {}


init : Flags -> ( Model, Cmd Msg )
init _ =
    update Initialise Initialising


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Initialise ->
            ( model, Random.generate ShuffledDeck (Random.List.shuffle getDeck) )

        ShuffledDeck deck ->
            ( GameState deck, Cmd.none )
