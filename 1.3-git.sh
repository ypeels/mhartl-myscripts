#!/bin/bash
pushd ~/shared/first_app

echo
echo Listing 1.7 .gitignore
gedit .gitignore

echo


echo
echo "To create and switch to a new branch, type 'git checkout -b modify-README"
echo "To display current branch, type 'git branch'"
echo
echo "To merge changes from branch into master, do the following"
echo "- git checkout master"
echo "- git merge modify-README"

echo
echo "To delete the branch, type 'git branch -d modify-README'"

popd
