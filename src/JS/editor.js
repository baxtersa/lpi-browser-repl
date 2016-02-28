function compile () {
    var form = document.getElementById("inputForm");
    form.submit();
}

function clear () {
    editor.setValue("");
    editor.clearHistory();
}

var editor;

function initEditor() {
    var controlsDiv = document.getElementById("controls");
    var controls = Elm.embed(Elm.Main, controlsDiv);

    controls.ports.compile.subscribe(compile);
    controls.ports.clear.subscribe(clear);
    
    editor = CodeMirror.fromTextArea(document.getElementById("code"), {
        lineNumbers: true,
        lineWrapping: true,
        theme: "material",
        mode: "lpi",
        extraKeys: {
	    'Cmd-Enter': compile
        }
    });
};
