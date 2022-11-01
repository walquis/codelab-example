# Multi-stage build; stage 1 of 2 - install claat
FROM --platform=linux/amd64 golang:latest as builder

RUN go install github.com/googlecodelabs/tools/claat@latest

# Multi-stage build; stage 2 of 2 - copy claat to custom node image
FROM --platform=linux/amd64 node:16-bullseye

COPY --from=builder /go/bin/claat /usr/local/bin

WORKDIR /www

COPY --chown=nobody:nobody site .

RUN mkdir /nonexistent && npm install && npm install gulp-cli && npm rebuild node-sass

# Could probably make this another stage ... build the new Codelab
RUN chown -R nobody: codelabs && chown nobody: /www && $(cd codelabs ; claat export  -prefix /elements *.md)

USER nobody

EXPOSE 8000

ENTRYPOINT ["./node_modules/.bin/gulp", "serve", "--codelabs-dir=codelabs"]
