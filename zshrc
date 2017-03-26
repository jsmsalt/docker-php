function docker-php() {
    action=$1
    app=$2

	if [[ -z $action || -z $app ]]; then
		echo "Necesitas especificar los parametros"
	else
		if [ "up" = "$action" ]; then
			if [[ ! -a ~/Projects/$app/docker.yml ]]; then
				echo "La aplicación no tiene archivo dock.yml."
			else
				docker-compose -f ~/.docker-php/docker-compose.yml -f ~/Projects/$app/docker.yml up -d
			fi
		elif [ "down" = "$action" ]; then
			if [[ ! -a ~/Projects/$app/docker.yml ]]; then
				echo "La aplicación no tiene archivo dock.yml."
			else
				docker-compose -f ~/.docker-php/docker-compose.yml -f ~/Projects/$app/docker.yml stop
				docker-compose -f ~/.docker-php/docker-compose.yml -f ~/Projects/$app/docker.yml rm -v
			fi
		elif [ "remove" = "$action" ]; then
			if [ "images" = "$app" ]; then
				docker rmi $(docker images -q)
			elif [ "containers" = "$app" ]; then
				docker stop $(docker ps -a -q)
				docker rm $(docker ps -a -q) -f -v
				docker-compose -f ~/.docker-php/docker-compose.yml rm -v
			fi
		fi
	fi

}
