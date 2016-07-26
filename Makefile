#######################################
# Render R Markdown files to Markdown #
#######################################

%.md: %.Rmd
	cd $(<D); Rscript -e "knitr::knit('$(<F)')"

RMD_FILES = $(shell find lessons -name "*.Rmd")
MD_FILES = $(patsubst %.Rmd, %.md, $(RMD_FILES))

render: $(MD_FILES)

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
