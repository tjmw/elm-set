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
        , describe "isSet"
            [ test "returns True if the cards are a set" <|
                \_ ->
                    let
                        card1 =
                            Card Red Diamond Solid One

                        card2 =
                            Card Red Diamond Solid Two

                        card3 =
                            Card Red Diamond Solid Three
                    in
                    Expect.equal True (isSet card1 card2 card3)
            ]
        ]
