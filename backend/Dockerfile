FROM python:3.11-slim
RUN useradd -m appuser
WORKDIR /app

# The build context is now the project root, so we prepend directory paths
COPY backend/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY backend/ .

# Pull Alembic back from the frontend directory for database migrations
COPY frontend/alembic/ ./alembic/
COPY frontend/alembic.ini .

RUN chown -R appuser:appuser /app
USER appuser
EXPOSE 5000
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "--workers", "3", "app:app"]
