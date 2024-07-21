# Utilisez l'image node officielle comme image de base
FROM node:21

# Définissez le répertoire de travail dans le conteneur
WORKDIR /app

# Copiez le fichier package.json et package-lock.json dans le répertoire de travail
COPY package*.json ./

# Installez les dépendances
RUN npm install

# Copiez le reste des fichiers de l'application dans le répertoire de travail
COPY . .

# Construisez le site Docusaurus
RUN npm run build

# Exposez le port que Docusaurus utilise (par défaut 3000)
EXPOSE 3000

# Commande pour lancer le serveur Docusaurus
CMD ["npx", "serve", "build"]
