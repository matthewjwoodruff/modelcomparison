all: paper binaries

binaries: bin/gasp/quietgasp

paper: markdown pdf

markdown: README.md draft.md
pdf: draft
draft: latex/draft.pdf

README.md: src/README.md src/license.html
	pandoc -i src/README.md -o src/README.html --bibliography src/bibliography.bib
	pandoc -i src/README.html src/license.html -o README.md -t markdown_github

draft.md: src/license.html src/paper/bibliography.bib src/paper/back.md src/paper/abstract.md src/paper/intro.md src/paper/compex.md
	pandoc -i src/paper/abstract.md src/paper/intro.md src/paper/compex.md src/paper/back.md -o draft.html --bibliography src/paper/bibliography.bib
	pandoc -i draft.html src/license.html -o draft.md -t markdown_github

latex:
	mkdir -p latex

latex/draftinput.tex: src/paper/bibliography.bib src/paper/abstract.md src/paper/compex.md src/paper/back.md src/paper/intro.md latex
	pandoc src/paper/abstract.md src/paper/intro.md src/paper/compex.md src/paper/back.md -o latex/draftinput.tex --metadata biblio-files=src/paper/bibliography.bib  --natbib --chapters

latex/draft.tex: src/paper/drafttemplate.tex latex
	cp src/paper/drafttemplate.tex latex/draft.tex

latex/draft.pdf: latex/draft.tex latex/draftinput.tex src/paper/bibliography.bib latex
	cp src/paper/bibliography.bib latex
	pdflatex draft.tex
	bibtex draft
	pdflatex draft.tex
	pdflatex draft.tex

bin/gasp/quietgasp: src/gasp/gaspall.f
	gfortran -fno-automatic src/gasp/gaspall.f -o bin/gasp/quietgasp

clean: paperclean

allclean: paperclean binclean

paperclean: nojunk
	rm -f draft.md README.md latex/draft.pdf

nojunk:
	rm -f src/README.html
	rm -f src/draft.html src/README.html
	rm -f *aux *bbl *blg *log *out *tex

binclean:
	rm -f bin/gasp/quietgasp
