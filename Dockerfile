FROM    python:3.6-alpine3.6

WORKDIR /app

COPY    letmecrawl /app/letmecrawl
COPY    service.py setup.py README.rst requirements-service.txt /app/

RUN     pip install -r requirements-service.txt && \
        pip install -e .

ENTRYPOINT python service.py
