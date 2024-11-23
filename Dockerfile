FROM cgr.dev/chainguard/python:latest-dev as build

ENV PATH="/app/venv/bin:$PATH"

WORKDIR /app

RUN python -m venv /app/venv
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

FROM cgr.dev/chainguard/python:latest

WORKDIR /app

ENV PATH="/venv/bin:$PATH"

COPY . ./
COPY --from=build /app/venv /venv

EXPOSE 5000

ENTRYPOINT ["python", "/app/app.py"]