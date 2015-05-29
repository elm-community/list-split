module List.Split where
{-| Split lists into chunks

# Splitters
@docs chunksOfLeft, chunksOfRight

-}

import List exposing (..)

{-| Split list into smaller lists of length `k`, starting from the left.

    chunksOfLeft 3 [1,2,3,4,5,6,7,8] == [[1,2,3],[4,5,6],[7,8]]
-}
chunksOfLeft : Int -> List a -> List (List a)
chunksOfLeft k xs =
  let len = length xs
  in  if len > k
      then take k xs :: chunksOfLeft k (drop k xs)
      else [xs]

{-| Split list into smaller lists of length `k`, starting from the right.

    chunksOfRight 3 [1,2,3,4,5,6,7,8] == [[1,2], [3,4,5], [6,7,8]]
-}
chunksOfRight : Int -> List a -> List (List a)
chunksOfRight k = map reverse << chunksOfLeft k << reverse
