module GameTest exposing (..)

import Expect
import Game exposing (..)
import Test exposing (..)


suite : Test
suite =
    describe "Game"
        [ describe "getColour"
            [ test "returns the correct colour" <|
                \_ -> Expect.equal Red (getColour <| Card Red Diamond Solid Three)
            ]
        ]
