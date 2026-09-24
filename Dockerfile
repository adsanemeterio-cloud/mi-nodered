FROM nodered/node-red:latest

USER root
COPY settings.js /data/settings.js
USER node
