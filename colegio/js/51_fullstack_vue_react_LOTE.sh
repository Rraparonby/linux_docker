#!/bin/bash

source "../../../source_docker/lib/01_docker_general/general_lib.sh"
source "../../../source_docker/lib/01_docker_general/network_lib.sh"

source "../../../source_docker/lib/02_docker_db/mariadb/mariadb_lib.sh"
source "../../../source_docker/lib/04_docker_js/nest/nest_lib.sh"
source "../../../source_docker/lib/04_docker_js/vue/vue_lib.sh"
source "../../../source_docker/lib/04_docker_js/react/react_lib.sh"

source "../../../source_docker/lib_lote/04_mariadb_nest_vue_react/mariadb_nest_vue_react_lib_lote.sh"

source "./50_fullstack_vue_react_CONFIG.sh"

opcion_lote=0
linea_lote=""

con_mariadb=1
con_nest=1
con_react=1
con_vue=0

#============ OPCION 1: VUE ============
# con_vue=1
# con_react=0

#============ OPCION 2: REACT ============
# con_vue=0
# con_react=1


get_menu_opciones_lote() {
    clear
    echo
    echo -e "\t-----------  LOTE (MARIADB - NEST - NEST) - HOST-PC "
    echo -e "\n\t(1-11-12-13-51-52) / (2-3) / (4)"

    echo -e "\n\t--- COMANDOS NEST ---\n"

    echo -e "\t1. Build-Construir Imagen LOTE (docker build)"
    echo -e "\t-----------------------------------------"
    echo -e "\t2. Ejecutar Comando Container NEST Interactivo GENERAL Colegio (docker exec -it)"
    echo -e "\t3. Ejecutar Comando Container NEST Parametro GENERAL Colegio (docker exec -it)"
    echo -e "\t4. CORRER Comando Container MARIADB PARAMETRO Colegio (docker run -it)"
    echo -e "\t5. CORRER Comando Container NEST PARAMETRO Colegio (docker run -it)"
    echo -e "\t6. CORRER Comando Container VUE PARAMETRO Colegio (docker run -it)"
    echo -e "\t7. CORRER Comando Container REACT PARAMETRO Colegio (docker run -it)"
    echo -e "\t9. Ejecutar Comando Container MARIADB IMPORTAR GENERAL (docker exec -i)"
    
    echo -e "\n\t--- SERVICIO LOTE ---\n"
    
	echo -e "\t11. Crear Container LOTE Colegio (docker create)"
    echo -e "\t12. Iniciar Container LOTE Colegio (docker start)"
    echo -e "\t13. Mostrar LOGs Container LOTE Colegio (docker logs)"
    echo -e "\t14. Detener Container LOTE Colegio (docker stop)"
    
    get_menu_opciones_network

    echo -e "\n\t--- ELIMINAR NEST- LOTE ---\n"

    echo -e "\t51.- Eliminar Contenedores LOTE  "
    echo -e "\t52.- Eliminar Imagenes LOTE  "
    echo -e "\t53.- Verificar Eliminacion Imagen/Contenedores LOTE  "
    echo -e "\t54.- Verificar History Imagen LOTE  "

    get_menu_opciones_auxiliares_generales

    echo -e "\n\t0. SALIR\n\n"
    
    read -p "Escoja una Opcion: " opcion_lote
}



while [ 1 ]
do

    get_menu_opciones_lote

    case $opcion_lote in
        0)
            clear;
            echo -e "Proceso terminado correctamente..."
            break ;;
            
        1)  exec_build_image_lote ;;
        2)  exec_correr_contenedor_consola_general ;;  
        3)  exec_run_parametro_general ;;
        4)  exec_run_mariadb_lote ;;
        5)  exec_run_nest_lote ;;
        6)  exec_run_vue_lote ;;
        7)  exec_run_react_lote ;;
        9)  exec_correr_container_import_mariadb ;;

        11)  exec_create_container_lote ;;
        12)  exec_start_container_lote ;;
        13)  exec_logs_container_lote ;;
        14)  exec_stop_container_lote ;;

        21)  exec_create_network ;;            
        22)  exec_verificar_network ;;
        23)  exec_eliminar_network ;;

        51)  exec_eliminar_contenedor_lote ;;            
        52)  exec_eliminar_imagen_lote ;;
        53)  get_verificar_eliminacion_general ;;        
        54)  exec_history_imagen_lote ;;
        
        991)  exec_logs_container_exited_general ;;
        992)  exec_inspeccionar_image_container_general ;;
        993)  exec_attach_container_consola_general ;;

        *)  echo -e "Seleccion Incorrecta" ;;
    esac

echo -e "Presione la tecla Enter para continuar"

read linea_lote

done