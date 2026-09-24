FROM nodered/node-red:latest

USER root

# Modificamos el archivo settings nativo para activar el login SOLO en el editor
RUN sed -i '/adminAuth:/,/},\n/s/\/\/ \?//' /usr/src/node-red/node_modules/node-red/settings.js \
    && sed -i 's/username: "admin"/username: "admin"/' /usr/src/node-red/node_modules/node-red/settings.js \
    && sed -i 's|password: "\$2a\$08\$zZWtXTja0fB1pzD4sHCMyOCMYz2Z6dNbM6tl8sJogENOMcxWV9DN."|password: "$2a$08$WTo7Zg3exYwYubD67W177OX8N6FAn6g7K9mX1Yf9N2gV3Cg7X8Y2q"|' /usr/src/node-red/node_modules/node-red/settings.js

USER node

