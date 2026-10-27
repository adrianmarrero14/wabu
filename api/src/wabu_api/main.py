from fastapi import FastAPI

from wabu_api.core.config import get_settings
from wabu_api.routers import health


def create_app() -> FastAPI:
    settings = get_settings()
    app = FastAPI(title=settings.app_name, debug=settings.debug)
    app.include_router(health.router)
    return app


app = create_app()
