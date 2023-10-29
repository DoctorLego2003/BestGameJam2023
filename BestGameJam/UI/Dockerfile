FROM python:3.9.2-slim-buster
EXPOSE 80/tcp

ARG flag1
ARG flag2
RUN if [ -z "$flag1" ]; then \
    echo "ERROR: The 'flag1' build argument is missing. Please provide it using --build-arg flag1=<value>"; \
    exit 1; \
    fi
RUN if [ -z "$flag2" ]; then \
    echo "ERROR: The 'flag2' build argument is missing. Please provide it using --build-arg flag2=<value>"; \
    exit 1; \
    fi

RUN pip install flask gunicorn werkzeug==2.2 --no-cache-dir

WORKDIR /app
COPY app.py ./
COPY templates templates
RUN mkdir /app/static && \
    chmod -R 775 . && \
    chmod 1773 static templates/errors
RUN echo "$flag1" > flag-$(cat /proc/sys/kernel/random/uuid).txt

CMD ["gunicorn", "-w16", "-t5", "--graceful-timeout", "0", "-unobody", "-gnogroup", "-b0.0.0.0:80", "app:app"]
