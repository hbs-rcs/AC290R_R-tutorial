#######################################
# Render R Markdown files to Markdown #
#######################################

%.html: %.Rmd
	Rscript -e "rmarkdown::render('$<')"

RMD_FILES = $(shell ls *.Rmd)
HTML_FILES = $(patsubst %.Rmd, %.html, $(RMD_FILES))

render: $(HTML_FILES)

######################
# Serve site locally #
######################

serve: render
	jekyll serve --port 1234

#########################
# Deploy site to GitHub #
#########################

deploy:
	GIT_DEPLOY_DIR=_site ./deploy.sh
