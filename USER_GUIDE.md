# AgriSnapp User Guide

AgriSnapp is a food security tool that empowers farmers and agricultural stakeholders to monitor crop health, detect diseases early, and make data-driven decisions in the field. This guide covers the app's target users, core features, and intended use cases.

---

## Target Users

AgriSnapp is designed for four primary user roles:

**Smallholder Farmers**
Farmers who need accessible, low barrier tools for monitoring their crops. AgriSnapp allows them to snap a photo of a crop and receive an instant health assessment without requiring agronomic expertise or internet connectivity for core features.

**Agricultural Extension Workers**
Field agents conducting assessments across multiple farms. AgriSnapp supports efficient data collection and provides standardised disease identification, helping extension workers deliver consistent recommendations at scale.

**Agricultural Students**
Students learning to identify crop diseases in real world conditions. AgriSnapp serves as a practical learning tool, providing instant feedback on disease identification during fieldwork.

**Food Security Researchers**
Researchers collecting field data on crop health trends. AgriSnapp's structured data outputs and community map features support aggregated analysis of disease prevalence and spread.

---

## Core Features

### 1. Crop Disease Detection
Users can photograph a crop using their device camera. The image is analysed using a machine learning model to identify signs of disease, returning a diagnosis and confidence score. This is the primary feature of AgriSnapp.

> **Current status:** UI prototype complete. ML integration via Roboflow API is implemented in `roboflow_service.dart`; pending migration to TensorFlow Lite for open-source compliance.

### 2. Health Monitoring
Users can track the condition of their crops over time by logging repeated assessments. This allows farmers and extension workers to observe whether a condition is improving or worsening across visits.

> **Current status:** Planned feature. Data persistence via `shared_preferences` is implemented; longitudinal tracking UI is in development.

### 3. Actionable Recommendations
Following a disease detection result, the app surfaces contextual recommendations: such as treatment options or preventive measures, based on the identified condition.


### 4. Community Map
A shared map screen allows users to view anonymised disease reports from other farmers in their region, enabling early warning of spreading conditions.

> **Current status:** UI prototype complete. Powered by `community_map_screen.dart`; pending migration from Google Maps SDK to `flutter_map` (OpenStreetMap) for open-source compliance.

### 5. Offline Support
Core features — including image capture and local storage of assessments; are designed to function without an internet connection, making AgriSnapp suitable for use in low-connectivity rural environments.

> **Current status:** Partial. Local storage via `shared_preferences` is implemented. Full offline ML inference is planned via TensorFlow Lite migration.

### 6. Multilingual Support
The app includes a translation layer (`translation_service.dart`) to support multiple languages, ensuring accessibility for non-English speaking farming communities.

> **Current status:** Translation service implemented; language coverage is being expanded.

### 7. Badge System
A gamification layer rewards users for consistent crop monitoring activity, encouraging regular engagement and data collection.

> **Current status:** Prototype implemented in `badge_system.dart`.

---

## How to Use AgriSnapp

1. **Open the app** on your Android or iOS device.
2. **Navigate to the Snap screen** and tap the camera button to photograph a crop showing signs of disease or stress.
3. **Review the diagnosis** — the app returns an identified condition and confidence score.
4. **Read the recommendations** for treatment or next steps based on the diagnosis.
5. **View the community map** to see if similar conditions have been reported nearby.
6. **Track progress** by logging follow-up assessments of the same crop over time.

---

## Getting Started (Developers & Contributors)

For technical setup, installation instructions, and contribution guidelines, see:
- [`README.md`](../README.md) — project overview, prerequisites, and quick-start commands
- [`CONTRIBUTING.md`](../CONTRIBUTING.md) — environment configuration, platform-specific setup, and PR process

---

## About

AgriSnapp was developed by the Google Developer Student Club at LUISS Guido Carli University and is the winner of the UN's Reboot the Earth Hackathon. It is part of the Reboot Accelerator in collaboration with Salesforce.

**Built by:** Yasemin Ates, Giulio Presaghi, Alayna Shariff, Quynh Anh Tran, Rebecca Raible

**License:** Apache 2.0 — see [`LICENSE`](../LICENSE)
