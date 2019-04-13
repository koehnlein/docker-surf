#!/bin/bash

docker build --pull . -f debian/php73/Dockerfile -t akoehnlein/surf:php73-debian && docker run -it -v `pwd`/tests.sh:/tmp/test.sh akoehnlein/surf:php73-debian /tmp/test.sh && \
docker build --pull . -f debian/php72/Dockerfile -t akoehnlein/surf:php72-debian && docker run -it -v `pwd`/tests.sh:/tmp/test.sh akoehnlein/surf:php72-debian /tmp/test.sh && \
docker build --pull . -f debian/php71/Dockerfile -t akoehnlein/surf:php71-debian && docker run -it -v `pwd`/tests.sh:/tmp/test.sh akoehnlein/surf:php71-debian /tmp/test.sh && \
docker build --pull . -f alpine/php73/Dockerfile -t akoehnlein/surf:php73 && docker run -it -v `pwd`/tests.sh:/tmp/test.sh akoehnlein/surf:php73 /tmp/test.sh \
docker build --pull . -f alpine/php72/Dockerfile -t akoehnlein/surf:php72 && docker run -it -v `pwd`/tests.sh:/tmp/test.sh akoehnlein/surf:php72 /tmp/test.sh \
docker build --pull . -f alpine/php71/Dockerfile -t akoehnlein/surf:php71 && docker run -it -v `pwd`/tests.sh:/tmp/test.sh akoehnlein/surf:php71 /tmp/test.sh && \
docker build --pull . -f alpine/php70/Dockerfile -t akoehnlein/surf:php70 && docker run -it -v `pwd`/tests.sh:/tmp/test.sh akoehnlein/surf:php70 /tmp/test.sh && \
docker build --pull . -f alpine/php56/Dockerfile -t akoehnlein/surf:php56 && docker run -it -v `pwd`/tests.sh:/tmp/test.sh akoehnlein/surf:php56 /tmp/test.sh && \
echo "done"
