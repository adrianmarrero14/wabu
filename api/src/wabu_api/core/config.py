from functools import lru_cache
from typing import Literal

from pydantic_settings import BaseSettings, SettingsConfigDict


class Settings(BaseSettings):
    """Application settings, loaded from environment variables prefixed with `WABU_` or `.env`."""

    model_config = SettingsConfigDict(env_prefix="WABU_", env_file=".env", extra="ignore")

    app_name: str = "Wabu API"
    environment: Literal["local", "production"] = "local"
    debug: bool = False


@lru_cache
def get_settings() -> Settings:
    return Settings()
