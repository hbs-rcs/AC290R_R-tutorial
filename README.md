# R for the Social Sciences

The content for this tutorial is available at
[hbs-rcs.github.io/AC290R_R-tutorial/][tutorial].

# Modifying this Tutorial

To update this tutorial you will need:

1.  [rmarkdown][rmarkdown] to convert R Markdown documents to HTML.
2.  [Jekyll][jekyll] to arrange those files for
    deployment to GitHub Pages, and also to serve files locally.
3.  [GNU Make][make] to tie everything together.

Here is the typical workflow:

1.  Edit the content in the R Markdown files in the `content` folder.
2.  Re-compile the updated R Markdown files using:

        make render
        
3.  To inspect the site locally use:

        make serve
        
    and point your browser to [localhost:1234][localhost].
    
4.  Deploy your changes to the gh-pages branch of this repository
    using:
    
        make deploy
    
    This step uses [git-directory-deploy][gdd] under the hood.

[tutorial]: https://hbs-rcs.github.io/AC290R_R-tutorial/
[rmarkdown]: https://cran.r-project.org/web/packages/rmarkdown/index.html
[jekyll]: https://jekyllrb.com/
[make]: https://www.gnu.org/software/make/
[localhost]: http://localhost:1234/
[gdd]: https://github.com/X1011/git-directory-deploy
