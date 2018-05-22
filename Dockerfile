FROM  ubuntu:16.04
MAINTAINER Marc mail@prueba.com

# Actualizamos los repositorios 
RUN apt-get update -y && apt-get upgrade -y

# Instalamos PHP y la libreria que hace que funcione con apache
RUN apt-get install php libapache2-mod-php

# Incluimos la configuracion de nuestro "site" dentro de el directorio de Apache
ADD ./config/docker.conf
RUN a2ensite docker

EXPOSE 80
ADD ./scripts/info.php /var/www/html/info.php
ADD ./scripts/start.sh /start.sh
RUN chmod 0755 /start.sh
CMD ["bash", "start.sh"]
