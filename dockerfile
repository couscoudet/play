FROM n8nio/n8n:latest

# Switch to root user for global installations
USER root

# Installer Playwright et ses navigateurs
RUN npm install -g playwright@latest \
    && npx playwright install --with-deps
