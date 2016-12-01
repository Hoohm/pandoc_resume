SRCFILES = resume.md $(wildcard references/ref-*.md) footer.md

all: html pdf docx rtf

pdf: resume.pdf
resume.pdf: $(SRCFILES)
	pandoc --standalone --template style_chmduquesne.tex \
	--from markdown --to context \
	-V papersize=A4 \
	-o resume.tex $(SRCFILES); \
	context resume.tex

html: resume.html
resume.html: style_chmduquesne.css $(SRCFILES)
	pandoc --standalone -H style_chmduquesne.css \
        --from markdown --to html \
        -o resume.html $(SRCFILES)

docx: resume.docx
resume.docx: $(SRCFILES)
	pandoc -s -S $(SRCFILES) -o resume.docx

rtf: resume.rtf
resume.rtf: $(SRCFILES)
	pandoc -s -S $(SRCFILES) -o resume.rtf

clean:
	rm resume.html
	rm resume.tex
	rm resume.tuc
	rm resume.log
	rm resume.pdf
	rm resume.docx
	rm resume.rtf
