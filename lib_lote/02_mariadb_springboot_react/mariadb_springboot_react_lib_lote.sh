#!/bin/bash

#---------------------------------------- COMANDOS ------------------------------------


exec_build_image_lote() {
	clear	
    echo -e "----------- 1. Build-Construir Imagen LOTE (docker build) -------------"
    echo 

    if [ $con_spring -eq 1 ]
    then
        cd ${base_path_spring}
        exec_build_image_spring
        cd ..
        echo -e "\n\nBuilding Spring Realizado..... \n"
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

exec_run_spring_lote() {

    clear	
    echo -e "----------- 5. CORRER Comando Container SPRING Colegio PARAMETRO (docker run -it) -------------"
    echo 

    if [ $con_spring -eq 1 ]
    then
        cd ${base_path_spring}
        exec_run_spring
        cd ..
    fi
}

exec_run_react_lote() {

    clear	
    echo -e "----------- 6. CORRER Comando Container REACT Colegio PARAMETRO (docker run -it) -------------"
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

    if [ $con_spring -eq 1 ]
    then
        cd ${base_path_spring}
        exec_create_container_spring
        cd ..
        echo -e "\n\nServicio Spring Creado..... \n"
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

    if [ $con_spring -eq 1 ]
    then
        exec_start_container_spring
        echo -e "\n\nServicio Spring Iniciado..... \n"
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

    if [ $con_spring -eq 1 ]
    then
        exec_logs_container_spring
        echo -e "\n\nLOGs Servicio Spring Iniciado..... \n"
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

    if [ $con_spring -eq 1 ]
    then
        exec_stop_container_spring
        echo -e "\n\nServicio Spring Detenido..... \n"
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

    if [ $con_spring -eq 1 ]
    then
        exec_eliminar_container_spring
        echo -e "\n\nContainer Spring Eliminado..... \n"
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
    
    if [ $con_spring -eq 1 ]
    then
        exec_eliminar_image_spring
        echo -e "\n\nImagen Spring Eliminada..... \n"
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

    if [ $con_spring -eq 1 ]
    then
        exec_history_imagen_spring
        echo -e "\n\nHISTORY Servicio Spring Iniciado..... \n"
    fi

    if [ $con_react -eq 1 ]
    then
        exec_history_imagen_react
        echo -e "\n\nHISTORY Servicio React Iniciado..... \n"
    fi

    #echo -e "\n\nHISTORY Servicio LOTE Iniciado..... \n"
}