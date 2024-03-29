FROM ubuntu:22.04

ENV REPO=https://github.com/LizenzFass78851/uup-dump_website.git
ENV BRANCH=sta

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update && apt upgrade -yy && apt install -yy \
  git \
  php php-curl php-xml php-zip p7zip-full && \
  rm -rf /var/cache/apt /var/lib/apt/lists

WORKDIR /
RUN mkdir ./uupdump
ADD ./uupdump/* ./uupdump

WORKDIR /uupdump
ADD ./run.sh ./
RUN chmod +x *.sh

RUN git clone --recurse-submodules -j$(nproc||printf "2") $REPO -b $BRANCH ./uup

RUN mkdir ./uup/packs && \
  mkdir ./uup/fileinfo

RUN chmod -R 777 /uupdump

VOLUME ["/uupdump/uup/packs","/uupdump/uup/fileinfo"]
EXPOSE 44400
ENTRYPOINT ["/uupdump/run.sh"]

