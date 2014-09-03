.SUFFIXES: .md .html .pdf
.PRECIOUS: %.pdf %.html
.PRECIOUS: 

.md.html: 
	pandoc --toc --mathjax=MathJax/MathJax.js\
          --template=template-revealjs.html\
          -s -t html5\
          -f markdown --section-divs -o $@ $<

.md.pdf:
	pandoc --listings -H header.tex\
          -V theme:Warsaw -V colortheme:seahorse\
          -s -t beamer -f markdown -o $@ $<
