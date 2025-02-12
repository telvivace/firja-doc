
# Default dataset folder (change as needed)
G_DATASET ?= dataset1

YCAP ?= 1000
# Find all CSV files in the dataset directory
G_DATAFILES := $(wildcard data/$(G_DATASET)/*.csv)

# Generate output PDF filenames based on the data files
OUTPUTS := $(patsubst data/$(G_DATASET)/%.csv, graph_$(G_DATASET)_%.pdf, $(G_DATAFILES))


all: raziskovalna.pdf $(OUTPUTS)

LATEX = lualatex  -interaction=nonstopmode -halt-on-error
raziskovalna.pdf: raziskovalna.tex
	$(LATEX) raziskovalna.tex
	bibtex raziskovalna.aux
	$(LATEX) raziskovalna.tex
	$(LATEX) raziskovalna.tex


# Rule to generate PDFs for each data file
$(OUTPUTS): graph_$(G_DATASET)_%.pdf: data/$(G_DATASET)/%.csv graph_hit.tex
	$(LATEX) "\def\SetYLimits{0}{$(YCAP)} \def\DataPath{$<} \input{graph_hit.tex}"
	mv graph.pdf $@


clean:
	rm -f *.aux *.log *.nav *.toc *.snm *.out *.vrb

realclean: clean
	rm -f *.pdf *~
