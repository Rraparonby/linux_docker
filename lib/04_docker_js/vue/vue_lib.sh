#!/bin/bash

#----------------------------------- VARIABLES ---------------------------

opcion_vue=0
linea_vue=""

new_name_image_vue="me_colegio_vue:0.1";
#message_vue="Hola nuevo container" 

share_code_host_vue="/02_code/"   # ${PWD}${share_host_vue}
share_code_container_vue="/home/me_apps/"
share_code_container_vue_modules="/home/me_apps/colegio_vue/node_modules/"

share_host_vue="/03_sharing/"   # ${PWD}${share_host_vue}
share_container_vue="/home/sharing/"

name_container_vue="me_colegio_vue_c01"
#id_container_vue="daddb910e6cf"

#id_image_vue="d93c8e1f7e02" 

config_host_vue="localhost"
config_port_vue="3006"      #"3000", "5173"
port_container_vue="3006"   #"3000", "5173"


#------- Usuario en Container SO -----------
user_name_vue="bydan_lnmn"     # root, node, bydan_lnmn
user_uid_vue=1001   # id -u $USER, root=0, node=1000, bydan_lnmn=1001
user_guid_vue=1001  # id -g $USER, root=0, node=1000, bydan_lnmn=1001

# BUILD IMAGES
base_path_vue="./03_colegio_vue"

#----------------------------------- FUNCIONES ---------------------------

get_menu_opciones_vue() {
    clear
    echo
    #echo ${PWD}
    echo -e "\t\t\t------- HOST PC: DOCKER FILE VUE ------"
    echo -e "\n\t(1-11-12-3-13-51-52) / (1-2-3-13-51-52) / (21-23) / (3-4)"

    echo -e "\n\t--- COMANDOS VUE ---\n"

	echo -e "\t1. Build-Construir Imagen (docker build)"
    echo -e "\t-----------------------------------------"
    echo -e "\t2. Ejecutar Container Vue Colegio DEFECTO (docker run)"
    echo -e "\t3. Ejecutar Container Vue Colegio INTERACTIVO-Consola (docker run)"
    echo -e "\t4. Ejecutar Container Vue Colegio PARAMETRO (docker run)"

    echo -e "\n\t--- SERVICIO VUE ---\n"

    echo -e "\t11. Crear Container Vue Colegio (docker create)"
    echo -e "\t12. Iniciar Container Vue Colegio (docker start)"
    echo -e "\t13. Detener Container Vue Colegio (docker stop)"

    get_menu_opciones_network

    echo -e "\n\t--- ELIMINAR VUE ---\n"

    echo -e "\t51.- Eliminar Contenedor Vue Colegio "
    echo -e "\t52.- Eliminar Imagen Vue Colegio "
    echo -e "\t53.- Verificar Eliminacion Imagen/Contenedor Vue Colegio "

    #echo -e "\n\tAYUDA"
    #echo -e "\t\t81. Ayuda Cd-ROM 1(Log,Eject)"

    echo -e "\n\t0. Salir\n\n"
    
    read -p "Escoja una Opcion: " opcion_vue

    #echo -e "\t\tEscoja una Opcion: "    
    #read opcion_vue
}

#---------------------------------------- COMANDOS ------------------------------------

exec_build_image_vue() {
	clear
	
    echo -e "----------- 1. Build-Construir Imagen (docker build) -------------"
    echo
    
    # docker commit
    # --no-cache 
    # --no-cache=true --force-rm

    docker build . \
                --file Dockerfile \
                --tag ${new_name_image_vue}
    
    #docker image prune -f

    # --no-cache => (NO VALE) No Genera Imagenes Incompletas/Intermedias ???
    # --tag = Name and Tag
}  

exec_run_vue() {
	clear
	
    echo -e "----------- 4. CORRER Comando Container APACHE GENERAL Colegio PARAMETRO (docker run -it) -------------"
    echo
    
    # -d (Detach)
    # -u ${user_uid_vue}:${user_guid_vue} \
    # -u ${user_name_vue} \

    comando1=""
    read -p "Ingrese Comando (bash,ls): " comando1

    docker run  -it --rm \
                --name ${name_container_vue} \
                -u ${user_name_vue} \
                -p ${config_port_vue}:${port_container_vue} \
                --network ${network_name} \
                -v ${PWD}${share_code_host_vue}:${share_code_container_vue} \
                -v ${share_code_container_vue_modules} \
                -v ${PWD}${share_host_vue}:${share_container_vue} \
                ${new_name_image_vue} ${comando1}

    # --rm = Cuando exit en Contenedor ==> Stop y Delete Contenedor
    # -d = Atado a la Consola o no (Al Servicio ejecutado), Attached/Dettached
    # -p ${config_port_vue}:${port_container_vue} \
    # -u ${user_uid_vue}:${user_guid_vue} \                
}

exec_run_console_vue() {
	clear
	
    echo -e "----------- 3. Ejecutar Container Vue Colegio INTERACTIVO-Consola (docker run) -------------"
    echo
    
    #3.- Correr Imagen --> (Contenedor)
    # -u ${user_uid_vue}:${user_guid_vue} \

    docker exec -it ${name_container_vue} \
                bash

    #docker run -it --rm \         
}

exec_run_parametro_vue() {
	clear
	
    echo -e "----------- 4. Ejecutar Container Vue Colegio PARAMETRO (docker run) -------------"
    echo
    
    parametro1=""
    read -p "Ingrese Comando (ls,id, ip addr show): " parametro1

    docker exec -it ${name_container_vue} \
                ${parametro1}
                
    #3.- Correr Imagen --> (Contenedor)
    # -u ${user_uid_vue}:${user_guid_vue} \

    #docker run -it --rm \              
}

#---------------------------------------- SERVICIO ------------------------------------

exec_create_container_vue() {
	clear
	
    echo -e "----------- 11. Crear Container Vue Colegio (docker create) -------------"
    echo

    # -u ${user_uid_vue}:${user_guid_vue} \
    # -u ${user_name_vue} \
    # --rm \
    docker create   --name ${name_container_vue} \
                    -u ${user_name_vue} \
                    -p ${config_port_vue}:${port_container_vue} \
                    --network ${network_name} \
                    -v ${PWD}${share_code_host_vue}:${share_code_container_vue} \
                    -v ${share_code_container_vue_modules} \
                    -v ${PWD}${share_host_vue}:${share_container_vue} \
                    ${new_name_image_vue}
    
    echo -e "\n\nServicio Creado..... \n\n"

    # --rm = Se elimina Container cuando se detiene o docker stop
    # -u ${user_uid_vue}:${user_guid_vue} \
}

exec_start_container_vue() {
	clear
	
    echo -e "----------- 12. Iniciar Container Vue Colegio (docker start) -------------"
    echo    

    docker start ${name_container_vue}

    echo -e "\n\nServicio Iniciado..... \n\n"
}

exec_logs_container_vue() {
	clear
	
    echo -e "----------- 13.000. Mostrar LOGs Container Vue (docker logs) -------------"
    echo    

    xfce4-terminal -e "docker logs --follow ${name_container_vue}"
}

exec_history_imagen_vue() {
	#clear	
    echo -e "----------- 54. Mostrar HISTORY Imagen Vue (docker history) -------------"
    echo    

    docker history ${new_name_image_vue}
}

exec_stop_container_vue() {
	clear
	
    echo -e "----------- 13. Detener Container Vue Colegio (docker stop) -------------"
    echo    

    docker stop ${name_container_vue}

    echo -e "\n\nServicio Detenido..... \n\n"
}

#---------------------------------------- VER / ELIMINAR ------------------------------------

exec_eliminar_container_vue() {
	clear	
    echo -e "----------- 51.- Eliminar Contenedor Vue Colegio -------------"
    echo
    
    id_container2=""
    read -p "Ingrese Sufijo Id Container: " id_container2

    docker stop ${name_container_vue}${id_container2}
    docker rm --volumes ${name_container_vue}${id_container2}

    echo -e "Contenedor Eliminado..... "
}

exec_eliminar_image_vue() {
	clear	
    echo -e "----------- 52.- Eliminar Imagen Vue Colegio -------------"
    echo
    
    id_image2=""
    read -p "Ingrese Sufijo Id Image: " id_image2

    docker rmi -f ${new_name_image_vue}${id_image2}

    echo -e "Imagen Eliminada..... "
}