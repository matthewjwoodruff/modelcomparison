#### Big aliases

all: paper binaries slides
binaries: bin/gasp/quietgasp
paper: markdown pdf
slides: slides/slides.html

markdown: README.md draft.md
pdf: draft
draft: pdf/draft.pdf

#### markdown

README.md: src/README.md src/license.html src/bibliography.bib
	pandoc -i src/README.md -o html/README.html --bibliography src/bibliography.bib
	pandoc -i html/README.html src/license.html -o README.md -t markdown_github

draft.md: src/license.html src/bibliography.bib src/paper/back.md src/paper/abstract.md src/paper/intro.md src/paper/compex.md
	pandoc -i src/paper/abstract.md src/paper/intro.md src/paper/compex.md src/paper/back.md -o html/draft.html --bibliography src/bibliography.bib
	pandoc -i html/draft.html src/license.html -o draft.md -t markdown_github

#### pdf

latex:
	mkdir -p latex

latex/draftinput.tex: src/bibliography.bib src/paper/abstract.md src/paper/compex.md src/paper/back.md src/paper/intro.md latex
	pandoc src/paper/abstract.md src/paper/intro.md src/paper/compex.md src/paper/back.md -o latex/draftinput.tex --metadata biblio-files=src/bibliography.bib  --natbib --chapters

latex/draft.tex: src/paper/drafttemplate.tex latex
	cp src/paper/drafttemplate.tex latex/draft.tex

latex/bibliography.bib: src/bibliography.bib
	mkdir -p latex
	cp src/bibliography.bib latex

latex/draft.pdf: latex/draft.tex latex/draftinput.tex latex/bibliography.bib
	mkdir -p latex
	cd latex; \
	pdflatex draft.tex; \
	bibtex draft; \
	pdflatex draft.tex; \
	pdflatex draft.tex

pdf/draft.pdf: latex/draft.pdf
	mkdir -p pdf
	cp latex/draft.pdf pdf/

#### paperclean

paperclean: nojunk
	rm -f draft.md README.md pdf/draft.pdf

nojunk:
	rm -f html/README.html
	rm -f html/draft.html
	rm -f latex/*{aux,bbl,blg,log,out,tex,bib}

#### proposal

slides/slides.html: src/proposal/slides.md src/bibliography.bib src/license.html
	mkdir -p slides
	pandoc -t slidy -s src/proposal/slides.md  -o slides/slides.html --standalone --self-contained --slide-level=1 --bibliography src/bibliography.bib

slidesclean:
	rm -f slides/slides.html

#### binaries

bin/gasp/quietgasp: src/gasp/gaspall.f
	gfortran -fno-automatic src/gasp/gaspall.f -o bin/gasp/quietgasp

binclean:
	rm -f bin/gasp/quietgasp

### clean

clean: paperclean slidesclean

allclean: paperclean binclean 

