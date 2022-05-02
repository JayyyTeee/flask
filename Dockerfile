FROM ubuntu:22.04

EXPOSE 5000

# install libs
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y \
      python3-pkg-resources \
      python3-dev \
      python3-pip && \
    pip3 install --upgrade pip && \
    apt-get clean

WORKDIR /app
COPY requirements.txt /app
RUN pip3 install -r requirements.txt
COPY src /app

ENTRYPOINT [ "python3" ]
CMD [ "-u", "app.py" ]
