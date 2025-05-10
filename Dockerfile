FROM odoo:18

# Initialisation de la base à la première exécution
CMD ["odoo", 
     "--db_host=${DB_HOST}", 
     "--db_port=${DB_PORT}", 
     "--db_user=${DB_USER}", 
     "--db_password=${DB_PASSWORD}",
     "--database=odoo_ready", 
     "-i", "base"]