FROM ubuntu:latest

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

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
RUN chmod +x *.sh
RUN sed -i 's/127.0.0.1/0.0.0.0/g' linux-uupdump-run-website.sh

VOLUME ["/root/uupdump-x64/uup/packs","/root/uupdump-x64/uup/fileinfo"]
EXPOSE 44400
ENTRYPOINT ["/root/uupdump-x64/run.sh"]

