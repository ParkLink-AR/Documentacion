.PHONY: pdf watch clean

# LaTeX corre dentro de la imagen oficial de TeX Live (no hace falta instalarlo).
TEX := docker run --rm -it -u $(shell id -u):$(shell id -g) -e HOME=/tmp \
	-v "$(CURDIR)":/work -w /work texlive/texlive:latest

# Compila una sola vez.
pdf:
	$(TEX) latexmk -pdf -interaction=nonstopmode main.tex

# Abre el PDF y recompila automáticamente cada vez que guardás un .tex/.cls/.bib/imagen.
# Evince recarga el PDF solo. Cortalo con Ctrl+C.
watch:
	@(xdg-open main.pdf >/dev/null 2>&1 &)
	$(TEX) latexmk -pdf -pvc -view=none -interaction=nonstopmode main.tex

# Borra los archivos auxiliares de compilación (deja main.pdf).
clean:
	$(TEX) latexmk -c main.tex
