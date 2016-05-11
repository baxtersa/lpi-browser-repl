module Home exposing (..)

import Html exposing (div, a, text, Html, Attribute)
import Html.Attributes as Attrs
import Skeleton exposing (skeleton)


(=>) : a -> b -> ( a, b )
(=>) =
  (,)


main : Html msg
main =
  skeleton
    "home"
    [ splash ]


splash : Html msg
splash =
  div
    [ Attrs.id "splash" ]
    [ div [ size 100 16 ] [ text "lpi" ]
    , div [ size 26 8 ] [ text "A small dependently typed language in your browser" ]
    , div
        [ size 26 30 ]
        [ a [ Attrs.href "/repl" ] [ text "repl" ] ]
    ]


size : a -> b -> Attribute msg
size height padding =
  Attrs.style
    [ "font-size" => (toString height ++ "px")
    , "padding" => (toString padding ++ "px 0")
    ]
