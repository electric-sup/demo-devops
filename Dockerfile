# Commencons!! (Nginx sur Linux Alpine)
FROM nginx:alpine

# On copie notre fichier html dans le dossier du serveur web du conteneur
COPY ./index.html /usr/share/nginx/html/index.html

# Aurevoir!