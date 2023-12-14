#!/bin/bash

opcion=0
linea=""

#===================== DOCKER COMPOSE =====================

name_file_compose="53_fullstack_prod_docker-compose.yml"    
# "5302_fullstack_prod_docker-compose_TOMCAT.yml"
# ""53_fullstack_prod_docker-compose.yml""

path_file_compose="./${name_file_compose}"

#===================== EXPORT / IMPORT =====================

idname_image_db="mariadb:10.7.6-focal"
idname_image_backend="me_colegio_spring_prod:0.1"    #"me_colegio_spring_prod:01",     "me_colegio_springtomcat_prod:01"
idname_image_frontend="me_colegio_react_prod:0.1"

idname_container_db="me_colegio_mariadb_c01"        # NO CAMBIAR, dev = prod = "me_colegio_mariadb_c01"
idname_container_backend="me_colegio_spring_cp01"       # "me_colegio_spring_cp01",   "me_colegio_springtomcat_cp01"
idname_container_frontend="me_colegio_react_cp01"

id_image_db="123456789"
id_image_backend="6859fa52b8fb"
id_image_frontend="10e23eb9b771"

id_container_db="123456789"
id_container_backend="123456789"
id_container_frontend="123456789"

#===================== GENERAL DOCKER =====================

#----- Valores Generales Auxiliar -----
idname_image=""
idname_container=""

id_image=""
id_container=""

command=""
type=""     # D, B, F ==> (D=Database, B=Backend, F=Frontend)

#----- Valores Iniciales Defecto -----
# SOLO PARA TITLE
idname_image_init="me_colegio_spring_prod:0.1"        # "me_colegio_laravel:0.1"
idname_container_init="me_colegio_spring_cp01"        # "me_colegio_mariadb_c01",   "me_colegio_laravel_c01",     "me_colegio_vue_c01"

command_init="ls"      # ls, ip address

#----- Url Web -----
host="localhost"
port="80"
path_url1=""

#----- DB ----
db="2015_colegio_relaciones"
user="root"
password="root"
path_backup="./01_colegio_mariadb/03_backups/prod/2015_colegio_relaciones_221120.sql"


get_menu_opciones() {
    clear
    echo -e "\n\t============================ DOCKER COMPOSE ============================"
    
	echo -e "\t1. Start Docker Compose (docker compose -f ${name_file_compose} up -d)"
    echo -e "\t2. Verify Docker Compose (docker compose -f ${name_file_compose} ps)"
    echo -e "\t3. Conectar Contenedor Url (curl  ${host}:${port}/${path_url1})"
    echo -e "\t4. Stop Docker Compose (docker compose -f ${name_file_compose} down --volumes)"
   
    echo -e "\n\t=========== DOCKER CONTAINER ==========="
    echo -e "\t11. Ejecutar Bash Container (docker exec -it ${idname_container_init})"
    echo -e "\t12. Ejecutar Command Container (docker exec -it ${idname_container_init} ${command_init})"
    echo -e "\t13. Ejecutar Logs Container (docker logs ${idname_container_init})"
    echo -e "\t14. Attach Container (docker attach ${idname_container_init})"
    echo -e "\t19. Ejecutar MariaDB Import Container (docker exec -i ${idname_container_init})"

    echo -e "\n\t=========== DOCKER INFORMACION ==========="
    echo -e "\t31.- Mostrar Info Imagens/Containers (docker images,ps,volume, -a)"
    echo -e "\t32.- Mostrar Info Configuration Container (docker inspect --format='{{json .Config}}' ${idname_container_init})"
    echo -e "\t33.- Mostrar Info History Image (docker history ${idname_image_init})"
    
    echo -e "\n\t=========== DOCKER DELETE ==========="
    echo -e "\t81.- Eliminar Container (docker rm ${idname_container_init})"
    echo -e "\t82.- Eliminar Image (docker rmi -f ${idname_image_init})"

    echo -e "\n\t============================ DOCKER EXTRAS ============================"
    echo -e "\t91. Export Image Docker(docker save -o ${idname_image_init}.tar ${idname_image_init})"
    echo -e "\t92. Import Image Docker(docker load < ${idname_image_init}.tar)"
    echo -e "\t93. Export Container Docker(docker export ${idname_container_init} > ${idname_container_init}.tar)"
    echo -e "\t94. Import Container Docker(docker import - ${idname_container_init} < ${idname_container_init}.tar)"
   
    echo -e "\n\t0. Salir\n\n"
    
    read -p "Escoja una Opcion: " opcion
}

#============================================ DOCKER COMPOSE ============================================
exec_start_docker_compose() {
    get_global_title "----------- 1. Start Docker Compose (docker compose -f ${name_file_compose} up -d) -------------\n"

    docker compose -f ${path_file_compose} up -d
}

exec_verify_docker_compose() {
    get_global_title "----------- 2. Verify Docker Compose (docker compose -f ${name_file_compose} ps) -------------\n"

    docker compose -f ${path_file_compose} ps
}

get_url_connect_container() {
    exec_global_title "--------- 3. Conectar Contenedor Url (curl  ${host}:${port}/${path_url1}) -------------\n"
        
    curl ${host}:${port}/${path_url1}
}

exec_stop_docker_compose() {
    get_global_title "----------- 4. Stop Docker Compose (docker compose -f ${name_file_compose} down --volumes) -------------\n"

    docker compose -f ${path_file_compose} down --volumes
}

#============================================ DOCKER ============================================
exec_bash_container() {
    get_global_title "----------- 11. Ejecutar Bash Container (docker exec -it ${idname_container_init}) -------------\n"

    get_global_name_container
    
    docker exec -it ${idname_container} bash
}

exec_command_container() {
    get_global_title "----------- 12. Ejecutar Command Container (docker exec -it ${idname_container_init} ${command_init}) -------------\n"

    get_global_name_container
    
    get_global_command

    docker exec -it ${idname_container} ${command}
}


exec_logs_container() {
    get_global_title "----------- 13. Ejecutar Logs Container (docker logs ${idname_container_init}) -------------\n"

    get_global_name_container
    
    docker logs -t ${idname_container}
}

exec_attach_container() {
    get_global_title "----------- 14. Attach Container (docker attach ${idname_container_init}) -------------\n"

    get_global_name_container
    
    docker attach ${idname_container}
}

exec_import_mariadb_container() {
    get_global_title "----------- 19. Ejecutar MariaDB Import Container (docker exec -i ${idname_container_init}) -------------\n"

    # Crear DB
    docker exec -i ${idname_container_db} \
                mysql -u${user} -p${password} \
                -D mysql -e "CREATE DATABASE IF NOT EXISTS ${db}  CHARACTER SET utf8 COLLATE utf8_general_ci;"

    # Crear TABLES / DATA
    docker exec -i ${idname_container_db} \
                mysql -u${user} -p${password} \
                ${db} < ${path_backup}

    echo -e "${db} Creado ..."
}

#============================================ DOCKER DELETE ============================================
exec_delete_container() {
    get_global_title "----------- 81.- Eliminar Container (docker rm ${idname_container_init})-------------\n"

    get_global_id_container

    docker rm ${id_container}
}

exec_delete_image() {
    get_global_title "----------- 82.- Eliminar Image (docker rmi -f ${idname_image_init})-------------\n"

    get_global_id_image

    docker rmi -f ${id_image}
}

#============================================ DOCKER EXTRAS ============================================

exec_export_image_docker() {
    get_global_title "----------- 91. Export Image Docker(docker save -o ${idname_image_init}.tar ${idname_image_init}) -------------\n"

    get_global_name_image
    
    #get_global_id_image
    #${id_image}

    docker save -o ${idname_image}.tar ${idname_image}
}

exec_import_image_docker() {
    get_global_title "----------- 92. Import Image Docker(docker load < ${idname_image_init}.tar) -------------\n"

    get_global_name_image

    sudo docker load < ${idname_image}.tar
}

exec_export_container_docker() {
    get_global_title "----------- 93. Export Container Docker(docker export ${idname_container_init} > ${idname_container_init}.tar) -------------\n"

    get_global_name_container

    docker export ${idname_container} > ${idname_container}.tar
}

exec_import_container_docker() {
    get_global_title "----------- 94. Import Container Docker(docker import - ${idname_container_init} < ${idname_container_init}.tar) -------------\n"

    get_global_name_container

    sudo docker import - ${idname_container} < ${idname_container}.tar
}

#============================================ DOCKER INFO ============================================
get_info_general_docker() {
	get_global_title "----------- 31.- Mostrar Info Imagens/Containers (docker images,ps,volume, -a) -------------\n"
    
    echo -e "======================================= IMAGES ======================================="    
    docker images   # -a = All Layers Image

    echo -e "======================================= CONTAINERS ======================================="
    docker ps -a

    echo -e "======================================= VOLUMES ======================================="
    docker volume ls

    echo -e "======================================= NETWORKS ======================================="
    docker network ls
}

get_info_configuration_container() {
	get_global_title "----------- 32.- Mostrar Info Configuration Container (docker inspect --format='{{json .Config}}' ${idname_container_init}) -------------\n"
    
    get_global_name_container
    
    docker inspect --format='{{json .Config}}' ${idname_container} | jq
}

get_info_history_image() {
	get_global_title "----------- 33.- Mostrar Info History Image (docker history ${idname_image_init}) -------------\n"
    
    get_global_name_image
    
    docker history ${idname_image}
}

#============================================ GLOBAL CODE ============================================

get_global_title() {
    clear	
    echo -e ${1}
}

get_global_name_container() {

    read -p "Ingrese Type (D=DB.B=BACK,F=FRONT): " type

    if [ "${type}" = "D" ]
    then
      idname_container=${idname_container_db}

    elif [ "${type}" = "B" ]
    then
        idname_container=${idname_container_backend}

    elif [ "${type}" = "F" ]
    then
        idname_container=${idname_container_frontend}
    fi
}

get_global_name_image() {

    read -p "Ingrese Type (D=DB.B=BACK,F=FRONT): " type

    if [ "${type}" = "D" ]
    then
      idname_image=${idname_image_db}

    elif [ "${type}" = "B" ]
    then
        idname_image=${idname_image_backend}

    elif [ "${type}" = "F" ]
    then
        idname_image=${idname_image_frontend}
    fi
}

get_global_id_container() {

    read -p "Ingrese Type (D=DB.B=BACK,F=FRONT): " type

    if [ "${type}" = "D" ]
    then
      id_container=${id_container_db}

    elif [ "${type}" = "B" ]
    then
        id_container=${id_container_backend}

    elif [ "${type}" = "F" ]
    then
        id_container=${id_container_frontend}
    fi
}

get_global_id_image() {

    read -p "Ingrese Type (D=DB.B=BACK,F=FRONT): " type

    if [ "${type}" = "D" ]
    then
      id_image=${id_image_db}

    elif [ "${type}" = "B" ]
    then
        id_image=${id_image_backend}

    elif [ "${type}" = "F" ]
    then
        id_image=${id_image_frontend}
    fi
}

get_global_command() {

    if [ -z "${command_init}" ]
    then
      read -p "Ingrese Comando (sh/bash, ls, ip address): " command
    else
        command=${command_init}
    fi
}


while [ 1 ]
do

    get_menu_opciones

    case $opcion in
    
        0)
            clear;
            echo -e "Proceso terminado correctamente..."
            break ;;
            
        1) exec_start_docker_compose ;;
        2) exec_verify_docker_compose ;;
        3) get_url_connect_container ;;
        4) exec_stop_docker_compose ;;   

        11) exec_bash_container ;;
        12) exec_command_container ;;
        13) exec_logs_container ;;
        14) exec_attach_container ;;
        19) exec_import_mariadb_container ;;

        31) get_info_general_docker ;;
        32) get_info_configuration_container ;;
        33) get_info_history_image ;;                

        81) exec_delete_container ;;
        82) exec_delete_image ;;

        91) exec_export_image_docker ;;
        92) exec_import_image_docker ;;
        93) exec_export_container_docker ;;
        94) exec_import_container_docker ;;

        *)  echo -e "Seleccion Incorrecta" ;;

    esac

echo -e "Presione la tecla Enter para continuar"
read linea

done

#------ Delete Volume -----
# docker volume rm