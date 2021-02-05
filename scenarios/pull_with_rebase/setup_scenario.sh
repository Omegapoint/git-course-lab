mkdir scenario_pull_with_rebase
cd scenario_pull_with_rebase
git clone git@github.com:Omegapoint/git-course-lab.git jobs_git_repository
cd jobs_git_repository
git config user.name "Steve Jawbs"
git config user.email "Steve@fruitcompany.apple"
git checkout master
git reset --hard origin master
git checkout -b master_branch
touch test
echo "one line" >> test
git add test
git commit -m "A"

echo "one line" >> test
git add test
git commit -m "B"

git push origin master_branch

cd ..
git clone git@github.com:Omegapoint/git-course-lab.git torvalds_git_repository
cd torvalds_git_repository
git config user.name "Lajnus Törwalds"
git config user.email "lajnus@linux.com"
git checkout master_branch
git checkout -b feature_branch
git push origin feature_branch
