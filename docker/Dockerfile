FROM python:3

ENV APP_PORT=8888
WORKDIR /app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

RUN mkdir cgi-bin 
COPY app.py ./cgi-bin/
RUN chmod +x cgi-bin/app.py
EXPOSE $APP_PORT


CMD ["python", "-m", "http.server", "8888", "--cgi" ]
