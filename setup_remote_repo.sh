#!/bin/bash

# Variablen setzen
REPO_NAME="NewLocalRepo"  # Lokaler Repository-Name
REMOTE_URL="git@github.com:MrArgen/NewLocalRepo.git"  # GitHub-Repository-URL (SSH)
USER_NAME="MrArgen"
USER_EMAIL="genicelaj1@gmail.com"

# Lösche existierendes Verzeichnis
if [ -d "$REPO_NAME" ]; then
    echo "Warnung: Verzeichnis '$REPO_NAME' existiert bereits. Lösche es..."
        rm -rf "$REPO_NAME"
	fi

	# Lokales Repository erstellen
	echo "Erstelle lokales Repository '$REPO_NAME'..."
	mkdir "$REPO_NAME"
	cd "$REPO_NAME"
	git init

	# Benutzername und E-Mail setzen
	echo "Setze Git-Konfiguration..."
	git config user.name "$USER_NAME"
	git config user.email "$USER_EMAIL"

	# README erstellen und committen
	echo "Erstelle README.md..."
	echo "# NewLocalRepo" > README.md
	git add README.md
	git commit -m "Initial commit: Added README.md"

	# Remote-Repository hinzufügen
	echo "Verbinde mit Remote-Repository '$REMOTE_URL'..."
	git remote add origin "$REMOTE_URL"

	# Hauptbranch umbenennen und pushen
	echo "Pushe die Dateien ins Remote-Repository..."
	git branch -M main
	git push -u origin main

	echo "Repository erfolgreich erstellt, verbunden und synchronisiert!"

