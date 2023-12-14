#!/bin/bash

network_name="network_colegio"

#---------------------------------------- NETWORKING ------------------------------------

get_menu_opciones_network() {
    echo -e "\n\t--- NETWORKING ---\n"
    echo -e "\t21. Crear Red Bridge Networking (docker network create)"
    echo -e "\t22. Verificar Red Bridge Networking (docker network ls)"
    echo -e "\t23. Eliminar Red Bridge Networking (docker network rm)"
}

exec_create_network() {
	clear
	
    echo -e "----------- 21. Crear Red Bridge MariaDB (docker network create) -------------"
    echo    

    docker network create --driver bridge ${network_name}
}

exec_verificar_network() {
	clear
	
    echo -e "----------- 22. Verificar Red Bridge MariaDB (docker network ls) -------------"
    echo    

    docker network ls

    #docker network inspect ${network_name}
}

exec_eliminar_network() {
	clear
	
    echo -e "----------- 23. Eliminar Red Bridge MariaDB (docker network rm) -------------"
    echo    

    docker network rm ${network_name}
}