FROM golang:alpine AS builder

RUN apk add --no-cache ca-certificates tzdata
WORKDIR /build
COPY . .
RUN go mod download
RUN CGO_ENABLED=0 GOOS=linux go build -ldflags="-w -s" -o gatus .

FROM scratch

COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=builder /build/gatus /gatus
COPY --from=builder /build/web /web
COPY --from=builder /build/config.yaml /config/config.yaml

ENV PORT=8080
EXPOSE 8080

USER 65534:65534
ENTRYPOINT ["/gatus"]
