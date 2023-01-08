# Compilacao do Documento com latexmk
# Autor: Giordano Vicente | GitHub: @giordanorn

.PHONY: default view pdf clean cleanall macros

default: pdf

pdf: macros
	latexmk -pdf

view: macros
	latexmk -pdf -pv

clean:
	latexmk -c

cleanall:
	latexmk -C
	rm -rf *.run.xml *.bbl

macros:
 	git submodule update --init --recursive
	git submodule foreach git pull origin master