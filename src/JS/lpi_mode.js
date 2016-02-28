/* Example definition of a simple mode that understands a subset of
 * JavaScript:
 */

CodeMirror.defineSimpleMode("lpi", {
    // The start state contains the rules that are intially used
    start: [
        // The regex matches the token, the token property contains the type
        {regex: /"(?:[^\\]|\\.)*?"/, token: "string"},
        // You can match multiple tokens at once. Note that the captured
        // groups must span the whole string in this case
        {regex: /(let|fn|pi)(\s+)([a-z$][\w$]*)/,
         token: ["keyword", null, "def"]},
        // Rules are matched in the order in which they appear, so there is
        // no ambiguity between this one and the one above
        {regex: /(?:fn|pi|let|if|then|else)\b/,
         token: "keyword"},
        {regex: /(?:int|bool|list|true|false|stop|more)\b/, token: "atom"},
        {regex: /0x[a-f\d]+|[-+]?(?:\d\.\d+|\d+\.?\d*)(?:e[-+]?\d+)?/i,
         token: "number"},
        {regex: /\/(?:[^\\]|\\.)*?\//, token: "variable-3"},
        {regex: /[-+\/*=<>!%]+/, token: "operator"},
        // indent and dedent properties guide autoindentation
        {regex: /[\{\[\(]/, indent: true},
        {regex: /[\}\]\)]/, dedent: true},
        {regex: /[a-z$][\w$]*/,
         token: "variable-2"},
    ],
});
