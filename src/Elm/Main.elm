port module Main exposing (..)

import Html exposing (div, p, text, Html, node)
import Html.App as Html
import Html.Attributes as Attrs
import Html.Events as Events


main : Program Never
main =
  Html.program
      { init = init
      , view = view
      , update = update
      , subscriptions = always Sub.none
      }


-- MODEL


type alias Model =
  {}


initialModel : Model
initialModel =
  {}


init : ( Model, Cmd msg )
init =
  ( initialModel, Cmd.none )


-- MSG


type Msg
  = NoOp
  | Compile
  | Clear


-- VIEW


button : String -> String -> String -> Msg -> Html Msg
button class title prompt msg =
  div
    [ Attrs.class class
    , Attrs.title title
    , Events.onClick msg
    ]
    [ text prompt
    ]


view : Model -> Html Msg
view model =
  div
    [ Attrs.class "options" ]
    [ button
        "button teal"
        "Type-check and evaluate the code (Cmd+Enter)"
        "Compile"
        Compile
    , button
        "button teal"
        "Clear code from the editor"
        "Clear"
        Clear
    ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    NoOp ->
      ( model, Cmd.none )
    Compile ->
      ( model, compile () )
    Clear ->
      ( model, clear () )


port compile : () -> Cmd msg

port clear : () -> Cmd msg
