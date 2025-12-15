# 🚀 Projet DevOps : Cyber-Odyssey

![CI Status](https://github.com/Telectric-sup/demo-devops/actions/workflows/ci.yml/badge.svg)
![Docker Pulls](https://img.shields.io/docker/pulls/bryan456/site-bryan)
![License](https://img.shields.io/badge/License-MIT-green)
![Terraform](https://img.shields.io/badge/Infrastructure-Terraform-purple)

## 📋 Description du Projet

Ce projet est une démonstration complète d'un pipeline **DevOps** moderne. Il met en œuvre une chaîne d'intégration et de déploiement continu (CI/CD) robuste.

L'application déployée est **"Cyber-Odyssey"**, une interface interactive et visuelle permettant de comprendre le rôle de chaque outil (Git, Docker, Terraform) à travers une expérience gamifiée en 3D.

## 🛠️ Stack Technique

Le projet respecte l'architecture suivante :

* **Gestion de Version :** Git & GitHub (Branches `main` et `dev`).
* **Conteneurisation :** Docker (Image basée sur `nginx:alpine`).
* **Infrastructure as Code (IaC) :** Terraform pour la gestion de l'environnement local.
* **CI/CD :** GitHub Actions pour l'automatisation des tests, du build Docker et du déploiement.
* **Tests de Qualité :** HTMLHint pour le linting du code source.

## 🚀 Installation & Démarrage Rapide

### Option A : Via Docker (Recommandé)
Pour lancer le projet sans installer de dépendances :

```bash
docker run -d -p 8000:80 bryan456/site-bryan:latest