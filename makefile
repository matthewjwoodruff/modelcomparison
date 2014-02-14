all: README.md

#README.md: src/README.md
#	 pandoc -i src/README.md -o README.md -t markdown_github+tex_math_dollars --bibliography src/bibliography.bib

README.html: src/README.md
	 pandoc -i src/README.md -o README.html --bibliography src/bibliography.bib

README.md: README.html
	pandoc -i README.html -o README.md -t markdown_github

clean:
	rm -f README.md README.html
