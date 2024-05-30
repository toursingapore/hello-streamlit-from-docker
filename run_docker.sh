#!/bin/bash

# Build the Docker image
docker build -t hello-streamlit .

# Run the Docker container
docker run -p 8501:8501 hello-streamlit
