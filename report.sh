set -e

COMMIT_TIMESTAMP=$(git log -1 --format=%ct)
NOW_TIMESTAMP=$(date +%s)

CI_NAME="undefined"
SHA=$(git rev-parse HEAD)

if [ ! -z "$GITHUB_ACTIONS" ]; then
    CI_NAME="GitHub Actions"
fi

if [ ! -z "$TRAVIS" ]; then
    CI_NAME="Travis CI"
fi

if [ ! -z "$CIRCLE" ]; then
    CI_NAME="Circle CI"
fi

if [ ! -z "$CIRRUS" ]; then
    CI_NAME="Cirrus CI"
fi

DURATION=`expr $NOW_TIMESTAMP - $COMMIT_TIMESTAMP`

curl -i --retry 3 \
    --header "Authorization: Token ef2344b2-142a-4cf8-baba-7c02bf73c039" \
    --header "Content-Type: application/json" \
    --data "{
      \"values\":[
        {
          \"line\":\"$CI_NAME\",
          \"value\":\"$DURATION s\"
        }
      ],
      \"sha\":\"${SHA}\"
    }" \
    https://seriesci.com/api/fkorotkov/ci-sheduling-performance/:series/many
