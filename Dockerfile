# set base image (host OS)
FROM python:3.11-bookworm

# set the working directory in the container
WORKDIR /code

# copy the dependencies file to the working directory
COPY requirements.txt /code

# install dependencies
RUN apt update
# RUN apt install -y sqlite3 libgl1-mesa-glx
RUN pip install pip --upgrade
RUN pip install -r "requirements.txt"

# Copy local libraries
COPY hana-vs-material-rag-ws.py /code
COPY img/ /code/img

# expose a port for Gradio
EXPOSE 51030

# command to run on container start
CMD [ "python3", "hana-vs-material-rag-ws.py" ]