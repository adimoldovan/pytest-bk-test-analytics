
ts=$(date +%s)
BUILDKITE_BUILD_ID="$ts"
BUILDKITE_BUILD_URL="https://github.com/adimoldovan/pytest-bk-test-analytics/actions"
BUILDKITE_BRANCH="main"
BUILDKITE_MESSAGE="local run $ts"

curl \
  -X POST \
  -H "Authorization: Token token=\"$BUILDKITE_ANALYTICS_TOKEN\"" \
  -F "data=@junit-results.xml" \
  -F "format=junit" \
  -F "run_env[CI]=buildkite" \
  -F "run_env[key]=$BUILDKITE_BUILD_ID" \
  -F "run_env[url]=$BUILDKITE_BUILD_URL" \
  -F "run_env[branch]=$BUILDKITE_BRANCH" \
  -F "run_env[commit_sha]=$BUILDKITE_COMMIT" \
  -F "run_env[number]=$BUILDKITE_BUILD_NUMBER" \
  -F "run_env[job_id]=$BUILDKITE_JOB_ID" \
  -F "run_env[message]=$BUILDKITE_MESSAGE" \
  https://analytics-api.buildkite.com/v1/uploads
