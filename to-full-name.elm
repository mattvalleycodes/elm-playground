toFullName person =
  person.firstName ++ " " ++ person.lastName

fullName =
  toFullName { fistName = "Mehdi", lastName =  "Valikhani" }
