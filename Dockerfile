# start from an official image
FROM python:3.6

# arbitrary location choice: you can change the directory
RUN mkdir -p /opt/services/djangoapp/src
WORKDIR /opt/services/djangoapp/src

# install our two dependencies
RUN pip install -r /requirements.txt

# copy our project code
COPY . /opt/services/djangoapp/src

# expose the port 80
EXPOSE 80

# define the default command to run when starting the container
CMD ["gunicorn", "--chdir", "hello", "--bind", ":8000", "hello.wsgi:application"]