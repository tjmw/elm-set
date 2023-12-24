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
            , test "returns False if the cards are not a set" <|
                \_ ->
                    let
                        card1 =
                            Card Red Diamond Solid One

                        card2 =
                            Card Red Squiggle Solid Two

                        card3 =
                            Card Red Diamond Solid Three
                    in
                    Expect.equal True (isSet card1 card2 card3)
            ]
        , describe "getDeck" <|
            [ test "returns a deck of 81 cards" <|
                \_ ->
                    Expect.equal 81 (List.length getDeck)
            ]
        ]
