FROM python:3.5-stretch
WORKDIR /ripple

RUN git clone --recurse-submodules https://zxq.co/ripple/pep.py.git /ripple-src
WORKDIR /ripple-src

RUN pip install -r requirements.txt
RUN python setup.py build_ext --inplace

VOLUME [ "/ripple" ]

EXPOSE 5001 6667

WORKDIR /ripple

COPY start.sh /bin/startpeppy
RUN chmod +x /bin/startpeppy

RUN mkdir ~/.config && touch ~/.config/ripple_license_agreed

CMD [ "startpeppy" ]
