"""
Smart Healthcare AI Platform — Main Entry Point
Handles authentication (login / registration).
"""

import streamlit as st
import sys
import os

# Ensure modules resolve correctly when run from any directory
sys.path.insert(0, os.path.dirname(__file__))

from utils.auth import login_user, register_user, is_authenticated
from utils.helpers import load_css

st.set_page_config(
    page_title="HealthAI Platform",
    page_icon="🏥",
    layout="wide",
    initial_sidebar_state="expanded",
)

load_css()

# If already authenticated, redirect to dashboard
if is_authenticated():
    st.switch_page("pages/1_Dashboard.py")

# ── Page Header ──────────────────────────────────────────────────────────────
st.markdown("""
<div style="text-align:center; padding: 2rem 0 1rem 0;">
    <div style="font-size:4rem; margin-bottom:0.5rem;">🏥</div>
    <h1 style="font-size:2.5rem; font-weight:800; margin:0;
               background:linear-gradient(135deg,#0EA5E9,#10B981);
               -webkit-background-clip:text; -webkit-text-fill-color:transparent;
               background-clip:text;">
        Smart Healthcare AI
    </h1>
    <p style="color:#94A3B8; font-size:1.1rem; margin-top:0.5rem;">
        Your personal, offline, AI-powered health assistant
    </p>
</div>
""", unsafe_allow_html=True)

# ── Auth Tabs ────────────────────────────────────────────────────────────────
col1, col2, col3 = st.columns([1, 2, 1])
with col2:
    tab_login, tab_register = st.tabs(["🔑 Login", "📝 Register"])

    # ── Login Tab ──────────────────────────────────────────────────
    with tab_login:
        st.markdown('<div style="height:1rem"></div>', unsafe_allow_html=True)
        with st.form("login_form"):
            username = st.text_input("Username", placeholder="Enter your username")
            password = st.text_input("Password", type="password", placeholder="Enter your password")
            submitted = st.form_submit_button("Sign In", use_container_width=True)

        if submitted:
            if not username or not password:
                st.error("Please fill in all fields.")
            else:
                success, message, user = login_user(username, password)
                if success:
                    st.session_state["authenticated"] = True
                    st.session_state["user"] = user
                    st.success("✅ Login successful! Redirecting...")
                    st.rerun()
                else:
                    st.error(f"❌ {message}")

        st.markdown("""
        <div style="text-align:center; color:#64748B; font-size:0.85rem; margin-top:1rem;">
            🔒 Your data is stored locally. No internet connection required.
        </div>
        """, unsafe_allow_html=True)

    # ── Register Tab ───────────────────────────────────────────────
    with tab_register:
        st.markdown('<div style="height:1rem"></div>', unsafe_allow_html=True)
        with st.form("register_form"):
            r_fullname = st.text_input("Full Name", placeholder="John Doe")
            r_username = st.text_input("Username", placeholder="johndoe (letters, numbers, _)")
            r_email    = st.text_input("Email (optional)", placeholder="john@example.com")
            r_password = st.text_input("Password", type="password", placeholder="Min 8 chars, upper+lower+digit")
            r_confirm  = st.text_input("Confirm Password", type="password", placeholder="Re-enter password")
            r_submit   = st.form_submit_button("Create Account", use_container_width=True)

        if r_submit:
            if not r_username or not r_password or not r_confirm:
                st.error("Username and password are required.")
            elif r_password != r_confirm:
                st.error("Passwords do not match.")
            else:
                success, message = register_user(r_username, r_password, r_fullname or None, r_email or None)
                if success:
                    st.success("✅ Account created! Please log in.")
                else:
                    st.error(f"❌ {message}")

# ── Features Overview ─────────────────────────────────────────────────────────
st.markdown("<br>", unsafe_allow_html=True)
st.markdown("---")
st.markdown("### ✨ Platform Features", unsafe_allow_html=False)

features = [
    ("🔬", "Disease Prediction",  "ML models for Diabetes, Heart Disease, Kidney, Liver & Breast Cancer"),
    ("🩺", "Health Tools",        "BMI, Calorie, Water Intake, Blood Pressure & Heart Rate calculators"),
    ("💬", "AI Chatbot",          "Offline rule-based healthcare assistant — no internet needed"),
    ("📋", "Medical Reports",     "Upload & analyze PDF/image reports with offline text extraction"),
    ("💊", "Medicine Reminder",   "Track medications, dosages, and schedules"),
    ("📅", "Appointments",        "Book and manage doctor appointments"),
    ("🚨", "Emergency Module",    "Emergency contacts, hospital finder, and first-aid guide"),
    ("🔒", "100% Offline",        "All data stored locally in SQLite — no cloud, no API keys"),
]

cols = st.columns(4)
for i, (icon, title, desc) in enumerate(features):
    with cols[i % 4]:
        st.markdown(f"""
        <div class="glass-card" style="text-align:center; padding:1rem;">
            <div style="font-size:2rem">{icon}</div>
            <div style="font-weight:600; color:#E2E8F0; margin:0.5rem 0 0.3rem">{title}</div>
            <div style="font-size:0.78rem; color:#64748B">{desc}</div>
        </div>
        """, unsafe_allow_html=True)
