FROM n8nio/n8n:latest

USER root

# Create app directory and install Playwright locally
RUN mkdir -p /opt/playwright \
    && cd /opt/playwright \
    && npm init -y \
    && npm install playwright@latest \
    && npx playwright install --with-deps \
    && chown -R node:node /opt/playwright

# Add local playwright to PATH
ENV PATH="/opt/playwright/node_modules/.bin:$PATH"

USER node