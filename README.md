# Joonak

**Engineering foundation for a Persian-language Android game where children's paper drawings become playable characters in their own adventure world.**

> **Status: foundation stage.** This repository holds the project scaffold:
> a Flutter Android app shell, a Django + Celery backend, Docker Compose and
> CI. **No product features are implemented yet.** The product is defined in
> the [MVP specification](docs/joonak_mvp_specification.md).

## The product idea

Joonak (working title "Drawing-to-World") is planned as a Persian-first
Android creative game for families in Iran, aimed at children aged 6–12 with
a parent managing the account:

1. A child draws a hero, a friend, a playful rival and a home on paper.
2. A parent photographs each drawing, crops it and approves sending it for
   processing.
3. An AI image pipeline turns each drawing into a game-ready
   character or object while keeping the child's own lines and colors.
4. The creations appear together in one saved, side-scrolling 2D adventure
   that can be replayed offline.

The spec also covers a PIN-protected parent area, credit-based transformations
(a free allowance plus a purchasable pack), privacy and deletion rules, and a
Persian, right-to-left UI. All of this is **planned**, not built.

## What is implemented

- **Monorepo layout** with separate mobile, backend and infrastructure
  directories, a shared `.editorconfig`, and Docker ignore rules.
- **Django 5.2 backend** (`apps/backend`): environment-driven settings,
  PostgreSQL, Redis cache, Django REST Framework, WhiteNoise for static files,
  Django admin, and a `/health/` endpoint.
- **Celery worker** wired to Redis, with app autodiscovery ready for future
  background jobs (for example drawing processing).
- **AI package placeholder** (`apps/backend/ai/`). PyTorch (CPU wheels),
  OpenCV (headless) and Pillow are installed, but no models or pipelines exist
  yet.
- **Flutter Android app shell** (`apps/mobile`): Riverpod for state and
  go_router for navigation, rendering a single placeholder screen. Dependencies
  for the planned features are already declared: Flame (game engine), Dio
  (HTTP), Drift/SQLite (local storage) and camera. The app requests camera
  permission in its Android manifest.
- **Docker Compose** stack: PostgreSQL 17, Redis 7, the backend and a Celery
  worker, with health checks.
- **GitHub Actions CI**: Ruff lint and format check plus pytest for the
  backend, and `flutter analyze` plus `flutter test` for the app.
- **Nginx reverse-proxy config** under `infrastructure/nginx/` for later use.
  It is not started by the default Compose file.

Planned (not implemented): drawing capture and crop flow, the AI drawing-to-
sprite pipeline, the Flame-based adventure, parent accounts with phone/OTP
sign-in and PIN, credits and in-app purchases through an Iranian app store,
S3-compatible media storage, and Persian localization.

## Architecture (current)

```text
 Flutter Android app (apps/mobile)        Django backend (apps/backend)
   Riverpod + go_router shell     ---->     DRF, admin, /health/
   (no API calls yet)                           |            |
                                           PostgreSQL 17   Redis 7 <---- Celery worker
                                                                         (ai/ package: future
                                                                          image processing)
```

The Django project module is `config`. Settings read environment variables,
loading the repository-root `.env` first and then `.env.example` as a
fallback. Tests and CI therefore run without a local `.env`.

## Tech stack

| Layer | Technologies |
|---|---|
| Mobile | Flutter (Dart ≥ 3.8), Riverpod, go_router, Flame, Dio, Drift + sqlite3, camera |
| Backend | Python 3.12, Django 5.2, Django REST Framework, Celery 5, Redis, Gunicorn, WhiteNoise, boto3 |
| AI / imaging (installed, unused) | PyTorch (CPU), OpenCV (headless), Pillow |
| Infrastructure | Docker Compose, PostgreSQL 17, Redis 7, Nginx config, GitHub Actions |
| Tooling | uv, Ruff, pytest + pytest-django, flutter_lints |

## Repository layout

```text
joonak/
├── apps/
│   ├── backend/              # Django project (config/), ai/ placeholder, tests/
│   └── mobile/               # Flutter Android app (lib/, test/, android/)
├── infrastructure/
│   ├── docker/backend/       # Backend Dockerfile (uv, CPU-only PyTorch)
│   └── nginx/                # Reverse-proxy config, not used by default
├── docs/
│   └── joonak_mvp_specification.md
├── .github/workflows/ci.yml
├── docker-compose.yml
└── .env.example
```

## Getting started

### Backend with Docker (recommended)

Requires Docker with Compose.

```bash
cp .env.example .env
docker compose up --build
```

This starts PostgreSQL, Redis, the Django app on http://localhost:8000
(it runs migrations on startup) and a Celery worker.

- Health check: http://localhost:8000/health/ returns `{"status": "ok"}`
- Django admin: http://localhost:8000/admin/. Create a user with
  `docker compose exec backend python manage.py createsuperuser`.

`docker compose ps` shows service health, and `docker compose down` stops
the stack.

### Backend on the host

Requires Python 3.12 and [uv](https://docs.astral.sh/uv/). Keep Postgres and
Redis in Docker and point the app at localhost:

```bash
docker compose up -d postgres redis
cd apps/backend
uv sync
export POSTGRES_HOST=localhost
export REDIS_URL=redis://localhost:6379/0
export CELERY_BROKER_URL=redis://localhost:6379/0
export CELERY_RESULT_BACKEND=redis://localhost:6379/1
uv run python manage.py migrate
uv run python manage.py runserver
uv run celery -A config worker --loglevel=info   # separate terminal
```

### Mobile app

Requires the Flutter SDK (stable, ≥ 3.32) with the Android toolchain and an
emulator or device.

```bash
cd apps/mobile
flutter pub get
flutter run                 # pick a target with `flutter devices`
flutter build apk --debug   # optional debug APK
```

## Configuration

Copy `.env.example` to `.env`. All values are local-development placeholders.

| Variable | Purpose |
|---|---|
| `DJANGO_SECRET_KEY`, `DJANGO_DEBUG`, `DJANGO_ALLOWED_HOSTS`, `DJANGO_CSRF_TRUSTED_ORIGINS` | Core Django settings |
| `DJANGO_STATIC_URL`, `DJANGO_MEDIA_URL`, `DJANGO_MEDIA_ROOT` | Static/media paths (media root defaults to `apps/backend/media`) |
| `POSTGRES_DB`, `POSTGRES_USER`, `POSTGRES_PASSWORD`, `POSTGRES_HOST`, `POSTGRES_PORT` | Database, also used by the Postgres container |
| `REDIS_URL`, `CELERY_BROKER_URL`, `CELERY_RESULT_BACKEND` | Cache and Celery broker/results |
| `CELERY_TASK_ALWAYS_EAGER` | Run Celery tasks inline (only honored when `DJANGO_DEBUG=true`) |
| `S3_ENDPOINT_URL`, `S3_ACCESS_KEY`, `S3_SECRET_KEY`, `S3_BUCKET_NAME`, `S3_REGION` | Placeholders for future S3-compatible storage. Not needed to run locally |

## Testing

CI runs the Ruff, pytest, `flutter analyze` and `flutter test` steps below on
every push and pull request:

```bash
# Backend
cd apps/backend
uv sync
uv run ruff check .
uv run ruff format --check .
uv run pytest
uv run python manage.py check

# Mobile
cd apps/mobile
flutter pub get
flutter analyze
flutter test
```

The backend tests are foundation smoke tests: Django system check, DRF and
Postgres configuration, Celery app loading and the health endpoint. They do
not need a running database. The Flutter tests check that the app shell
renders and that the core packages can be constructed.

## Project status

Early-stage personal project: one commit containing the engineering
foundation. The next milestones are the drawing capture flow, the
drawing-processing pipeline in `apps/backend/ai/`, and the first playable
Flame stage. It has not been released or deployed.
