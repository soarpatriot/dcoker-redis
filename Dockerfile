FROM soar/ubuntu

MAINTAINER soar 

WORKDIR /app/
COPY manage.sh /app/

RUN cd /app \
&& wget http://download.redis.io/releases/redis-3.0.4.tar.gz \
&& tar zxvf redis-3.0.4.tar.gz \
&& cd redis-3.0.4 \
&& cd deps \
&& make hiredis lua jemalloc linenoise \
&& cd .. \
&& make \
&& make install 

ENV PORT 6379

CMD ["manage.sh"]
