# Base Docker image containing binaries to run Python 3
FROM python:3.7-slim

# Download Odyssey and change directories
RUN git clone https://github.com/zackjmccann/odyssey.git /root/cm/
WORKDIR /root/cm/

# Bind to port 5000
EXPOSE 5000
