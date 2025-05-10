FROM odoo:18

USER root                                  # ← on passe root le temps d’APT
RUN apt-get update \
 && apt-get install -y --no-install-recommends gettext-base \
 && rm -rf /var/lib/apt/lists/*

USER odoo                                  # ← on redevient l’utilisateur sûr

# Copie le template dans un répertoire persistant
COPY odoo.conf.template /etc/odoo/odoo.conf.template

# Génère la conf avec les variables Render puis lance Odoo
CMD bash -c 'envsubst < /etc/odoo/odoo.conf.template > /etc/odoo/odoo.conf && exec odoo'