#!/bin/bash

#----------------------------------- VARIABLES ---------------------------

opcion_neovim=0
linea_neovim=""

# SOLO CAMBIA   01 --> :02
#               02 --> :01
#"me_ide_neovim:0.1";
#new_name_image_neovim_final="me_ide_neovim:0.2";

new_name_image_neovim="me_ide_neovim:0.1";
name_container_neovim="me_ide_neovim_c01"

config_host_neovim="127.0.0.1"
config_port_neovim="3307"
config_user_neovim="root"

#config_password_neovim="root"
#config_path_data_neovim="/01_data/"
#port_container_neovim="3306"

#----------------------- NEOVIM CONFIG FILES -----------------------
#--- Config ---
share_config_host_neovim="/99_ide_neovim/02_home/bydan_lnmn/"     # .config/
share_config_container_neovim="/home/bydan_lnmn/"                   # .config/
#--- Plugins0 ---

#----------------------- GENERAL FILES -----------------------
share_host_neovim="/99_ide_neovim/03_sharing/"   
share_container_neovim="/home/sharing/"

#----------------------- PROJECTS FILES -----------------------
#--- Laravel ---
share_code_host_laravel="/02_colegio_laravel/02_code/colegio_laravel/"
share_code_container_laravel="/home/me_apps/colegio_laravel/"

#--- Vue ---
share_code_host_vue="/03_colegio_vue/02_code/colegio_vue/"
share_code_container_vue="/home/me_apps/colegio_vue/"

#---------------- PATHs ORIGINALs --------------------

#share_code_host_laravel="/02_colegio_laravel/02_code/"
#share_code_container_laravel="/var/www/html/"

#share_code_host_vue="/03_colegio_vue/02_code/"
#share_code_container_vue="/home/me_apps/"

#id_container_neovim="5186da889cd8";
#id_image_neovim="159a32906318";
 

#------- Usuario en Container SO -----------
user_name_neovim="bydan_lnmn"     # root, node, bydan_lnmn
user_uid_neovim=1001   # id -u $USER, root=0, node=1000, bydan_lnmn=1001
user_guid_neovim=1001  # id -g $USER, root=0, node=1000, bydan_lnmn=1001

# CORRER COMANDOS
base_path_neovim="./99_ide_neovim"

#----------------------------------- FUNCIONES ---------------------------

#---------------------------------------- COMANDOS ------------------------------------


exec_build_image_neovim() {
	clear
	
    echo -e "----------- 1. Build-Construir Imagen NEOVIM (docker build) -------------"
    echo
    
    # docker commit
    # --no-cache 
    # --no-cache=true --force-rm

    docker build . \
                --file Dockerfile \
                --tag ${new_name_image_neovim}
}  

exec_commit_container_image_neovim() {
    clear
	
    echo -e "----------- 1. COMMIT-Grabar Container --> Imagen NEOVIM (docker commit) -------------"
    echo
    
    #--------- CAMBIOS -----------
    # 1) Instalar Plugins
    #        nvim +PlugInstall

    docker commit ${name_container_neovim} ${new_name_image_neovim_final}
}

exec_run_neovim() {
    clear	
    
    base_path=${1}

    comando1=${2}

    #echo "PATH: ${base_path}"

	echo -e "----------- 2. Correr Imagen Neovim (docker run) -------------"
    echo
    
    # -d

    #comando1="bash"

    #read -p "Ingrese Comando (bash,ls): " comando1

    # -p ${config_port_neovim}:${port_container_neovim} \
    # --network ${network_name} \
    # -v ${PWD}${config_path_data_neovim}:/var/lib/mysql \
    # -u ${user_uid_neovim}:${user_guid_neovim} \
    # -u ${user_name_nest} \

    docker run -it --rm \
                --name ${name_container_neovim} \
                -u ${user_name_neovim} \
                -v ${base_path}${share_host_neovim}:${share_container_neovim} \
                -v ${base_path}${share_config_host_neovim}:${share_config_container_neovim} \
                -v ${base_path}${share_code_host_laravel}:${share_code_container_laravel} \
                -v ${base_path}${share_code_host_vue}:${share_code_container_vue} \
                ${new_name_image_neovim} ${comando1}
    #Running...
}

exec_correr_container_consola_neovim() {
	clear	
    echo -e "----------- 3. Correr Contenedor Interactivo Neovim (docker run) -------------"
    echo ${name_container_neovim}
    
    docker exec -it ${name_container_neovim} \
                bash
}

exec_logs_container_neovim() {
	clear
	
    echo -e "----------- 13.000. Mostrar LOGs Container Neovim (docker logs) -------------"
    echo    

    xfce4-terminal -e "docker logs --follow ${name_container_neovim}"
}

exec_history_imagen_neovim() {
	#clear	
    echo -e "----------- 54. Mostrar HISTORY Imagen Neovim (docker history) -------------"
    echo    

    docker history ${new_name_image_neovim}
}

#---------------------------------------- VER / ELIMINAR ------------------------------------

exec_eliminar_container_neovim() {
	clear	
    echo -e "----------- 51.- Eliminar Contenedor Neovim -------------"
    echo
    
    id_container2=""
    read -p "Ingrese Sufijo Id Container: " id_container2

    docker stop ${name_container_neovim}${id_container2}
    docker rm --volumes ${name_container_neovim}${id_container2}

    echo -e "Contenedor Eliminado..... "
}

exec_eliminar_image_neovim() {
	clear	
    echo -e "----------- 52.- Eliminar Imagen Neovim -------------"
    echo
    
    id_image2=""
    read -p "Ingrese Sufijo Id Image: " id_image2

    docker rmi -f ${new_name_image_neovim}${id_image2}

    echo -e "Imagen Eliminada..... "
}


#---------------------------------------- SERVICIO ------------------------------------

: '

exec_create_container_neovim() {
	clear
	
    echo -e "----------- 11. Crear Container Neovim (docker create) -------------"
    echo

    # --rm
    # -p ${config_port_neovim}:${port_container_neovim} \
    # --network ${network_name} \
    # -v ${PWD}${config_path_data_neovim}:/var/lib/mysql \
    # -u ${user_name_neovim} \
    # -u ${user_uid_neovim}:${user_guid_neovim} \

    docker create   --name ${name_container_neovim} \
                    -u ${user_name_neovim} \
                    -v ${base_path}${share_host_neovim}:${share_container_neovim} \
                    -v ${base_path}${share_config_host_neovim}:${share_config_container_neovim} \
                    -v ${base_path}${share_code_host_laravel}:${share_code_container_laravel} \
                    -v ${base_path}${share_code_host_vue}:${share_code_container_vue} \
                    ${new_name_image_neovim}
    
    # --rm = Se elimina Container cuando se detiene o docker stop
}

exec_start_container_neovim() {
	clear
	
    echo -e "----------- 12. Iniciar Container Neovim (docker start) -------------"
    echo    

    docker start ${name_container_neovim}
}

exec_stop_container_neovim() {
	clear
	
    echo -e "----------- 13. Detener Container Neovim (docker stop) -------------"
    echo    

    docker stop ${name_container_neovim}
}

'


#----------------------------------- MENU -----------------------------------------------

: '

get_menu_opciones_neovim() {
    clear
    #echo ${PWD}
    echo -e "\t\t\t----------- NEOVIM - HOST-PC"
    echo -e "\n\t(1-11-12-3-13-51-52) / (1-2-3-13-51-52) / (21-23) / (3-4-5)"

    echo -e "\n\t--- COMANDOS NEOVIM ---\n"

	echo -e "\t1. Descargar Imagen Neovim (docker pull)"
    echo -e "\t-----------------------------------------"
    echo -e "\t2. Correr Imagen Neovim (docker run)"
    echo -e "\t3. Correr Contenedor Interactivo Neovim (docker exec)"
    echo -e "\t4. Correr Contenedor Conexion Neovim (docker exec)"
    echo -e "\t5. Conectar Host Neovim (neovim -h -u -p)"
    
    echo -e "\n\t--- SERVICIO NEOVIM ---\n"

    echo -e "\t11. Crear Container Neovim (docker create)"
    echo -e "\t12. Iniciar Container Neovim (docker start)"
    echo -e "\t13. Detener Container Neovim (docker stop)"

    get_menu_opciones_network

    echo -e "\n\t--- ELIMINAR NEOVIM ---\n"

    echo -e "\t51.- Eliminar Contenedor Neovim "
    echo -e "\t52.- Eliminar Imagen Neovim "
    echo -e "\t53.- Verificar Eliminacion Imagen/Contenedor Neovim "

    #echo -e "\n\tAYUDA"
    #echo -e "\t\t81. Ayuda Cd-ROM 1(Log,Eject)"

    echo -e "\n\t0. SALIR\n\n"
    
    read -p "Escoja una Opcion: " opcion_neovim
}

'