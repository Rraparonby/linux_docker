#!/bin/bash

#---------------------------------------- SERVICIO ------------------------------------

exec_correr_image_compose_lote() {
	clear	
    echo -e "----------- 1. Correr Imagen-Compose-Lote  (docker compose up) -------------"
    echo
    
    # -d = detached mode
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

    exec_logs_container_spring
    echo -e "\n\nLOGs Servicio Spring Iniciado..... \n"

    exec_logs_container_react
    echo -e "\n\nLOGs Servicio React Iniciado..... \n"

    #echo -e "\n\nLOGs Servicio LOTE Iniciado..... \n"
}

exec_conectar_container_compose_lote() {
	clear	
    echo -e "----------- 4. Conectar Contenedor-Compose-Lote  (curl localhost) -------------"
    echo
    
    path_file1=""
    read -p "Ingrese Path Archivo Web: " path_file1

    curl ${config_host_spring}:${config_port_spring}/${path_file1}

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

exec_run_spring_lote() {

    clear   
    echo -e "----------- 14. CORRER Comando Container SPRING Colegio PARAMETRO (docker run -it) -------------"
    echo 

    cd ${base_path_spring}
    exec_run_spring
    cd ..
}

exec_run_react_lote() {

    clear   
    echo -e "----------- 15. CORRER Comando Container REACT Colegio PARAMETRO (docker run -it) -------------"
    echo 

    cd ${base_path_react}
    exec_run_react
    cd ..
}

#---------------------------------------- VER / ELIMINAR ------------------------------------


exec_eliminar_container_compose_lote() {
	clear	
    echo -e "----------- 51.- Eliminar Contenedor  Colegio -------------"
    echo
    
    exec_eliminar_container_mariadb
    echo -e "\n\nContainer MariaDB Eliminado..... \n"
    
    exec_eliminar_container_spring
    echo -e "\n\nContainer Spring Eliminado..... \n"

    exec_eliminar_container_react
    echo -e "\n\nContainer React Eliminado..... \n"

    echo -e "Contenedor LOTE Eliminado..... "
}

exec_eliminar_image_compose_lote() {
	clear	
    echo -e "----------- 52.- Eliminar Imagen  Colegio -------------"
    echo
    
    exec_eliminar_image_spring
    echo -e "\n\nImagen Spring Eliminada..... \n"

    exec_eliminar_image_spring
    echo -e "\n\nImagen Spring Eliminada..... \n"

    exec_eliminar_image_react
    echo -e "\n\nImagen React Eliminada..... \n"

    echo -e "Imagen LOTE Eliminada..... "
}

exec_history_imagen_lote() {
	clear	
    echo -e "----------- 54.- Verificar History Imagen -------------"
    echo    

    #exec_history_imagen_mariadb
    #echo -e "\n\nHISTORY Servicio MariaDB Iniciado..... \n"

    exec_history_imagen_spring
    echo -e "\n\nHISTORY Servicio Spring Iniciado..... \n"

    exec_history_imagen_react
    echo -e "\n\nHISTORY Servicio React Iniciado..... \n"

    #echo -e "\n\nHISTORY Servicio LOTE Iniciado..... \n"
}