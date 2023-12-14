#!/bin/bash

#----------------------------------- VARIABLES ---------------------------

opcion_react=0
linea_react=""

new_name_image_react="me_colegio_react:0.1";
#message_react="Hola nuevo container" 

share_code_host_react="/02_code/"   # ${PWD}${share_host_react}
share_code_container_react="/home/me_apps/"
share_code_container_react_modules="/home/me_apps/colegio_react/node_modules/"

share_host_react="/03_sharing/"   # ${PWD}${share_host_react}
share_container_react="/home/sharing/"

name_container_react="me_colegio_react_c01"
#id_container_react="daddb910e6cf"

#id_image_react="d93c8e1f7e02" 

config_host_react="localhost"
config_port_react="3007"      #"3000", "5173"
port_container_react="3007"   #"3000", "5173"


#------- Usuario en Container SO -----------
user_name_react="bydan_lnmn"     # root, node, bydan_lnmn
user_uid_react=1001   # id -u $USER, root=0, node=1000, bydan_lnmn=1001
user_guid_react=1001  # id -g $USER, root=0, node=1000, bydan_lnmn=1001

# BUILD IMAGES
base_path_react="./03_colegio_react"

#----------------------------------- FUNCIONES ---------------------------

get_menu_opciones_react() {
    clear
    echo
    #echo ${PWD}
    echo -e "\t\t\t------- HOST PC: DOCKER FILE REACT ------"
    echo -e "\n\t(1-11-12-3-13-51-52) / (1-2-3-13-51-52) / (21-23) / (3-4)"

    echo -e "\n\t--- COMANDOS REACT ---\n"

	echo -e "\t1. Build-Construir Imagen (docker build)"
    echo -e "\t-----------------------------------------"
    echo -e "\t2. Ejecutar Container React Colegio DEFECTO (docker run)"
    echo -e "\t3. Ejecutar Container React Colegio INTERACTIVO-Consola (docker run)"
    echo -e "\t4. Ejecutar Container React Colegio PARAMETRO (docker run)"

    echo -e "\n\t--- SERVICIO REACT ---\n"

    echo -e "\t11. Crear Container React Colegio (docker create)"
    echo -e "\t12. Iniciar Container React Colegio (docker start)"
    echo -e "\t13. Detener Container React Colegio (docker stop)"

    get_menu_opciones_network

    echo -e "\n\t--- ELIMINAR REACT ---\n"

    echo -e "\t51.- Eliminar Contenedor React Colegio "
    echo -e "\t52.- Eliminar Imagen React Colegio "
    echo -e "\t53.- Verificar Eliminacion Imagen/Contenedor React Colegio "

    #echo -e "\n\tAYUDA"
    #echo -e "\t\t81. Ayuda Cd-ROM 1(Log,Eject)"

    echo -e "\n\t0. Salir\n\n"
    
    read -p "Escoja una Opcion: " opcion_react

    #echo -e "\t\tEscoja una Opcion: "    
    #read opcion_react
}

#---------------------------------------- COMANDOS ------------------------------------

exec_build_image_react() {
	clear
	
    echo -e "----------- 1. Build-Construir Imagen (docker build) -------------"
    echo
    
    # docker commit
    # --no-cache 
    # --no-cache=true --force-rm

    docker build . \
                --file Dockerfile \
                --tag ${new_name_image_react}
    
    #docker image prune -f

    # --no-cache => (NO VALE) No Genera Imagenes Incompletas/Intermedias ???
    # --tag = Name and Tag
}  

exec_run_react() {
	clear
	
    echo -e "----------- 4. CORRER Comando Container APACHE GENERAL Colegio PARAMETRO (docker run -it) -------------"
    echo
    
    # -d (Detach)
    # -u ${user_uid_react}:${user_guid_react} \
    # -u ${user_name_react} \

    comando1=""
    read -p "Ingrese Comando (bash,ls): " comando1

    docker run  -it --rm \
                --name ${name_container_react} \
                -u ${user_name_react} \
                -p ${config_port_react}:${port_container_react} \
                --network ${network_name} \
                -v ${PWD}${share_code_host_react}:${share_code_container_react} \
                -v ${share_code_container_react_modules} \
                -v ${PWD}${share_host_react}:${share_container_react} \
                ${new_name_image_react} ${comando1}

    # --rm = Cuando exit en Contenedor ==> Stop y Delete Contenedor
    # -d = Atado a la Consola o no (Al Servicio ejecutado), Attached/Dettached
    # -p ${config_port_react}:${port_container_react} \
    # -u ${user_uid_react}:${user_guid_react} \                
}

exec_run_console_react() {
	clear
	
    echo -e "----------- 3. Ejecutar Container React Colegio INTERACTIVO-Consola (docker run) -------------"
    echo
    
    #3.- Correr Imagen --> (Contenedor)
    # -u ${user_uid_react}:${user_guid_react} \

    docker exec -it ${name_container_react} \
                bash

    #docker run -it --rm \         
}

exec_run_parametro_react() {
	clear
	
    echo -e "----------- 4. Ejecutar Container React Colegio PARAMETRO (docker run) -------------"
    echo
    
    parametro1=""
    read -p "Ingrese Comando (ls,id, ip addr show): " parametro1

    docker exec -it ${name_container_react} \
                ${parametro1}
                
    #3.- Correr Imagen --> (Contenedor)
    # -u ${user_uid_react}:${user_guid_react} \

    #docker run -it --rm \              
}

#---------------------------------------- SERVICIO ------------------------------------

exec_create_container_react() {
	clear
	
    echo -e "----------- 11. Crear Container React Colegio (docker create) -------------"
    echo

    # --rm \
    # -u ${user_uid_react}:${user_guid_react} \
    # -u ${user_name_react} \
    
    docker create   --name ${name_container_react} \
                    -u ${user_name_react} \
                    -p ${config_port_react}:${port_container_react} \
                    --network ${network_name} \
                    -v ${PWD}${share_code_host_react}:${share_code_container_react} \
                    -v ${share_code_container_react_modules} \
                    -v ${PWD}${share_host_react}:${share_container_react} \
                    ${new_name_image_react}
    
    echo -e "\n\nServicio Creado..... \n\n"

    # --rm = Se elimina Container cuando se detiene o docker stop
    # -u ${user_uid_react}:${user_guid_react} \
}

exec_start_container_react() {
	clear
	
    echo -e "----------- 12. Iniciar Container React Colegio (docker start) -------------"
    echo    

    docker start ${name_container_react}

    echo -e "\n\nServicio Iniciado..... \n\n"
}

exec_logs_container_react() {
	clear
	
    echo -e "----------- 13.000. Mostrar LOGs Container React (docker logs) -------------"
    echo    

    xfce4-terminal -e "docker logs --follow ${name_container_react}"
}

exec_history_imagen_react() {
	#clear	
    echo -e "----------- 54. Mostrar HISTORY Imagen React (docker history) -------------"
    echo    

    docker history ${new_name_image_react}
}

exec_stop_container_react() {
	clear
	
    echo -e "----------- 13. Detener Container React Colegio (docker stop) -------------"
    echo    

    docker stop ${name_container_react}

    echo -e "\n\nServicio Detenido..... \n\n"
}

#---------------------------------------- VER / ELIMINAR ------------------------------------

exec_eliminar_container_react() {
	clear	
    echo -e "----------- 51.- Eliminar Contenedor React Colegio -------------"
    echo
    
    id_container2=""
    read -p "Ingrese Sufijo Id Container: " id_container2

    docker stop ${name_container_react}${id_container2}
    docker rm --volumes ${name_container_react}${id_container2}

    echo -e "Contenedor Eliminado..... "
}

exec_eliminar_image_react() {
	clear	
    echo -e "----------- 52.- Eliminar Imagen React Colegio -------------"
    echo
    
    id_image2=""
    read -p "Ingrese Sufijo Id Image: " id_image2

    docker rmi -f ${new_name_image_react}${id_image2}

    echo -e "Imagen Eliminada..... "
}