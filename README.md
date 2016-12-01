# Paul Fenwick's Resume

My resume is based upon [mszep](https://github.com/mszep)'s fabuous [pandoc resume](https://github.com/mszep/pandoc_resume) scheme. To build, simply clone and `make`.

I've updated the `Makefile` to handle multiple input files, which allows for local references to be
included which do not get published to git.

Like mszep's resume, all my work is released under an MIT license as well.

If you'd like to use mszep's original resume process, follow the steps below:

## The Markdown Resume

Instructions:

    git clone https://github.com/mszep/pandoc_resume
    cd pandoc_resume
    vim resume.md   #insert your own resume info
    make

Requirements:

 * ConTeXt
 * pandoc
