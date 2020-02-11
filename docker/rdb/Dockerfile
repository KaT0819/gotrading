FROM mysql/mysql-server:5.7.28

    #timezone設定
RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
RUN echo 'ZONE="Asia/Tokyo"' > /etc/sysconfig/clock

# COPY server_config/mysql/my.cnf /etc/my.cnf
