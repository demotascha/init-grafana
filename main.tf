terraform {
    required_providers {
        grafana = {
            source  = "grafana/grafana"
            version = "1.24.0"
        }
    }
}

provider "grafana" {
    url   = "http://prometheus-grafana.telemetry"
    auth  = "admin:gcp"
}

resource "grafana_dashboard" "FluentBit" {
    config_json = file("./dashboards/fluent-bit.json")
    folder      = "General"
}

resource "grafana_dashboard" "SpringBootObservability" {
    config_json = file("./dashboards/spring-boot-observability.json")
    folder      = "General"
}
