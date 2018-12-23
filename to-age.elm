type MaybeAge
  = Age Int
  | InvalidInput


toAge: String -> MaybeAge
toAge input =
  case String.toInt input of
    Just age ->
      Age age

    Nothing ->
      InvalidInput


withNumber = toAge "12"

withLetter = toAge "a"
