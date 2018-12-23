type MaybeValid
  = Yes
  | No


convert: String -> MaybeValid
convert source =
  case String.toFloat source of
    Just value ->
      Yes

    Nothing ->
      No


itsYes = convert "12"
itsNo = convert "No"
