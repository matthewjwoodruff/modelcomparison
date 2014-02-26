all: README.md sections/abstract.md sections/compex.md

README.md: src/README.md src/license.html
	pandoc -i src/README.md -o README.html --bibliography src/bibliography.bib
	pandoc -i README.html src/license.html -o README.md -t markdown_github

sections/abstract.md: src/license.html src/bibliography.bib src/abstract.md
	pandoc -i src/abstract.md -o abstract.html --bibliography src/bibliography.bib
	pandoc -i abstract.html src/license.html -o sections/abstract.md -t markdown_github

sections/compex.md: src/license.html src/bibliography.bib src/compex.md
	pandoc -i src/compex.md -o compex.html --bibliography src/bibliography.bib
	pandoc -i compex.html src/license.html -o sections/compex.md -t markdown_github


clean:
	rm -f README.md
	rm -f *html
	rm -f sections/*md
