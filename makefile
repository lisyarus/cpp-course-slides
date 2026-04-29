PDFLATEX=lualatex -shell-escape -interaction=nonstopmode -halt-on-error

.ONESHELL:

all: pdf/lecture09.pdf
all: pdf/lecture10.pdf
all: pdf/lecture11.pdf
all: pdf/lecture12.pdf
all: pdf/lecture13.pdf
all: pdf/lecture14.pdf
all: pdf/lecture15.pdf
all: pdf/lecture16.pdf
all: pdf/lecture17.pdf
all: pdf/lecture18.pdf
all: pdf/lecture19.pdf
all: pdf/lecture20.pdf

pdf/%.pdf: source/%/source.tex source/%/images/*.png
	mkdir -p build/$(@F)
	ls build/$(@F)/images || ln -sv ../../source/$*/images build/$(@F)/images
	cd build/$(@F) && $(PDFLATEX) ../../$< && $(PDFLATEX) ../../$< && mv source.pdf ../../$@

.PHONY: clean
clean:
	rm -rf *.pdf build/*
