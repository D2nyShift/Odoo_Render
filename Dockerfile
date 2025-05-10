FROM odoo:18

COPY entrypoint.sh /entrypoint.sh

CMD ["bash", "/entrypoint.sh"]