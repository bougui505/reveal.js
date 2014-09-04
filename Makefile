.SUFFIXES: .rst .html .pdf
.PRECIOUS: %.pdf %.html
.PRECIOUS: 

.rst.html: 
	pandoc --toc --mathjax=MathJax/MathJax.js\
          --template=template-revealjs.html --variable transition="default"\
		  --variable theme="serif"\
          -s -t html5\
          -f rst --section-divs -o $@ $<

.rst.pdf:
	pandoc --listings -H header.tex\
          -V theme:Warsaw -V colortheme:seahorse\
          -s -t beamer -f rst -o $@ $<
