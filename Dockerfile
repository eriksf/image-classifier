FROM pytorch/pytorch:2.4.1-cuda12.1-cudnn9-runtime

RUN apt-get update && \
    apt-get upgrade -y

COPY image_classifier.py /code/image_classifier.py

RUN chmod +rx /code/image_classifier.py

ENV PATH="/code:$PATH"

CMD ["image_classifier.py", "-h"]
