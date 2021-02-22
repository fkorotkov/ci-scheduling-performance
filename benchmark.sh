set -e

while true; do
  date +%s >> updates.txt
  git add updates.txt
  git commit -m "Update on $(date)"
  git push origin HEAD

  sleep 180
done
