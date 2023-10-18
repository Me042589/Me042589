3-alpine

RUN apk add --no-cache git unzip groff build-base libffi-dev cmake
RUN git clone --recursive  --depth 1 --branch v2 --single-branch  https://github.com/aws/aws-cli.git

WORKDIR aws-cli
RUN python -m venv venv
RUN . venv/bin/activate
RUN scripts/installers/make-exe
RUN unzip -q dist/awscli-exe.zip
RUN aws/install --bin-dir /aws-cli-bin
RUN /aws-cli-bin/aws --version