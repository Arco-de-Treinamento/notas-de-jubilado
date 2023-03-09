# ==== FLAGS ====
TEX_FLAGS = -pdf	     \
			-shell-escape

DARKMODE = -pdflatex="pdflatex %O '\def\darkmode{1} \input{%S}'"
AUX_FILES = *.run.xml *.bbl *.listing _minted-*

# ==== NOMES DOS ARQUIVOS ====
DARKMODE_NAME  = Jubilado_DarkMode
LIGHTMODE_NAME = Jubilado

.PHONY: default macros lightMode darkMode debug clean 

default: lightMode

macros:
	git submodule update --init --recursive
	git submodule foreach git pull origin master

lightMode: macros
	latexmk $(TEX_FLAGS) -jobname=$(LIGHTMODE_NAME) 
	latexmk -c -jobname=$(LIGHTMODE_NAME)
	rm -rf $(AUX_FILES)

darkMode: macros
	latexmk $(TEX_FLAGS) -jobname=$(DARKMODE_NAME) $(DARKMODE)
	latexmk -c -jobname=$(DARKMODE_NAME)
	rm -rf $(AUX_FILES)

debug: 
	latexmk $(TEX_FLAGS) -pvc $(DARKMODE)

clean:
	latexmk -C
	rm -rf $(AUX_FILES) *.pdf

