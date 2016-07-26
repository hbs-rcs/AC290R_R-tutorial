%.html: %.Rmd
	cd $(<D); Rscript -e "rmarkdown::render('$(<F)')"

RMD_FILES = $(shell find . -name "*.Rmd")
HTML_FILES = $(patsubst %.Rmd, %.html, $(RMD_FILES))

render: $(HTML_FILES)
