# app.py
import os

app_version = os.environ.get('APP_VERSION', 'Unknown Version')
environment = os.environ.get('ENVIRONMENT', 'Unknown Environment')

print(f"Running application version {app_version} in {environment} environment...")