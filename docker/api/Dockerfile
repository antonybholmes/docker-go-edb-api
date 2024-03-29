FROM golang as build-stage

WORKDIR /app

ADD go-edb-api/ go-edb-api/
ADD go-dna/ go-dna/
ADD go-genes/ go-genes/
ADD go-auth/ go-auth/
ADD go-math/ go-math/
ADD go-mailer/ go-mailer/
ADD go-sys/ go-sys/

WORKDIR /app/go-edb-api

RUN go mod tidy

# build statically so runs without dependencies
RUN CGO_ENABLED=1 GOOS=linux BUILD=production go build -o /go-edb-api

# move app into smaller alpine image
FROM debian as release-stage

WORKDIR /

COPY --from=build-stage /go-edb-api /go-edb-api
COPY go-edb-api/templates/ /templates/

EXPOSE 8080

# CMD ["./go-edb-api"]
CMD BUILD=production ./go-edb-api
