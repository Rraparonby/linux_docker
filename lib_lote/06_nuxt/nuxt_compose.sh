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
    
    exec_logs_container_nuxt
    echo -e "\n\nLOGs Servicio Nuxt Iniciado..... \n"

    #echo -e "\n\nLOGs Servicio LOTE Iniciado..... \n"
}

exec_conectar_container_compose_lote() {
	clear	
    echo -e "----------- 4. Conectar Contenedor-Compose-Lote  (curl localhost) -------------"
    echo
    
    path_file1=""
    read -p "Ingrese Path Archivo Web: " path_file1

    echo "URL: ${config_host_nuxt}:${config_port_nuxt}"

    curl ${config_host_nuxt}:${config_port_nuxt}/${path_file1}

    #curl localhost:8081/index1.html
}

exec_detener_image_compose_lote() {
	clear	
    echo -e "----------- 5. Detener Imagen-Compose-Lote  (docker compose down) -------------"
    echo
    
    docker compose -f ${file_compose_lote} down --volumes
}  

#---------------------------------------- COMANDOS ------------------------------------

exec_run_nuxt_lote() {

    clear   
    echo -e "----------- 3. CORRER Comando Container NUXT GENERAL Colegio PARAMETRO (docker run -it) -------------"
    echo 

    cd ${base_path_nuxt}
    exec_run_nuxt
    cd ..
}

#---------------------------------------- VER / ELIMINAR ------------------------------------


exec_eliminar_container_compose_lote() {
	clear	
    echo -e "----------- 51.- Eliminar Contenedor  Colegio -------------"
    echo
    
    exec_eliminar_container_nuxt
    echo -e "\n\nContainer Node Eliminado..... \n"

    echo -e "Contenedor LOTE Eliminado..... "
}

exec_eliminar_image_compose_lote() {
	clear	
    echo -e "----------- 52.- Eliminar Imagen  Colegio -------------"
    echo
    
    exec_eliminar_image_nuxt
    echo -e "\n\nImagen Node Eliminada..... \n"

    echo -e "Imagen LOTE Eliminada..... "
}

exec_history_imagen_lote() {
	clear	
    echo -e "----------- 54.- Verificar History Imagen LOTE -------------"
    echo    

    exec_history_imagen_nuxt
    echo -e "\n\nHISTORY Servicio Nuxt Iniciado..... \n"

    #echo -e "\n\nHISTORY Servicio LOTE Iniciado..... \n"
}