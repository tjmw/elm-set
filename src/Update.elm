module Update exposing (Flags, init, update)

import Game exposing (getDeck)
import Model exposing (Model(..), Msg(..), attemptToSelectCard, deselectCard, drawInitialCards, handleSet)
import Random
import Random.List


type alias Flags =
    {}


init : Flags -> ( Model, Cmd Msg )
init _ =
    update ShuffleDeck Initialising


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ShuffleDeck ->
            ( Initialising, Random.generate ShuffledDeck (Random.List.shuffle getDeck) )

        ShuffledDeck deck ->
            update (DrawCards deck) Initialising

        DrawCards deck ->
            ( GameInProgress deck [] Nothing Nothing Nothing |> drawInitialCards, Cmd.none )

        SelectCard card ->
            ( attemptToSelectCard model card |> handleSet, Cmd.none )

        DeselectCard card ->
            ( deselectCard model card, Cmd.none )

        NoOp ->
            ( model, Cmd.none )
