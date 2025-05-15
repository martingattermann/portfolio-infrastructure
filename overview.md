# Terraform & Ansible - Key Facts

## Terraform

### Was ist Terraform?

* Infrastructure as Code (IaC) Tool von HashiCorp
* Ermöglicht deklaratives Management von Infrastruktur
* Multi-Cloud Support: AWS, Azure, GCP, u.v.m.
* Zustandsbasiert: Verfolgt Infrastrukturzustand mit einer `terraform.tfstate` Datei
* Open Source Alternative: **OpenTofu** (Fork von Terraform nach Lizenzänderung durch HashiCorp)

### Vorteile

* Wiederholbarkeit und Versionierung von Infrastruktur
* Automatisierung und Reduzierung menschlicher Fehler
* Einfache Integration in CI/CD-Pipelines

### Basic Commands

```bash
terraform init     # Initialisiert das Terraform-Projekt
terraform plan     # Zeigt geplante Änderungen
terraform apply    # Wendet die Infrastrukturveränderungen an
terraform destroy  # Löscht die verwaltete Infrastruktur
```

### Struktur eines Terraform-Projekts

* `main.tf`: Hauptkonfiguration
* `variables.tf`: Definition von Variablen
* `terraform.tfvars`: Werte für Variablen
* `outputs.tf`: Ausgabevariablen

---

## Ansible

### Was ist Ansible?

* Konfigurationsmanagement- und Automatisierungstool
* Agentenlos (nutzt SSH)
* Playbook-basiert (YAML)
* Von Red Hat entwickelt

### Vorteile

* Einfache Syntax (YAML)
* Schneller Einstieg, besonders geeignet für kleinere bis mittlere Umgebungen
* Wiederholbare und idempotente Tasks

### Grundkonzepte

* **Inventory**: Liste der Hosts (z. B. `hosts.ini`)
* **Playbook**: YAML-Datei mit Tasks
* **Module**: Vorgefertigte Funktionen (z. B. `apt`, `copy`, `service`)
* **Roles**: Strukturierung großerer Projekte

### Beispiel-Befehle

```bash
ansible -i hosts.ini all -m ping                   # Ping an alle Hosts
ansible-playbook -i hosts.ini playbook.yml         # Playbook ausführen
```

### Beispiel eines einfachen Playbooks

```yaml
- name: Installiere Apache auf Webservern
  hosts: webserver
  become: yes
  tasks:
    - name: Apache installieren
      apt:
        name: apache2
        state: present
```

---

## Vergleich Terraform vs. Ansible

| Merkmal    | Terraform                     | Ansible                  |
| ---------- | ----------------------------- | ------------------------ |
| Fokus      | Provisionierung               | Konfigurationsmanagement |
| Sprache    | HashiCorp Configuration Lang. | YAML                     |
| Agentenlos | Ja                            | Ja                       |
| Idempotenz | Ja (durch State-Datei)        | Ja                       |
| Ziel       | Infrastruktur erstellen       | Systeme konfigurieren    |

---