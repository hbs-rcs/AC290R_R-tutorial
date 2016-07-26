##########################################
# Rendering R Markdown files to Markdown #
##########################################

%.md: %.Rmd
	cd $(<D); Rscript -e "knitr::knit('$(<F)')"

RMD_FILES = $(shell find lessons -name "*.Rmd")
MD_FILES = $(patsubst %.Rmd, %.md, $(RMD_FILES))

render: $(MD_FILES)

########################
# Serving site locally #
########################

serve: render
	jekyll serve --port 1234

############################
# Deploying site to GitHub #
############################

CURRENT_BRANCH = $(shell git branch | grep "*" | sed "s/* //")
deploy:
	git checkout gh-pages
	mv .git _site/
	cd _site/; \
	  git add . && git commit -am "Updated tutorial from '$(CURRENT_BRANCH)' branch."; \
	  git push origin gh-pages; \
	  mv .git ..
	git checkout $(CURRENT_BRANCH)
