#!/bin/bash



#---------------------------------------- COMANDOS ------------------------------------


exec_build_image_lote() {
	clear	
    echo -e "----------- 1. BUILD-Construir Imagen NEOVIM (docker build) -------------"
    echo 

    cd ${base_path_neovim}
    exec_build_image_neovim
    cd ..
    echo -e "\n\nBuilding Neovim Realizado..... \n"
}  

exec_commit_container_to_image_lote() {
    clear	
    echo -e "----------- 2. COMMIT-Grabar Container --> Imagen NEOVIM (docker commit) -------------"
    echo 

    cd ${base_path_neovim}
    exec_commit_container_image_neovim
    cd ..
    echo -e "\n\nCommiting Neovim Realizado..... \n"
}

exec_run_neovim_bash_lote() {
    clear   
    echo -e "----------- 3. CORRER BASH Container NEOVIM IDE (docker run -it) -------------"
    echo 

    #cd ${base_path_neovim}
    exec_run_neovim ${PWD} "bash"
    #cd ..
}

exec_run_neovim_neovim_lote() {
    clear   
    echo -e "----------- 4. CORRER NEOVIM Container NEOVIM IDE (docker run -it) -------------"
    echo 

    #cd ${base_path_neovim}
    exec_run_neovim ${PWD} "nvim"
    #cd ..
}

#---------------------------------------- SERVICIO ------------------------------------

exec_create_container_lote() {
	clear	
    echo -e "----------- 11. Crear Container NEOVIM IDE (docker create) -------------"
    echo

    #cd ${base_path_neovim}
    exec_create_container_neovim
    #cd ..
    echo -e "\n\nServicio Neovim Creado..... \n"
}

exec_start_container_lote() {
	clear	
    echo -e "----------- 12. Iniciar Container NEOVIM IDE (docker start) -------------"
    echo    

    exec_start_container_neovim
    echo -e "\n\nServicio Neovim Iniciado..... \n"
}

exec_logs_container_lote() {
	clear	
    echo -e "----------- 13. Mostrar LOGs Container NEOVIM IDE (docker logs) -------------"
    echo    

    exec_logs_container_neovim
    echo -e "\n\nLOGs Servicio Neovim Iniciado..... \n"
}

exec_stop_container_lote() {
	clear	
    echo -e "----------- 14. Detener Container NEOVIM IDE (docker stop) -------------"
    echo    

    exec_stop_container_neovim
    echo -e "\n\nServicio Neovim Detenido..... \n"
}


#---------------------------------------- VER / ELIMINAR ------------------------------------


exec_eliminar_contenedor_lote() {
	clear	
    echo -e "----------- 51.- Eliminar Contenedores NEOVIM IDE -------------"
    echo
    
    exec_eliminar_container_neovim
    echo -e "\n\nContainer Neovim Eliminado..... \n"
}

exec_eliminar_imagen_lote() {
	clear	
    echo -e "----------- 52.- Eliminar Imagenes NEOVIM IDE -------------"
    echo
    
    exec_eliminar_image_neovim
    echo -e "\n\nImagen Neovim Eliminada..... \n"
}

exec_history_imagen_lote() {
	clear	
    echo -e "----------- 54.- Verificar History Imagen NEOVIM -------------"
    echo    

    exec_history_imagen_neovim
    echo -e "\n\nHISTORY Servicio Neovim Iniciado..... \n"
}