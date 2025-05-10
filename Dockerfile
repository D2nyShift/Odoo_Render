FROM odoo:18

USER 0        # 0 = root dans toutes les images Linux

RUN apt-get update \
 && apt-get install -y --no-install-recommends gettext-base \
 && rm -rf /var/lib/apt/lists/*

USER odoo     # on revient à l’utilisateur applicatif

COPY odoo.conf.template /etc/odoo/odoo.conf.template

CMD bash -c 'envsubst < /etc/odoo/odoo.conf.template > /etc/odoo/odoo.conf && exec odoo'