#!/bin/bash
set -eu

if [[ -z "$GITHUB_TOKEN" ]]; then
  echo "Set the GITHUB_TOKEN env variable."
  exit 1
fi

API_HEADER="Accept: application/vnd.github.v3+json; application/vnd.github.antiope-preview+json"
AUTH_HEADER="Authorization: token ${GITHUB_TOKEN}"

echo $GITHUB_EVENT_PATH

issue_body=$(jq --raw-output .issue.body "$GITHUB_EVENT_PATH")
issue_number=$(jq --raw-output .issue.number "$GITHUB_EVENT_PATH")

labels=''
echo $issue_body > issue_body
cat issue_body
sed -n '/```test_start/,/```/p' issue_body | sed '/^```/ d' > src/reproduce_issue.rs
if cargo check --tests; then
    if cargo test --release reproduce_issue; then
    echo 'The issue is not reproducible'
    labels+=\"not-reproducible\"
    else
    labels+=\"reproducible\"
    fi
else
    echo 'There are compilation errors'
    labels+='"not-reproducible", "errored"'
fi
curl -sSL \
    -H "Content-Type: application/json" \
    -H "${AUTH_HEADER}" \
    -H "${API_HEADER}" \
    -X PUT \
    -d "{ \"labels\" : [$labels]}" \
    https://api.github.com/repos/lionel1704/gh-actions-demo/issues/${issue_number}/labels