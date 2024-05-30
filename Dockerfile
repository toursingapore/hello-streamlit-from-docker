# Use the official Python image from the Docker Hub
FROM python:3.9

# Set the working directory in Docker Hub
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt /app/requirements.txt

# Install the dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the packages.txt file into the container
COPY packages.txt /app/packages.txt

# Install OS packages listed in packages.txt & Clean up to reduce the image size by removing cached package lists (apt-get clean and rm -rf /var/lib/apt/lists/*)
RUN apt-get update && \
    xargs -a /app/packages.txt apt-get install -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Download SAM Model in Docker Hub if it doesn't exist
RUN mkdir -p /app/sam_images
RUN if [ ! -f /app/sam_images/sam_vit_l_0b3195.pth ]; then \
    curl -o /app/sam_images/sam_vit_l_0b3195.pth https://dl.fbaipublicfiles.com/segment_anything/sam_vit_l_0b3195.pth; \
    fi
RUN apt install libgl1-mesa-glx -y

# Copy the rest of the application code into the container
COPY . /app

# Expose the Streamlit port
EXPOSE 8501

# Run the Streamlit app
CMD ["streamlit", "run", "streamlit_app.py", "--server.port=8501", "--server.address=0.0.0.0"]
