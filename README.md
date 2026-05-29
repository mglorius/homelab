# 🏠 Homelab Dokumentation

> Persönliche Infrastruktur – betrieben, konfiguriert und gewartet von Michael Glorius

-----

## 📋 Übersicht

Dieses Repository dokumentiert mein privates Homelab. Ziel ist es, reale IT-Infrastruktur
selbst zu betreiben, zu verstehen und kontinuierlich zu verbessern.  
Der Stack entspricht dem, was in kleinen und mittleren Unternehmen produktiv eingesetzt wird.

-----

## 🖥️ Hardware

|Gerät            |Modell                    |Zweck                          |
|-----------------|--------------------------|-------------------------------|
|Homelab-Server   |LENOVO ThinkCentre M720q  |Virtualisierung (Proxmox)      |
|NAS              |Synology DS923+           |Storage, Backup, Dateiablage   |
|Router / Firewall|UniFi Dream Machine SE    |Routing, Firewall, VPN, IDS/IPS|
|Switch           |UniFi Switch Pro 24 PoE   |Managed Switching, PoE für APs |
|Access Points    |6x UniFi AP               |Enterprise WLAN-Infrastruktur  |

sowie ARRIS Router für Vodafone Netzzugang und UPS von Legrand
-----

## 🏗️ Netzwerk-Architektur

```
Internet
    │
    ▼
[UniFi Dream Machine SE]
 Firewall │ VPN │ IDS/IPS │ Controller
    │
    ▼
[UniFi Switch Pro 24 PoE]
    │
    ├──▶ 6x UniFi Access Points (WLAN)
    │
    ├──▶ Proxmox Host
    │        ├── VM: Nextcloud + Collabora Online
    │        ├── VM/LXC: InfluxDB + Grafana
    │        └── LXC: Nginx Proxy Manager
    │
    └──▶ Synology DS923+
             ├── Netzwerkspeicher
             └── Backup-Ziel für VMs
```



-----

## 🛠️ Dienste & Software

### 🔀 Netzwerk

**UniFi Dream Machine SE**

- Zentrales Routing, Firewall und DHCP-Management
- IDS/IPS für Netzwerksicherheit
- VPN-Server (WireGuard/OpenVPN) für sicheren Fernzugriff
- Unified Controller für Switch und Access Points

**UniFi Switch Pro 24 PoE**

- Managed Layer-2/3 Switch
- PoE-Versorgung aller 6 Access Points
- VLAN-Konfiguration zur Netzwerksegmentierung

**6x UniFi Access Points**

- Flächendeckendes WLAN-Netz
- Mehrere SSIDs für verschiedene Netzwerksegmente (z.B. IoT, privat, Gäste)

-----

### ⚙️ Virtualisierung

**Proxmox VE**

- Betrieb mehrerer VMs und LXC-Container auf einem Host
- Snapshot- und Backup-Verwaltung
- Ressourcen-Monitoring und -Zuweisung

-----

### 💾 Storage

**Synology DS923+**

- Zentraler Netzwerkspeicher (NAS)
- Backup-Ziel für Proxmox-VMs
- RAID-Konfiguration für Datensicherheit
- Anbindung an Nextcloud als externer Speicher

-----

### ☁️ Collaboration & Cloud

**Nextcloud**

- Selbstgehostete Cloud-Lösung (Alternative zu Google Drive / OneDrive)
- Betrieben als VM unter Linux auf Proxmox
- Zugriff von extern über Nginx Proxy Manager mit SSL

**Collabora Online**

- Selbstgehostete Office-Suite (Alternative zu Microsoft 365 / Google Docs)
- Läuft als Docker-Container, integriert in Nextcloud
- Ermöglicht kollaboratives Bearbeiten von Dokumenten im Browser

-----

### 🌐 Reverse Proxy & SSL

**Nginx Proxy Manager (NPM)**

- Reverse Proxy für alle internen Dienste
- SSL-Zertifikate via Let’s Encrypt (automatische Erneuerung)
- Absicherung und zentrales Management der externen Erreichbarkeit

-----

### 📊 Monitoring & Observability

**InfluxDB + Grafana**

- Monitoring-Stack für System- und Netzwerkmetriken
- Zeitreihendaten aus allen Diensten gesammelt in InfluxDB
- Visualisierung, Dashboards und Alerting über Grafana

-----

## 🔧 Gelöste Probleme

### Problem: SSL-Zertifikat lief ab

**Situation:** Nextcloud war extern nicht mehr erreichbar, Browser zeigte Zertifikatsfehler  
**Lösung:** Let’s Encrypt-Erneuerung über NPM manuell angestoßen, danach Automatisierung geprüft  
**Gelernt:** Monitoring-Alert auf Zertifikatslaufzeit in Grafana eingerichtet

-----

### Problem: [Nächstes Problem hier eintragen]

**Situation:**  
**Lösung:**  
**Gelernt:**

-----

## 🔒 Sicherheit

- Netzwerksegmentierung via VLANs (IoT, Clients, Server, Gäste)
- Firewall-Regeln zwischen allen Segmenten über UDM SE
- IDS/IPS aktiv auf dem gesamten Netzwerktraffic
- Alle Dienste nur über HTTPS erreichbar (NPM + Let’s Encrypt)
- VPN für sicheren Fernzugriff
- Regelmäßige VM-Backups auf Synology DS923+

-----

## 📈 Monitoring

Grafana-Dashboard überwacht:

- CPU, RAM, Disk-Auslastung aller VMs und Container
- Netzwerkdurchsatz und -latenz
- Verfügbarkeit aller Dienste (Uptime)
- Speicherbelegung der Synology
- UniFi Netzwerkmetriken

-----

## 📚 Learnings & nächste Schritte

- [x] Enterprise-Netzwerk mit UniFi aufgebaut (UDM SE, Switch, 6 APs)
- [x] Proxmox Virtualisierungsplattform eingerichtet
- [x] Selbstgehostete Cloud (Nextcloud + Collabora) betrieben
- [x] Monitoring mit Grafana/InfluxDB etabliert
- [x] Externer Zugriff mit SSL und Reverse Proxy abgesichert
- [x] NAS mit Backup-Strategie konfiguriert
- [ ] Automatisierung mit Ansible
- [ ] Kubernetes/k3s ausprobieren
- [x] Offsite-Backup einrichten

-----

## 📬 Kontakt

**Michael Glorius**  
