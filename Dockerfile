FROM ubuntu:xenial

ENV PORT    8080

ADD durian /durian
ADD start /start
RUN chmod +x /durian
RUN chmod +x /start
CMD ./start
