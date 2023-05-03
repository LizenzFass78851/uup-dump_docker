FROM ubuntu:latest

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update && apt install -yy \
  php php-curl php-xml php-zip p7zip-full && \
  rm -rf /var/cache/apt /var/lib/apt/lists

WORKDIR /
ADD ./uupdump ./

WORKDIR /uupdump
ADD ./run.sh ./
RUN chmod +x *.sh

RUN mkdir /uupdump/uup/packs && \
  mkdir /uupdump/uup/fileinfo

RUN sed -i 's/127.0.0.1/0.0.0.0/g' linux-uupdump-run-website.sh

RUN chmod -R 777 /uupdump

VOLUME ["/uupdump/uup/packs","/uupdump/uup/fileinfo"]
EXPOSE 44400
ENTRYPOINT ["/root/uupdump-x64/run.sh"]

