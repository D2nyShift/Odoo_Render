FROM odoo:18

COPY odoo.conf.template /tmp/odoo.conf.template

CMD bash -c "envsubst < /tmp/odoo.conf.template > /etc/odoo/odoo.conf && odoo"