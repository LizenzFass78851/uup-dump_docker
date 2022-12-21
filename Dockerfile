FROM ubuntu:latest

RUN apt update && apt install -yy \
  php php-curl php-xml php-zip p7zip-full \
  unzip && \
  rm -rf /var/cache/apt /var/lib/apt/lists

WORKDIR /root
ADD ./uupdump-x64.zip ./
RUN unzip ./uupdump-x64.zip && \
  rm ./uupdump-x64.zip

WORKDIR /root/uupdump-x64
ADD ./run.sh ./
ADD ./update.sh ./
RUN chmod +x *.sh

VOLUME ["/root/uupdump-x64/packs","/root/uupdump-x64/fileinfo"]
EXPOSE 44400
ENTRYPOINT ["/root/uupdump-x64/run.sh"]
