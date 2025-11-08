# Imagen base
FROM node:18-alpine

# Crear directorio de trabajo
WORKDIR /app

# Copiar dependencias
COPY package*.json ./

# Instalar dependencias
RUN npm install --production

# Copiar todo el proyecto
COPY . .

# Variables de entorno
ENV NODE_ENV=production
ENV HOST=0.0.0.0
ENV PORT=1337

# Exponer el puerto
EXPOSE 1337

# Comando de inicio
CMD ["npm", "run", "start"]
