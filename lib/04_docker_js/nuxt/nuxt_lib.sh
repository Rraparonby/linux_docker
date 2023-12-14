#!/bin/bash

#----------------------------------- VARIABLES ---------------------------

opcion_nuxt=0
linea_nuxt=""

docker_file="Dockerfile"        # "Dockerfile", "Dockerfile_Prod"
new_name_image_nuxt="me_lebeauty_nuxt:0.1"  # "me_lebeauty_nuxt:0.1", "me_lebeauty_nuxt_prod:0.1"
#message_nuxt="Hola nuevo container" 

share_code_host_nuxt="/02_code/"   # ${PWD}${share_host_nuxt}
share_code_container_nuxt="/home/me_apps/"
share_code_container_nuxt_modules="/home/me_apps/lebeauty_nuxt/node_modules/"

share_host_nuxt="/03_sharing/"   # ${PWD}${share_host_nuxt}
share_container_nuxt="/home/sharing/"

name_container_nuxt="me_lebeauty_nuxt_c01"
#id_container_nuxt="daddb910e6cf"

#id_image_nuxt="d93c8e1f7e02" 

config_host_nuxt="localhost"
config_port_nuxt="3006"      #"3000", "5173"
port_container_nuxt="3006"   #"3000", "5173"


#------- Usuario en Container SO -----------
user_name_nuxt="bydan_lnmn"
user_uid_nuxt=1001   # id -u $USER, node=1000, bydan_lnmn=1001, root=0
user_guid_nuxt=1001  # id -g $USER, node=1000, bydan_lnmn=1001, root=0

# BUILD IMAGES
base_path_nuxt="./01_lebeauty_nuxt"

#----------------------------------- FUNCIONES ---------------------------

get_menu_opciones_nuxt() {
    clear
    echo
    #echo ${PWD}
    echo -e "\t\t\t------- HOST PC: DOCKER FILE NUXT ------"
    echo -e "\n\t(1-11-12-3-13-51-52) / (1-2-3-13-51-52) / (21-23) / (3-4)"

    echo -e "\n\t--- COMANDOS NUXT ---\n"

	echo -e "\t1. Build-Construir Imagen (docker build)"
    echo -e "\t-----------------------------------------"
    echo -e "\t2. Ejecutar Container Nuxt Colegio DEFECTO (docker run)"
    echo -e "\t3. Ejecutar Container Nuxt Colegio INTERACTIVO-Consola (docker run)"
    echo -e "\t4. Ejecutar Container Nuxt Colegio PARAMETRO (docker run)"

    echo -e "\n\t--- SERVICIO NUXT ---\n"

    echo -e "\t11. Crear Container Nuxt Colegio (docker create)"
    echo -e "\t12. Iniciar Container Nuxt Colegio (docker start)"
    echo -e "\t13. Detener Container Nuxt Colegio (docker stop)"

    get_menu_opciones_network

    echo -e "\n\t--- ELIMINAR NUXT ---\n"

    echo -e "\t51.- Eliminar Contenedor Nuxt Colegio "
    echo -e "\t52.- Eliminar Imagen Nuxt Colegio "
    echo -e "\t53.- Verificar Eliminacion Imagen/Contenedor Nuxt Colegio "

    #echo -e "\n\tAYUDA"
    #echo -e "\t\t81. Ayuda Cd-ROM 1(Log,Eject)"

    echo -e "\n\t0. Salir\n\n"
    
    read -p "Escoja una Opcion: " opcion_nuxt

    #echo -e "\t\tEscoja una Opcion: "    
    #read opcion_nuxt
}

#---------------------------------------- COMANDOS ------------------------------------

exec_build_image_nuxt() {
	clear	
    echo -e "----------- 1. Build-Construir Imagen (docker build) -------------"
    echo
    
    # docker commit
    # --no-cache 
    # --no-cache=true --force-rm

    docker build . \
                --file ${docker_file} \
                --tag ${new_name_image_nuxt}
    
    #docker image prune -f
    # --no-cache => (NO VALE) No Genera Imagenes Incompletas/Intermedias ???
    # --tag = Name and Tag
}  

exec_run_nuxt() {
	clear	
    echo -e "----------- 4. CORRER Comando Container APACHE GENERAL Colegio PARAMETRO (docker run -it) -------------"
    echo
    
    # -d (Detach)
    # -u ${user_uid_nuxt}:${user_guid_nuxt} \
    # -u ${user_name_nuxt} \
    # --network ${network_name} \

    comando1=""
    read -p "Ingrese Comando (bash,ls): " comando1
    
    docker run  -it --rm \
                --name ${name_container_nuxt} \
                -u ${user_name_nuxt} \
                -p ${config_port_nuxt}:${port_container_nuxt} \
                -v ${PWD}${share_code_host_nuxt}:${share_code_container_nuxt} \
                -v ${share_code_container_nuxt_modules} \
                -v ${PWD}${share_host_nuxt}:${share_container_nuxt} \
                ${new_name_image_nuxt} ${comando1}

    # --rm = Cuando exit en Contenedor ==> Stop y Delete Contenedor
    # -d = Atado a la Consola o no (Al Servicio ejecutado), Attached/Dettached
    # -p ${config_port_nuxt}:${port_container_nuxt} \
    # -u ${user_uid_nuxt}:${user_guid_nuxt} \                
}

exec_run_console_nuxt() {
	clear	
    echo -e "----------- 3. Ejecutar Container Nuxt Colegio INTERACTIVO-Consola (docker run) -------------"
    echo
    
    #3.- Correr Imagen --> (Contenedor)
    # -u ${user_uid_nuxt}:${user_guid_nuxt} \

    docker exec -it ${name_container_nuxt} \
                bash

    #docker run -it --rm \         
}

exec_run_parametro_nuxt() {
	clear	
    echo -e "----------- 4. Ejecutar Container Nuxt Colegio PARAMETRO (docker run) -------------"
    echo
    
    parametro1=""
    read -p "Ingrese Comando (ls,id, ip addr show): " parametro1

    docker exec -it ${name_container_nuxt} \
                ${parametro1}
                
    #3.- Correr Imagen --> (Contenedor)
    # -u ${user_uid_nuxt}:${user_guid_nuxt} \
    #docker run -it --rm \              
}

#---------------------------------------- SERVICIO ------------------------------------

exec_create_container_nuxt() {
	clear	
    echo -e "----------- 11. Crear Container Nuxt Colegio (docker create) -------------"
    echo

    # -u ${user_uid_nuxt}:${user_guid_nuxt} \
    # -u ${user_name_nuxt} \
    # --rm \
    # --network ${network_name} \

    docker create   --name ${name_container_nuxt} \
                    -u ${user_name_nuxt} \
                    -p ${config_port_nuxt}:${port_container_nuxt} \
                    -v ${PWD}${share_code_host_nuxt}:${share_code_container_nuxt} \
                    -v ${share_code_container_nuxt_modules} \
                    -v ${PWD}${share_host_nuxt}:${share_container_nuxt} \
                    ${new_name_image_nuxt}
    
    echo -e "\n\nServicio Creado..... \n\n"

    # --rm = Se elimina Container cuando se detiene o docker stop
    # -u ${user_uid_nuxt}:${user_guid_nuxt} \
}

exec_start_container_nuxt() {
	clear	
    echo -e "----------- 12. Iniciar Container Nuxt Colegio (docker start) -------------"
    echo    

    docker start ${name_container_nuxt}

    echo -e "\n\nServicio Iniciado..... \n\n"
}

exec_logs_container_nuxt() {
	clear	
    echo -e "----------- 13.000. Mostrar LOGs Container Nuxt (docker logs) -------------"
    echo    

    xfce4-terminal -e "docker logs --follow ${name_container_nuxt}"
}

exec_history_imagen_nuxt() {
	#clear	
    echo -e "----------- 54. Mostrar HISTORY Imagen Nuxt (docker history) -------------"
    echo    

    docker history ${new_name_image_nuxt}
}

exec_stop_container_nuxt() {
	clear
    echo -e "----------- 13. Detener Container Nuxt Colegio (docker stop) -------------"
    echo    

    docker stop ${name_container_nuxt}

    echo -e "\n\nServicio Detenido..... \n\n"
}

#---------------------------------------- VER / ELIMINAR ------------------------------------

exec_eliminar_container_nuxt() {
	clear	
    echo -e "----------- 51.- Eliminar Contenedor Nuxt Colegio -------------"
    echo
    
    id_container2=""
    read -p "Ingrese Sufijo Id Container: " id_container2

    docker stop ${name_container_nuxt}${id_container2}
    
    docker rm --volumes ${name_container_nuxt}${id_container2}

    echo -e "Contenedor Eliminado..... "
}

exec_eliminar_image_nuxt() {
	clear	
    echo -e "----------- 52.- Eliminar Imagen Nuxt Colegio -------------"
    echo
    
    id_image2=""
    read -p "Ingrese Sufijo Id Image: " id_image2

    docker rmi -f ${new_name_image_nuxt}${id_image2}

    echo -e "Imagen Eliminada..... "
}