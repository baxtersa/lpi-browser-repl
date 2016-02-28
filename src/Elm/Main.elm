module Main (..) where

import Html exposing (div, p, text, Html, node)
import Html.Attributes as Attrs
import Html.Events as Events
import Signal exposing (map, mailbox, foldp, Mailbox, Address)


main : Signal Html
main =
  Signal.map (view actions.address) model



-- ACTIONS


type Action
  = NoOp


actions : Mailbox Action
actions =
  Signal.mailbox NoOp



-- MODEL


type alias Model =
  {}


initialModel : Model
initialModel =
  {}


model : Signal Model
model =
  Signal.foldp update initialModel actions.signal



-- VIEW


button : String -> String -> String -> Address () -> Html
button class title prompt address =
  div
    [ Attrs.class class
    , Attrs.title title
    , Events.onClick address ()
    ]
    [ text prompt
    ]


view : Address Action -> Model -> Html
view address model =
  div
    [ Attrs.class "options" ]
    [ button
        "button teal"
        "Type-check and evaluate the code (Cmd+Enter)"
        "Compile"
        compileMailbox.address
    , button
        "button teal"
        "Clear code from the editor"
        "Clear"
        clearMailbox.address
    ]


update : Action -> Model -> Model
update action model =
  model


compileMailbox : Mailbox ()
compileMailbox =
  Signal.mailbox ()


clearMailbox : Mailbox ()
clearMailbox =
  Signal.mailbox ()


port compile : Signal ()
port compile =
  compileMailbox.signal


port clear : Signal ()
port clear =
  clearMailbox.signal
