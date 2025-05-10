FROM odoo:18

# Installe envsubst (gettext-base)
RUN apt-get update && apt-get install -y --no-install-recommends gettext-base \
    && rm -rf /var/lib/apt/lists/*

# Copie le template dans une zone persistante
COPY odoo.conf.template /etc/odoo/odoo.conf.template

# Génère la conf à partir des variables Render puis lance Odoo
CMD bash -c "envsubst < /etc/odoo/odoo.conf.template > /etc/odoo/odoo.conf && exec odoo"