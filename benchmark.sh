set -e

while true; do
  date +%s >> updates.txt
  git add updates.txt
  git commit -m "Update on $(date)"
  git push origin bench-2021-02-22

  sleep 180
done
