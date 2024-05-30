# hello-streamlit-from-docker
# Hello Streamlit

This is the official repository for the Hello Streamlit demo app. This guide will help you build and run the Streamlit app using Docker.

## Prerequisites

- Docker installed on your machine.

## Getting Started

1. **Clone the Repository**:

    ```sh
    git clone https://github.com/streamlit/hello-streamlit.git
    cd hello-streamlit
    ```

2. **Build and Run with Docker**:

    Run the provided shell script to build the Docker image and start the container:

    ```sh
    ./run_docker.sh
    ```

3. **Access the App**:

    Open your web browser and go to `http://localhost:8501` to see the Streamlit app in action.

## Files

- `Dockerfile`: Defines the Docker image for the Streamlit app.
- `run_docker.sh`: Shell script to build and run the Docker container.
- `README.md`: Instructions for setting up and running the app.
