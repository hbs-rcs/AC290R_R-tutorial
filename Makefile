###################################
# Render R Markdown files to HTML #
###################################

%.html: %.Rmd
	cd $(<D); Rscript -e "rmarkdown::render('$(<F)', output_format = 'html_document')"

RMD_FILES = $(shell find content -name "*.Rmd")
HTML_FILES = $(patsubst %.Rmd, %.html, $(RMD_FILES))

html: $(HTML_FILES)

###############################
# Build the site using jekyll #
###############################

build: html
	jekyll clean
	jekyll build --source content

######################
# Serve site locally #
######################

serve: build
	jekyll serve --port 1234 --source content

#########################
# Deploy site to GitHub #
#########################

deploy: build
	GIT_DEPLOY_DIR=_site ./deploy.sh
