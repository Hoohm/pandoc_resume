# Rölli Patrick's resume

My resume is based upon [mszep](https://github.com/mszep)'s fabulous [pandoc resume](https://github.com/mszep/pandoc_resume) scheme and a fork from [pjf](https://github.com/pjf/).

I use snakemake instead of make in my day to day work so I decided to translate it into snakemake. I also added some plotting and more automation using csv files as entry source and generate the `resume.md` on the fly.

To use the template you will need to follow theses steps:

### Step 1: Download and install miniconda3
First you need to download and install miniconda3:

for linux
```
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh
```

for mac os
```
curl https://repo.continuum.io/miniconda/Miniconda3-latest-MacOSX-x86_64.sh -o Miniconda3-latest-MacOSX-x86_64.sh
bash Miniconda3-latest-MacOSX-x86_64.sh
```


### Step 2: Clone the template

```
git clone https://github.com/Hoohm/pandoc_resume.git
```

### Step 3: Install snakemake

```
conda install -c bioconda -c conda-forge snakemake
```
 
### Step4: Modify the csv files with all your history

There are 6 files in `data` that store all your information.

1. `awards.csv` -- Contains awards and honorary certificates you obtained.

2. `coding_languages.csv` -- Contains your coding experience at the moment. This will be used to plot a summary of your present coding experience.

3. `education.csv` -- You can add here the schools, university you went to, etc...

4. `experiences.csv` -- This is probably the most important file. You shuold enter here all the experience you got throughout your life.

5. `languages.csv` -- Languages you know.

6. `publications.csv` -- This resume is more oriented towards a scientist, hence the publications section. Add here all the paper you published.

7. `skills.csv` -- Other skills you might have but haven't mentionned specifically in the experiences section.


### Step5: Generate resume.md

This will populate the `markdown/resume.md` with all the data you provided earlier.

```
snakemake --use-conda markdown/resume.md
```

### Step6: Trim your resume

Depending on the job you are applying, some experiences might not fit. Take the time to check out all entries and select the ones you think are not necessary.

### Step7: Generate all the different resume versions

This will produce all the files you need. Doc, pdf, html, rtf.

```
snakemake --use-conda
```

All is easily tweakable although you will have to change the output formatting in the `scripts/populate_template.py` as well as the plotting scripts to accomodate for your changes.


Like mszep's resume, all my work is released under an MIT license as well.