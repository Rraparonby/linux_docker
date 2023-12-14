#!/bin/bash

#----------------------------------- VARIABLES ---------------------------

opcion_laravel=0
linea_laravel=""

new_name_image_laravel="me_colegio_laravel:0.1";
#message_laravel="Hola nuevo container" 

share_code_host_laravel="/02_code/"   # ${PWD}${share_host_laravel}
share_code_container_laravel="/var/www/html/"

share_host_laravel="/03_sharing/"   # ${PWD}${share_host_laravel}
share_container_laravel="/home/sharing/"

name_container_laravel="me_colegio_laravel_c01"
#id_container_laravel="daddb910e6cf"

#id_image_laravel="d93c8e1f7e02" 

config_host_laravel="localhost"
config_port_laravel="3000"
port_container_laravel="80"


#------- Usuario en Container SO -----------
user_name_laravel="bydan_lnmn"     # root, node, bydan_lnmn
user_uid_laravel=1000   # id -u $USER, root = 0, bydan_lnmn=1000
user_guid_laravel=1000  # id -g $USER, root = 0, bydan_lnmn=1000

# CORRER COMANDOS
base_path_laravel="./02_colegio_laravel"

#----------------------------------- FUNCIONES ---------------------------

get_menu_opciones_laravel() {
    clear
    echo
    #echo ${PWD}
    echo -e "\t\t\t------- HOST PC: DOCKER FILE LARAVEL ------"
    echo -e "\n\t(1-11-12-3-13-51-52) / (1-2-3-13-51-52) / (21-23) / (3-4)"

    echo -e "\n\t--- COMANDOS LARAVEL ---\n"

	echo -e "\t1. Build-Construir Imagen (docker build)"
    echo -e "\t-----------------------------------------"
    echo -e "\t2. Ejecutar Container Laravel Colegio DEFECTO (docker run)"
    echo -e "\t3. Ejecutar Container Laravel Colegio INTERACTIVO-Consola (docker run)"
    echo -e "\t4. Ejecutar Container Laravel Colegio PARAMETRO (docker run)"

    echo -e "\n\t--- SERVICIO LARAVEL ---\n"

    echo -e "\t11. Crear Container Laravel Colegio (docker create)"
    echo -e "\t12. Iniciar Container Laravel Colegio (docker start)"
    echo -e "\t13. Detener Container Laravel Colegio (docker stop)"

    get_menu_opciones_network

    echo -e "\n\t--- ELIMINAR LARAVEL ---\n"

    echo -e "\t51.- Eliminar Contenedor Laravel Colegio "
    echo -e "\t52.- Eliminar Imagen Laravel Colegio "
    echo -e "\t53.- Verificar Eliminacion Imagen/Contenedor Laravel Colegio "

    #echo -e "\n\tAYUDA"
    #echo -e "\t\t81. Ayuda Cd-ROM 1(Log,Eject)"

    echo -e "\n\t0. Salir\n\n"
    
    read -p "Escoja una Opcion: " opcion_laravel

    #echo -e "\t\tEscoja una Opcion: "    
    #read opcion_laravel
}

#---------------------------------------- COMANDOS ------------------------------------

exec_build_image_laravel() {
	clear
	
    echo -e "----------- 1. Build-Construir Imagen (docker build) -------------"
    echo
    
    # docker commit
    # --no-cache 
    # --no-cache=true --force-rm

    docker build . \
                --file Dockerfile \
                --tag ${new_name_image_laravel}
    
    #docker image prune -f

    # --no-cache => (NO VALE) No Genera Imagenes Incompletas/Intermedias ???
    # --tag = Name and Tag
}  

exec_run_laravel() {
	clear
	
    echo -e "----------- 4. CORRER Comando Container LARAVEL GENERAL Colegio PARAMETRO (docker run -it) -------------"
    echo
    
    # -d (Detach)
    # -u ${user_uid_laravel}:${user_guid_laravel} \
    # -u ${user_name_laravel} \

    comando1=""
    read -p "Ingrese Comando (bash,ls): " comando1

    docker run  -it --rm \
                --name ${name_container_laravel} \
                -u ${user_name_laravel} \
                -p ${config_port_laravel}:${port_container_laravel} \
                --network ${network_name} \
                -v ${PWD}${share_code_host_laravel}:${share_code_container_laravel} \
                -v ${PWD}${share_host_laravel}:${share_container_laravel} \
                ${new_name_image_laravel} ${comando1}

    # --rm = Cuando exit en Contenedor ==> Stop y Delete Contenedor
    # -d = Atado a la Consola o no (Al Servicio ejecutado), Attached/Dettached
    # -p ${config_port_laravel}:${port_container_laravel} \
    # -u ${user_uid_laravel}:${user_guid_laravel} \                
}

exec_run_console_laravel() {
	clear
	
    echo -e "----------- 3. Ejecutar Container Laravel Colegio INTERACTIVO-Consola (docker run) -------------"
    echo
    
    #3.- Correr Imagen --> (Contenedor)
    # -u ${user_uid_laravel}:${user_guid_laravel} \

    docker exec -it ${name_container_laravel} \
                bash

    #docker run -it --rm \         
}

exec_run_parametro_laravel() {
	clear
	
    echo -e "----------- 4. Ejecutar Container Laravel Colegio PARAMETRO (docker run) -------------"
    echo
    
    parametro1=""
    read -p "Ingrese Comando (bash,ls,id, ip addr show): " parametro1

    docker exec -it ${name_container_laravel} \
                ${parametro1}
                
    #3.- Correr Imagen --> (Contenedor)
    # -u ${user_uid_laravel}:${user_guid_laravel} \

    #docker run -it --rm \              
}

#---------------------------------------- SERVICIO ------------------------------------

exec_create_container_laravel() {
	clear
	
    echo -e "----------- 11. Crear Container Laravel Colegio (docker create) -------------"
    echo

    # -u ${user_uid_laravel}:${user_guid_laravel} \
    # -u ${user_name_laravel} \
    # --rm \
    docker create   --name ${name_container_laravel} \
                    -u ${user_name_laravel} \
                    -p ${config_port_laravel}:${port_container_laravel} \
                    --network ${network_name} \
                    -v ${PWD}${share_code_host_laravel}:${share_code_container_laravel} \
                    -v ${PWD}${share_host_laravel}:${share_container_laravel} \
                    ${new_name_image_laravel}
    
    echo -e "\n\nServicio Creado..... \n\n"

    # --rm = Se elimina Container cuando se detiene o docker stop
    # -u ${user_uid_laravel}:${user_guid_laravel} \
}

exec_start_container_laravel() {
	clear
	
    echo -e "----------- 12. Iniciar Container Laravel Colegio (docker start) -------------"
    echo    

    docker start ${name_container_laravel}

    echo -e "\n\nServicio Iniciado..... \n\n"
}

exec_logs_container_laravel() {
	clear
	
    echo -e "----------- 13.000. Mostrar LOGs Container Node (docker logs) -------------"
    echo    

    xfce4-terminal -e "docker logs --follow ${name_container_laravel}"
}

exec_history_imagen_laravel() {
	#clear	
    echo -e "----------- 54. Mostrar HISTORY Imagen Laravel (docker history) -------------"
    echo    

    docker history ${new_name_image_laravel}
}

exec_stop_container_laravel() {
	clear
	
    echo -e "----------- 13. Detener Container Laravel Colegio (docker stop) -------------"
    echo    

    docker stop ${name_container_laravel}

    echo -e "\n\nServicio Detenido..... \n\n"
}

#---------------------------------------- VER / ELIMINAR ------------------------------------

exec_eliminar_container_laravel() {
	clear	
    echo -e "----------- 51.- Eliminar Contenedor Laravel Colegio -------------"
    echo
    
    id_container2=""
    read -p "Ingrese Sufijo Id Container: " id_container2

    docker stop ${name_container_laravel}${id_container2}
    docker rm ${name_container_laravel}${id_container2}

    echo -e "Contenedor Eliminado..... "
}

exec_eliminar_image_laravel() {
	clear	
    echo -e "----------- 52.- Eliminar Imagen Laravel Colegio -------------"
    echo
    
    id_image2=""
    read -p "Ingrese Sufijo Id Image: " id_image2

    docker rmi -f ${new_name_image_laravel}${id_image2}

    echo -e "Imagen Eliminada..... "
}