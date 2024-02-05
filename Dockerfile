# syntax=docker/dockerfile:1
# Build an image starting with the Python 3.7 image.
FROM python:3.7-alpine
# Set the working directory to /code.
WORKDIR /code
# Set environment variables used by the flask command.
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
# Install gcc and other dependencies
RUN apk add --no-cache gcc musl-dev linux-headers
# Copy requirements.txt and install the Python dependencies.
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
EXPOSE 5000
# Copy the current directory . in the project to the workdir . in the image.
COPY . .
# Set the default command for the container to flask run.
CMD ["flask", "run"]
