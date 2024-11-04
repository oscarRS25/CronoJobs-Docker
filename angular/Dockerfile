# Usar la versión de nginx:stable-alpine.
FROM nginx:stable-alpine

# Crear un volumen con el nombre /tmp
VOLUME /tmp

# Eliminar de la imagen el contenido de la carpeta /usr/share/nginx/html/*
RUN rm -rf /usr/share/nginx/html/*

# Copiar el contenido de la configuración de nginx.conf, 
# mime.types y el directorio sistema-ventas-front a sus respectivas carpetas.
COPY nginx.conf /etc/nginx/nginx.conf
COPY cronojobs_front /usr/share/nginx/html
COPY mime.types /etc/nginx/mime.types

# Exponer el puerto 80.
EXPOSE 80

# Ejecutar el comando: CMD[“nginx”, “-g”, “daemon off;”]
CMD ["nginx", "-g", "daemon off;"]