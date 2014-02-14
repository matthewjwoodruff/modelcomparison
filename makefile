all: README.md

README.md: src/README.md
	 pandoc -i src/README.md -o README.md -t markdown_github --bibliography src/bibliography.bib
