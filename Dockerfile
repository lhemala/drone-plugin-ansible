FROM alpine:3.12

LABEL Maintainer="Lars Hemala | github.com/lhemala" \
      Description="Lightweight ansible container as drone.io plugin with apache_libcloud based on Alpine Linux."

RUN apk update && \
      apk --no-cache add ansible openssh-client rsync make && \
      python3 -m ensurepip && \
      pip3 install --no-cache-dir --upgrade docker apache_libcloud google-auth requests boto boto3 && \
      ansible-galaxy collection install community.aws && \
      rm -rf /usr/bin/pip3* && \
      rm -rf /usr/lib/python*/ensurepip && \
      rm -rf /root/.cache && \
      rm -rf /tmp/* && \
      rm -rf /var/cache/apk/*

ENV PATH /usr/sbin:$PATH

CMD ["ansible-playbook"]
