type alias User =
  { name: String
  , age: Maybe Int
  }

sue: User
sue = { name = "Sue", age = Nothing }

tom: User
tom = { name = "Tom", age = Just 21 }

canBuyAlcohol: User -> Bool
canBuyAlcohol user =
  case user.age of
    Nothing ->
      False

    Just age ->
      if age >= 21 then
        True
      else
        False

canSueBuyAlcohol = canBuyAlcohol sue
canTomBuyAlcohol = canBuyAlcohol tom
