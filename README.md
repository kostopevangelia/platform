# Thesis Demo

This repo links the two submodules:
- `payment-system`: Java Spring Boot microservice
- `fraud-detection`: Python FastAPI ML service

## Quick Start
```bash
git clone --recurse-submodules <this-repo-url>
cd thesis-demo
cp .env.example .env
docker compose up -d --build
```

## Endpoints
Spring Boot Swagger: http://localhost:8080/swagger-ui

FastAPI Docs: http://localhost:8000/docs

## Example workflow

Init Payment:

Copy - Paste this at terminal:
```bash
@'
{
  "cardNumber": "4000056656656556",
  "iban": null,
  "transactionId": null,
  "amount": 100,
  "currency": "USD",
  "timestamp": "2025-03-04T19:11:52Z",
  "paymentType": "card",
  "transactionType": "PAYMENT",
  "userId": "USER987"
}
'@ | Set-Content -NoNewline -Encoding UTF8 req.json
```
```bash
$port = (docker compose -f C:\PROJECTS\THESIS\thesis-demo\docker-compose.yml port payment-system 8080).Split(':')[-1];
```
```bash
curl.exe -v -H "Content-Type: application/json" --data-binary "@req.json" "http://localhost:$port/payments/init"
```

Get fraud score:

```bash
curl -X POST http://localhost:8000/score \
  -H "Content-Type: application/json" \
  -d '{
  "amount": 120.50,
  "currency": "USD",
  "paymentType": "card",
  "transactionType": "PAYMENT",
  "userId": "USER123",
  "bin": "400005",
  "hour": 14,
  "day_of_week": 2
}'
```
(/payments/init will bring the fraud score)


## Troubleshooting
- If containers fail, check logs:
  ```bash
  docker compose logs -f


If submodules are empty:

git submodule update --init --recursive


Make sure ports 8080, 8000, 3307 are free.