FROM python

ENV API_HOST=0.0.0.0 \
    API_PORT=5000 \
    AUTH_TYPE=basic_auth

WORKDIR /my_app

COPY . .

RUN chmod +x /my_app/api/v1/app.py

RUN pip3 install -r requirements.txt

ENTRYPOINT ["python3"]

CMD ["-m", "api.v1.app"]