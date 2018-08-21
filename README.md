# Rölli Patrick' resume

My resume is based upon [mszep](https://github.com/mszep)'s fabulous [pandoc resume](https://github.com/mszep/pandoc_resume) scheme and a fork from [pjf](https://github.com/pjf/).

I use snakemake insted of make in my day to day work so I decided to translate it into snakemake. I also added some plotting and more automation using csv files as entry source and generate the `resume.md` on the fly.

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

Clone the worflow
```
git clone https://github.com/Hoohm/pandoc_resume.git
```

### Step 3: Install snakemake

```
conda install -c bioconda -c conda-forge snakemake
```
 
Next step is config files completion

### Step4: Run snakemake

```
snakemake --use-conda
```

Like mszep's resume, all my work is released under an MIT license as well.