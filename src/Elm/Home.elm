module Home (..) where

import Html exposing (div, a, text, Html, Attribute)
import Html.Attributes as Attrs
import Skeleton exposing (skeleton)


(=>) : a -> b -> ( a, b )
(=>) =
  (,)


main : Html
main =
  skeleton
    "home"
    [ splash ]


splash : Html
splash =
  div
    [ Attrs.id "splash" ]
    [ div [ size 100 16 ] [ text "lpi" ]
    , div [ size 26 8 ] [ text "A small dependently typed language in your browser" ]
    , div
        [ size 26 30 ]
        [ a [ Attrs.href "index.html" ] [ text "repl" ] ]
    ]


size : a -> b -> Attribute
size height padding =
  Attrs.style
    [ "font-size" => (toString height ++ "px")
    , "padding" => (toString padding ++ "px 0")
    ]
