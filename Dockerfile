FROM ubuntu:precise

# installing Python on ubuntu

# Install Python.
RUN \
  apt-get update && \
  apt-get install -y python python-dev python-pip python-virtualenv
  
RUN \
  apt-get install -y python-lxml libxml2-dev libxslt1-dev
  
RUN \
  rm -rf /var/lib/apt/lists/*
  
RUN \
  pip install pillow cssutils lxml docutils roman
  
# install epubmaker

RUN \
  apt-get update && \
  apt-get install -y git

RUN \
  pip install git+git://github.com/rdhyee/pg-epubmaker.git


# install tidy; could try to install html5 tidy -- but let's start with tidy

RUN \
  apt-get install -y tidy
    
# tidy html5
# http://therealmarv.com/blog/installing-tidy-html5-on-ubuntu-first/
# https://github.com/htacg/tidy-html5

#RUN \   
#  apt-get install -y cmake && \
#  git clone https://github.com/w3c/tidy-html5 /tidy-html5 && \
#  cd /tidy-html5/build/cmake/ && \

# install wget
RUN apt-get install -y -q wget
 
# get the kindlegen .gz file
RUN wget http://kindlegen.s3.amazonaws.com/kindlegen_linux_2.6_i386_v2_9.tar.gz

# unzip and untar

RUN tar xvfz kindlegen_linux_2.6_i386_v2_9.tar.gz
#RUN ln -s kindlegen_linux_2.6_i386_v2_9 kindlegen
RUN chmod +x kindlegen
RUN ln -s /kindlegen /usr/local/bin/kindlegen


# Define working directory.
VOLUME ["/data"]

# Define default command.
CMD ["bash"]
