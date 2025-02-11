#!/usr/bin/env bash
source /opt/$VENV_NAME/bin/activate

# Check correcy virtual env is activated
echo "Current env: $VIRTUAL_ENV"
echo "Python in env: $(python3 --version)"

# rm -rf python/data_refresh_py_files
# find python/iframe_figures/ -type f ! -name "figure_8.html" -delete # remove all files from iframe_figures except figure_8.html which contains backfile data.
# rm python/data_refresh_py.html
rm -rf docs/data_refresh_python/

if quarto render python/data_refresh_py.qmd --to html --output-dir ../docs/data_refresh_python; then
    rm -rf python/iframe_figures
    rm python/.gitignore
    # rm -rf docs/data_refresh_python/
    # mkdir -p docs/data_refresh_python
    # cp python/data_refresh_py.html docs/data_refresh_python/
    # cp -R python/data_refresh_py_files docs/data_refresh_python/
    # mkdir -p docs/data_refresh_python/iframe_figures
    # cp -R python/iframe_figures docs/data_refresh_python/
else
    echo "Quarto render of data_refresh_py.qmd failed, please check!"
fi

echo "Finish"
p=$(pwd)
git config --global --add safe.directory $p


if [[ "$(git status --porcelain)" != "" ]]; then
    # cp ./python/index.html ./docs/index.html
    # rm -rf ./docs/index_files
    # cp -R ./python/index_files/ ./docs/
    # rm ./python/index.html
    # rm -rf ./python/index_files
    rm -rf docs/index_files
    if quarto render python/index.qmd --to dashboard --output-dir ../docs; then
        rm -rf python/iframe_figures
        rm python/.gitignore
        cp docs/index_files/index.html docs/index.html
        git config --global user.name $USER_NAME
        git config --global user.email $USER_EMAIL
        git add csv/*
        git add metadata/*
        git add docs/*
        git commit -m "Auto update and refresh of data"
        git push origin main
    else
        echo "Quarto render of index.qmd failed, despite there were some fresh data available." && \
        echo "Check index.qmd or even GitHub Actions/Pages settings and logs."
    fi
else
    echo "Nothing to commit..."
fi