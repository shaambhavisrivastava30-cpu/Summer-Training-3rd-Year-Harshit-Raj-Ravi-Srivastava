# 🏥 Smart Healthcare AI Platform

A complete, production-ready healthcare AI platform that works **100% offline** — no API keys, no cloud services, no internet required.

## Features

- 🔐 **Authentication** — Secure login/registration with bcrypt password hashing
- 📊 **Dashboard** — Health statistics, charts, and prediction history
- 🔬 **Disease Prediction** — ML models for Diabetes, Heart Disease, Kidney, Liver, and Breast Cancer
- 🩺 **Health Tools** — BMI, Calorie, Water Intake, Blood Pressure, Heart Rate calculators
- 💬 **AI Chatbot** — Offline rule-based healthcare chatbot
- 📋 **Medical Reports** — Upload PDF/images, extract text, generate summaries
- 💊 **Medicine Reminder** — Track medications and schedules
- 📅 **Appointments** — Book and manage doctor appointments
- 🚨 **Emergency** — Emergency contacts, hospital database, first-aid instructions

## Tech Stack

- Python 3.11
- Streamlit
- SQLite
- Scikit-learn
- Pandas / NumPy
- Plotly / Matplotlib
- bcrypt

## Quick Start

```bash
cd healthcare-platform
pip install -r requirements.txt
streamlit run app.py
```

## Architecture

- `app.py` — Main entry point with authentication
- `pages/` — Streamlit multi-page app pages
- `database/` — SQLite database manager
- `models/` — ML model training and prediction
- `utils/` — Authentication, helpers, styles

## Security

- All passwords hashed with bcrypt
- SQL injection protected via parameterised queries
- Session-based authentication
- Input validation on all forms
- Secure file upload handling

## Offline Usage

This app runs completely offline. All data is stored locally in `healthcare.db` (SQLite). ML models are trained locally using synthetic/sample data and saved to `models/trained/`.
