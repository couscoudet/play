FROM n8nio/n8n:latest

# Switch to root to perform privileged operations
USER root

# Fix npm permissions for global installs
RUN mkdir -p /home/node/.npm-global \
    && chown -R node:node /home/node/.npm-global

# Switch to node user
USER node

# Configure npm prefix for the node user and install Playwright
RUN npm config set prefix '/home/node/.npm-global' \
    && export PATH="/home/node/.npm-global/bin:$PATH" \
    && npm install -g playwright@latest \
    && /home/node/.npm-global/bin/npx playwright install --with-deps

# Add npm global bin to PATH for runtime
ENV PATH="/home/node/.npm-global/bin:$PATH"