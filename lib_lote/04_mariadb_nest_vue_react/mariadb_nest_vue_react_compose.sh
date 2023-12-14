#!/bin/bash

#---------------------------------------- SERVICIO ------------------------------------

exec_correr_image_compose_lote() {
	clear	
    echo -e "----------- 1. Correr Imagen-Compose-Lote  (docker compose up) -------------"
    echo
    
    # -d = up -d (detach)

    docker compose -f ${file_compose_lote} up -d
}  

exec_verificar_image_compose_lote() {
	clear	
    echo -e "----------- 2. Verificar Imagen-Compose-Lote  (docker compose ps) -------------"
    echo
    
    docker compose -f ${file_compose_lote} ps
}

exec_logs_container_lote() {
	clear	
    echo -e "----------- 3. Mostrar LOGs Container LOTE Colegio (docker logs) -------------"
    echo    

    exec_logs_container_mariadb
    echo -e "\n\nLOGs Servicio MariaDB Iniciado..... \n"

    exec_logs_container_nest
    echo -e "\n\nLOGs Servicio Nest Iniciado..... \n"

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

exec_conectar_container_compose_lote() {
	clear	
    echo -e "----------- 4. Conectar Contenedor-Compose-Lote  (curl localhost) -------------"
    echo
    
    path_file1=""
    read -p "Ingrese Path Archivo Web: " path_file1

    curl ${config_host_nest}:${config_port_nest}/${path_file1}

    #curl localhost:8081/index1.html
}

exec_detener_image_compose_lote() {
	clear	
    echo -e "----------- 5. Detener Imagen-Compose-Lote  (docker compose down) -------------"
    echo
    
    docker compose -f ${file_compose_lote} down --volumes
}  

#---------------------------------------- COMANDOS ------------------------------------

exec_run_mariadb_lote() {

    clear   
    echo -e "----------- 13. CORRER Comando Container MARIADB Colegio PARAMETRO (docker run -it) -------------"
    echo 

    cd ${base_path_mariadb}
    exec_run_mariadb
    cd ..
}

exec_run_nest_lote() {

    clear   
    echo -e "----------- 14. CORRER Comando Container NODE Colegio PARAMETRO (docker run -it) -------------"
    echo 

    cd ${base_path_nest}
    exec_run_nest
    cd ..
}

exec_run_vue_lote() {

    clear   
    echo -e "----------- 15. CORRER Comando Container VUE Colegio PARAMETRO (docker run -it) -------------"
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
    echo -e "----------- 16. CORRER Comando Container REACT Colegio PARAMETRO (docker run -it) -------------"
    echo 

    if [ $con_react -eq 1 ]
    then
        cd ${base_path_react}
        exec_run_react
        cd ..
    fi
}

#---------------------------------------- VER / ELIMINAR ------------------------------------


exec_eliminar_container_compose_lote() {
	clear	
    echo -e "----------- 51.- Eliminar Contenedor  Colegio -------------"
    echo
    
    exec_eliminar_container_mariadb
    echo -e "\n\nContainer MariaDB Eliminado..... \n"
    
    exec_eliminar_container_nest
    echo -e "\n\nContainer Nest Eliminado..... \n"
    
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

exec_eliminar_image_compose_lote() {
	clear	
    echo -e "----------- 52.- Eliminar Imagen  Colegio -------------"
    echo
    
    exec_eliminar_image_nest
    echo -e "\n\nImagen Nest Eliminada..... \n"

    exec_eliminar_image_nest
    echo -e "\n\nImagen Nest Eliminada..... \n"

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
    echo -e "----------- 54.- Verificar History Imagen -------------"
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