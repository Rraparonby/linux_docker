#!/bin/bash

#----------------------------------- VARIABLES ---------------------------

opcion_codeigniter=0
linea_codeigniter=""

new_name_image_codeigniter="me_portafolio_codeigniter:0.1";
#message_codeigniter="Hola nuevo container" 

share_code_host_codeigniter="/02_code/"   # ${PWD}${share_host_codeigniter}
share_code_container_codeigniter="/var/www/html/"

share_host_codeigniter="/03_sharing/"   # ${PWD}${share_host_codeigniter}
share_container_codeigniter="/home/sharing/"

name_container_codeigniter="me_portafolio_codeigniter_c01"
#id_container_codeigniter="daddb910e6cf"

#id_image_codeigniter="d93c8e1f7e02" 

config_host_codeigniter="localhost"
config_port_codeigniter="3000"
port_container_codeigniter="80"


#------- Usuario en Container SO -----------
user_name_codeigniter="bydan_lnmn"     # root, node, bydan_lnmn
user_uid_codeigniter=1000   # id -u $USER, root = 0, bydan_lnmn=1000
user_guid_codeigniter=1000  # id -g $USER, root = 0, bydan_lnmn=1000

# CORRER COMANDOS
base_path_codeigniter="./02_portafolio_codeigniter"

#----------------------------------- FUNCIONES ---------------------------

get_menu_opciones_codeigniter() {
    clear
    echo
    #echo ${PWD}
    echo -e "\t\t\t------- HOST PC: DOCKER FILE CODEIGNITER ------"
    echo -e "\n\t(1-11-12-3-13-51-52) / (1-2-3-13-51-52) / (21-23) / (3-4)"

    echo -e "\n\t--- COMANDOS CODEIGNITER ---\n"

	echo -e "\t1. Build-Construir Imagen (docker build)"
    echo -e "\t-----------------------------------------"
    echo -e "\t2. Ejecutar Container Codeigniter Colegio DEFECTO (docker run)"
    echo -e "\t3. Ejecutar Container Codeigniter Colegio INTERACTIVO-Consola (docker run)"
    echo -e "\t4. Ejecutar Container Codeigniter Colegio PARAMETRO (docker run)"

    echo -e "\n\t--- SERVICIO CODEIGNITER ---\n"

    echo -e "\t11. Crear Container Codeigniter Colegio (docker create)"
    echo -e "\t12. Iniciar Container Codeigniter Colegio (docker start)"
    echo -e "\t13. Detener Container Codeigniter Colegio (docker stop)"

    get_menu_opciones_network

    echo -e "\n\t--- ELIMINAR CODEIGNITER ---\n"

    echo -e "\t51.- Eliminar Contenedor Codeigniter Colegio "
    echo -e "\t52.- Eliminar Imagen Codeigniter Colegio "
    echo -e "\t53.- Verificar Eliminacion Imagen/Contenedor Codeigniter Colegio "

    #echo -e "\n\tAYUDA"
    #echo -e "\t\t81. Ayuda Cd-ROM 1(Log,Eject)"

    echo -e "\n\t0. Salir\n\n"
    
    read -p "Escoja una Opcion: " opcion_codeigniter

    #echo -e "\t\tEscoja una Opcion: "    
    #read opcion_codeigniter
}

#---------------------------------------- COMANDOS ------------------------------------

exec_build_image_codeigniter() {
	clear
	
    echo -e "----------- 1. Build-Construir Imagen (docker build) -------------"
    echo
    
    # docker commit
    # --no-cache 
    # --no-cache=true --force-rm

    docker build . \
                --file Dockerfile \
                --tag ${new_name_image_codeigniter}
    
    #docker image prune -f

    # --no-cache => (NO VALE) No Genera Imagenes Incompletas/Intermedias ???
    # --tag = Name and Tag
}  

exec_run_codeigniter() {
	clear
	
    echo -e "----------- 4. CORRER Comando Container CODEIGNITER GENERAL Colegio PARAMETRO (docker run -it) -------------"
    echo
    
    # -d (Detach)
    # -u ${user_uid_codeigniter}:${user_guid_codeigniter} \
    # -u ${user_name_codeigniter} \

    comando1=""
    read -p "Ingrese Comando (bash,ls): " comando1

    docker run  -it --rm \
                --name ${name_container_codeigniter} \
                -u ${user_name_codeigniter} \
                -p ${config_port_codeigniter}:${port_container_codeigniter} \
                --network ${network_name} \
                -v ${PWD}${share_code_host_codeigniter}:${share_code_container_codeigniter} \
                -v ${PWD}${share_host_codeigniter}:${share_container_codeigniter} \
                ${new_name_image_codeigniter} ${comando1}

    # --rm = Cuando exit en Contenedor ==> Stop y Delete Contenedor
    # -d = Atado a la Consola o no (Al Servicio ejecutado), Attached/Dettached
    # -p ${config_port_codeigniter}:${port_container_codeigniter} \
    # -u ${user_uid_codeigniter}:${user_guid_codeigniter} \                
}

exec_run_console_codeigniter() {
	clear
	
    echo -e "----------- 3. Ejecutar Container Codeigniter Colegio INTERACTIVO-Consola (docker run) -------------"
    echo
    
    #3.- Correr Imagen --> (Contenedor)
    # -u ${user_uid_codeigniter}:${user_guid_codeigniter} \

    docker exec -it ${name_container_codeigniter} \
                bash

    #docker run -it --rm \         
}

exec_run_parametro_codeigniter() {
	clear
	
    echo -e "----------- 4. Ejecutar Container Codeigniter Colegio PARAMETRO (docker run) -------------"
    echo
    
    parametro1=""
    read -p "Ingrese Comando (bash,ls,id, ip addr show): " parametro1

    docker exec -it ${name_container_codeigniter} \
                ${parametro1}
                
    #3.- Correr Imagen --> (Contenedor)
    # -u ${user_uid_codeigniter}:${user_guid_codeigniter} \

    #docker run -it --rm \              
}

#---------------------------------------- SERVICIO ------------------------------------

exec_create_container_codeigniter() {
	clear
	
    echo -e "----------- 11. Crear Container Codeigniter Colegio (docker create) -------------"
    echo

    # -u ${user_uid_codeigniter}:${user_guid_codeigniter} \
    # -u ${user_name_codeigniter} \
    # --rm \
    docker create   --name ${name_container_codeigniter} \
                    -u ${user_name_codeigniter} \
                    -p ${config_port_codeigniter}:${port_container_codeigniter} \
                    --network ${network_name} \
                    -v ${PWD}${share_code_host_codeigniter}:${share_code_container_codeigniter} \
                    -v ${PWD}${share_host_codeigniter}:${share_container_codeigniter} \
                    ${new_name_image_codeigniter}
    
    echo -e "\n\nServicio Creado..... \n\n"

    # --rm = Se elimina Container cuando se detiene o docker stop
    # -u ${user_uid_codeigniter}:${user_guid_codeigniter} \
}

exec_start_container_codeigniter() {
	clear
	
    echo -e "----------- 12. Iniciar Container Codeigniter Colegio (docker start) -------------"
    echo    

    docker start ${name_container_codeigniter}

    echo -e "\n\nServicio Iniciado..... \n\n"
}

exec_logs_container_codeigniter() {
	clear
	
    echo -e "----------- 13.000. Mostrar LOGs Container Node (docker logs) -------------"
    echo    

    xfce4-terminal -e "docker logs --follow ${name_container_codeigniter}"
}

exec_history_imagen_codeigniter() {
	#clear	
    echo -e "----------- 54. Mostrar HISTORY Imagen Codeigniter (docker history) -------------"
    echo    

    docker history ${new_name_image_codeigniter}
}

exec_stop_container_codeigniter() {
	clear
	
    echo -e "----------- 13. Detener Container Codeigniter Colegio (docker stop) -------------"
    echo    

    docker stop ${name_container_codeigniter}

    echo -e "\n\nServicio Detenido..... \n\n"
}

#---------------------------------------- VER / ELIMINAR ------------------------------------

exec_eliminar_container_codeigniter() {
	clear	
    echo -e "----------- 51.- Eliminar Contenedor Codeigniter Colegio -------------"
    echo
    
    id_container2=""
    read -p "Ingrese Sufijo Id Container: " id_container2

    docker stop ${name_container_codeigniter}${id_container2}
    docker rm ${name_container_codeigniter}${id_container2}

    echo -e "Contenedor Eliminado..... "
}

exec_eliminar_image_codeigniter() {
	clear	
    echo -e "----------- 52.- Eliminar Imagen Codeigniter Colegio -------------"
    echo
    
    id_image2=""
    read -p "Ingrese Sufijo Id Image: " id_image2

    docker rmi -f ${new_name_image_codeigniter}${id_image2}

    echo -e "Imagen Eliminada..... "
}