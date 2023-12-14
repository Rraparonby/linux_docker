#!/bin/bash


#---------------------------------------- COMANDOS ------------------------------------


exec_build_image_lote() {
	clear	
    echo -e "----------- 1. Build-Construir Imagen LOTE (docker build) -------------"
    echo 

    if [ $con_laravel -eq 1 ]
    then
        cd ${base_path_laravel}
        exec_build_image_laravel
        cd ..
        echo -e "\n\nBuilding Laravel Realizado..... \n"
    fi

    if [ $con_vue -eq 1 ]
    then
        cd ${base_path_vue}
        exec_build_image_vue
        cd ..
        echo -e "\n\nBuilding Vue Realizado..... \n"
    fi

    echo -e "\n\nBuilding LOTE Realizado..... \n"
}  

exec_run_mariadb_lote() {

    clear   
    echo -e "----------- 4. CORRER Comando Container MARIADB Colegio PARAMETRO (docker run -it) -------------"
    echo 

    if [ $con_mariadb -eq 1 ]
    then
        cd ${base_path_mariadb}
        exec_run_mariadb
        cd ..
    fi
}

exec_run_laravel_lote() {

    clear   
    echo -e "----------- 5. CORRER Comando Container LARAVEL Colegio PARAMETRO (docker run -it) -------------"
    echo 

    if [ $con_laravel -eq 1 ]
    then
        cd ${base_path_laravel}
        exec_run_laravel
        cd ..
    fi
}

exec_run_vue_lote() {

    clear   
    echo -e "----------- 6. CORRER Comando Container VUE Colegio PARAMETRO (docker run -it) -------------"
    echo 

    if [ $con_vue -eq 1 ]
    then
        cd ${base_path_vue}
        exec_run_vue
        cd ..
    fi
}

#---------------------------------------- SERVICIO ------------------------------------

exec_create_container_lote() {
	clear	
    echo -e "----------- 11. Crear Container LOTE Colegio (docker create) -------------"
    echo

    if [ $con_mariadb -eq 1 ]
    then
        cd ${base_path_mariadb}
        exec_create_container_mariadb    
        cd ..
        echo -e "\n\nServicio MariaDB Creado..... \n"
    fi

    if [ $con_laravel -eq 1 ]
    then
        cd ${base_path_laravel}
        exec_create_container_laravel
        cd ..
        echo -e "\n\nServicio Laravel Creado..... \n"
    fi

    if [ $con_vue -eq 1 ]
    then
        cd ${base_path_vue}
        exec_create_container_vue
        cd ..
        echo -e "\n\nServicio Vue Creado..... \n"
    fi

    echo -e "\n\nServicio LOTE Creado..... \n"
}

exec_start_container_lote() {
	clear	
    echo -e "----------- 12. Iniciar Container LOTE Colegio (docker start) -------------"
    echo    

    if [ $con_mariadb -eq 1 ]
    then
        exec_start_container_mariadb
        echo -e "\n\nServicio MariaDB Iniciado..... \n"
    fi

    if [ $con_laravel -eq 1 ]
    then
        exec_start_container_laravel
        echo -e "\n\nServicio Laravel Iniciado..... \n"
    fi

    if [ $con_vue -eq 1 ]
    then
        exec_start_container_vue
        echo -e "\n\nServicio Vue Iniciado..... \n"
    fi

    echo -e "\n\nServicio LOTE Iniciado..... \n"
}

exec_logs_container_lote() {
	clear	
    echo -e "----------- 13. Mostrar LOGs Container LOTE Colegio (docker logs) -------------"
    echo    

    if [ $con_mariadb -eq 1 ]
    then
        exec_logs_container_mariadb
        echo -e "\n\nLOGs Servicio MariaDB Iniciado..... \n"
    fi

    if [ $con_laravel -eq 1 ]
    then
        exec_logs_container_laravel
        echo -e "\n\nLOGs Servicio Laravel Iniciado..... \n"
    fi

    if [ $con_vue -eq 1 ]
    then
        exec_logs_container_vue
        echo -e "\n\nLOGs Servicio Laravel Iniciado..... \n"
    fi

    #echo -e "\n\nLOGs Servicio LOTE Iniciado..... \n"
}

exec_stop_container_lote() {
	clear
	
    echo -e "----------- 14. Detener Container LOTE Colegio (docker stop) -------------"
    echo    

    if [ $con_vue -eq 1 ]
    then
        exec_stop_container_vue
        echo -e "\n\nServicio Vue Detenido..... \n"
    fi

    if [ $con_laravel -eq 1 ]
    then
        exec_stop_container_laravel
        echo -e "\n\nServicio Laravel Detenido..... \n"
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
    echo -e "----------- 51.- Eliminar Contenedores LOTE Colegio -------------"
    echo
    
    if [ $con_mariadb -eq 1 ]
    then
        exec_eliminar_container_mariadb
        echo -e "\n\nContainer MariaDB Eliminado..... \n"
    fi

    if [ $con_laravel -eq 1 ]
    then
        exec_eliminar_container_laravel
        echo -e "\n\nContainer Laravel Eliminado..... \n"
    fi

    if [ $con_vue -eq 1 ]
    then
        exec_eliminar_container_vue
        echo -e "\n\nContainer Vue Eliminado..... \n"
    fi

    echo -e "Contenedor LOTE Eliminado..... "
}

exec_eliminar_imagen_lote() {
	clear	
    echo -e "----------- 52.- Eliminar Imagenes LOTE Colegio -------------"
    echo
    
    if [ $con_vue -eq 1 ]
    then
        exec_eliminar_image_vue
        echo -e "\n\nImagen Vue Eliminada..... \n"
    fi

    if [ $con_laravel -eq 1 ]
    then
        exec_eliminar_image_laravel
        echo -e "\n\nImagen Laravel Eliminada..... \n"
    fi

    echo -e "Imagen LOTE Eliminada..... "
}

exec_history_imagen_lote() {
	clear	
    echo -e "----------- 54.- Verificar History Imagen LOTE -------------"
    echo    

    #exec_history_imagen_mariadb
    #echo -e "\n\nHISTORY Servicio MariaDB Iniciado..... \n"

    if [ $con_laravel -eq 1 ]
    then
        exec_history_imagen_laravel
        echo -e "\n\nHISTORY Servicio Laravel Iniciado..... \n"
    fi

    if [ $con_vue -eq 1 ]
    then
        exec_history_imagen_vue
        echo -e "\n\nHISTORY Servicio Vue Iniciado..... \n"
    fi

    #echo -e "\n\nHISTORY Servicio LOTE Iniciado..... \n"
}