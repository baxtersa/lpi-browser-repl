module Skeleton (skeleton) where

import VirtualDom exposing (Node)
import Html exposing (div, a, ul, li, text, Html)
import Html.Attributes as Attrs


(=>) : a -> b -> ( a, b )
(=>) =
  (,)


skeleton : String -> List Node -> Html
skeleton name content =
  div
    []
    (header name :: content ++ [ footer ])


header : String -> Html
header name =
  div
    [ Attrs.id "nav-tabs" ]
    [ a [ Attrs.href "home.html" ] [ text "home" ]
    , ul
        []
        (List.map (tab name) [ "repl" ])
    ]


tab : String -> String -> Html
tab selected other =
  li
    []
    [ a
        [ Attrs.classList [ "tab" => True, "current" => (selected == other) ]
        , Attrs.href "index.html"
        ]
        [ text other ]
    ]


footer : Html
footer =
  div
    [ Attrs.class "footer" ]
    [ text "Code for this site is open source under MIT License and can be found at\n"
    , a [ Attrs.href "http://github.com/baxtersa" ] [ text "http://github.com/baxtersa" ]
    ]