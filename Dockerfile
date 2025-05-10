FROM odoo:18

# Spécifie la commande de démarrage avec les variables d'env
CMD ["odoo",
     "--db_host=${DB_HOST}",
     "--db_port=${DB_PORT}",
     "--db_user=${DB_USER}",
     "--db_password=${DB_PASSWORD}"]