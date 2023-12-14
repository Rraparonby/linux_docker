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

    exec_logs_container_codeigniter
    echo -e "\n\nLOGs Servicio Codeigniter Iniciado..... \n"

    exec_logs_container_vue_react
    echo -e "\n\nLOGs Servicio Vue-React Iniciado..... \n"

    #echo -e "\n\nLOGs Servicio LOTE Iniciado..... \n"
}

exec_conectar_container_compose_lote() {
	clear	
    echo -e "----------- 4. Conectar Contenedor-Compose-Lote  (curl localhost) -------------"
    echo
    
    path_file1=""
    read -p "Ingrese Path Archivo Web: " path_file1

    echo "URL: ${config_host_vue_react}:${config_port_vue_react}"

    curl ${config_host_vue_react}:${config_port_vue_react}/${path_file1}

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
    echo -e "----------- 13. CORRER Comando Container MARIADB GENERAL Colegio PARAMETRO (docker run -it) -------------"
    echo 

    cd ${base_path_mariadb}
    exec_run_mariadb
    cd ..
}

exec_run_codeigniter_lote() {

    clear   
    echo -e "----------- 14. CORRER Comando Container CODEIGNITER Colegio PARAMETRO (docker run -it) -------------"
    echo 

    cd ${base_path_codeigniter}
    exec_run_codeigniter
    cd ..
}

exec_run_vue_react_lote() {

    clear   
    echo -e "----------- 15. CORRER Comando Container VUE-REACT GENERAL Colegio PARAMETRO (docker run -it) -------------"
    echo 

    cd ${base_path_vue_react}
    exec_run_vue_react
    cd ..
}

#---------------------------------------- VER / ELIMINAR ------------------------------------


exec_eliminar_container_compose_lote() {
	clear	
    echo -e "----------- 51.- Eliminar Contenedor  Colegio -------------"
    echo
    
    exec_eliminar_container_mariadb
    echo -e "\n\nContainer MariaDB Eliminado..... \n"
    
    exec_eliminar_container_codeigniter
    echo -e "\n\nContainer Codeigniter Eliminado..... \n"

    exec_eliminar_container_vue_react
    echo -e "\n\nContainer Codeigniter Eliminado..... \n"

    echo -e "Contenedor LOTE Eliminado..... "
}

exec_eliminar_image_compose_lote() {
	clear	
    echo -e "----------- 52.- Eliminar Imagen  Colegio -------------"
    echo
    
    exec_eliminar_image_codeigniter
    echo -e "\n\nImagen Codeigniter Eliminada..... \n"

    exec_eliminar_image_vue_react
    echo -e "\n\nImagen Codeigniter Eliminada..... \n"

    echo -e "Imagen LOTE Eliminada..... "
}

exec_history_imagen_lote() {
	clear	
    echo -e "----------- 54.- Verificar History Imagen LOTE -------------"
    echo    

    exec_history_imagen_codeigniter
    echo -e "\n\nHISTORY Servicio Codeigniter Iniciado..... \n"

    exec_history_imagen_vue_react
    echo -e "\n\nHISTORY Servicio Vue-React Iniciado..... \n"

    #echo -e "\n\nHISTORY Servicio LOTE Iniciado..... \n"
}