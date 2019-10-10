#!/bin/bash
set -eu

sed --version

# if [[ -z "$GITHUB_TOKEN" ]]; then
#   echo "Set the GITHUB_TOKEN env variable."
#   exit 1
# fi

# API_HEADER="Accept: application/vnd.github.v3+json; application/vnd.github.antiope-preview+json"
# AUTH_HEADER="Authorization: token ${GITHUB_TOKEN}"

# issue_body=$(jq --raw-output .issue.body "$GITHUB_EVENT_PATH")
# issue_number=$(jq --raw-output .issue.number "$GITHUB_EVENT_PATH")

# labels=''
# echo $issue_body > issue_body
# sed -n '/```test_start/,/```/p' issue_body | sed '/^```/ d' > src/reproduce_issue.rs
# if cargo check --tests; then
#     if cargo test --release reproduce_issue; then
#     message='The issue is not reproducible'
#     echo $message
#     labels+=\"not-reproducible\"
#     else
#     message='The issue is reproducible'
#     echo $message
#     labels+=\"reproducible\"
#     fi
# else
#     message='There are compilation errors'
#     echo $message
#     labels+='"not-reproducible", "errored"'
# fi
# curl -sSL \
#     -H "Content-Type: application/json" \
#     -H "${AUTH_HEADER}" \
#     -H "${API_HEADER}" \
#     -X PUT \
#     -d "{ \"labels\" : [$labels]}" \
#     https://api.github.com/repos/lionel1704/gh-actions-demo/issues/${issue_number}/labels

# curl -sSL \
#     -H "Content-Type: application/json" \
#     -H "${AUTH_HEADER}" \
#     -H "${API_HEADER}" \
#     -X POST \
#     -d "{ \"body\" : \"$message\"}" \
#     https://api.github.com/repos/lionel1704/gh-actions-demo/issues/${issue_number}/comments