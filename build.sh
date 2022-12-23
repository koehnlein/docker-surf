#!/bin/bash

docker build --pull . -f debian/php82/Dockerfile -t akoehnlein/surf:php82-debian && docker run -it -v `pwd`/tests.sh:/tmp/test.sh akoehnlein/surf:php82-debian /tmp/test.sh && docker push akoehnlein/surf:php82-debian && \
docker build --pull . -f debian/php81/Dockerfile -t akoehnlein/surf:php81-debian && docker run -it -v `pwd`/tests.sh:/tmp/test.sh akoehnlein/surf:php81-debian /tmp/test.sh && docker push akoehnlein/surf:php81-debian && \
docker build --pull . -f debian/php80/Dockerfile -t akoehnlein/surf:php80-debian && docker run -it -v `pwd`/tests.sh:/tmp/test.sh akoehnlein/surf:php80-debian /tmp/test.sh && docker push akoehnlein/surf:php80-debian && \
docker build --pull . -f debian/php74/Dockerfile -t akoehnlein/surf:php74-debian && docker run -it -v `pwd`/tests.sh:/tmp/test.sh akoehnlein/surf:php74-debian /tmp/test.sh && docker push akoehnlein/surf:php74-debian && \
#docker build --pull . -f debian/php73/Dockerfile -t akoehnlein/surf:php73-debian && docker run -it -v `pwd`/tests.sh:/tmp/test.sh akoehnlein/surf:php73-debian /tmp/test.sh && docker push akoehnlein/surf:php73-debian && \
#docker build --pull . -f debian/php72/Dockerfile -t akoehnlein/surf:php72-debian && docker run -it -v `pwd`/tests.sh:/tmp/test.sh akoehnlein/surf:php72-debian /tmp/test.sh && docker push akoehnlein/surf:php72-debian && \
#docker build --pull . -f debian/php71/Dockerfile -t akoehnlein/surf:php71-debian && docker run -it -v `pwd`/tests.sh:/tmp/test.sh akoehnlein/surf:php71-debian /tmp/test.sh && docker push akoehnlein/surf:php71-debian && \
docker build --pull . -f alpine/php82/Dockerfile -t akoehnlein/surf:php82 && docker run -it -v `pwd`/tests.sh:/tmp/test.sh akoehnlein/surf:php82 /tmp/test.sh && docker push akoehnlein/surf:php82 && \
docker build --pull . -f alpine/php81/Dockerfile -t akoehnlein/surf:php81 && docker run -it -v `pwd`/tests.sh:/tmp/test.sh akoehnlein/surf:php81 /tmp/test.sh && docker push akoehnlein/surf:php81 && \
docker build --pull . -f alpine/php80/Dockerfile -t akoehnlein/surf:php80 && docker run -it -v `pwd`/tests.sh:/tmp/test.sh akoehnlein/surf:php80 /tmp/test.sh && docker push akoehnlein/surf:php80 && \
docker build --pull . -f alpine/php74/Dockerfile -t akoehnlein/surf:php74 && docker run -it -v `pwd`/tests.sh:/tmp/test.sh akoehnlein/surf:php74 /tmp/test.sh && docker push akoehnlein/surf:php74 && \
docker build --pull . -f alpine/php73/Dockerfile -t akoehnlein/surf:php73 && docker run -it -v `pwd`/tests.sh:/tmp/test.sh akoehnlein/surf:php73 /tmp/test.sh && docker push akoehnlein/surf:php73 && \
docker build --pull . -f alpine/php72/Dockerfile -t akoehnlein/surf:php72 && docker run -it -v `pwd`/tests.sh:/tmp/test.sh akoehnlein/surf:php72 /tmp/test.sh && docker push akoehnlein/surf:php72 && \
#docker build --pull . -f alpine/php71/Dockerfile -t akoehnlein/surf:php71 && docker run -it -v `pwd`/tests.sh:/tmp/test.sh akoehnlein/surf:php71 /tmp/test.sh && docker push akoehnlein/surf:php71 && \
#docker build --pull . -f alpine/php70/Dockerfile -t akoehnlein/surf:php70 && docker run -it -v `pwd`/tests.sh:/tmp/test.sh akoehnlein/surf:php70 /tmp/test.sh && docker push akoehnlein/surf:php70 && \
#docker build --pull . -f alpine/php56/Dockerfile -t akoehnlein/surf:php56 && docker run -it -v `pwd`/tests.sh:/tmp/test.sh akoehnlein/surf:php56 /tmp/test.sh && docker push akoehnlein/surf:php56 && \
echo "done"
