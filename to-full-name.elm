toFullName person =
  person.firstName ++ " " ++ person.lastName

fullName =
  toFullName { firstName = "Mehdi", lastName =  "Valikhani" }
