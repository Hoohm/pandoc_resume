import csv


def get_out_strings(input_file, out_format):
	with open(input_file) as input_strings:
		reader = csv.reader(input_strings, quotechar='"', delimiter=',')
		final_string = '\n\n'
		next(reader)
		for line in reader:
			final_string+= out_format.format(line=line)
		final_string += '\n\n'
	return(final_string)



out_string_formats={
	'experiences':"""{line[0]}--{line[1]}\n:   **{line[4]}**, {line[2]}, [{line[3]}]({line[7]})\n\n:   Tasks: {line[5]}\n:   Skills: {line[6]}\n\n""",
	'education':"""{line[0]}--{line[1]}\n:   **{line[3]}**, [{line[2]}]({line[4]})\n\n""",
	'awards':"""{line[0]}:   **{line[1]}**, {line[2]}\n\n""",
	'languages': """* {line[0]}: {line[1]}\n\n""",
	'publications': """{line[0]}-{line[1]}\n:   {line[3]}\n\n""",
	'skills':"""{line[0]}, """}


with open(snakemake.input['markdown_template'],'r') as markdown_template:
	with open(snakemake.output['markdown'],'w') as out_markdown:
		lines = markdown_template.readlines()
		for line in lines:
			if('Education' in line):
				out_markdown.write(line)
				out_markdown.write('![]({}){{width=100%}}\n\n'.format(snakemake.input['education_timeline']))
				out_markdown.write(get_out_strings(snakemake.input['education'], out_string_formats['education']))
			elif('Experiences' in line):
				out_markdown.write(line)
				out_markdown.write(get_out_strings(snakemake.input['experiences'], out_string_formats['experiences']))
			elif('Publications' in line):
				out_markdown.write(line)
				out_markdown.write(get_out_strings(snakemake.input['publications'], out_string_formats['publications']))
			elif('Coding skills' in line):
				out_markdown.write(line)
				out_markdown.write('![]({}){{width=100%}}\n\n'.format(snakemake.input['coding_plot']))
			elif('Hobbies' in line):
				out_markdown.write(line)
				out_markdown.write('![]({}){{height=2cm}}\n\n'.format(snakemake.input['hobbies']))
			elif('Awards' in line):
				out_markdown.write(line)
				out_markdown.write(get_out_strings(snakemake.input['awards'], out_string_formats['awards']))
			elif('Languages' in line):
				out_markdown.write(line)
				out_markdown.write(get_out_strings(snakemake.input['languages'], out_string_formats['languages']))
			elif('Other skills' in line):
				out_markdown.write(line)
				out_markdown.write(get_out_strings(snakemake.input['skills'], out_string_formats['skills']))
			else:
				out_markdown.write(line)
			
