#!/bin/bash

#----------------------------------- VARIABLES ---------------------------

opcion_spring=0
linea_spring=""

new_name_image_spring="me_colegio_spring:0.1";
#message_spring="Hola nuevo container" 

share_code_host_spring="/02_code/"   # ${PWD}${share_host_spring}
share_code_container_spring="/home/me_apps/"

share_host_spring="/03_sharing/"   # ${PWD}${share_host_spring}
share_container_spring="/home/sharing/"

name_container_spring="me_colegio_spring_c01"                     
#id_container_spring="daddb910e6cf"

#id_image_spring="d93c8e1f7e02" 

config_host_spring="localhost"
config_port_spring="3000"
port_container_spring="3000"


#------- Usuario en Container SO -----------
user_name_spring="root"     # root, node, bydan_lnmn --> (NO VALE bydan_lnmn, debe ser root)
user_uid_spring=0   # id -u $USER, root=0, gradle=1000, bydan_lnmn=1001
user_guid_spring=0  # id -g $USER, root=0, gradle=1000, bydan_lnmn=1001

# BUILD IMAGES
base_path_spring="./02_colegio_spring"

#----------------------------------- FUNCIONES ---------------------------

get_menu_opciones_spring() {
    clear
    echo
    #echo ${PWD}
    echo -e "\t\t\t------- HOST PC: DOCKER FILE SPRING ------"
    echo -e "\n\t(1-11-12-3-13-51-52) / (1-2-3-13-51-52) / (21-23) / (3-4)"

    echo -e "\n\t--- COMANDOS SPRING ---\n"

	echo -e "\t1. Build-Construir Imagen (docker build)"
    echo -e "\t-----------------------------------------"
    echo -e "\t2. Ejecutar Container Spring Colegio DEFECTO (docker run)"
    echo -e "\t3. Ejecutar Container Spring Colegio INTERACTIVO-Consola (docker run)"
    echo -e "\t4. Ejecutar Container Spring Colegio PARAMETRO (docker run)"

    echo -e "\n\t--- SERVICIO SPRING ---\n"

    echo -e "\t11. Crear Container Spring Colegio (docker create)"
    echo -e "\t12. Iniciar Container Spring Colegio (docker start)"
    echo -e "\t13. Detener Container Spring Colegio (docker stop)"

    get_menu_opciones_network

    echo -e "\n\t--- ELIMINAR SPRING ---\n"

    echo -e "\t51.- Eliminar Contenedor Spring Colegio "
    echo -e "\t52.- Eliminar Imagen Spring Colegio "
    echo -e "\t53.- Verificar Eliminacion Imagen/Contenedor Spring Colegio "

    #echo -e "\n\tAYUDA"
    #echo -e "\t\t81. Ayuda Cd-ROM 1(Log,Eject)"

    echo -e "\n\t0. Salir\n\n"
    
    read -p "Escoja una Opcion: " opcion_spring

    #echo -e "\t\tEscoja una Opcion: "    
    #read opcion_spring
}

#---------------------------------------- COMANDOS ------------------------------------

exec_build_image_spring() {
	clear
	
    echo -e "----------- 1. Build-Construir Imagen (docker build) -------------"
    echo
    
    # docker commit
    # --no-cache 
    # --no-cache=true --force-rm

    docker build . \
                --file Dockerfile \
                --tag ${new_name_image_spring}
    
    #docker image prune -f

    # --no-cache => (NO VALE) No Genera Imagenes Incompletas/Intermedias ???
    # --tag = Name and Tag
}  

exec_run_spring() {
	clear	
    echo -e "----------- 4. CORRER Comando Container APACHE GENERAL Colegio PARAMETRO (docker run -it) -------------"
    echo
    
    # -d (Detach)
    # -u ${user_uid_spring}:${user_guid_spring} \
    # -u ${user_name_spring} \
    
    echo -e "IMAGE = ${new_name_image_spring}"

    comando1=""
    read -p "Ingrese Comando (bash,ls): " comando1

    docker run  -it --rm \
                --name ${name_container_spring} \
                -u ${user_name_spring} \
                -p ${config_port_spring}:${port_container_spring} \
                --network ${network_name} \
                -v ${PWD}${share_code_host_spring}:${share_code_container_spring} \
                -v ${PWD}${share_host_spring}:${share_container_spring} \
                ${new_name_image_spring} ${comando1}

    # --rm = Cuando exit en Contenedor ==> Stop y Delete Contenedor
    # -d = Atado a la Consola o no (Al Servicio ejecutado), Attached/Dettached
    # -p ${config_port_spring}:${port_container_spring} \
    # -u ${user_uid_spring}:${user_guid_spring} \                
}

exec_run_console_spring() {
	clear
	
    echo -e "----------- 3. Ejecutar Container Spring Colegio INTERACTIVO-Consola (docker run) -------------"
    echo
    
    #3.- Correr Imagen --> (Contenedor)
    # -u ${user_uid_spring}:${user_guid_spring} \

    docker exec -it ${name_container_spring} \
                bash

    #docker run -it --rm \         
}

exec_run_parametro_spring() {
	clear
	
    echo -e "----------- 4. Ejecutar Container Spring Colegio PARAMETRO (docker run) -------------"
    echo
    
    parametro1=""
    read -p "Ingrese Comando (ls,id, ip addr show): " parametro1

    docker exec -it ${name_container_spring} \
                ${parametro1}
                
    #3.- Correr Imagen --> (Contenedor)
    # -u ${user_uid_spring}:${user_guid_spring} \

    #docker run -it --rm \              
}

#---------------------------------------- SERVICIO ------------------------------------

exec_create_container_spring() {
	clear
	
    echo -e "----------- 11. Crear Container Spring Colegio (docker create) -------------"
    echo

    # --rm \
    # -u ${user_uid_spring}:${user_guid_spring} \
    # -u ${user_name_spring} \    
    
    docker create   --name ${name_container_spring} \
                    -u ${user_name_spring} \
                    -p ${config_port_spring}:${port_container_spring} \
                    --network ${network_name} \
                    -v ${PWD}${share_code_host_spring}:${share_code_container_spring} \
                    -v ${PWD}${share_host_spring}:${share_container_spring} \
                    ${new_name_image_spring}
    
    echo -e "\n\nServicio Creado..... \n\n"

    # --rm = Se elimina Container cuando se detiene o docker stop
    # -u ${user_uid_spring}:${user_guid_spring} \
}

exec_start_container_spring() {
	clear
	
    echo -e "----------- 12. Iniciar Container Spring Colegio (docker start) -------------"
    echo    

    docker start ${name_container_spring}

    echo -e "\n\nServicio Iniciado..... \n\n"
}

exec_logs_container_spring() {
	clear
	
    echo -e "----------- 13.000. Mostrar LOGs Container Spring (docker logs) -------------"
    echo    

    xfce4-terminal -e "docker logs --follow ${name_container_spring}"
}

exec_history_imagen_spring() {
	#clear	
    echo -e "----------- 54. Mostrar HISTORY Imagen Spring (docker history) -------------"
    echo    

    docker history ${new_name_image_spring}
}

exec_stop_container_spring() {
	clear
	
    echo -e "----------- 13. Detener Container Spring Colegio (docker stop) -------------"
    echo    

    docker stop ${name_container_spring}

    echo -e "\n\nServicio Detenido..... \n\n"
}

#---------------------------------------- VER / ELIMINAR ------------------------------------

exec_eliminar_container_spring() {
	clear	
    echo -e "----------- 51.- Eliminar Contenedor Spring Colegio -------------"
    echo
    
    id_container2=""
    read -p "Ingrese Sufijo Id Container: " id_container2

    docker stop ${name_container_spring}${id_container2}
    docker rm --volumes ${name_container_spring}${id_container2}

    echo -e "Contenedor Eliminado..... "
}

exec_eliminar_image_spring() {
	clear	
    echo -e "----------- 52.- Eliminar Imagen Spring Colegio -------------"
    echo
    
    id_image2=""
    read -p "Ingrese Sufijo Id Image: " id_image2

    docker rmi -f ${new_name_image_spring}${id_image2}

    echo -e "Imagen Eliminada..... "
}