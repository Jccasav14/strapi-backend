FROM node:18-alpine

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

# 🔹 Construir el panel de administración (carpeta ./dist)
RUN npm run build

ENV NODE_ENV=production
ENV HOST=0.0.0.0
ENV PORT=1337

EXPOSE 1337

# 🔹 Ejecutar en modo producción
CMD ["npm", "start"]
