FROM odoo:18

COPY entrypoint.sh /usr/bin/entrypoint.sh

CMD /usr/bin/entrypoint.sh