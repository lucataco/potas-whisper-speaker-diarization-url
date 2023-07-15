# This is a potassium-standard dockerfile, compatible with Banana

# Don't change this. Currently we only support this specific base image.
FROM pytorch/pytorch:1.11.0-cuda11.3-cudnn8-runtime

WORKDIR /

# Install git
RUN apt-get update && apt-get install -y build-essential git
RUN conda install -y pytorch==1.12.1 torchvision==0.13.1 torchaudio==0.12.1 cudatoolkit=11.3 -c pytorch
RUN apt-get install -y ffmpeg

# Install python packages
RUN pip3 install --upgrade pip
ADD requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

# Add your model weight files 
# (in this case we have a python script)
ADD download.py .
RUN python3 download.py

ADD . .

EXPOSE 8000

CMD python3 -u app.py