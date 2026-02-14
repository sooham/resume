# Resume

LaTeX resume sources for Sooham Rafiz. Two variants are maintained:

| File | Description |
|------|-------------|
| `main.tex` | General software engineering resume |
| `main_gpu_perf_eng.tex` | GPU & performance engineering focused resume |

## Prerequisites

Requires [XeLaTeX](https://tug.org/xetex/) (part of MacTeX) for CJK font support (`xeCJK` + Songti SC).

```sh
make install        # installs MacTeX via Homebrew (macOS)
```

After installing, restart your shell or run:
```sh
eval "$(/usr/libexec/path_helper)"
```

## Build

```sh
make                # builds main.tex -> main-YYYY-MM-DD.pdf
make SRC=main_gpu_perf_eng.tex   # builds the GPU/perf eng variant
```

The Makefile runs XeLaTeX twice (for cross-references) and stamps the output PDF with the current date.

### Clean

```sh
make clean          # removes all generated .aux, .log, .out, .pdf files
```

## Project Structure

```
.
├── Makefile                  # Build system (xelatex, date-stamped output)
├── main.tex                  # General resume source
├── main_gpu_perf_eng.tex     # GPU/performance engineering resume source
├── shading.sty               # LaTeX style for shaded text boxes
├── main-YYYY-MM-DD.pdf       # Built PDF (general)
└── main_gpu_perf_eng-YYYY-MM-DD.pdf  # Built PDF (GPU/perf eng)
```

## How It Works

The `Makefile` uses a pattern rule `%-$(DATE).pdf: %.tex shading.sty` so any `.tex` file can be built by passing it as `SRC`. XeLaTeX is used instead of pdfLaTeX because the resume includes Chinese characters (HSK proficiency) rendered via the `xeCJK` package with the macOS Songti SC font.

`shading.sty` is a PostScript-based style (originally by Art Mulder, 1992) that provides `\textshade` and `\parashade` commands for shaded background boxes.
