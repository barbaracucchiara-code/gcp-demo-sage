"""Legge il file di istruzioni da Cloud Storage."""

import asyncio

from google.cloud import storage

from sage.config import get_app_config


def _read_instructions() -> str:
    config = get_app_config()
    if not config.instructions_bucket:
        return ""
    client = storage.Client(project=config.project_id)
    blob = client.bucket(config.instructions_bucket).blob(config.instructions_file)
    return blob.download_as_text(encoding="utf-8")


async def get_instructions() -> str:
    return await asyncio.to_thread(_read_instructions)