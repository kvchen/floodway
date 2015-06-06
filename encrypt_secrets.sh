declare -a SECRETS=(
	"app/config/app.coffee"
	"app/config/database.coffee"
	"app/config/oauth.coffee"
)

tar cjf secrets.tar "${SECRETS[@]}"
travis encrypt-file secrets.tar --add
