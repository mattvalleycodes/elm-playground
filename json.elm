import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Http
import Json.Decode exposing (Decoder, field, string)


main =
  Browser.element
    { init = init
    , update = update
    , subscriptions = subscriptions
    , view = view
    }


type Model
  = Loading
  | Failure
  | Success String


type Msg
  = MorePlease
  | GotGif (Result Http.Error String)


subscriptions: Model -> Sub Msg
subscriptions _ =
  Sub.none


update: Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    MorePlease ->
      (Loading, getRandomCatGif)

    GotGif result ->
      case result of
        Ok url ->
          (Success url, Cmd.none)

        Err _ ->
          (Failure, Cmd.none)


gifDecoder: Decoder String
gifDecoder =
  field "data" (field "image_url" string)


getRandomCatGif: Cmd Msg
getRandomCatGif =
  Http.get
    { url = "https://api.giphy.com/v1/gifs/random?api_key=dc6zaTOxFJmzC&tag=cat"
    , expect = Http.expectJson GotGif gifDecoder
    }


init: () -> (Model, Cmd Msg)
init _ =
  (Loading, getRandomCatGif)


viewGif: Model -> Html Msg
viewGif model =
  case model of
    Loading ->
      text "loading"

    Failure ->
      div []
        [ text "I could not load a random cat for some reason. "
        , button [ onClick MorePlease ][ text "Try Again!" ]
        ]

    Success url ->
      div []
        [ button [ onClick MorePlease, style "display" "block" ] [ text "More Please" ]
        , img [ src url ] []
        ]


view: Model -> Html Msg
view model =
  div []
    [ h2 [] [ text "Random Cats" ]
    , viewGif model
    ]
