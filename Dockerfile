# start from an official image
FROM python:3.6

ENV PYTHONBUFFERED 1

# arbitrary location choice: you can change the directory
RUN mkdir /code
WORKDIR /code

COPY requirements.txt /

# install our two dependencies
RUN pip install -r /requirements.txt

# copy our project code
COPY . /code

# expose the port 80
EXPOSE 80

# define the default command to run when starting the container
CMD ["gunicorn", "--chdir", "telematics", "--bind", ":80", "mytwitt.wsgi:application"]
