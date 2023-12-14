#!/bin/bash

#----------------------------------- VARIABLES ---------------------------

opcion_nest=0
linea_nest=""

new_name_image_nest="me_colegio_nest:0.1";
#message_nest="Hola nuevo container" 

share_code_host_nest="/02_code/"   # ${PWD}${share_host_nest}
share_code_container_nest="/home/me_apps/"
share_code_container_nest_modules="/home/me_apps/colegio_nest/node_modules/"

share_host_nest="/03_sharing/"   # ${PWD}${share_host_nest}
share_container_nest="/home/sharing/"

name_container_nest="me_colegio_nest_c01"                     
#id_container_nest="daddb910e6cf"

#id_image_nest="d93c8e1f7e02" 

config_host_nest="localhost"
config_port_nest="3000"
port_container_nest="3000"


#------- Usuario en Container SO -----------
user_name_nest="bydan_lnmn"     # root, node, bydan_lnmn
user_uid_nest=0   # id -u $USER, root=0, node=1000, bydan_lnmn=1001
user_guid_nest=0  # id -g $USER, root=0, node=1000, bydan_lnmn=1001

# BUILD IMAGES
base_path_nest="./02_colegio_nest"

#----------------------------------- FUNCIONES ---------------------------

get_menu_opciones_nest() {
    clear
    echo
    #echo ${PWD}
    echo -e "\t\t\t------- HOST PC: DOCKER FILE NEST ------"
    echo -e "\n\t(1-11-12-3-13-51-52) / (1-2-3-13-51-52) / (21-23) / (3-4)"

    echo -e "\n\t--- COMANDOS NEST ---\n"

	echo -e "\t1. Build-Construir Imagen (docker build)"
    echo -e "\t-----------------------------------------"
    echo -e "\t2. Ejecutar Container Nest Colegio DEFECTO (docker run)"
    echo -e "\t3. Ejecutar Container Nest Colegio INTERACTIVO-Consola (docker run)"
    echo -e "\t4. Ejecutar Container Nest Colegio PARAMETRO (docker run)"

    echo -e "\n\t--- SERVICIO NEST ---\n"

    echo -e "\t11. Crear Container Nest Colegio (docker create)"
    echo -e "\t12. Iniciar Container Nest Colegio (docker start)"
    echo -e "\t13. Detener Container Nest Colegio (docker stop)"

    get_menu_opciones_network

    echo -e "\n\t--- ELIMINAR NEST ---\n"

    echo -e "\t51.- Eliminar Contenedor Nest Colegio "
    echo -e "\t52.- Eliminar Imagen Nest Colegio "
    echo -e "\t53.- Verificar Eliminacion Imagen/Contenedor Nest Colegio "

    #echo -e "\n\tAYUDA"
    #echo -e "\t\t81. Ayuda Cd-ROM 1(Log,Eject)"

    echo -e "\n\t0. Salir\n\n"
    
    read -p "Escoja una Opcion: " opcion_nest

    #echo -e "\t\tEscoja una Opcion: "    
    #read opcion_nest
}

#---------------------------------------- COMANDOS ------------------------------------

exec_build_image_nest() {
	clear
	
    echo -e "----------- 1. Build-Construir Imagen (docker build) -------------"
    echo
    
    # docker commit
    # --no-cache 
    # --no-cache=true --force-rm

    docker build . \
                --file Dockerfile \
                --tag ${new_name_image_nest}
    
    #docker image prune -f

    # --no-cache => (NO VALE) No Genera Imagenes Incompletas/Intermedias ???
    # --tag = Name and Tag
}  

exec_run_nest() {
	clear
	
    echo -e "----------- 4. CORRER Comando Container APACHE GENERAL Colegio PARAMETRO (docker run -it) -------------"
    echo
    
    # -d (Detach)
    # -u ${user_uid_nest}:${user_guid_nest} \
    # -u ${user_name_nest} \

    comando1=""
    read -p "Ingrese Comando (bash,ls): " comando1

    docker run  -it --rm \
                --name ${name_container_nest} \
                -u ${user_name_nest} \
                -p ${config_port_nest}:${port_container_nest} \
                --network ${network_name} \
                -v ${PWD}${share_code_host_nest}:${share_code_container_nest} \
                -v ${share_code_container_nest_modules} \
                -v ${PWD}${share_host_nest}:${share_container_nest} \
                ${new_name_image_nest} ${comando1}

    # --rm = Cuando exit en Contenedor ==> Stop y Delete Contenedor
    # -d = Atado a la Consola o no (Al Servicio ejecutado), Attached/Dettached
    # -p ${config_port_nest}:${port_container_nest} \
    # -u ${user_uid_nest}:${user_guid_nest} \                
}

exec_run_console_nest() {
	clear
	
    echo -e "----------- 3. Ejecutar Container Nest Colegio INTERACTIVO-Consola (docker run) -------------"
    echo
    
    #3.- Correr Imagen --> (Contenedor)
    # -u ${user_uid_nest}:${user_guid_nest} \

    docker exec -it ${name_container_nest} \
                bash

    #docker run -it --rm \         
}

exec_run_parametro_nest() {
	clear
	
    echo -e "----------- 4. Ejecutar Container Nest Colegio PARAMETRO (docker run) -------------"
    echo
    
    parametro1=""
    read -p "Ingrese Comando (ls,id, ip addr show): " parametro1

    docker exec -it ${name_container_nest} \
                ${parametro1}
                
    #3.- Correr Imagen --> (Contenedor)
    # -u ${user_uid_nest}:${user_guid_nest} \

    #docker run -it --rm \              
}

#---------------------------------------- SERVICIO ------------------------------------

exec_create_container_nest() {
	clear
	
    echo -e "----------- 11. Crear Container Nest Colegio (docker create) -------------"
    echo

    # -u ${user_uid_nest}:${user_guid_nest} \
    # -u ${user_name_nest} \
    # --rm \
    docker create   --name ${name_container_nest} \
                    -u ${user_name_nest} \
                    -p ${config_port_nest}:${port_container_nest} \
                    --network ${network_name} \
                    -v ${PWD}${share_code_host_nest}:${share_code_container_nest} \
                    -v ${share_code_container_nest_modules} \
                    -v ${PWD}${share_host_nest}:${share_container_nest} \
                    ${new_name_image_nest}
    
    echo -e "\n\nServicio Creado..... \n\n"

    # --rm = Se elimina Container cuando se detiene o docker stop
    # -u ${user_uid_nest}:${user_guid_nest} \
}

exec_start_container_nest() {
	clear
	
    echo -e "----------- 12. Iniciar Container Nest Colegio (docker start) -------------"
    echo    

    docker start ${name_container_nest}

    echo -e "\n\nServicio Iniciado..... \n\n"
}

exec_logs_container_nest() {
	clear
	
    echo -e "----------- 13.000. Mostrar LOGs Container Nest (docker logs) -------------"
    echo    

    xfce4-terminal -e "docker logs --follow ${name_container_nest}"
}

exec_history_imagen_nest() {
	#clear	
    echo -e "----------- 54. Mostrar HISTORY Imagen Nest (docker history) -------------"
    echo    

    docker history ${new_name_image_nest}
}

exec_stop_container_nest() {
	clear
	
    echo -e "----------- 13. Detener Container Nest Colegio (docker stop) -------------"
    echo    

    docker stop ${name_container_nest}

    echo -e "\n\nServicio Detenido..... \n\n"
}

#---------------------------------------- VER / ELIMINAR ------------------------------------

exec_eliminar_container_nest() {
	clear	
    echo -e "----------- 51.- Eliminar Contenedor Nest Colegio -------------"
    echo
    
    id_container2=""
    read -p "Ingrese Sufijo Id Container: " id_container2

    docker stop ${name_container_nest}${id_container2}
    docker rm --volumes ${name_container_nest}${id_container2}

    echo -e "Contenedor Eliminado..... "
}

exec_eliminar_image_nest() {
	clear	
    echo -e "----------- 52.- Eliminar Imagen Nest Colegio -------------"
    echo
    
    id_image2=""
    read -p "Ingrese Sufijo Id Image: " id_image2

    docker rmi -f ${new_name_image_nest}${id_image2}

    echo -e "Imagen Eliminada..... "
}