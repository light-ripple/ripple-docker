FROM python:3.6-stretch
WORKDIR /ripple

RUN git clone --recurse-submodules https://github.com/osufx/lets.git /ripple-src
WORKDIR /ripple-src

RUN pip install -r requirements.txt
RUN python setup.py build_ext --inplace

WORKDIR /ripple-src/pp/oppai-ng/
RUN chmod +x ./build
RUN ./build

VOLUME [ "/ripple", "/ripple-src/common" ]

EXPOSE 5001 6667

WORKDIR /ripple

COPY start.sh /bin/startlets
RUN chmod +x /bin/startlets

RUN mkdir ~/.config && touch ~/.config/ripple_license_agreed

CMD [ "startlets" ]
