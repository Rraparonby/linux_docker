#!/bin/bash

#---------------------------------------- COMANDOS ------------------------------------

exec_build_image_lote() {
	clear	
    echo -e "----------- 1. Build-Construir Imagen LOTE (docker build) -------------"
    echo 

    cd ${base_path_nuxt}
    exec_build_image_nuxt
    cd ..
    echo -e "\n\nBuilding Nuxt Realizado..... \n"

    echo -e "\n\nBuilding LOTE Realizado..... \n"
}  

exec_run_nuxt_lote() {

    clear   
    echo -e "----------- 4. CORRER Comando Container NUXT Colegio PARAMETRO (docker run -it) -------------"
    echo 

    cd ${base_path_nuxt}
    exec_run_nuxt
    cd ..
}

#---------------------------------------- SERVICIO ------------------------------------

exec_create_container_lote() {
	clear	
    echo -e "----------- 11. Crear Container LOTE Colegio (docker create) -------------"
    echo
    
    cd ${base_path_nuxt}
    exec_create_container_nuxt
    cd ..
    echo -e "\n\nServicio Nuxt Creado..... \n"


    echo -e "\n\nServicio LOTE Creado..... \n"
}

exec_start_container_lote() {
	clear	
    echo -e "----------- 12. Iniciar Container LOTE Colegio (docker start) -------------"
    echo    
    
    exec_start_container_nuxt
    echo -e "\n\nServicio Nuxt Iniciado..... \n"

    echo -e "\n\nServicio LOTE Iniciado..... \n"
}

exec_logs_container_lote() {
	clear	
    echo -e "----------- 13. Mostrar LOGs Container LOTE Colegio (docker logs) -------------"
    echo    
    
    exec_logs_container_nuxt
    echo -e "\n\nLOGs Servicio Nuxt Iniciado..... \n"

    #echo -e "\n\nLOGs Servicio LOTE Iniciado..... \n"
}

exec_stop_container_lote() {
	clear
	
    echo -e "----------- 14. Detener Container LOTE Colegio (docker stop) -------------"
    echo    

    exec_stop_container_nuxt
    echo -e "\n\nServicio Nuxt Detenido..... \n"

    echo -e "\n\nServicio LOTE Detenido..... \n"
}


#---------------------------------------- VER / ELIMINAR ------------------------------------


exec_eliminar_contenedor_lote() {
	clear	
    echo -e "----------- 51.- Eliminar Contenedores LOTE Colegio -------------"
    echo
    
    exec_eliminar_container_nuxt
    echo -e "\n\nContainer Nuxt Eliminado..... \n"

    echo -e "Contenedor LOTE Eliminado..... "
}

exec_eliminar_imagen_lote() {
	clear	
    echo -e "----------- 52.- Eliminar Imagenes LOTE Colegio -------------"
    echo
    
    exec_eliminar_image_nuxt
    echo -e "\n\nImagen Nuxt Eliminada..... \n"

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