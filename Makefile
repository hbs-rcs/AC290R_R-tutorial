clean: 
	rm -rf public

themes/hugo-material-docs:
	R -e "blogdown::install_theme('digitalcraftsman/hugo-material-docs')"

#######################################
# Serve site locally, includes drafts #
#######################################

serve: themes/hugo-material-docs
	R -e "blogdown::serve_site()"

#########################################
# Build the site, no drafts             #
# To preview the site use `hugo server` #
#########################################

build: themes/hugo-material-docs
	R -e "library(blogdown)" -e "build_site(local = TRUE)" -e "hugo_build(local = FALSE)"
