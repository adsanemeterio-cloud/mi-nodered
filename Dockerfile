FROM nodered/node-red:latest

# Activamos la seguridad inyectando la configuración en el arranque
USER root
RUN sed -i '/adminAuth:/,/},\n/s/\/\/ \?//' /usr/src/node-red/node_modules/node-red/settings.js \
    && sed -i "s/username: \"admin\"/username: \"admin\"/" /usr/src/node-red/node_modules/node-red/settings.js \
    && sed -i 's|password: "\$2a\$08\$zZWtXTja0fB1pzD4sHCMyOCMYz2Z6dNbM6tl8sJogENOMcxWV9DN."|password: "$2a$12$h2TNJdtwH05DVPVdLK9mJeW7m2BhgxAoRlEdUSukvwwnoUkWsRMSG"|' /usr/src/node-red/node_modules/node-red/settings.js

USER node
