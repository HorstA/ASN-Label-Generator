FROM python:3

WORKDIR /asn-gen

RUN apt-get update && apt-get install -y --no-install-recommends libdmtx0t64 \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

VOLUME ["/out"] 

CMD [ "python", "./asn-gen.py"]


# docker exec -it $(docker run -d --rm debian:unstable bash -c "apt-get update && apt-get upgrade -y && sleep 86400") bash
