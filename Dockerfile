FROM nvidia/cuda:12.4.1-cudnn-runtime-ubuntu22.04

RUN apt-get update && \
    apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y python3.10-full python3-pip

RUN pip install torch==2.5.1 torchvision==0.20.1 torchaudio==2.5.1 --index-url https://download.pytorch.org/whl/cu124

COPY image_classifier.py /code/image_classifier.py

RUN chmod +rx /code/image_classifier.py

ENV PATH="/code:$PATH"

CMD ["image_classifier.py", "-h"]
