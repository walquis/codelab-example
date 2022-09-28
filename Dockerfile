FROM jamesgroat/golang-nodejs
#FROM ubuntu:20.04

#USER nobody

COPY site .
# RUN go install github.com/googlecodelabs/tools/claat@latest

EXPOSE 8080

CMD ["/bin/bash", "run"]
