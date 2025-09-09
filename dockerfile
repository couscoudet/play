FROM n8nio/n8n:latest

# Switch to root to perform privileged operations
USER root

# Check current user and create npm global directory
RUN whoami \
    && mkdir -p /home/node/.npm-global \
    && chown -R node:node /home/node/.npm-global || chown -R $(whoami):$(whoami) /home/node/.npm-global \
    && npm config set prefix '/home/node/.npm-global'

# Add npm global bin to PATH
ENV PATH="/home/node/.npm-global/bin:$PATH"

# Switch back to the appropriate user
USER node

# Install Playwright and its browsers
RUN npm install -g playwright@latest \
    && npx playwright install --with-deps