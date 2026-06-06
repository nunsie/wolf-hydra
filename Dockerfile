FROM ghcr.io/games-on-whales/base-app:edge

# RUN apt-get update && apt-get install -y --no-install-recommends \
#     curl \
#     && rm -rf /var/lib/apt/lists/*

# Install hydralauncher from pre-built deb
RUN curl -fSL "https://github.com/hydralauncher/hydra/releases/download/v3.9.9/hydralauncher_3.9.9_amd64.deb" \
    -o /tmp/hydralauncher.deb \
    && apt install /tmp/hydralauncher.deb \
    && rm /tmp/hydralauncher.deb

# Install as GOW startup hook
COPY startup-app.sh /opt/gow/startup-app.sh
RUN chmod +x /opt/gow/startup-app.sh && chmod +x /opt/gow/startup.sh
