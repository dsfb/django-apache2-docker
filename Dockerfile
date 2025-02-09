FROM ubuntu/apache2:2.4-20.04_beta

RUN apt-get update
RUN apt-get install -y apt-utils vim curl apache2 apache2-utils
RUN apt-get -y install python3 libapache2-mod-wsgi-py3
RUN ln /usr/bin/python3 /usr/bin/python
RUN apt-get -y install python3-pip
RUN pip install --upgrade pip
RUN pip install "django ~= 3.2.0" ptvsd
ADD ./demo_site.conf /etc/apache2/sites-available/000-default.conf
EXPOSE 80 81 3500
CMD ["apache2ctl", "-D", "FOREGROUND"]
