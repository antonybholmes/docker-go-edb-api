FROM golang as build-stage

WORKDIR /app

ADD go-edb-api/ go-edb-api/
ADD go-dna/ go-dna/
ADD go-gene/ go-gene/
ADD go-auth/ go-auth/
ADD go-math/ go-math/
ADD go-env/ go-env/
ADD go-email/ go-email/

WORKDIR /app/go-edb-api

RUN go mod tidy

# build statically so runs without dependencies
RUN CGO_ENABLED=1 GOOS=linux BUILD=production go build -o /go-edb-api

# move app into smaller alpine image
FROM debian as release-stage

WORKDIR /

COPY --from=build-stage /go-edb-api /go-edb-api

EXPOSE 8080

# CMD ["./go-edb-api"]
CMD BUILD=production ./go-edb-api