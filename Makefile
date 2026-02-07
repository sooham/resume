TEX = xelatex
SRC = main.tex
DATE := $(shell date +%Y-%m-%d)
BASE = $(basename $(SRC))
OUT = $(BASE)-$(DATE).pdf

# Add MacTeX to PATH if installed but not yet on PATH
export PATH := /Library/TeX/texbin:$(PATH)

.PHONY: all clean install

all: $(OUT)

%-$(DATE).pdf: %.tex shading.sty
	$(TEX) -interaction=nonstopmode $<
	$(TEX) -interaction=nonstopmode $<
	mv $(basename $<).pdf $@

clean:
	rm -f *.aux *.log *.out *.pdf

install:
	brew install --cask mactex-no-gui
	@echo ""
	@echo "Restart your shell or run: eval \"$$(/usr/libexec/path_helper)\""
	@echo "Then run 'make' to build the resume."
