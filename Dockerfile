# Use the official Python image from the Docker Hub
FROM python:3.9

# Set the working directory
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt /app/requirements.txt

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt
# Install packages in linux
RUN apt-get update && apt-get install -y \
    apt install python3-opencv -y \
    apt install ffmpeg -y \
    apt install chromium -y \

# Copy the rest of the application code into the container
COPY . /app

# Expose the Streamlit port
EXPOSE 8501

# Run the Streamlit app
CMD ["streamlit", "run", "streamlit_app.py", "--server.port=8501", "--server.address=0.0.0.0"]
