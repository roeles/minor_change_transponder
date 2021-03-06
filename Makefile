DEPS=Makefile


all: minorchange_complete.pdf

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
minorchange_complete.pdf: minorchange.pdf preface.pdf
	pdftk preface.pdf approval.pdf minorchange.pdf cat output $@

minorchange.pdf: minorchange.tex img/b4_ersatzteil_katalog_fig_2_1_3_annotated.pdf img/b4_ersatzteil_katalog_fig_2_1_15_annotated.pdf img/antenna_location.pdf img/inside.pdf img/outside.pdf img/bxp6401.pdf img/trt800.pdf img/tt21.pdf img/vt01.pdf img/circuit.pdf $(DEPS)
	pdflatex minorchange.tex
	pdflatex minorchange.tex
	pdflatex minorchange.tex
#	bibtex kalman_paper.aux
#	pdflatex kalman_paper.tex
#	pdflatex kalman_paper.tex

preface.pdf: preface.tex
	pdflatex preface.tex
	pdflatex preface.tex
	pdflatex preface.tex



#Image generation
img/%.pdf: img/%.svg $(DEPS)
	inkscape -z -D --file=$< --export-pdf=$@
#	 rsvg-convert -f pdf -o $@ $<
