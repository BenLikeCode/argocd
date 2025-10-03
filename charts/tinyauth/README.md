générer un mot de passe d e32 caractère:
openssl rand -base64 32 | tr -dc 'a-zA-Z0-9' | head -c 32 && echo
ajouter au secret

se connecter au pod pour créer le user/password:
./tinyauth user create --interactive