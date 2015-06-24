set -e
docker build -t rdhyee/epubmaker-docker .
DOCUMENT_DIR=${1:-`pwd`}
docker run -it  -v $DOCUMENT_DIR:/data/  rdhyee/epubmaker-docker bash
