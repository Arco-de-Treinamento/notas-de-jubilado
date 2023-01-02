.PHONY: default view pdf clean cleanAll updateMacros cleanFiles

default: pdf

pdf: updateMacros
	latexmk -pdf

view: updateMacros
	latexmk -pdf -pv

clean:
	latexmk -c

cleanAll:
	latexmk -C

updateMacros:
	git submodule update --init --recursive
	git submodule foreach git pull origin master
