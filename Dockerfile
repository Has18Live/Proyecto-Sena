# Utilizamos la imagen base de Ubuntu
FROM ubuntu:latest

# Actualizamos el sistema e instalamos MySQL Server
RUN apt-get update && \
    apt-get install -y mysql-server-8.0 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Creamos un volumen para persistir los datos de MySQL
VOLUME /var/lib/mysql

# Exponemos el puerto 3306 para que se pueda acceder a MySQL desde fuera del contenedor
EXPOSE 3306

# Configuramos la base de datos para aceptar conexiones desde cualquier dirección IP
RUN sed -i 's/^\(bind-address\s.*\)/# \1/' /etc/mysql/mysql.conf.d/mysqld.cnf

# Ejecutamos MySQL Server al iniciar el contenedor
CMD ["mysqld"]

# Establecemos la contraseña de root de MySQL por defecto (puedes cambiarla según tus preferencias)
ENV MYSQL_ROOT_PASSWORD=12345

# iniciamos el servicio ssh
CMD service ssh start

# 
