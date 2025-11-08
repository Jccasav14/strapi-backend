# Usa una imagen base de Node.js
FROM node:18-alpine

# Crea y entra al directorio de trabajo
WORKDIR /app

# Copia package.json e instala dependencias
COPY package*.json ./
RUN npm install

# Copia todo el código fuente al contenedor
COPY . .

# ⚙️ Compila el panel de administración de Strapi
RUN npm run build

# Variables de entorno
ENV NODE_ENV=production
ENV HOST=0.0.0.0
ENV PORT=1337

# Expone el puerto
EXPOSE 1337

# Inicia Strapi
CMD ["npm", "start"]
