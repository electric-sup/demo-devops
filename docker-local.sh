#!/bin/bash

echo "=== Pipeline Docker Local pour demo-devops ==="
echo "Structure détectée :"
ls -la

# Variables
IMAGE_NAME="demo-devops"
TAG="local"
PORT=8080

# 1. Construire l'image
echo "1. Construction de l'image Docker..."
docker build -t $IMAGE_NAME:$TAG .

# 2. Vérifier l'image
echo "2. Vérification de l'image..."
docker images | grep $IMAGE_NAME

# 3. Tester l'image
echo "3. Test de l'image en conteneur..."
docker run -d --name test-container -p $PORT:80 $IMAGE_NAME:$TAG
sleep 5

# 4. Vérifier que le site fonctionne
echo "4. Test HTTP..."
if curl -s -f "http://localhost:$PORT" | grep -q "Bienvenue"; then
    echo "✅ Test réussi : Site accessible"
else
    echo "❌ Test échoué : Site inaccessible"
    docker logs test-container
fi

# 5. Exporter l'image en .tar
echo "5. Exportation de l'image en fichier .tar..."
docker save -o $IMAGE_NAME-$TAG.tar $IMAGE_NAME:$TAG
echo "Taille du fichier :"
ls -lh $IMAGE_NAME-$TAG.tar

# 6. Tester l'importation
echo "6. Test d'importation..."
docker rmi $IMAGE_NAME:$TAG 2>/dev/null || true
docker load -i $IMAGE_NAME-$TAG.tar
echo "Image après import :"
docker images | grep $IMAGE_NAME

# 7. Nettoyage
echo "7. Nettoyage..."
docker stop test-container 2>/dev/null || true
docker rm test-container 2>/dev/null || true
docker rmi $IMAGE_NAME:$TAG 2>/dev/null || true

echo "=== Processus terminé avec succès ==="
echo "Image disponible : $IMAGE_NAME-$TAG.tar"