FROM golang:1.19-alpine AS builder

WORKDIR /app

COPY . .

RUN go mod init main

RUN go build -o main .

FROM scratch

WORKDIR /app

COPY --from=builder /app .

CMD [ "./main" ]
