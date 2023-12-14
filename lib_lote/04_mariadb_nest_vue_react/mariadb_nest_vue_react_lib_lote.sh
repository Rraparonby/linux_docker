#!/bin/bash

#---------------------------------------- COMANDOS ------------------------------------


exec_build_image_lote() {
	clear	
    echo -e "----------- 1. Build-Construir Imagen LOTE (docker build) -------------"
    echo 

    if [ $con_nest -eq 1 ]
    then
        cd ${base_path_nest}
        # exec_build_image_nest
        cd ..
        echo -e "\n\nBuilding Nest Realizado..... \n"
    fi

    if [ $con_vue -eq 1 ]
    then
        cd ${base_path_vue}
        # exec_build_image_vue
        cd ..
        echo -e "\n\nBuilding Vue Realizado..... \n"
    fi

    if [ $con_react -eq 1 ]
    then
        cd ${base_path_react}
        exec_build_image_react
        cd ..
        echo -e "\n\nBuilding React Realizado..... \n"
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

exec_run_nest_lote() {

    clear   
    echo -e "----------- 5. CORRER Comando Container NEST Colegio PARAMETRO (docker run -it) -------------"
    echo 

    if [ $con_nest -eq 1 ]
    then
        cd ${base_path_nest}
        exec_run_nest
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

exec_run_react_lote() {

    clear   
    echo -e "----------- 7. CORRER Comando Container REACT Colegio PARAMETRO (docker run -it) -------------"
    echo 

    if [ $con_react -eq 1 ]
    then
        cd ${base_path_react}
        exec_run_react
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

    if [ $con_nest -eq 1 ]
    then
        cd ${base_path_nest}
        exec_create_container_nest
        cd ..
        echo -e "\n\nServicio Nest Creado..... \n"
    fi

    if [ $con_vue -eq 1 ]
    then
        cd ${base_path_vue}
        exec_create_container_vue
        cd ..
        echo -e "\n\nServicio Vue Creado..... \n"
    fi

    if [ $con_react -eq 1 ]
    then
        cd ${base_path_react}
        exec_create_container_react
        cd ..
        echo -e "\n\nServicio React Creado..... \n"
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

    if [ $con_nest -eq 1 ]
    then
        exec_start_container_nest
        echo -e "\n\nServicio Nest Iniciado..... \n"
    fi

    if [ $con_vue -eq 1 ]
    then
        exec_start_container_vue
        echo -e "\n\nServicio Vue Iniciado..... \n"
    fi

    if [ $con_react -eq 1 ]
    then
        exec_start_container_react
        echo -e "\n\nServicio React Iniciado..... \n"
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

    if [ $con_nest -eq 1 ]
    then
        exec_logs_container_nest
        echo -e "\n\nLOGs Servicio Nest Iniciado..... \n"
    fi

    if [ $con_vue -eq 1 ]
    then
        exec_logs_container_vue
        echo -e "\n\nLOGs Servicio Vue Iniciado..... \n"
    fi

    if [ $con_react -eq 1 ]
    then
        exec_logs_container_react
        echo -e "\n\nLOGs Servicio React Iniciado..... \n"
    fi

    #echo -e "\n\nLOGs Servicio LOTE Iniciado..... \n"
}

exec_stop_container_lote() {
	clear
	
    echo -e "----------- 14. Detener Container LOTE Colegio (docker stop) -------------"
    echo    

    if [ $con_react -eq 1 ]
    then
        exec_stop_container_react
        echo -e "\n\nServicio React Detenido..... \n"
    fi

    if [ $con_vue -eq 1 ]
    then
        exec_stop_container_vue
        echo -e "\n\nServicio Vue Detenido..... \n"
    fi

    if [ $con_nest -eq 1 ]
    then
        exec_stop_container_nest
        echo -e "\n\nServicio Nest Detenido..... \n"
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

    if [ $con_nest -eq 1 ]
    then
        exec_eliminar_container_nest
        echo -e "\n\nContainer Nest Eliminado..... \n"
    fi

    if [ $con_vue -eq 1 ]
    then
        exec_eliminar_container_vue
        echo -e "\n\nContainer Vue Eliminado..... \n"
    fi

    if [ $con_react -eq 1 ]
    then
        exec_eliminar_container_react
        echo -e "\n\nContainer React Eliminado..... \n"
    fi

    echo -e "Contenedor LOTE Eliminado..... "
}

exec_eliminar_imagen_lote() {
	clear	
    echo -e "----------- 52.- Eliminar Imagenes LOTE Colegio -------------"
    echo
    
    if [ $con_nest -eq 1 ]
    then
        exec_eliminar_image_nest
        echo -e "\n\nImagen Nest Eliminada..... \n"
    fi

    if [ $con_vue -eq 1 ]
    then
        exec_eliminar_image_vue
        echo -e "\n\nImagen Vue Eliminada..... \n"
    fi

    if [ $con_react -eq 1 ]
    then
        exec_eliminar_image_react
        echo -e "\n\nImagen React Eliminada..... \n"
    fi

    echo -e "Imagen LOTE Eliminada..... "
}

exec_history_imagen_lote() {
	clear	
    echo -e "----------- 54.- Verificar History Imagen LOTE -------------"
    echo    

    #exec_history_imagen_mariadb
    #echo -e "\n\nHISTORY Servicio MariaDB Iniciado..... \n"

    exec_history_imagen_nest
    echo -e "\n\nHISTORY Servicio Nest Iniciado..... \n"

    if [ $con_vue -eq 1 ]
    then
        exec_history_imagen_vue
        echo -e "\n\nHISTORY Servicio Vue Iniciado..... \n"
    fi

    if [ $con_react -eq 1 ]
    then
        exec_history_imagen_react
        echo -e "\n\nHISTORY Servicio React Iniciado..... \n"
    fi
    
    #echo -e "\n\nHISTORY Servicio LOTE Iniciado..... \n"
}


