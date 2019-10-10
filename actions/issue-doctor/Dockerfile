FROM debian:9.6-slim

LABEL "com.github.actions.name"="Rust issue doctor"
LABEL "com.github.actions.description"="Check if an issue is reproducible"

LABEL version="0.0.1"
LABEL repository="http://github.com/lionel1704/gh-actions-demo"
LABEL homepage="http://github.com/lionel1704/gh-actions-demo"
LABEL maintainer="Lionel Faber <lionel1704@gmail.com>"

RUN apt-get update && apt-get install -y \
    curl

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]