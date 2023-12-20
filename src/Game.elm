module Game exposing (..)


type Colour
    = Red
    | Green
    | Purple


type Shape
    = Diamond
    | Squiggle
    | Oval


type Shading
    = Solid
    | Stripe
    | Open


type Count
    = One
    | Two
    | Three


type Card
    = Card Colour Shape Shading Count


randomCard : Card
randomCard =
    Card Red Diamond Stripe One


getColour : Card -> Colour
getColour (Card colour _ _ _) =
    colour
