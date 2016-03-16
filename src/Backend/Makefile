OCAMLC=ocamlc
OCAMLFIND=ocamlfind
SRCDIR=.
INCLUDES=-I $(SRCDIR)
OCAMLFLAGS=$(INCLUDES)    # add other options for ocamlc here
OCAMLFIND_FLAGS=-linkpkg -package lwt,cohttp,cohttp.lwt,core,lpi -thread \
		$(OCAMLFLAGS)

LPI_SERVER_SRCS= server.ml

server:
	$(OCAMLFIND) $(OCAMLC) -o ../../lpi-server \
	$(OCAMLFIND_FLAGS) $(LPI_SERVER_SRCS)

# Common rules
.SUFFIXES: .ml .mli .cmo .cmi .cmx

%.cmo: $(SRCDIR)/%.ml
		 $(OCAMLC) $(OCAMLFLAGS) -c $<

%.cmi: $(SRCDIR)/%.mli
		 $(OCAMLC) $(OCAMLFLAGS) -c $<

%.cmx: $(SRCDIR)/%.ml
		 $(OCAMLOPT) $(OCAMLOPTFLAGS) -c $<

clean:
	rm -f ../../lpi-server
	rm -f $(SRCDIR)/*.cm* $(SRCDIR)/*~
