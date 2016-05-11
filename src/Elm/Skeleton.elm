module Skeleton exposing (skeleton)

import VirtualDom exposing (Node)
import Html exposing (div, a, ul, li, text, Html)
import Html.Attributes as Attrs


(=>) : a -> b -> ( a, b )
(=>) =
  (,)


skeleton : String -> List (Node msg) -> Html msg
skeleton name content =
  div
    []
    (header name :: content ++ [ footer ])


header : String -> Html msg
header name =
  div
    [ Attrs.id "nav-tabs" ]
    [ a [ Attrs.href "/" ] [ text "home" ]
    , ul
        []
        (List.map (tab name) [ "repl", "features", "author" ])
    ]


tab : String -> String -> Html msg
tab selected other =
  li
    []
    [ a
        [ Attrs.classList [ "tab" => True, "current" => (selected == other) ]
        , Attrs.href ("/" ++ other)
        ]
        [ text other ]
    ]


footer : Html msg
footer =
  div
    [ Attrs.class "footer" ]
    [ text "Code for this site is open source under MIT License and can be found at\n"
    , a
        [ Attrs.href "http://github.com/baxtersa"
        , Attrs.class "purple-link"
        ]
        [ text "http://github.com/baxtersa" ]
    ]
