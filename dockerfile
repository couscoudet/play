FROM n8nio/n8n:latest

# Fix npm permissions for global installs
RUN mkdir -p /home/node/.npm-global \
    && chown -R node:node /home/node/.npm-global \
    && npm config set prefix '/home/node/.npm-global'

# Add npm global bin to PATH
ENV PATH="/home/node/.npm-global/bin:$PATH"

USER node

# Install Playwright and its browsers
RUN npm install -g playwright@latest \
    && npx playwright install --with-deps