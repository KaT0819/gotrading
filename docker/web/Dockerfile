FROM golang:latest

RUN apt -y update

# nginx
#RUN apt install -y nginx1.12

# package
RUN go get golang.org/x/tools/cmd/godoc
RUN go get golang.org/x/tools/cmd/goimports
RUN go get gopkg.in/ini.v1
RUN go get github.com/gorilla/websocket
RUN go get github.com/mattn/go-sqlite3

RUN mkdir -p /data/gotrading

#RUN mkdir -p $GOPATH/src/gotrading
RUN ln -s /data/gotrading $GOPATH/src/gotrading

WORKDIR  $GOPATH/src/gotrading
