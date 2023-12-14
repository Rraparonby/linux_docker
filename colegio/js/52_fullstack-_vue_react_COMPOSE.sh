#!/bin/bash

source "../../../source_docker/lib/01_docker_general/general_lib.sh"
source "../../../source_docker/lib/01_docker_general/network_lib.sh"

source "../../../source_docker/lib/02_docker_db/mariadb/mariadb_lib.sh"
source "../../../source_docker/lib/04_docker_js/nest/nest_lib.sh"
source "../../../source_docker/lib/04_docker_js/vue/vue_lib.sh"
source "../../../source_docker/lib/04_docker_js/react/react_lib.sh"

source "../../../source_docker/lib_lote/04_mariadb_nest_vue_react/mariadb_nest_vue_react_compose.sh"

source "./50_fullstack_vue_react_CONFIG.sh"

opcion_compose_lote=0
linea_compose_lote=""
file_compose_lote="52_fullstack_vue_react_docker-compose.yml"

con_vue=0
con_react=1

# IMAGES
#new_name_image_node="me_colegio_node:0.1"
#new_name_image_node="me_colegio_node:0.1"

# CONTAINERS
#name_container_mariadb="me_mariadb_01"
#name_container_node="me_colegio_node_01_c01"
#name_container_node="me_colegio_node_01_c01"

#config_host="localhost"
#config_port="8081"

get_menu_opciones_compose_lote() {
    clear
    echo
    echo -e "\t----------- COMPOSE LOTE (MARIADB - NEST - NODE) - HOST-PC \n"
    
	echo -e "\t1. Correr Imagen-Compose-Lote  (docker compose up)"    
    echo -e "\t2. Verificar Imagen-Compose-Lote  (docker compose ps)"
    echo -e "\t3. Mostrar LOGs Container LOTE Colegio (docker logs)"
    echo -e "\t4. Conectar Contenedor-Compose-Lote  (curl localhost)"
    echo -e "\t5. Detener Imagen-Compose-Lote  (docker compose down)"

    echo -e "\n\t--- COMANDOS NODE ---\n"
    echo -e "\t11. Ejecutar Comando Container NODE Interactivo GENERAL Colegio (docker exec -it)"
    echo -e "\t12. Ejecutar Comando Container NODE Parametro GENERAL Colegio (docker exec -it)"
    echo -e "\t13. CORRER Comando Container MARIADB PARAMETRO Colegio (docker run -it)"
    echo -e "\t14. CORRER Comando Container NODE PARAMETRO Colegio (docker run -it)"
    echo -e "\t15. CORRER Comando Container VUE PARAMETRO Colegio (docker run -it)"
    echo -e "\t16. CORRER Comando Container REACT PARAMETRO Colegio (docker run -it)"
    echo -e "\t19. Ejecutar Comando Container MARIADB IMPORTAR GENERAL Colegio (docker exec -i)"
    
    get_menu_opciones_network

    echo -e "\n\t--- ELIMINAR NEST-COMPOSE LOTE ---\n"

    echo -e "\t51.- Eliminar Contenedor  "
    echo -e "\t52.- Eliminar Imagen  "
    echo -e "\t53.- Verificar Eliminacion Imagen/Contenedor  "
    echo -e "\t54.- Verificar History Imagen"

    get_menu_opciones_auxiliares_generales

    echo -e "\n\t0. SALIR\n\n"
    
    read -p "Escoja una Opcion: " opcion_compose_lote
}



while [ 1 ]
do

    get_menu_opciones_compose_lote

    case $opcion_compose_lote in
        0)
            clear;
            echo -e "Proceso terminado correctamente..."
            break ;;
            
        1)  exec_correr_image_compose_lote ;;            
        2)  exec_verificar_image_compose_lote ;;
        3)  exec_logs_container_lote ;;         
        4)  exec_conectar_container_compose_lote ;;         
        5)  exec_detener_image_compose_lote ;;
        
        11)  exec_correr_contenedor_consola_general ;;  
        12)  exec_run_parametro_general ;; 
        13)  exec_run_mariadb_lote ;;
        14)  exec_run_node_lote ;;
        15)  exec_run_vue_lote ;;
        16)  exec_run_react_lote ;;
        19)  exec_correr_container_import_mariadb ;;

        21)  exec_create_network ;;            
        22)  exec_verificar_network ;;
        23)  exec_eliminar_network ;;

        51)  exec_eliminar_container_compose_lote ;;            
        52)  exec_eliminar_image_compose_lote ;;
        53)  get_verificar_eliminacion_general ;;
        54)  exec_history_imagen_lote ;;
        
        991)  exec_logs_container_exited_general ;;
        992)  exec_inspeccionar_image_container_general ;;
        993)  exec_attach_container_consola_general ;;

        *)  echo -e "Seleccion Incorrecta" ;;
    esac

echo -e "Presione la tecla Enter para continuar"

read linea_compose_lote

done