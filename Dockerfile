FROM python:3.12 as builder

RUN pip install uv 

WORKDIR /app
COPY . /app

RUN uv build --wheel

FROM python:3.12

COPY --from=builder /app/dist/*.whl /

RUN apt update && apt install -y jq openjdk-17-jre-headless
RUN pip install /*.whl

CMD ["dandelion-python"]
