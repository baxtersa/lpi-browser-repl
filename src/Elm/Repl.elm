module Repl (..) where

import Html exposing (div, iframe, Html, Attribute)
import Html.Attributes as Attrs
import Skeleton exposing (skeleton)


main : Html
main =
  skeleton
    "repl"
    [ io_frames ]


io_frames : Html
io_frames =
  div
    [ Attrs.id "repl" ]
    [ iframe
        [ Attrs.id "input"
        , Attrs.name "input"
        , Attrs.src "/editor"
        ]
        []
    , iframe
        [ Attrs.id "output"
        , Attrs.name "output"
        , Attrs.src "/editor"
        ]
        []
    ]
