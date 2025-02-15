FROM --platform=i386 i386/debian:buster

# Set non-interactive frontend
ARG DEBIAN_FRONTEND=noninteractive

# Add user and set passwords
RUN useradd -m user && echo "user:password" | chpasswd
RUN echo 'root:password' | chpasswd

# Update and install Python 3 and pip
RUN apt-get update && apt-get install -y python3 python3-pip

# Install esptool via pip
RUN pip3 install esptool

# Set default command
CMD ["/bin/bash"]
