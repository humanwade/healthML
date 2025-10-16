import os

class Config:
    DB_USER = os.getenv("DB_USER", "wade")
    DB_PASSWORD = os.getenv("DB_PASSWORD", "password")
    DB_HOST = os.getenv("DB_HOST", "132.145.108.97")
    DB_NAME = os.getenv("DB_NAME", "healthproject")

    UPLOAD_FOLDER = os.getenv("UPLOAD_FOLDER", "/app/uploads")

    FLASK_HOST = os.getenv("FLASK_HOST", "0.0.0.0")
    FLASK_PORT = int(os.getenv("FLASK_PORT", 5000))
    DEBUG = True
