FROM alpine:latest

RUN apk update
RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools
RUN apk add curl
RUN apk add unrar
RUN apk add unzip
RUN curl -O https://downloads.rclone.org/rclone-current-linux-amd64.zip
RUN unzip rclone-current-linux-amd64.zip
RUN cp /rclone-*-linux-amd64/rclone /usr/bin/
RUN chown root:root /usr/bin/rclone
RUN chmod 755 /usr/bin/rclone
RUN apk add aria2
RUN apk add wget
RUN apk add py3-pip
RUN pip install jupyter
RUN pip install voila
RUN pip install ipywidgets
RUN pip install widgetsnbextension
#Cleaning&Finalising
RUN rm /rclone-current-linux-amd64.zip
RUN rm -r /rclone-*-linux-amd64/rclone
COPY Essential-Files /Essential-Files
RUN mkdir /Essential-Files
RUN mkdir /voila
RUN mkdir /voila/files
RUN chmod +x /Essential-Files/entrypoint.sh
CMD /Essential-Files/entrypoint.sh
