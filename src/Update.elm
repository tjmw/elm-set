module Update exposing (Flags, init, update)

import Model exposing (Model, Msg)


type alias Flags =
    {}


init : Flags -> ( Model, Cmd Msg )
init _ =
    ( { deck = [] }, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update _ model =
    ( model, Cmd.none )
