TEXI2PDF = texi2pdf --pdf --batch --quiet --tidy
VIEWER = acroread
INPUT_FILES =	linux-packaging.tex		\
		src/compilation-profiles.tex	\
		src/install.tex			\
		src/introduction.tex		\
		src/package.tex			\
		src/zoology.tex

all: linux-packaging.pdf

%.pdf: %.tex
	$(TEXI2PDF) $< -o $@

linux-packaging.pdf: $(INPUT_FILES)

clean:
	-$(TEXI2PDF) --mostly-clean linux-packaging.tex

distclean: clean
	-rm -f linux-packaging.pdf

view: linux-packaging.pdf
	-$(VIEWER) $<&

.PHONY: clean distclean view view-fiche
.SUFFIXES: pdf
