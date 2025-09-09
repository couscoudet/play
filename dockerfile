FROM n8nio/n8n:latest

# Installer Playwright et ses navigateurs
RUN npm install -g playwright@latest \
    && npx playwright install --with-deps
