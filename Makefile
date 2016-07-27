#######################################
# Render R Markdown files to Markdown #
#######################################

%.html: %.Rmd
	cd $(<D); Rscript -e "rmarkdown::render('$(<F)')"

RMD_FILES = $(shell find content -name "*.Rmd")
HTML_FILES = $(patsubst %.Rmd, %.html, $(RMD_FILES))

render: $(HTML_FILES)

######################
# Serve site locally #
######################

serve: render
	jekyll serve --port 1234 --source content

#########################
# Deploy site to GitHub #
#########################

deploy:
	GIT_DEPLOY_DIR=_site ./deploy.sh
