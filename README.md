# AgriSnapp!

View live demo here: https://drive.google.com/drive/u/0/folders/1uddo-WkmDnb-xfVXIR3-bJIFQRAuumD8

This project is the winner of the **Reboot the Earth Rome Hackathon**, and is part of the **Reboot Accelerator** in collaboration with **Salesforce**. The new and improved AgriSnapp will be presented here shortly!

API keys have been replaced with a placeholder, .gitignore not yet optimized.

A food security MVP leveraging computer vision and machine learning to empower farmers and agricultural stakeholders with intelligent crop monitoring and disease detection capabilities.

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
[![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)](https://python.org)


## Overview


AgriSnapp addresses critical food security challenges by providing farmers with accessible, mobile-first technology for:
- Real-time crop health assessment
- Disease detection and identification
- Actionable agricultural insights
- Data-driven decision making


Developed by the Google Developer Student Club at LUISS Guido Carli University.


## Features


### Core Capabilities
- **Image Recognition**: Snap photos of crops to analyze health status
- **Disease Detection**: ML-powered identification of common crop diseases
- **Health Monitoring**: Track crop conditions over time
- **Recommendations**: Receive actionable insights based on analysis
- **Offline Support**: Core features available without internet connectivity


### Target Use Cases
- Smallholder farmers seeking accessible diagnostic tools
- Agricultural extension workers conducting field assessments
- Agricultural students learning crop disease identification
- Food security researchers collecting field data


## Tech Stack


### Frontend
- **Framework**: Flutter 3.x
- **Language**: Dart


### Backend & ML
- **Computer Vision / ML**: Roboflow integration


### Development Tools
- **Version Control**: Git
- **CI/CD**: GitHub Actions




## Getting Started


### Prerequisites
```bash
# Flutter SDK (3.0+)
flutter --version


# Dart SDK (included with Flutter)
dart --version


# Python (3.8+) for ML model training
python --version


# Git
git --version
```


### Installation


1. **Clone the repository**
```bash
git clone https://github.com/Google-Developers-Club-Guido-Carli/AgriSnapp.git
cd AgriSnapp
```


2. **Install Flutter dependencies**
```bash
flutter pub get
```




5. **Run the app**
```bash
flutter run
```


### Quick Start Commands


```bash
# Run in debug mode
flutter run


# Build for Android
flutter build apk


# Build for iOS
flutter build ios


# Analyze code
flutter analyze
```


## Project Structure


```
AgriSnapp/
├── android/                      # Android-specific code
├── ios/                          # iOS-specific code
├── linux/                        # Linux desktop support
├── macos/                        # macOS desktop support
├── windows/                      # Windows desktop support
├── web/                          # Web support
│
├── lib/
│ 	├── main.dart # App entry point
│ 	├── ai_insights.dart # AI insights logic / UI
│ 	├── badge_system.dart # Gamification & badges
│ 	├── community_map_screen.dart # Community map screen
│ 	├── privacy_manager.dart # Privacy handling
│ 	├── roboflow_service.dart # Roboflow API integration
│ 	├── translation_service.dart # Translation logic
│ 	└── translated_text.dart # Translated text widget/helper
│
├── test/                         # Unit & widget tests
├── node_modules/                 # Node dependencies (web-related)
│


```


## ML Model Pipeline


1. **Data Collection**: Curated dataset of crop images with disease labels
2. **Preprocessing**: Image augmentation, normalization, resizing
3. **Training**: Transfer learning on pre-trained architectures
4.  **API Integration**: Developed a Flutter service layer to transmit image buffers to the Roboflow Inference API via secure POST requests.


## Configuration


### API Keys & Secrets
Create a `.env` file in the project root:


```env
# API Configuration
API_BASE_URL=https://your-api-endpoint.com
API_KEY=your_api_key_here


# Roboflow Configuration (if using)
ROBOFLOW_API_KEY=your_roboflow_key
ROBOFLOW_WORKSPACE=your_workspace
ROBOFLOW_PROJECT=your_project


# Firebase Configuration (if using)
FIREBASE_API_KEY=your_firebase_key
```









## Contributing


We welcome contributions from the LUISS community and beyond!


1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request


### Code Style Guidelines
- Follow [Effective Dart](https://dart.dev/guides/language/effective-dart) conventions
- Use meaningful variable and function names
- Add comments for complex logic
- Write tests for new features
- Keep functions small and focused


## License


This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.


## Acknowledgments


- **Google Developer Student Club** at LUISS Guido Carli University
- Open-source crop disease datasets
- Flutter and Dart communities
- Agricultural domain experts who provided guidance


---


Built with ❤️ by GDSC LUISS Guido Carli

