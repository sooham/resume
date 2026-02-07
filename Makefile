TEX = xelatex
SRC = main.tex
DATE := $(shell date +%Y-%m-%d)
OUT = main-$(DATE).pdf

# Add MacTeX to PATH if installed but not yet on PATH
export PATH := /Library/TeX/texbin:$(PATH)

.PHONY: all clean install

all: $(OUT)

$(OUT): $(SRC) shading.sty
	$(TEX) -interaction=nonstopmode $(SRC)
	$(TEX) -interaction=nonstopmode $(SRC)
	mv main.pdf $(OUT)

clean:
	rm -f main.aux main.log main.out main.pdf main-*.pdf

install:
	brew install --cask mactex-no-gui
	@echo ""
	@echo "Restart your shell or run: eval \"$$(/usr/libexec/path_helper)\""
	@echo "Then run 'make' to build the resume."
