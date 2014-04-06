DEPS=Makefile


all: minorchange.pdf

imgclean:
	rm -f img/*.pdf

outputclean:
	rm -f *.pdf

intermediateclean:
	rm -f *.aux
	rm -f *.bbl
	rm -f *.log
	rm -f *.out
	rm -f *.blg
	rm -f *.nlo
	rm -f *.ist
	rm -f *.nls

clean: imgclean outputclean intermediateclean

%.pdf-view: %.pdf
		qpdfview $<

%.pdf-install: %.pdf
	cp -v $< ~/public_html/


#PDF files
minorchange.pdf: minorchange.tex $(DEPS)
	pdflatex minorchange.tex
#	bibtex kalman_paper.aux
#	pdflatex kalman_paper.tex
#	pdflatex kalman_paper.tex



#Image generation
img/%.pdf: img/%.svg $(DEPS)
	 rsvg-convert -f pdf -o $@ $<
