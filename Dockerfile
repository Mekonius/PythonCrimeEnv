# Use an official Python runtime as a parent image
FROM python:3.10-bookworm

# Set environment variables
ENV PYTHONUNBUFFERED=1

# Install Jupyter Notebook and any additional dependencies
RUN pip install jupyter 
RUN pip install pandas==2.1.0
RUN pip install matplotlib==3.4.3
RUN pip install numpy==1.25.2
RUN pip install folium==0.14.0

# Create a working directory
WORKDIR /app

COPY crime_data.ipynb .

# Expose the Jupyter Notebook port
EXPOSE 8888

# Start Jupyter Notebook when the container runs
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
