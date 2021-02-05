cd scenario_pull_with_rebase

# Remove jobs repo
cd jobs_git_repository
git checkout master
git fetch origin
git branch -D master_branch
git push origin --delete master_branch
cd ..
sudo rm -r jobs_git_repository

# Remove torvalds git
cd torvalds_git_repository
git checkout master
git fetch origin
git branch -D feature_branch
git push origin --delete feature_branch
cd ..
sudo rm -r torvalds_git_repository

cd ..
rm -r scenario_pull_with_rebase
