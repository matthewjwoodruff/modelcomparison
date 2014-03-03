all: markdown pdf

markdown: README.md draft.md
pdf: draft.pdf

README.md: src/README.md src/license.html
	pandoc -i src/README.md -o README.html --bibliography src/bibliography.bib
	pandoc -i README.html src/license.html -o README.md -t markdown_github

draft.md: src/license.html src/bibliography.bib src/back.md src/abstract.md src/intro.md src/compex.md
	pandoc -i src/abstract.md src/intro.md src/compex.md src/back.md -o draft.html --bibliography src/bibliography.bib
	pandoc -i draft.html src/license.html -o draft.md -t markdown_github

draftinput.tex: src/bibliography.bib src/abstract.md src/compex.md src/back.md src/intro.md
	pandoc src/abstract.md src/intro.md src/compex.md src/back.md -o draftinput.tex --metadata biblio-files=src/bibliography.bib  --natbib --chapters

draft.tex: src/drafttemplate.tex
	cp src/drafttemplate.tex draft.tex

draft.pdf: draft.tex draftinput.tex src/bibliography.bib
	pdflatex draft.tex
	bibtex draft
	pdflatex draft.tex
	pdflatex draft.tex

clean:
	rm -f *html
	rm -f *md
	rm -f *aux *bbl *blg *log *out *pdf *tex *docx
