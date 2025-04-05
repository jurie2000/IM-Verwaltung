# 🛠️ Dev Scripts Toolkit

Willkommen zum zentralen Skript-Toolkit für dein Fullstack-Projekt (Spring Boot + React).  
Dieses Repository enthält Shell-Skripte zum einfachen Starten, Stoppen, Testen und Überprüfen deiner lokalen Services.

---

## 🚀 Befehle zur Nutzung

### `./dev.sh start`

Startet sowohl das Backend (Spring Boot auf Port 8181) als auch das Frontend (React auf Port 3100).  
Öffne [http://localhost:3100](http://localhost:3100) im Browser, um die App zu sehen.  
Backend erreichbar unter: [http://localhost:8181/actuator/health](http://localhost:8181/actuator/health)

---

### `./dev.sh stop`

Beendet alle laufenden Services auf Port 3100 (Frontend) und 8181 (Backend).

---

### `./dev.sh test`

Startet beide Services, prüft ob sie erreichbar sind, und stoppt sie wieder automatisch.  
Ideal zum Verifizieren, ob alles korrekt läuft.

---

### `./dev.sh status`

Zeigt, ob Frontend und Backend aktuell laufen. Gibt Port, PID und Status aus.

---

### `./dev.sh frontend`
Startet nur die React-App.  
👉 [http://localhost:3100](http://localhost:3100)

---

### `./dev.sh backend`
Startet nur das Spring Boot Backend.  
👉 [http://localhost:8181/actuator/health](http://localhost:8181/actuator/health)

---

### `./dev.sh stop-frontend`
Beendet nur den Frontend-Service (Port 3100)

---

### `./dev.sh stop-backend`
Beendet nur den Backend-Service (Port 8181)

---

## 🔧 Setup-Hinweis

Beim ersten Start unbedingt alle Skripte ausführbar machen:

```bash
chmod +x *.sh