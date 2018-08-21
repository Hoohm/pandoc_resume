

rule generate_resume:
	input:
		'resume.html',
		'resume.pdf',
		'resume.docx',
		'resume.rtf'

rule generate_template:
	input:
		'markdowns/resume.md'

rule coding_freq_plot:
	input:
		'data/coding_languages.csv'
	output:
		'img/coding_freq.png'
	conda: 'envs/plots.yaml'
	script:
		'scripts/plot_coding_freq.R'

rule education_timeline_plot:
	input:
		'data/education.csv'
	output:
		'img/education.png'
	conda: 'envs/plots.yaml'
	script:
		'scripts/plot_education_timeline.R'


rule populate_template:
	input:
		markdown_template='markdowns/resume_template.md',
		experiences='data/experiences.csv',
		education='data/education.csv',
		awards='data/awards.csv',
		languages='data/languages.csv',
		publications='data/publications.csv',
		skills='data/skills.csv',
		coding_plot='img/coding_freq.png',
		education_timeline='img/education.png',
		hobbies='img/hobbies.png'
	output:
		markdown='markdowns/resume.md'
	conda: 'envs/pandoc.yaml'
	script:
		'scripts/populate_template.py'

rule make_html:
	input:
		style_css='style/style_chmduquesne.css',
		body='markdowns/resume.md',
		footer='markdowns/footer.md'
	output:
		'resume.html'
	conda: 'envs/pandoc.yaml'
	shell:
		"""
		pandoc --standalone -H {input.style_css}\
        --from markdown --to html\
        -o {output} {input.body} {input.footer}
		"""

rule make_tex:
	input:
		body='markdowns/resume.md',
		footer='markdowns/footer.md',
		style_tex='style/style_chmduquesne.tex',
	output:
		tex='resume.tex'
	conda: 'envs/pandoc.yaml'
	shell:
		"""
		pandoc --standalone --template {input.style_tex}\
		--from markdown --to context \
		-V papersize=A4 \
		-o {output.tex} {input.body} {input.footer}\
		"""

rule make_pdf:
	input:
		'resume.tex'
	output:
		'resume.pdf'
	conda: 'envs/pandoc.yaml'
	shell:
		"""context {input} --noconsole"""
		

rule make_docx:
	input:
		body='markdowns/resume.md',
		footer='markdowns/footer.md'
	output:
		'resume.docx'
	conda: 'envs/pandoc.yaml'
	shell:
		"""pandoc -s -f markdown+smart  {input.body} {input.footer} -o {output}"""

rule make_rtf:
	input:
		body='markdowns/resume.md',
		footer='markdowns/footer.md'
	output:
		'resume.rtf'
	conda: 'envs/pandoc.yaml'
	shell:
		"""pandoc -s -f markdown+smart {input.body} {input.footer} -o {output}"""