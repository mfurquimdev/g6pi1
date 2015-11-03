TARGET = Relatorio_final.pdf

BIBTEX = bibtex
LATEX = latex
DVIPS = dvips
PS2PDF = ps2pdf
DVIPDF = dvipdfm

VERSION = 0.1.0

FIXOS_DIR = fixos
FIXOS_SOURCES = informacoes.tex novosComandos.tex \
		pacotes.tex comandos.tex setup.tex	\
		listasAutomaticas.tex indiceAutomatico.tex
FIXOS_FILES = $(addprefix $(FIXOS_DIR)/, $(FIXOS_SOURCES))

EDITAVEIS_DIR = editaveis
EDITAVEIS_SOURCES = informacoes.tex resumo.tex abstract.tex \
					abreviaturas.tex simbolos.tex \
					apendices.tex anexos.tex
EDITAVEIS_FILES = $(addprefix $(EDITAVEIS_DIR)/, $(EDITAVEIS_SOURCES))

CONTEUDO_DIR = $(addprefix $(EDITAVEIS_DIR)/, conteudo)
CONTEUDO_SOURCES = introducao.tex estrutura_materiais.tex \
					eficiencia_energetica.tex automacao.tex
CONTEUDO_FILES = $(addprefix $(CONTEUDO_DIR)/, $(CONTEUDO_SOURCES))

APENDICES_DIR = $(addprefix $(EDITAVEIS_DIR)/, apendices)
APENDICES_SOURCES = software.tex
APENDICES_FILES = $(addprefix $(APENDICES_DIR)/, $(APENDICES_SOURCES))

MAIN_FILE = relatorio.tex
DVI_FILE  = $(addsuffix .dvi, $(basename $(MAIN_FILE)))
AUX_FILE  = $(addsuffix .aux, $(basename $(MAIN_FILE)))
PS_FILE   = $(addsuffix .ps, $(basename $(MAIN_FILE)))
PDF_FILE  = $(addsuffix .pdf, $(basename $(MAIN_FILE)))

SOURCES = $(FIXOS_FILES) $(EDITAVEIS_FILES) $(CONTEUDO_FILES) $(APENDICES_FILES)

.PHONY: all clean dist-clean

all:
	@make $(TARGET)

$(TARGET): $(MAIN_FILE) $(SOURCES) bibliografia.bib
	$(LATEX) $(MAIN_FILE) $(SOURCES)
	$(BIBTEX) $(AUX_FILE)
#$(LATEX) $(MAIN_FILE) $(SOURCES)
#$(LATEX) $(MAIN_FILE) $(SOURCES)
	$(DVIPS) $(DVI_FILE)
	$(PS2PDF) $(PS_FILE)
#	$(DVIPDF) $(DVI_FILE)
	@cp $(PDF_FILE) $(TARGET)

clean:
	rm -f *~ *.dvi *.ps *.backup *.aux *.log
	rm -f *.lof *.lot *.bbl *.blg *.brf *.toc *.idx
	rm -f *.pdf

dist: clean
	tar vczf relatorio-fga-latex-$(VERSION).tar.gz *

dist-clean: clean
	rm -f $(PDF_FILE) $(TARGET)
