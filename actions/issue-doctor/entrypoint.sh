#!/bin/sh -l

labels=''
echo $1 > issue_body
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
    -H "Authorization: token $3" \
    -H "Accept: application/vnd.github.v3+json; application/vnd.github.antiope-preview+json" \
    -X PUT \
    -d "{ \"labels\" : [$labels]}" \
    https://api.github.com/repos/lionel1704/gh-actions-demo/issues/$2/labels