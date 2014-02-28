all: markdown pdf

markdown: README.md sections/abstract.md sections/compex.md sections/intro.md
pdf: draft.pdf

README.md: src/README.md src/license.html
	pandoc -i src/README.md -o README.html --bibliography src/bibliography.bib
	pandoc -i README.html src/license.html -o README.md -t markdown_github

sections/abstract.md: src/license.html src/bibliography.bib src/abstract.md
	pandoc -i src/abstract.md -o abstract.html --bibliography src/bibliography.bib
	pandoc -i abstract.html src/license.html -o sections/abstract.md -t markdown_github

sections/intro.md: src/license.html src/bibliography.bib src/intro.md
	pandoc -i src/intro.md -o intro.html --bibliography src/bibliography.bib
	pandoc -i intro.html src/license.html -o sections/intro.md -t markdown_github

sections/compex.md: src/license.html src/bibliography.bib src/back.md src/compex.md
	pandoc -i src/compex.md src/back.md -o compex.html --bibliography src/bibliography.bib
	sed -e "s/align/valign=\"top\" align/g;s/<table/<table border=1/" -i compex.html
	pandoc -i compex.html src/license.html -o sections/compex.md -t markdown_github

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
	rm -f README.md
	rm -f *html
	rm -f sections/*md
	rm -f *aux *bbl *blg *log *out *pdf *tex *docx
