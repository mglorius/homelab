# homelab
# 🏠 Homelab Dokumentation

> Persönliche Infrastruktur – betrieben, konfiguriert und gewartet von [Dein Name]

-----

## 📋 Übersicht

Dieses Repository dokumentiert mein privates Homelab. Ziel ist es, reale IT-Infrastruktur
selbst zu betreiben, zu verstehen und kontinuierlich zu verbessern.

-----

## 🖥️ Hardware

|Gerät          |Typ                             |Zweck                       |
|---------------|--------------------------------|----------------------------|
|Homelab-Server |[z.B. Intel NUC / eigener Build]|Virtualisierung (Proxmox)   |
|Synology DS923+|NAS                             |Storage, Backup, Dateiablage|
|[Router/Switch]|[z.B. Fritzbox / Unifi]         |Netzwerk                    |

-----

## 🏗️ Architektur

```
Internet
    │
    ▼
[Router/Firewall]
    │
    ├──▶ Proxmox Host
    │        ├── VM: Nextcloud
    │        ├── VM: Grafana + InfluxDB
    │        └── LXC: Nginx Proxy Manager
    │
    └──▶ Synology DS923+
             ├── Backups
             └── Dateiablage
```

> 💡 Tipp: Ersetze dies durch einen Screenshot aus draw.io oder einem handgezeichneten Scan

-----

## 🛠️ Dienste & Software

### Virtualisierung

**Proxmox VE**

- Betrieb mehrerer VMs und LXC-Container auf einem Host
- Snapshot- und Backup-Verwaltung
- Ressourcen-Monitoring

### Storage

**Synology DS923+**

- Zentraler Netzwerkspeicher (NAS)
- Backup-Ziel für VMs und Endgeräte
- RAID-Konfiguration für Datensicherheit

### Dienste

**Nextcloud**

- Selbstgehostete Cloud-Lösung (Alternative zu Google Drive / OneDrive)
- Betrieben in einer Proxmox-VM unter Linux
- Zugriff von extern über Nginx Proxy Manager mit SSL

**Nginx Proxy Manager (NPM)**

- Reverse Proxy für alle internen Dienste
- SSL-Zertifikate via Let’s Encrypt (automatische Erneuerung)
- Absicherung der externen Erreichbarkeit

**InfluxDB + Grafana**

- Monitoring-Stack für System- und Netzwerkmetriken
- Zeitreihendaten aus allen Diensten gesammelt in InfluxDB
- Visualisierung und Alerting über Grafana-Dashboards

-----

## 🔧 Gelöste Probleme (Beispiele)

### Problem: SSL-Zertifikat lief ab

**Situation:** Nextcloud war extern nicht mehr erreichbar, Browser zeigte Zertifikatsfehler  
**Lösung:** Let’s Encrypt-Erneuerung über NPM manuell angestoßen, danach Automatisierung konfiguriert  
**Gelernt:** Monitoring-Alert auf Zertifikatslaufzeit eingerichtet in Grafana

-----

### Problem: [Dein nächstes Problem hier eintragen]

**Situation:**  
**Lösung:**  
**Gelernt:**

-----

## 📈 Monitoring

Grafana-Dashboard überwacht:

- CPU, RAM, Disk-Auslastung aller VMs
- Netzwerkdurchsatz
- Verfügbarkeit aller Dienste (Uptime)
- Speicherbelegung der Synology

-----

## 🔒 Sicherheit

- Alle Dienste nur über HTTPS erreichbar (NPM + Let’s Encrypt)
- SSH-Zugang nur per Key-Authentifizierung
- Regelmäßige Backups auf Synology
- VMs isoliert in separaten Netzwerksegmenten

-----

## 📚 Learnings & nächste Schritte

- [x] Proxmox aufgesetzt und VMs konfiguriert
- [x] Monitoring mit Grafana/InfluxDB etabliert
- [x] Externer Zugriff mit SSL abgesichert
- [ ] Kubernetes/k3s ausprobieren
- [ ] Automatisierung mit Ansible
- [ ] Offsite-Backup einrichten

-----

## 📬 Kontakt

**[Dein Name]**  
[LinkedIn-Profil einfügen]  
[E-Mail optional]