FROM python:3.9.16-slim

ENV PYTHONUNBUFFERED=TRUE

RUN pip --no-cache-dir install pipenv

WORKDIR /app

COPY ["requirements.txt", "./"]
RUN pip install -r requirements.txt 

# --deploy --system && \
#     rm -rf /root/.cache

COPY ["*.py", "churn-model.bin", "./"]

EXPOSE 9696

ENTRYPOINT ["gunicorn", "--bind", "0.0.0.0:9696", "churn_serving:app"] 

