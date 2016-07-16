module List.Split exposing (..)

{-| Split lists into chunks

# Splitters
@docs chunksOfLeft, chunksOfRight

-}

import List exposing (..)


{-| Split list into smaller lists of length `k`, starting from the left.

    chunksOfLeft  3 [1..9] == [[1,2,3],[4,5,6],[7,8,9]]
    chunksOfLeft  3 [1,2,3,4,5,6,7,8] == [[1,2,3],[4,5,6],[7,8]]
    chunksOfLeft  3 [] == [[]]
    chunksOfLeft  0 xs == [[]]
    chunksOfLeft -1 xs == []
-}
chunksOfLeft : Int -> List a -> List (List a)
chunksOfLeft k xs =
    if k == 0 then
        [ [] ]
    else if k < 0 then
        []
    else if length xs > k then
        take k xs :: chunksOfLeft k (drop k xs)
    else
        [ xs ]


{-| Split list into smaller lists of length `k`, starting from the right.

    chunksOfRight  3 [1..9] == [[7,8,9],[4,5,6],[1,2,3]]
    chunksOfRight  3 [1,2,3,4,5,6,7,8] == [[6,7,8],[3,4,5],[1,2]]
    chunksOfRight  3 [] == [[]]
    chunksOfRight  0 xs == [[]]
    chunksOfRight -1 xs == []
-}
chunksOfRight : Int -> List a -> List (List a)
chunksOfRight k =
    map reverse << chunksOfLeft k << reverse
