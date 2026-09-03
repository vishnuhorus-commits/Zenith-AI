# Deploy instructions for Zenith-AI

Required env vars:
- GROQ_API_KEY
- GOOGLE_API_KEY

Render quick deploy:
- Build Command: pip install -r requirements.txt
- Start Command: gunicorn app:app --chdir Backend --bind 0.0.0.0:$PORT --workers 2
- Set the two environment variables in Render settings.

Docker quick run:
- Build: docker build -t zenith-ai .
- Run: docker run -p 5000:5000 -e GROQ_API_KEY=... -e GOOGLE_API_KEY=... zenith-ai
