FROM python:3.8-alpine

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

WORKDIR /app/backend

COPY requirements.txt /app/backend/

# Build psycopg2-binary from source -- add required required dependencies
RUN apk add --virtual .build-deps --no-cache postgresql-dev gcc python3-dev musl-dev && \
        pip install --no-cache-dir -r requirements.txt && \
        apk --purge del .build-deps

# copy entrypoint.sh
COPY ./entrypoint.sh ./app/backend/
RUN sed -i 's/\r$//g' ./app/backend/entrypoint.sh
RUN chmod +x ./app/backend/entrypoint.sh

COPY . /app/backend/

CMD [ "python", "manage.py", "runserver", "0.0.0.0:8000" ]

ENTRYPOINT ["/app/backend/entrypoint.sh"]
