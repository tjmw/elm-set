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


type alias Deck =
    List Card


type alias Board =
    List Card


randomCard : Card
randomCard =
    Card Red Squiggle Stripe One


getColour : Card -> Colour
getColour (Card colour _ _ _) =
    colour


colourToString : Colour -> String
colourToString colour =
    case colour of
        Red ->
            "red"

        Green ->
            "green"

        Purple ->
            "purple"


countToInteger : Count -> Int
countToInteger count =
    case count of
        One ->
            1

        Two ->
            2

        Three ->
            3


shadingToString : Shading -> String
shadingToString shading =
    case shading of
        Solid ->
            "solid"

        Stripe ->
            "stripe"

        Open ->
            "open"


cardCountToInteger : Card -> Int
cardCountToInteger =
    getCount >> countToInteger


cardColourToString : Card -> String
cardColourToString =
    getColour >> colourToString


cardShadingToString : Card -> String
cardShadingToString =
    getShading >> shadingToString


getShape : Card -> Shape
getShape (Card _ shape _ _) =
    shape


getShading : Card -> Shading
getShading (Card _ _ shading _) =
    shading


getCount : Card -> Count
getCount (Card _ _ _ count) =
    count


isSet : Card -> Card -> Card -> Bool
isSet card1 card2 card3 =
    colourIsSet card1 card2 card3


colourIsSet : Card -> Card -> Card -> Bool
colourIsSet =
    propertyIsSet getColour


shapeIsSet : Card -> Card -> Card -> Bool
shapeIsSet =
    propertyIsSet getShape


shadingIsSet : Card -> Card -> Card -> Bool
shadingIsSet =
    propertyIsSet getShading


countIsSet : Card -> Card -> Card -> Bool
countIsSet =
    propertyIsSet getCount


propertyIsSet : (Card -> a) -> Card -> Card -> Card -> Bool
propertyIsSet map card1 card2 card3 =
    propertyAllSame map card1 card2 card3 || propertyAllDifferent map card1 card2 card3


propertyAllSame : (Card -> a) -> Card -> Card -> Card -> Bool
propertyAllSame map card1 card2 card3 =
    map card1 == map card2 && map card2 == map card3


propertyAllDifferent : (Card -> a) -> Card -> Card -> Card -> Bool
propertyAllDifferent map card1 card2 card3 =
    map card1 /= map card2 && map card2 /= map card3 && map card1 /= map card3


getDeck : List Card
getDeck =
    [ Red, Green, Purple ]
        |> List.concatMap
            (\color ->
                [ Diamond, Squiggle, Oval ]
                    |> List.concatMap
                        (\shape ->
                            [ Solid, Stripe, Open ]
                                |> List.concatMap
                                    (\shading ->
                                        [ One, Two, Three ]
                                            |> List.map
                                                (\count ->
                                                    Card color shape shading count
                                                )
                                    )
                        )
            )


isCardSelected : Card -> List (Maybe Card) -> Bool
isCardSelected card selectedCards =
    List.member (Just card) selectedCards


cardSelectionFull : List (Maybe Card) -> Bool
cardSelectionFull selectedCards =
    List.all isJust selectedCards


isJust : Maybe a -> Bool
isJust maybe =
    case maybe of
        Just _ ->
            True

        Nothing ->
            False


drawFromDeck : Deck -> Int -> ( Deck, List Card )
drawFromDeck deck count =
    ( List.drop count deck, List.take count deck )
