FROM python:3.10.5-slim-buster

WORKDIR /app

COPY ./ ./

RUN python3 -m pip install --upgrade pip

RUN pip install --upgrade pip --no-cache-dir

RUN pip install -r requirements.txt

# CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]

CMD ["gunicorn", "portfolio.wsgi:application", "--bind", "0.0.0.0:8000"]