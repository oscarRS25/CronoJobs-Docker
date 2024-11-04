# Usar una imagen con node
FROM node:18.17.1-alpine

# Crear un directorio en /usr/src/app
WORKDIR /usr/src/app

# Copiar los archivos package.json y package-lock.json al directorio raíz ./
COPY package*.json ./

# Instalar las dependencias: Ejecutar el comando npm install
RUN npm install

# Copiar todo el directorio del proyecto al contenedor
COPY . .

# Exponer el puerto 3000
EXPOSE 3000

# Agregar el comando CMD para iniciar la aplicación
CMD ["npm", "run", "dev"]