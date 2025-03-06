# TFG-Go-Backend

A Golang-based backend system that automatically collects anime data from various APIs, translates content using Deepseek AI model (via Ollama), and stores the processed data in a database.

## Features

- Automated data collection from multiple anime APIs
- Scheduled execution using cron jobs
- AI-powered translation with Deepseek model through Ollama
- Data persistence in a containerized database

## Technologies Used

- Go 1.23+
- Docker & Docker Compose
- Deepseek AI model via Ollama
- Cron scheduling
- PostgreSQL database (containerized)

## Installation

### Prerequisites

- Go 1.23+
- Docker and Docker Compose
- Ollama with Deepseek model installed

### Setup

1. Clone the repository:

```bash
git clone https://github.com/DeTiveNC/TFG-Go-Backend.git
cd TFG-Go-Backend
```

2. Run the database container:

```bash
docker-compose up -d db
```

3. Install Go dependencies:

```bash
go mod tidy
```

4. Build the application:

```bash
go build -o tfg-backend
```

## Configuration

Create a `.env` file in the project root with the following variables:

```
DB_HOST=localhost
DB_PORT=5432
DB_NAME=anime_db
DB_USER=postgres
DB_PASSWORD=yourpassword
OLLAMA_URL=http://localhost:11434
CRON_SCHEDULE="0 */6 * * *"  # Run every 6 hours
API_SOURCES=myanimelist,anilist
TARGET_LANGUAGES=es,fr,de
```

## Usage

Start the application:

```bash
./tfg-backend
```

The application will:
1. Run on schedule based on the cron expression
2. Fetch anime data from configured APIs
3. Process and translate content using Deepseek
4. Store results in the database

## Architecture

```
┌─────────────┐    ┌───────────┐    ┌───────────┐
│ Cron Jobs   │───>│ API       │───>│ Deepseek  │
└─────────────┘    │ Fetchers  │    │ (Ollama)  │
                   └───────────┘    └───────────┘
                        │                │
                        ▼                ▼
                   ┌───────────────────────┐
                   │ Data Processing       │
                   └───────────────────────┘
                                │
                                ▼
                   ┌───────────────────────┐
                   │ Database (Docker)     │
                   └───────────────────────┘
```

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.