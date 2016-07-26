%.md: %.Rmd
	cd $(<D); Rscript -e "knitr::knit('$(<F)')"

RMD_FILES = $(shell find lessons -name "*.Rmd")
MD_FILES = $(patsubst %.Rmd, %.md, $(RMD_FILES))

render: $(MD_FILES)

serve: render
	jekyll serve --port 1234
