# Joonak

Engineering foundation for the Joonak monorepo. This repository currently contains a bootstrapped Flutter Android app and a Django backend with PostgreSQL, Redis, Celery, and AI/image-processing libraries installed. Product features are not implemented yet.

## Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (stable channel) with Android toolchain
- Android SDK / platform tools (`ANDROID_HOME` or `ANDROID_SDK_ROOT`)
- Docker and Docker Compose (for local backend infrastructure)
- Python 3.12 and [uv](https://docs.astral.sh/uv/) only if you run the backend outside Docker

## Repository structure

```text
joonak/
├── apps/
│   ├── mobile/          # Flutter Android application
│   └── backend/         # Django project (config + future AI package)
├── infrastructure/
│   ├── docker/          # Backend container image
│   └── nginx/           # Optional reverse-proxy config (not used by default Compose)
├── docs/                # Project documentation
├── docker-compose.yml
├── .env.example
└── README.md
```

The Django project module is `config`. Celery is started with `celery -A config worker`. Future AI code belongs in `apps/backend/ai/` in the same Python project.

## Local backend startup

```bash
cp .env.example .env
docker compose up --build
```

This starts PostgreSQL, Redis, the Django app on `http://localhost:8000`, and a Celery worker. The health endpoint is `http://localhost:8000/health/`. Django Admin is at `http://localhost:8000/admin/`.

To run Django or Celery on the host instead of in Compose, keep Postgres/Redis in Docker and point the process at localhost:

```bash
cd apps/backend
uv sync
export POSTGRES_HOST=localhost
export REDIS_URL=redis://localhost:6379/0
export CELERY_BROKER_URL=redis://localhost:6379/0
export CELERY_RESULT_BACKEND=redis://localhost:6379/1
uv run python manage.py migrate
uv run python manage.py runserver
uv run celery -A config worker --loglevel=info
```

## Flutter startup

```bash
cd apps/mobile
flutter pub get
flutter run
```

The app targets Android. Use `flutter devices` to select an emulator or device.

## Tests

Backend:

```bash
cd apps/backend
uv sync
uv run ruff check .
uv run ruff format --check .
uv run pytest
uv run python manage.py check
```

Flutter:

```bash
cd apps/mobile
flutter pub get
flutter analyze
flutter test
```

Android build (requires a local Android SDK):

```bash
cd apps/mobile
flutter build apk --debug
```

## Docker

Copy `.env.example` to `.env`, then:

```bash
docker compose up --build
docker compose ps
docker compose down
```

The `backend` and `celery-worker` services share the same image and source tree. PyTorch is installed from the official CPU wheel index so local Docker images stay smaller; CUDA is not required for this foundation. Nginx configuration lives under `infrastructure/nginx/` for later use and is not started by the default Compose file.

S3-compatible object-storage variables are present in `.env.example` so they can be filled in later. They are not required to run the local foundation.
