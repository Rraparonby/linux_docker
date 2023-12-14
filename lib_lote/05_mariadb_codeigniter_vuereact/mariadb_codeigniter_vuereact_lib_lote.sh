#!/bin/bash

#---------------------------------------- COMANDOS ------------------------------------

exec_build_image_lote() {
	clear	
    echo -e "----------- 1. Build-Construir Imagen LOTE (docker build) -------------"
    echo 

    if [ $con_codeigniter -eq 1 ]
    then
        cd ${base_path_codeigniter}
        # exec_build_image_codeigniter
        cd ..
        echo -e "\n\nBuilding Codeigniter Realizado..... \n"
    fi

    if [ $con_vue_react -eq 1 ]
    then
        cd ${base_path_vue_react}
        # exec_build_image_vue_react
        cd ..
        echo -e "\n\nBuilding Vue-React Realizado..... \n"
    fi

    echo -e "\n\nBuilding LOTE Realizado..... \n"
}  

exec_run_mariadb_lote() {
    clear   
    echo -e "----------- 4. CORRER Comando Container MARIADB Frontend PARAMETRO (docker run -it) -------------"
    echo 

    if [ $con_mariadb -eq 1 ]
    then
        cd ${base_path_mariadb}
        exec_run_mariadb
        cd ..
    fi
}

exec_run_codeigniter_lote() {

    clear   
    echo -e "----------- 5. CORRER Comando Container CODEIGNITER Frontend PARAMETRO (docker run -it) -------------"
    echo 

    if [ $con_codeigniter -eq 1 ]
    then
        cd ${base_path_codeigniter}
        exec_run_codeigniter
        cd ..
    fi
}

exec_run_vue_react_lote() {

    clear   
    echo -e "----------- 6. CORRER Comando Container VUE/REACT Frontend PARAMETRO (docker run -it) -------------"
    echo 

    if [ $con_vue_react -eq 1 ]
    then
        cd ${base_path_vue_react}
        exec_run_vue_react
        cd ..
    fi
}

#exec_run_vuestart_vue_react_lote() {
#    clear   
#    echo -e "----------- 6. CORRER VUE START Comando Container PORTAFOLIO VUE-REACT PARAMETRO (docker run -it) -------------"
#    echo
#
#    if [ $con_vue_react -eq 1 ]
#    then
#        cd ${base_path_vue_react}
#        exec_run_vuebash_vue_react
#        cd ..
#    fi
#}

#exec_run_reactstart_vue_react_lote() {
#    clear   
#    echo -e "----------- 7. CORRER REACT START Comando Container PORTAFOLIO VUE-REACT PARAMETRO (docker run -it) -------------"
#    echo 
#
#    if [ $con_vue_react -eq 1 ]
#    then
#        cd ${base_path_vue_react}
#        exec_run_reactbash_vue_react
#        cd ..
#    fi
#}

#---------------------------------------- SERVICIO ------------------------------------

exec_create_choose_container_lote() {

    if [ ${portafolio_init} = "VUE_PORTAFOLIO" ] || [ ${portafolio_init} = "VUE_CONTABLE" ]
    then
	    exec_create_vue_container_lote
    elif [ ${portafolio_init} = "REACT_PORTAFOLIO" ] || [ ${portafolio_init} = "REACT_CONTABLE" ]
    then
        exec_create_react_container_lote
    else
        echo -e "--- ERROR: Escoger Proyecto Frontend Inicial ---"
    fi
}

exec_create_vue_container_lote() {
	clear	
    echo -e "----------- 11. Crear Vue/React Container LOTE (docker create) -------------"
    echo
    
    # exec_create_react_container_lote ;;
        
    if [ $con_mariadb -eq 1 ]
    then
        cd ${base_path_mariadb}
        exec_create_container_mariadb    
        cd ..
        echo -e "\n\nServicio MariaDB Creado..... \n"
    fi

    if [ $con_codeigniter -eq 1 ]
    then
        cd ${base_path_codeigniter}
        exec_create_container_codeigniter
        cd ..
        echo -e "\n\nServicio Codeigniter Creado..... \n"
    fi

    if [ $con_vue_react -eq 1 ]
    then
        cd ${base_path_vue_react}

        if [ ${portafolio_init} = "VUE_PORTAFOLIO" ]
        then
            exec_create_vue_container_vue_react
        elif [ ${portafolio_init} = "VUE_CONTABLE" ]
        then
            exec_create_vue_contable_container_vue_react
        else
            exec_create_vue_container_vue_react
        fi

        cd ..
        echo -e "\n\nServicio Vue Creado..... \n"
    fi

    #echo -e "\n\nServicio LOTE Creado..... \n"
}

exec_create_react_container_lote() {
	clear	
    echo -e "----------- 11. Crear Rect Container LOTE (docker create) -------------"
    echo
    
    if [ $con_mariadb -eq 1 ]
    then
        cd ${base_path_mariadb}
        exec_create_container_mariadb    
        cd ..
        echo -e "\n\nServicio MariaDB Creado..... \n"
    fi

    if [ $con_codeigniter -eq 1 ]
    then
        cd ${base_path_codeigniter}
        exec_create_container_codeigniter
        cd ..
        echo -e "\n\nServicio Codeigniter Creado..... \n"
    fi

    if [ $con_vue_react -eq 1 ]
    then
        cd ${base_path_vue_react}

        if [ ${portafolio_init} = "REACT_PORTAFOLIO" ]
        then
            exec_create_react_container_vue_react
        elif [ ${portafolio_init} = "REACT_CONTABLE" ]
        then
            exec_create_react_contable_container_vue_react
        else
            exec_create_react_container_vue_react
        fi
        
        cd ..
        echo -e "\n\nServicio React Creado..... \n"
    fi

    #echo -e "\n\nServicio LOTE Creado..... \n"
}

exec_start_container_lote() {
	clear	
    echo -e "----------- 12. Iniciar Container LOTE (docker start) -------------"
    echo    
    
    if [ $con_mariadb -eq 1 ]
    then
        exec_start_container_mariadb
        echo -e "\n\nServicio MariaDB Iniciado..... \n"
    fi

    if [ $con_codeigniter -eq 1 ]
    then
        exec_start_container_codeigniter
        echo -e "\n\nServicio Codeigniter Iniciado..... \n"
    fi

    if [ $con_vue_react -eq 1 ]
    then
        exec_start_container_vue_react
        echo -e "\n\nServicio Vue-React Iniciado..... \n"
    fi

    echo -e "\n\nServicio LOTE Iniciado..... \n"
}

exec_logs_container_lote() {
	clear	
    echo -e "----------- 13. Mostrar LOGs Container LOTE (docker logs) -------------"
    echo    
    
    if [ $con_mariadb -eq 1 ]
    then
        exec_logs_container_mariadb
        echo -e "\n\nLOGs Servicio MariaDB Iniciado..... \n"
    fi

    if [ $con_codeigniter -eq 1 ]
    then
        exec_logs_container_codeigniter
        echo -e "\n\nLOGs Servicio Codeigniter Iniciado..... \n"
    fi

    if [ $con_vue_react -eq 1 ]
    then
        exec_logs_container_vue_react
        echo -e "\n\nLOGs Servicio Vue-React Iniciado..... \n"
    fi

    #echo -e "\n\nLOGs Servicio LOTE Iniciado..... \n"
}

exec_stop_container_lote() {
	clear
	
    echo -e "----------- 14. Detener Container LOTE (docker stop) -------------"
    echo    

    if [ $con_vue_react -eq 1 ]
    then
        exec_stop_container_vue_react
        echo -e "\n\nServicio Vue-React Detenido..... \n"
    fi

    if [ $con_codeigniter -eq 1 ]
    then
        exec_stop_container_codeigniter
        echo -e "\n\nServicio Codeigniter Detenido..... \n"
    fi

    if [ $con_mariadb -eq 1 ]
    then
        exec_stop_container_mariadb
        echo -e "\n\nServicio MariaDB Detenido..... \n"
    fi

    echo -e "\n\nServicio LOTE Detenido..... \n"
}


#---------------------------------------- VER / ELIMINAR ------------------------------------


exec_eliminar_contenedor_lote() {
	clear	
    echo -e "----------- 51.- Eliminar Contenedores LOTE -------------"
    echo
    
    if [ $con_mariadb -eq 1 ]
    then
        exec_eliminar_container_mariadb
        echo -e "\n\nContainer MariaDB Eliminado..... \n"
    fi

    if [ $con_codeigniter -eq 1 ]
    then
        exec_eliminar_container_codeigniter
        echo -e "\n\nContainer Codeigniter Eliminado..... \n"
    fi

    if [ $con_vue_react -eq 1 ]
    then
        exec_eliminar_container_vue_react
        echo -e "\n\nContainer Vue-React Eliminado..... \n"
    fi

    echo -e "Contenedor LOTE Eliminado..... "
}

exec_eliminar_imagen_lote() {
	clear	
    echo -e "----------- 52.- Eliminar Imagenes LOTE -------------"
    echo
    
    if [ $con_vue_react -eq 1 ]
    then
        exec_eliminar_image_vue_react
        echo -e "\n\nImagen Vue-React Eliminada..... \n"
    fi

    if [ $con_codeigniter -eq 1 ]
    then
        exec_eliminar_image_codeigniter
        echo -e "\n\nImagen Codeigniter Eliminada..... \n"
    fi

    echo -e "Imagen LOTE Eliminada..... "
}

exec_history_imagen_lote() {
	clear	
    echo -e "----------- 54.- Verificar History Imagen LOTE -------------"
    echo    

    if [ $con_codeigniter -eq 1 ]
    then
        exec_history_imagen_codeigniter
        echo -e "\n\nHISTORY Servicio Codeigniter Iniciado..... \n"
    fi

    if [ $con_vue_react -eq 1 ]
    then
        exec_history_imagen_vue_react
        echo -e "\n\nHISTORY Servicio Vue-React Iniciado..... \n"
    fi

    #echo -e "\n\nHISTORY Servicio LOTE Iniciado..... \n"
}

#6)  exec_run_vuestart_vue_react_lote ;;
#7)  exec_run_reactstart_vue_react_lote ;;
#11)  exec_create_vue_container_lote ;;