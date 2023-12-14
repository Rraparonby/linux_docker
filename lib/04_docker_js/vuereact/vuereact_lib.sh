#!/bin/bash

#----------------------------------- VARIABLES ---------------------------

opcion_vue_react=0
linea_vue_react=""

new_name_image_vue_react="me_portafolio_vue_react:0.1";
#message_vue_react="Hola nuevo container" 

share_code_host_vue_react="/02_code/"   # ${PWD}${share_host_vue_react}
share_code_container_vue_react="/home/me_apps/"

share_code_container_vue_modules="/home/me_apps/portafolio_vue/node_modules/"
share_code_container_react_modules2="/home/me_apps/contable_portafolio_react/node_modules/"

share_host_vue_react="/03_sharing/"   # ${PWD}${share_host_vue_react}
share_container_vue_react="/home/sharing/"

name_container_vue_react="me_portafolio_vue_react_c01"
#id_container_vue_react="daddb910e6cf"

#id_image_vue_react="d93c8e1f7e02" 

config_host_vue_react="localhost"

config_port_vue_react1="3006"      #"3000", "5173"
port_container_vue_react1="3006"   #"3000", "5173"

config_port_vue_react2="3007"      #"3000", "5173"
port_container_vue_react2="3007"   #"3000", "5173"

#------- Usuario en Container SO -----------
user_name_vue_react="bydan_lnmn" # bydan_lnmn, root, node
user_uid_vue_react=1001   # id -u $USER, node=1000, root=0, bydan_lnmn=1001
user_guid_vue_react=1001  # id -g $USER, node=1000, root=0, bydan_lnmn=1001

# BUILD IMAGES
base_path_vue_react="./03_portafolio_vue_react"

#----------------------------------- FUNCIONES ---------------------------

get_menu_opciones_vue_react() {
    clear
    echo
    #echo ${PWD}
    echo -e "\t\t\t------- HOST PC: DOCKER FILE VUE-REACT ------"
    echo -e "\n\t(1-11-12-3-13-51-52) / (1-2-3-13-51-52) / (21-23) / (3-4)"

    echo -e "\n\t--- COMANDOS VUE-REACT ---\n"

	echo -e "\t1. Build-Construir Imagen (docker build)"
    echo -e "\t-----------------------------------------"
    echo -e "\t2. Ejecutar Container Vue-React Colegio DEFECTO (docker run)"
    echo -e "\t3. Ejecutar Container Vue-React Colegio INTERACTIVO-Consola (docker run)"
    echo -e "\t4. Ejecutar Container Vue-React Colegio PARAMETRO (docker run)"

    echo -e "\n\t--- SERVICIO VUE-REACT ---\n"

    echo -e "\t11. Crear Container Vue-React Colegio (docker create)"
    echo -e "\t12. Iniciar Container Vue-React Colegio (docker start)"
    echo -e "\t13. Detener Container Vue-React Colegio (docker stop)"

    get_menu_opciones_network

    echo -e "\n\t--- ELIMINAR VUE-REACT ---\n"

    echo -e "\t51.- Eliminar Contenedor Vue-React Colegio "
    echo -e "\t52.- Eliminar Imagen Vue-React Colegio "
    echo -e "\t53.- Verificar Eliminacion Imagen/Contenedor Vue-React Colegio "

    #echo -e "\n\tAYUDA"
    #echo -e "\t\t81. Ayuda Cd-ROM 1(Log,Eject)"

    echo -e "\n\t0. Salir\n\n"
    
    read -p "Escoja una Opcion: " opcion_vue_react

    #echo -e "\t\tEscoja una Opcion: "    
    #read opcion_vue_react
}

#---------------------------------------- COMANDOS ------------------------------------

exec_build_image_vue_react() {
	clear	
    echo -e "----------- 1. Build-Construir Imagen (docker build) -------------"
    echo
    
    # docker commit
    # --no-cache 
    # --no-cache=true --force-rm

    docker build . \
                --file Dockerfile \
                --tag ${new_name_image_vue_react}
    
    #docker image prune -f
    # --no-cache => (NO VALE) No Genera Imagenes Incompletas/Intermedias ???
    # --tag = Name and Tag
}  

#exec_run_vuebash_vue_react() {
#    exec_run_vue_react_base "VUE_BASH"
#}

#exec_run_reactbash_vue_react() {
#    exec_run_vue_react_base "REACT_BASH"
#}

exec_run_bash_vue_react() {
    exec_run_vue_react_base "BASH"
}

exec_run_vue_react() {
    exec_run_vue_react_base "COMANDO"
}

exec_run_vue_react_base() {
	clear	
    echo -e "----------- 4. CORRER Comando Container APACHE GENERAL Colegio PARAMETRO (docker run -it) -------------"
    echo
    
    tipo=${1}        
    comando1=""
    working_dir="/home/me_apps/"

    # -d (Detach)
    # -u ${user_uid_vue_react}:${user_guid_vue_react} \
    # -u ${user_name_vue_react} \
    # --network ${network_name} \

    if [ ${tipo} = "COMANDO" ]
    then
	    read -p "Ingrese Comando (bash,ls): " comando1
    else    
        if [ ${tipo} = "BASH" ]
        then    
            comando1="bash"
        else
            if [ ${tipo} = "VUE_BASH" ]
            then
                echo -e "--- Deshabilitado ---"
                #working_dir="/home/me_apps/portafolio_vue/"
                #comando1="npm run start"
            else
                echo -e "--- Deshabilitado ---"
                #if [ ${tipo} = "REACT_BASH" ]
                #then
                #    working_dir="/home/me_apps/portafolio_react/"
                #    comando1="npm run start"
                #fi
            fi
        fi
    fi

    docker run  -it --rm \
                --name ${name_container_vue_react} \
                -u ${user_name_vue_react} \
                -w ${working_dir} \
                -p ${config_port_vue_react1}:${port_container_vue_react1} \
                -p ${config_port_vue_react2}:${port_container_vue_react2} \
                -v ${PWD}${share_code_host_vue_react}:${share_code_container_vue_react} \
                -v ${share_code_container_vue_modules} \
                -v ${share_code_container_react_modules2} \
                -v ${PWD}${share_host_vue_react}:${share_container_vue_react} \
                ${new_name_image_vue_react} ${comando1}

    # --rm = Cuando exit en Contenedor ==> Stop y Delete Contenedor
    # -d = Atado a la Consola o no (Al Servicio ejecutado), Attached/Dettached
    # -p ${config_port_vue_react}:${port_container_vue_react} \
    # -u ${user_uid_vue_react}:${user_guid_vue_react} \                
}

exec_run_console_vue_react() {
	clear	
    echo -e "----------- 3. Ejecutar Container Vue-React Colegio INTERACTIVO-Consola (docker run) -------------"
    echo
    
    #3.- Correr Imagen --> (Contenedor)
    # -u ${user_uid_vue_react}:${user_guid_vue_react} \

    docker exec -it ${name_container_vue_react} \
                bash

    #docker run -it --rm \         
}

exec_run_parametro_vue_react() {
	clear	
    echo -e "----------- 4. Ejecutar Container Vue-React Colegio PARAMETRO (docker run) -------------"
    echo
    
    parametro1=""
    read -p "Ingrese Comando (ls,id, ip addr show): " parametro1

    docker exec -it ${name_container_vue_react} \
                ${parametro1}
                
    #3.- Correr Imagen --> (Contenedor)
    # -u ${user_uid_vue_react}:${user_guid_vue_react} \
    #docker run -it --rm \              
}

#---------------------------------------- SERVICIO ------------------------------------

exec_create_vue_container_vue_react() {
    exec_create_container_vue_react_base "VUE"
}

exec_create_react_container_vue_react() {
    exec_create_container_vue_react_base "REACT"
}

exec_create_vue_contable_container_vue_react() {
    exec_create_container_vue_react_base "VUE_CONTABLE"
}

exec_create_react_contable_container_vue_react() {
    exec_create_container_vue_react_base "REACT_CONTABLE"
}

exec_create_container_vue_react_base() {
	clear	
    echo -e "----------- 11. Crear Container Vue-React Colegio (docker create) -------------"
    echo

    tipo=${1}        
    comando1="npm run start"
    working_dir=""

    if [ ${tipo} = "VUE" ]
    then
	    working_dir="/home/me_apps/portafolio_vue/"
    elif [ ${tipo} = "REACT" ]
    then
        working_dir="/home/me_apps/portafolio_react/"
    elif [ ${tipo} = "VUE_CONTABLE" ]
    then
        working_dir="/home/me_apps/contable_portafolio_vue/"
    elif [ ${tipo} = "REACT_CONTABLE" ]
    then
        working_dir="/home/me_apps/contable_portafolio_react/"
    else
        echo -e "--- ERROR: Escoger Proyecto Frontend Inicial ---"
        working_dir="/home/me_apps/portafolio_vue/"
    fi

    # -u ${user_uid_vue_react}:${user_guid_vue_react} \
    # -u ${user_name_vue_react} \
    # --rm \
    # --network ${network_name} \

    docker create   --name ${name_container_vue_react} \
                    -u ${user_name_vue_react} \
                    -w ${working_dir} \
                    -p ${config_port_vue_react1}:${port_container_vue_react1} \
                    -p ${config_port_vue_react2}:${port_container_vue_react2} \
                    -v ${PWD}${share_code_host_vue_react}:${share_code_container_vue_react} \
                    -v ${share_code_container_vue_modules} \
                    -v ${share_code_container_react_modules2} \
                    -v ${PWD}${share_host_vue_react}:${share_container_vue_react} \
                    ${new_name_image_vue_react} ${comando1}
    
    echo -e "\n\nServicio Creado..... \n\n"

    # --rm = Se elimina Container cuando se detiene o docker stop
    # -u ${user_uid_vue_react}:${user_guid_vue_react} \
}

exec_start_container_vue_react() {
	clear	
    echo -e "----------- 12. Iniciar Container Vue-React Colegio (docker start) -------------"
    echo    

    docker start ${name_container_vue_react}

    echo -e "\n\nServicio Iniciado..... \n\n"
}

exec_logs_container_vue_react() {
	clear	
    echo -e "----------- 13.000. Mostrar LOGs Container Vue-React (docker logs) -------------"
    echo    

    xfce4-terminal -e "docker logs --follow ${name_container_vue_react}"
}

exec_history_imagen_vue_react() {
	#clear	
    echo -e "----------- 54. Mostrar HISTORY Imagen Vue-React (docker history) -------------"
    echo    

    docker history ${new_name_image_vue_react}
}

exec_stop_container_vue_react() {
	clear
    echo -e "----------- 13. Detener Container Vue-React Colegio (docker stop) -------------"
    echo    

    docker stop ${name_container_vue_react}

    echo -e "\n\nServicio Detenido..... \n\n"
}

#---------------------------------------- VER / ELIMINAR ------------------------------------

exec_eliminar_container_vue_react() {
	clear	
    echo -e "----------- 51.- Eliminar Contenedor Vue-React Colegio -------------"
    echo
    
    id_container2=""
    read -p "Ingrese Sufijo Id Container: " id_container2

    docker stop ${name_container_vue_react}${id_container2}
    
    docker rm --volumes ${name_container_vue_react}${id_container2}

    echo -e "Contenedor Eliminado..... "
}

exec_eliminar_image_vue_react() {
	clear	
    echo -e "----------- 52.- Eliminar Imagen Vue-React Colegio -------------"
    echo
    
    id_image2=""
    read -p "Ingrese Sufijo Id Image: " id_image2

    docker rmi -f ${new_name_image_vue_react}${id_image2}

    echo -e "Imagen Eliminada..... "
}