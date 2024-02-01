FROM golang as build-stage

WORKDIR /app

ADD go-edb-api/ go-edb-api/
ADD go-dna/ go-dna/
ADD go-loctogene/ go-loctogene/

WORKDIR /app/go-edb-api

RUN go mod tidy

# build statically so runs without dependencies
RUN CGO_ENABLED=0 GOOS=linux go build -o /go-edb-api

# move app into smaller alpine image
FROM alpine as release-stage

WORKDIR /

COPY --from=build-stage /go-edb-api /go-edb-api

EXPOSE 8080

CMD ["/go-edb-api"]