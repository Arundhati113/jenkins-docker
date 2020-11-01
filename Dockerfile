# Base Image
FROM python:3.6

# create and set working directory
RUN mkdir /app
WORKDIR /app

# Add current directory code to working directory
ADD . /app/

COPY . /requirements.txt/simple_dj_docker/requirements.txt

# set default environment variables
ENV PYTHONUNBUFFERED 1


# set project environment variables
# grab these via Python's os.environ
# these are 100% optional here
ENV PORT=8000

# Install system dependencies

RUN pip3 install --upgrade pip 
RUN pip3 install pipenv
RUN pip install -r requirements.txt



EXPOSE 8888

CMD [ "python", "./simple_dj_docker/manage.py", "runserver", "0.0.0.0:8000" ]
