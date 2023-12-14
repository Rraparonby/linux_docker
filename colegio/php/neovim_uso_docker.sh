#!/bin/bash

opcion=0
linea=""

#===================== DOCKER =====================

name_image_neovim="me_ide_neovim:0.2"   # "me_ide_neovim:0.1"
name_container_neovim="me_ide_neovim_c01"

user_name_neovim="bydan_lnmn"

#===================== VOLUMES =====================

#--- Sharing ---
share_code_host_neovim="/02_colegio_laravel/03_sharing/"
share_code_container_neovim="/home/sharing"

#--- Backend ---
share_code_host_backend_neovim="/02_colegio_laravel/02_code/colegio_laravel/"     
share_code_container_backend_neovim="/home/me_apps/project_backend/" 

#--- Frontend ---
share_code_host_frontend_neovim="/03_colegio_vue/02_code/colegio_vue/"     
share_code_container_frontend_neovim="/home/me_apps/project_frontend/" 

get_menu_opciones() {
    clear
    echo
    echo -e "\t\t\t=============== NEOVIM USO ===============\n"
    
	echo -e "\t1. Correr Neovim Imagen (docker run)"
    #echo -e "\t2. Verify Docker Compose (docker compose -f ${name_file_compose} ps)"
    #echo -e "\t3. Detalle USB(eject)"
    
    echo -e "\n\t----- Running Image -----"
    echo -e "\t3. Run Bash Image Neovim (docker run)"
    echo -e "\t4. Run Param Image Neovim (docker run)"
    
    echo -e "\n\t----- Executing Container -----"
    echo -e "\t6. Execute Bash Container Neovim (docker exec)"
    echo -e "\t7. Execute Param Container Neovim (docker exec)"
        
    echo -e "\n\t----- Information -----"
    echo -e "\t11. Show info General Docker (docker images, ps, volume ls)"

    echo -e "\n\t----- Eliminar -----"
    echo -e "\t91.- Eliminar Imagen Neovim (docker rmi -f)"
    echo -e "\t92.- Eliminar Contenedor Neovim (docker rm --volumes)"

    echo -e "\n\t0. Salir\n\n"
    
    read -p "Escoja una Opcion: " opcion
}

#============================================ NEOVIM ============================================
exec_run_neovim() {
    clear	   
	echo -e "----------- 1. Correr Neovim Imagen (docker run) -------------\n"
    
    docker run -it --rm \
                --name ${name_container_neovim} \
                -u ${user_name_neovim} \
                -v ${PWD}${share_code_host_neovim}:${share_code_container_neovim} \
                -v ${PWD}${share_code_host_backend_neovim}:${share_code_container_backend_neovim} \
                -v ${PWD}${share_code_host_frontend_neovim}:${share_code_container_frontend_neovim} \
                ${name_image_neovim} bash
}

#---------------------------------------- RUNNING ------------------------------------

exec_run_bash_image_neovim() {
	clear	
    echo -e "----------- 3. Run Bash Image Neovim (docker run) -------------"
        
    docker run -it --rm \
               --name ${name_container_neovim} \
               -u ${user_name_neovim} \
               -v ${PWD}${share_code_host_neovim}:${share_code_container_neovim} \
               ${name_image_neovim} bash
}

exec_run_param_image_neovim() {
	clear	
    echo -e "----------- 4. Run Param Image Neovim (docker run) -------------"
    
    parametro1=""
    read -p "Ingrese Comando (bash/sh, ls,id, ip addr show): " parametro1

    docker run -it --rm \
               --name ${name_container_neovim} \
               -u ${user_name_neovim} \
               -v ${PWD}${share_code_host_neovim}:${share_code_container_neovim} \
               ${name_image_neovim} "${parametro1}"
}

#---------------------------------------- EXECUTING ------------------------------------

exec_execute_bash_container_neovim() {
    clear	
    echo -e "----------- 6. Execute Bash Container Neovim (docker exec) -------------\n"
    
    docker exec -it ${name_container_neovim} bash
}

exec_execute_param_container_neovim() {
    clear	
    echo -e "----------- 7. Execute Param Container Neovim (docker exec) -------------\n"
    
    parametro1=""
    read -p "Ingrese Comando (bash/sh, ls,id, ip addr show): " parametro1

    docker exec -it ${name_container_neovim} "${parametro1}"
}

#---------------------------------------- SHOW ------------------------------------

get_show_info_general() {
    clear   
    echo -e "----------- 11. Show info General Docker (docker images, ps, volume ls) -------------\n"
    
    echo -e "------ Imagenes ------"
    docker images     # -a = All Layers Image      
    
    echo -e "------ Contenedores ------"
    docker ps

    echo -e "------ Volumes ------"
    docker volume ls
}

#---------------------------------------- ELIMINAR ------------------------------------

exec_eliminar_image_neovim() {
    clear   
    echo -e "----------- 91.- Eliminar Imagen Neovim (docker rmi -f) -------------\n"
    
    #id_image2=""
    #read -p "Ingrese Sufijo Id Image: " id_image2

    docker rmi -f ${name_image_neovim} # ${id_image2}

    echo -e "Imagen Eliminada..... "
}

exec_eliminar_container_neovim() {
    clear   
    echo -e "----------- 92.- Eliminar Contenedor Neovim (docker rm --volumes) -------------\n"
    
    #id_container2=""
    #read -p "Ingrese Sufijo Id Container: " id_container2

    docker stop ${name_container_neovim}    # ${id_container2}

    docker rm --volumes ${name_container_neovim}    # ${id_container2}

    echo -e "Contenedor Eliminado..... "
}

while [ 1 ]
do

    get_menu_opciones

    case $opcion in
    
        0)
            clear;
            echo -e "Proceso terminado correctamente..."
            break ;;
            
        1) exec_run_neovim ;;            
        2) exec_stop_docker_compose ;;          

        3) exec_run_bash_image_neovim ;;          
        4) exec_run_param_image_neovim ;;
        
        6) exec_execute_bash_container_neovim ;;
        7) exec_execute_param_container_neovim ;;

        11) get_show_info_general ;;
        
        91) exec_eliminar_image_neovim ;;
        92) exec_eliminar_container_neovim ;;

        *)  echo -e "Seleccion Incorrecta" ;;

    esac

echo -e "Presione la tecla Enter para continuar"
read linea

done