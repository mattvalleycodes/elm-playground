isReasonableAge: String -> Result String Int
isReasonableAge input =
  case String.toInt input of
    Nothing ->
      Err "That is not a number!"

    Just age ->
      if age <= 0 then
        Err "Try again when you are born!"
      else if age >= 130 then
        Err "Are you some kind of turtle?"
      else
        Ok age

resultA = isReasonableAge "a"
resultB = isReasonableAge "-12"
resultC = isReasonableAge "12"
resultD = isReasonableAge "150"
