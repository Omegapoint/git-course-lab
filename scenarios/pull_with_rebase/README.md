## Scenario: Pull with rebase

### Context
... You have worked on a feature branch and want to update your branch with the latest changes from a remote branch (e.g. master)

### What do you want to achieve?
Pull down new remote changing from a remote branch and move your local commits on top of the new changes.

### How to achieve this?
Pull with --rebase flag as merge strategy.


### The scripts
These scripts require a remote repository. We made it use the omegapoint git-course-lab repository, so you need read/write access to run the script, or change the script to use another remote repository.

Set up scenario
```
sh setup_scenario.sh
```

This will create a scenario like this:
```
...                     master
     -> A -> B          master_branch
               ->       feature_branch
```

The feature_branch is checked out in the directory torvalds_git_repository, and the master_branch in jobs_git_repository. Git config is also modified for these repositories to commit as "Steve Jawbs" and "Lajnus Törwalds".

Step 2: Make commits on both branches (push master_branch to remote as well)a

```
# In torvalds_git_repository
touch linus && git add linus && git commit -m "C"
touch linux && git add linux && git commit -m "D"

# In jobs_git_repository
touch apple && git add apple && git commit -m "E"
touch bpple && git add bpple && git commit -m "F"
git push origin master_branch
```

Now we have this:
```
 ...                                master
     -> A -> B  -> E -> F           master_branch                
                -> C -> D           feature_branch
```

Alternative strategy: Pull with merge
Now we have this:
 ```
# In torvalds_git_repository
git pull origin master_branch
 ...                                        master
     -> A -> B  -> E -> F                   master_branch                
                -> C -> D -> merge          feature_branch
```

Pull with rebase as merge strategy:
Now we have this:
```
# In torvalds_git_repository
git pull origin master_branch --rebase
...                                        master
     -> A -> B  -> E -> F                  master_branch                
                          -> C' -> D'      feature_branch
```

### Comments
* This will change history on feature_branch. Do *NOT* do this when commits are on the remote.
* C and D commits have new hashes (as indicated by C' and D'
* Git will warn if you try to pull without specifying merge strategy (default is merge).
* Many consider --rebase flag to be mandatory for this to avoid ugly merge commits when synching with remote branch
* This scenario highlights the problems with long living branches

