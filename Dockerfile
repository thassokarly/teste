# Imagem base leve com Node.js
FROM node:20-slim

# Diretório de trabalho
WORKDIR /app

# Dependências do sistema necessárias para navegadores Playwright
RUN apt-get update && apt-get install -y \
    libnss3 libatk1.0-0 libatk-bridge2.0-0 libcups2 \
    libx11-xcb1 libxcomposite1 libxdamage1 libxrandr2 \
    libgbm1 libasound2 libpangocairo-1.0-0 libpango-1.0-0 \
    libxcb1 libxkbcommon0 libxcb-dri3-0 wget unzip \
    && rm -rf /var/lib/apt/lists/*

# Copiar package.json e package-lock.json
COPY package*.json ./

# Instalar dependências Node
RUN npm install

# Copiar todo o restante do projeto
COPY . .

# Instalar navegadores do Playwright
RUN npx playwright install --with-deps

# Comando padrão para rodar os testes
CMD ["npm", "run", "test"]
