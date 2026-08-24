FROM python:3.11-slim

# Security: Create a non-root user to prevent path traversal escalation
RUN useradd -m appuser

WORKDIR /app

# Install dependencies first for Docker caching
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application
COPY . .

# Set permissions and switch to non-root user
RUN chown -R appuser:appuser /app
USER appuser

EXPOSE 5000

# Start Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "--workers", "3", "app:app"]
