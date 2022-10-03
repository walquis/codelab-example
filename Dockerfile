# Multi-stage build; stage 1 of 2 - install claat
FROM golang:latest as builder

RUN apt-get update && apt-get install -y ca-certificates openssl

ARG cert_location=/usr/local/share/ca-certificates

# Get certificate from "github.com"
RUN openssl s_client -showcerts -connect github.com:443 </dev/null 2>/dev/null|openssl x509 -outform PEM > ${cert_location}/github.crt
# Get certificate from "proxy.golang.org"
RUN openssl s_client -showcerts -connect proxy.golang.org:443 </dev/null 2>/dev/null|openssl x509 -outform PEM >  ${cert_location}/proxy.golang.crt
# Update certificates
RUN update-ca-certificates

RUN go install github.com/googlecodelabs/tools/claat@latest

# Multi-stage build; stage 2 of 2 - copy go and claat to custom node image with gulp-cli installed
FROM prod.harbor.drw/apprenticeship/node-gulp

COPY --from=builder /usr/local/go/bin/go /usr/local/bin
COPY --from=builder /go/bin/claat /usr/local/bin
COPY --from=builder /usr/local/go /usr/local/


# Could probably make this another stage ... build the new Codelab
WORKDIR /www

COPY site .

RUN /bin/bash -c 'cd codelabs; claat export *.md' && chmod -R 0777 /www /nonexistent && chown -R nobody: /www

USER nobody

EXPOSE 8000

ENTRYPOINT ["./node_modules/.bin/gulp", "serve", "--codelabs-dir=codelabs"]
