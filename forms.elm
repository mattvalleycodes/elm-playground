import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)

main =
  Browser.sandbox { init = init , update = update , view = view }

type alias Model =
  {
    name: String,
    password: String,
    passwordAgain: String
  }

init: Model
init =
  Model "" "" ""

type Msg
  = Name String | Password String | PasswordAgain String

update: Msg -> Model -> Model
update msg model =
  case msg of
    Name name ->
      { model | name = name }

    Password password ->
      { model | password = password }

    PasswordAgain passwordAgain ->
      { model | passwordAgain = passwordAgain }

view : Model -> Html Msg

view model =
  div []
    [
      viewInput "text" "Your name" model.name Name ,
      viewInput "password" "Your Password" model.password Password ,
      viewInput "password" "Your password, again!" model.passwordAgain PasswordAgain ,
      viewValidation model
    ]

viewInput : String -> String -> String -> ( String -> msg ) -> Html msg

viewInput t p v toMsg =
  input [ type_ t, placeholder p, value v, onInput toMsg] []

viewValidation: Model -> Html Msg

viewValidation model =
  if model.password == model.passwordAgain then
    div [] [ text "OK" ]
  else
    div [] [ text "Not OK" ]
