# Thesis Demo – Payment System + Fraud Detection

This project demonstrates a **Payment System microservice** with a **Fraud Detection microservice**, running fully containerized with Docker.

## 🛠 Prerequisites

- **Docker** and **Docker Compose** installed  
  - [Install Docker](https://docs.docker.com/get-docker/)
- **Port availability**: `3307` (MySQL), `8080` (Payment System), `8000` (Fraud Detection)

## 🚀 Quick Start

1. **Clone or unzip** the project locally:
   ```bash
   git clone https://gitlab.com/evangeliakostop/thesis-demo.git
   cd thesis-demo

2. Start all services
    ```bash
    docker compose --profile localdb --env-file .env up --build -d

3. Run migrations for database
    ```bash
    docker compose --profile localdb --env-file .env run --rm db-migrate migrate

4. Verify containers are running:
    ```bash
    docker ps

5. You should see:
    ```bash
    mysql (healthy)
    thesis-demo-fraud-detection-1 (healthy)
    thesis-demo-payment-system-1 (healthy)

##  Access the APIs:

Payment System Swagger: http://localhost:8080/swagger-ui/index.html

Fraud Detection Docs: http://localhost:8000/docs

##  Try it
### Test with Postman
Import the included Postman collection (Payment MS.postman_collection.json) and trigger:

POST /payment/init

### Test with curl
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

## Logs
- To see logs:
    ```bash
    docker compose logs -f
