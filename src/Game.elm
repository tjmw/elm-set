module Game exposing (..)

import List exposing (repeat)


gridWidth : Int
gridWidth =
    10


gridHeight : Int
gridHeight =
    18


type GridCellState
    = Empty
    | Full Shape


type alias Grid =
    List (List GridCellState)


defaultGrid : Grid
defaultGrid =
    repeat 18 <| repeat 10 Empty


type Shape
    = T
    | S
    | Z
    | J
    | L
    | Line
    | Square


type Orientation
    = Zero
    | Ninety
    | OneEighty
    | TwoSeventy


type Brick
    = Brick Shape Orientation


rotateOrientationClockwise : Orientation -> Orientation
rotateOrientationClockwise orientation =
    case orientation of
        Zero ->
            Ninety

        Ninety ->
            OneEighty

        OneEighty ->
            TwoSeventy

        TwoSeventy ->
            Zero


rotateBrickClockwise : Brick -> Brick
rotateBrickClockwise (Brick shape orientation) =
    rotateOrientationClockwise orientation |> Brick shape
