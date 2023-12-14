#!/bin/bash

# -a = Todos (Layers none)
params_images=""

# -a = Todos (Exited, Restating)
params_containers="-a"

#---------------------------------------- GENERAL ------------------------------------

get_menu_opciones_auxiliares_generales() {
   echo -e "\n\t--- AUXILIARES GENERALES ---\n"
    echo -e "\t991.- Mostrar LOGs Container EXITED GENERAL (docker logs)"
    echo -e "\t992.- Mostrar CONFIGURACION Image/Container GENERAL (docker inspect)"
    echo -e "\t993.- Attach Container GENERAL (docker attach)"
}

exec_correr_contenedor_consola_general() {
	clear	
    echo -e "----------- 11. Ejecutar Comando Container Interactivo GENERAL (docker exec -it) -------------"
    
    id_container2=""
    read -p "Ingrese Id Container: " id_container2

    docker exec -it ${id_container2} \
                bash
}

exec_run_parametro_general() {
	clear	
    echo -e "----------- 12. Ejecutar Comando Container GENERAL Colegio PARAMETRO (docker exec -it) -------------"
    echo
    
    id_container2=""
    read -p "Ingrese Id Container: " id_container2

    parametro1=""
    read -p "Ingrese Comando (bash, ls, ip addr show): " parametro1

    docker exec -it ${id_container2} \
                ${parametro1}
}

exec_attach_container_consola_general() {
    clear   
    echo -e "----------- 993. Attach Container GENERAL (docker attach) -------------"
    
    id_container2=""
    read -p "Ingrese Id Container: " id_container2

    docker attach ${id_container2}

    # 1) docker run con bash
    # 2) docker start con bash
    # 3) docker compose con stdin_open: true, tty: true, command: bash
}

get_verificar_eliminacion_general() {
	clear	
    echo -e "----------- 53.- Verificar Eliminacion Imagen/Containers LOTE Colegio (docker images,docker ps,-a) -------------"
    echo
    
    echo -e "------ Imagenes ------"
    # -a = All Layers Image
    
    docker images ${params_images}

    echo -e "------ Contenedores ------"
    docker ps ${params_containers}

    echo -e "------ Volumes ------"
    docker volume ls
}

exec_logs_container_exited_general() {
    clear
    
    echo -e "----------- 991.- Mostrar LOGs Container EXITED GENERAL (docker logs) -------------"
    echo    

    id_container2=""
    read -p "Ingrese Id Container: " id_container2

    xfce4-terminal -e "docker logs -t ${id_container2}"
}

exec_inspeccionar_image_container_general() {
    clear  
    echo -e "----------- 992.- Mostrar CONFIGURACION Image/Container GENERAL (docker inspect) -------------"
    echo    

    id_element2=""
    read -p "Ingrese Id Image/Container: " id_element2

    docker inspect --format='{{json .Config}}' \
                   ${id_element2} \
                   | jq
}