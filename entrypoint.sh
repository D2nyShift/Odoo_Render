#!/bin/bash

# Initialisation de la base si vide
odoo --db_host=$DB_HOST --db_port=$DB_PORT --db_user=$DB_USER --db_password=$DB_PASSWORD --database=$ODOO_DB -i base --stop-after-init

# Création de l'admin si absent
odoo shell --db_host=$DB_HOST --db_port=$DB_PORT --db_user=$DB_USER --db_password=$DB_PASSWORD --database=$ODOO_DB <<EOF
from odoo import api, SUPERUSER_ID
env = api.Environment(cr, SUPERUSER_ID, {})
if not env['res.users'].search([('login', '=', '$ODOO_ADMIN_LOGIN')]):
    env['res.users'].create({
        'name': 'Administrator',
        'login': '$ODOO_ADMIN_LOGIN',
        'email': '$ODOO_ADMIN_EMAIL',
        'password': '$ODOO_ADMIN_PASSWORD',
    })
EOF

# Lancement normal
exec odoo --db_host=$DB_HOST --db_port=$DB_PORT --db_user=$DB_USER --db_password=$DB_PASSWORD --database=$ODOO_DB