rm -rf .git
git init
git checkout -b main
git add .
git commit -m "Reset: $(date) - Files: $(ls -m)"
git remote add origin git@github.com:DT9/public.git 
git push --force --set-upstream origin main

