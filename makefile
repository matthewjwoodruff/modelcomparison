all: README.md

README.html: src/README.md
	 pandoc -i src/README.md -o README.html --bibliography src/bibliography.bib

README.md: README.html src/license.html
	pandoc -i README.html src/license.html -o README.md -t markdown_github

clean:
	rm -f README.md README.html
