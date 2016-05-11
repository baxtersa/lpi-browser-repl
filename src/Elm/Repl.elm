module Repl exposing (..)

import Html exposing (div, iframe, Html, Attribute)
import Html.Attributes as Attrs
import Skeleton exposing (skeleton)


main : Html msg
main =
  skeleton
    "repl"
    [ io_frames ]


io_frames : Html msg
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
