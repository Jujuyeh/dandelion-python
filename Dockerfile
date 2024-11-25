FROM python:3.12

RUN pip install uv 

WORKDIR /app
COPY . /app

RUN uv sync --frozen --no-cache

CMD ["uv", "run", "uvicorn", "src.dandelion_python:app", "--host", "0.0.0.0"]
