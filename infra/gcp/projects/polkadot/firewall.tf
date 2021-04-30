resource "google_compute_firewall" "validator" {
  name          = "validator-firewall"
  network       = "default"

  allow {
    protocol    = "tcp"
    ports       = ["22"]
  }

  allow {
    protocol    = "tcp"
    ports       = ["30333"]
  }

  source_ranges = ["0.0.0.0/0"]

  target_tags   = ["validator"]
}

resource "google_compute_firewall" "border" {
  name          = "border-firewall"
  network       = "default"

  allow {
    protocol    = "tcp"
    ports       = ["22"]
  }

  allow {
    protocol    = "tcp"
    ports       = ["31300-31400"]
  }

  source_ranges = ["0.0.0.0/0"]

  target_tags   = ["border"]
}
