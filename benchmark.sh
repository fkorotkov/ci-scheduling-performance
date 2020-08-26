set -e

while true; do
  date +%s >> updates.txt
  git add updates.txt
  git commit -m "Update on $(date)"
  git push -u origin master 

  sleep 180
done
