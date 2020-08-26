START=$(date +%s)
DURRATION=$((60 * 60 * 24))
UPTIME=$(($(date +%s) - $START))

set -e

while [[ $UPTIME < $DURRATION ]]; do
  date +%s >> updates.txt
  git add updates.txt
  git commit -m "Update on $(date)"
  git push -u origin master 
  
  echo -n "Time remaining: "
  echo $(($DURRATION - $UPTIME))

  sleep 60
  UPTIME=$(($(date +%s) - $START))
done
