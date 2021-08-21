#!/bin/bash

echo "Installing needed packages..."

Rscript -e "install.packages(\"readr\", repos=\"https://cran.rstudio.com\")"

echo "Rendering the dashboard..."
Rscript -e "rmarkdown::render_site()"

if [[ "$(git status --porcelain)" != "" ]]; then
    git config --global user.name 'RamiKrispin'
    git config --global user.email 'ramkrisp@umich.edu'
    git add *
    git commit -m "Auto update dashboard"
    git push
fi
