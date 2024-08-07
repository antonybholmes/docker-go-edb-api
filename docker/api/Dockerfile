FROM golang as build-stage
# RUN apk update
# RUN apk add -U --no-cache ca-certificates && update-ca-certificates

WORKDIR /app

ADD go-edb-api/ go-edb-api/
ADD go-dna/ go-dna/
ADD go-genes/ go-genes/
ADD go-auth/ go-auth/
ADD go-basemath/ go-basemath/
ADD go-mailer/ go-mailer/
ADD go-sys/ go-sys/
ADD go-geneconv/ go-geneconv/
ADD go-pathway/ go-pathway/
ADD go-mutations/ go-mutations/
ADD go-microarray/ go-microarray/
ADD go-motiftogene/ go-motiftogene/


WORKDIR /app/go-edb-api

RUN go mod tidy

# build statically so runs without dependencies
RUN CGO_ENABLED=1 GOOS=linux BUILD=production go build --tags "fts5" -o /go-edb-api

# move app into smaller alpine image
FROM debian as release-stage

WORKDIR /

# need to copy certs for some reason as go email doesn't work without them
# https://stackoverflow.com/questions/52969195/docker-container-running-golang-http-client-getting-error-certificate-signed-by
COPY --from=build-stage /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/

COPY --from=build-stage /go-edb-api /go-edb-api

# aux files needed by app
COPY go-edb-api/templates/ /templates/
COPY .env /

# copy keys for signing jwts etc
COPY jwtRS256.key /
COPY jwtRS256.key.pub /

# default port
EXPOSE 8080

# CMD ["./go-edb-api"]
CMD BUILD=production ./go-edb-api
