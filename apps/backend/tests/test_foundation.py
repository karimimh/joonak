from django.core.management import call_command
from django.test import SimpleTestCase

from config.celery import app as celery_app


class FoundationTests(SimpleTestCase):
    def test_django_check(self):
        call_command("check")

    def test_rest_framework_is_configured(self):
        from django.conf import settings

        self.assertIn("rest_framework", settings.INSTALLED_APPS)
        self.assertIn("DEFAULT_RENDERER_CLASSES", settings.REST_FRAMEWORK)

    def test_postgres_is_configured(self):
        from django.conf import settings

        self.assertEqual(
            settings.DATABASES["default"]["ENGINE"],
            "django.db.backends.postgresql",
        )

    def test_celery_app_loads(self):
        self.assertEqual(celery_app.main, "joonak")
        self.assertTrue(celery_app.conf.broker_url)

    def test_health_endpoint(self):
        response = self.client.get("/health/")
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json(), {"status": "ok"})
