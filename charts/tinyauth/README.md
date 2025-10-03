générer un mot de passe d e32 caractère:
openssl rand -base64 32 | tr -dc 'a-zA-Z0-9' | head -c 32 && echo
l'encode en base64 et le mettre dans un secret