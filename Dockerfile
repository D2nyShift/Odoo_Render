FROM odoo:18

USER root
RUN apt-get update \
 && apt-get install -y --no-install-recommends gettext-base \
 && rm -rf /var/lib/apt/lists/*

USER odoo
COPY odoo.conf.template /etc/odoo/odoo.conf.template

CMD bash -c 'envsubst < /etc/odoo/odoo.conf.template > /etc/odoo/odoo.conf && exec odoo'