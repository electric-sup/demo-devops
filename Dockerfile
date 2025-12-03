# Étape 1 : Image de base légère avec Nginx
FROM nginx:alpine

# Étape 2 : Installer curl pour les tests de santé
RUN apk add --no-cache curl

# Étape 3 : Copier la configuration Nginx personnalisée
COPY docker/nginx.conf /etc/nginx/nginx.conf

# Étape 4 : Copier ton index.html dans le dossier web
COPY index.html /usr/share/nginx/html/

# Étape 5 : Ajouter un fichier de santé (optionnel)
RUN echo "OK" > /usr/share/nginx/html/health.html

# Étape 6 : Définir les permissions (sécurité)
RUN chown -R nginx:nginx /usr/share/nginx/html && \
    chmod -R 755 /usr/share/nginx/html

# Étape 7 : Vérification de santé
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD curl -f http://localhost/health.html || exit 1

# Étape 8 : Exposer le port 80
EXPOSE 80

# Étape 9 : Exécuter en tant qu'utilisateur non-root (sécurité)
USER nginx

# Étape 10 : Démarrer Nginx
CMD ["nginx", "-g", "daemon off;"]