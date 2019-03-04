setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
}

commit_pdf() {
  git checkout master
  git add cv.pdf
  git commit --message "Travis build: $TRAVIS_BUILD_NUMBER"
}

upload_files() {
  git remote add origin https://spirosbax:${GH_TOKEN}@github.com/cv.git > /dev/null 2>&1
  git push --quiet --set-upstream origin
}

setup_git
commit_pdf
upload_files
