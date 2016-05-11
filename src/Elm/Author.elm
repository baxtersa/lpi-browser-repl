module Author exposing (..)

import Html exposing (div, h1, text, a, p, ul, li, span, Html, Attribute)
import Html.Attributes as Attrs
import Skeleton exposing (skeleton)


(=>) : a -> b -> ( a, b )
(=>) =
  (,)


main : Html msg
main =
  skeleton
    "author"
    [ nav
    , bio
    , links
    ]


nav : Html msg
nav =
  div
    [ Attrs.id "nav" ]
    []


bio : Html msg
bio =
  div
    [ Attrs.id "bio" ]
    [ h1 [] [ text "bio" ]
    , p
        [ Attrs.style
            [ "font-size" => "18px"
            , "width" => "900px"
            ]
        ]
        [ text "I'm a software developer at "
        , a [ Attrs.href "http://www.izotope.com" ] [ text "iZotope" ]
        , text " and a prospective PhD student of computer science. My research focus"
        , text " is in programming languages and type systems, with a particular"
        , text " interest in applying PL techniques to systems implementations."
        ]
    ]


links : Html msg
links =
  div
    [ Attrs.id "links" ]
    [ h1 [] [ text "links" ]
    , ul
        [ Attrs.style
            [ "font-size" => "18px"
            , "color" => "rgb(199, 146, 234)"
            , "width" => "900px"
            ]
        ]
        [ li
            []
            [ link_item
                [ text "My undergrate thesis on an ML implementation of the dependently-"
                , text "typed lambda calculus: "
                , a
                    [ Attrs.href "http://cslab1.bc.edu/~csacademics/pdf/14Baxter.pdf" ]
                    [ text "PDF" ]
                ]
            ]
        , li
            []
            [ link_item
                [ text "My github profile: "
                , a
                    [ Attrs.href "http://github.com/baxtersa" ]
                    [ text "baxtersa" ]
                ]
            ]
        ]
    ]


link_item : List (Html msg) -> Html msg
link_item item =
  span
    [ Attrs.style
        [ "color" => "rgb(233, 237, 237)" ]
    ]
    item
