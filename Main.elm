module Test (..) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import StartApp.Simple
import String
import Maybe.Extras as Maybe
import Romans exposing (toRoman)


type alias Result =
  { arabic : Int
  , roman : String
  }


type alias Model =
  Maybe Result


initialModel : Model
initialModel =
  Nothing


type Action
  = UpdateText String


update : Action -> Model -> Model
update action model =
  case action of
    UpdateText input ->
      input
        |> String.toInt
        |> Result.toMaybe
        |> Maybe.bind
            (\x ->
              if x <= 0 || x >= 4000 then
                model
              else
                Just
                  { arabic = x
                  , roman = toRoman x
                  }
            )


view : Signal.Address Action -> Model -> Html
view address model =
  let
    ( arabic, roman ) =
      case model of
        Just { arabic, roman } ->
          ( toString arabic, roman )

        Nothing ->
          ( "", "" )
  in
    div
      []
      [ input
          [ type' "number"
          , value arabic
          , on "input" targetValue (Signal.message address << UpdateText)
          ]
          []
      , text roman
      ]


main : Signal Html
main =
  StartApp.Simple.start
    { model = initialModel
    , update = update
    , view = view
    }
