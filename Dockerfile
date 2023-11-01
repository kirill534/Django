FROM python:3.11

ENV PYTHONUNBUFFERD=1

WORKDIR /app

RUN pip install --upgrade pip pipenv
COPY Pipfile.lock Pipfile ./
RUN pipenv install --system --deploy

COPY mysite .

CMD ["gunicorn", "mysite.wsgi:application", "--bind", "0.0.0.0:8000"]

