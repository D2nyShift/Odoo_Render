FROM odoo:18

# Copie le template à un endroit persistant
COPY odoo.conf.template /etc/odoo/odoo.conf.template

# Génère le vrai odoo.conf à partir des variables Render puis démarre Odoo
CMD bash -c "envsubst < /etc/odoo/odoo.conf.template > /etc/odoo/odoo.conf && exec odoo"