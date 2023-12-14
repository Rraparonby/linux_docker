#!/bin/bash

#----------------------------------- VARIABLES ---------------------------

opcion_mariadb=0
linea_mariadb=""

name_image_mariadb="mariadb:10.7.6-focal"
name_container_mariadb="me_colegio_mariadb_c01"

config_host_mariadb="127.0.0.1"
config_port_mariadb="3307"
config_db_mariadb="2015_colegio_relaciones"

config_user_mariadb="root"
config_password_mariadb="root"
config_path_data_mariadb="/01_data/dev/"
config_path_backup_mariadb="/03_backups/dev/2015_colegio_relaciones_221120.sql"

port_container_mariadb="3306"

share_host_mariadb="/02_sharing"   # ${PWD}${share_host_mariadb}
share_container_mariadb="/home/sharing/"

#id_container_mariadb="5186da889cd8";
#id_image_mariadb="159a32906318";
 

# CORRER COMANDOS
base_path_mariadb="./01_colegio_mariadb"

#----------------------------------- FUNCIONES ---------------------------

get_menu_opciones_mariadb() {
    clear
    #echo ${PWD}
    echo -e "\t\t\t----------- MARIA-DB - HOST-PC"
    echo -e "\n\t(1-11-12-3-13-51-52) / (1-2-3-13-51-52) / (21-23) / (3-4-5)"

    echo -e "\n\t--- COMANDOS MARIADB ---\n"

	echo -e "\t1. Descargar Imagen MariaDB (docker pull)"
    echo -e "\t-----------------------------------------"
    echo -e "\t2. Correr Imagen MariaDB (docker run)"
    echo -e "\t3. Correr Contenedor Interactivo MariaDB (docker exec)"
    echo -e "\t4. Correr Contenedor Conexion MariaDB (docker exec)"
    echo -e "\t5. Conectar Host MariaDB (mariadb -h -u -p)"
    
    echo -e "\n\t--- SERVICIO MARIADB ---\n"

    echo -e "\t11. Crear Container MariaDB (docker create)"
    echo -e "\t12. Iniciar Container MariaDB (docker start)"
    echo -e "\t13. Detener Container MariaDB (docker stop)"

    get_menu_opciones_network

    echo -e "\n\t--- ELIMINAR MARIADB ---\n"

    echo -e "\t51.- Eliminar Contenedor MariaDB "
    echo -e "\t52.- Eliminar Imagen MariaDB "
    echo -e "\t53.- Verificar Eliminacion Imagen/Contenedor MariaDB "

    #echo -e "\n\tAYUDA"
    #echo -e "\t\t81. Ayuda Cd-ROM 1(Log,Eject)"

    echo -e "\n\t0. SALIR\n\n"
    
    read -p "Escoja una Opcion: " opcion_mariadb
}


#---------------------------------------- COMANDOS ------------------------------------


get_descargar_image_mariadb() {
	clear	
    echo -e "----------- 1. Descargar Imagen MariaDB (docker pull) -------------"
    echo
    
    docker pull ${name_image_mariadb}
}  

exec_run_mariadb() {
	clear	
    echo -e "----------- 2. Correr Imagen MariaDB (docker run) -------------"
    echo
    
    # -d

    comando1=""
    read -p "Ingrese Comando (bash,ls): " comando1

    docker run -it --rm \
                --name ${name_container_mariadb} \
                -p ${config_port_mariadb}:${port_container_mariadb} \
                --network ${network_name} \
                -e MYSQL_ROOT_PASSWORD=${config_password_mariadb} \
                -v ${PWD}${config_path_data_mariadb}:/var/lib/mysql \
                -v ${PWD}${share_host_mariadb}:${share_container_mariadb} \
                ${name_image_mariadb} ${comando1}
    #Running...
}

exec_correr_container_consola_mariadb() {
	clear	
    echo -e "----------- 3. Correr Contenedor Interactivo MariaDB (docker run) -------------"
    echo ${name_container_mariadb}
    
    docker exec -it ${name_container_mariadb} \
                bash

    #docker run  -it --rm \
    #            --name ${name_container_mariadb}_02 \
    #            -p ${config_port_mariadb}:${port_container_mariadb} \
    #            --network ${network_name} \
    #            -e MYSQL_ROOT_PASSWORD=${config_password_mariadb} \
    #            -v ${PWD}${config_path_data_mariadb}:/var/lib/mysql \
    #            -v ${PWD}${share_host_mariadb}:${share_container_mariadb} \
    #            ${name_image_mariadb} \
    #            bash

    # mariadb -h 08053668bdaf -P 3306 --protocol=tcp -u root -p
    # mariadb -h 127.0.0.1 -P 3306 --protocol=tcp -u root -p
    # mariadb -h localhost -P 3306 --protocol=tcp -u root -p
}

exec_correr_container_import_mariadb() {
    clear   
    echo -e "----------- 3. Correr Contenedor Importar MariaDB (docker exec) -------------"
    echo ${name_container_mariadb}
    
    # En Lote se Aplica en la mayoria, aqui es excepcion
    cd ${base_path_mariadb}

    # Crear DB
    docker exec -i ${name_container_mariadb} \
                mysql -u${config_user_mariadb} -p${config_password_mariadb} \
                -D mysql -e "CREATE DATABASE IF NOT EXISTS ${config_db_mariadb}  CHARACTER SET utf8 COLLATE utf8_general_ci;"

    # Crear TABLES / DATA
    docker exec -i ${name_container_mariadb} \
                mysql -u${config_user_mariadb} -p${config_password_mariadb} \
                ${config_db_mariadb} < ${PWD}${config_path_backup_mariadb}

    cd ..
}

exec_correr_container_conexion_mariadb() {
	clear	
    echo -e "----------- 4. Correr Contenedor Conexion MariaDB (docker exec) -------------"    
    
    docker exec -it ${name_container_mariadb} \
                mariadb \
                --user root \
                -p
}

exec_conectar_container_mariadb() {
	clear	
    echo -e "----------- 5. Conectar Contenedor MariaDB (mariadb -h -u -p) -------------"
    echo
    
    mariadb -h ${config_host_mariadb} \
            --port ${config_port_mariadb} \
            -u ${config_user_mariadb} \
            -p
}



#---------------------------------------- SERVICIO ------------------------------------

exec_create_container_mariadb() {
	clear
	
    echo -e "----------- 11. Crear Container MariaDB (docker create) -------------"
    echo

    # --rm

    docker create   --name ${name_container_mariadb} \
                    -p ${config_port_mariadb}:${port_container_mariadb} \
                    --network ${network_name} \
                    -e MYSQL_ROOT_PASSWORD=${config_password_mariadb} \
                    -v ${PWD}${config_path_data_mariadb}:/var/lib/mysql \
                    -v ${PWD}${share_host_mariadb}:${share_container_mariadb} \
                    ${name_image_mariadb}
    
    # --rm = Se elimina Container cuando se detiene o docker stop
}

exec_start_container_mariadb() {
	clear
	
    echo -e "----------- 12. Iniciar Container MariaDB (docker start) -------------"
    echo    

    docker start ${name_container_mariadb}
}

exec_logs_container_mariadb() {
	clear
	
    echo -e "----------- 13.000. Mostrar LOGs Container MariaDB (docker logs) -------------"
    echo    

    xfce4-terminal -e "docker logs --follow ${name_container_mariadb}"
}

exec_history_imagen_mariadb() {
	#clear	
    echo -e "----------- 54. Mostrar HISTORY Imagen MariaDB (docker history) -------------"
    echo    

    docker history ${name_image_mariadb}
}

exec_stop_container_mariadb() {
	clear
	
    echo -e "----------- 13. Detener Container MariaDB (docker stop) -------------"
    echo    

    docker stop ${name_container_mariadb}
}

#---------------------------------------- VER / ELIMINAR ------------------------------------

exec_eliminar_container_mariadb() {
	clear	
    echo -e "----------- 51.- Eliminar Contenedor MariaDB -------------"
    echo
    
    id_container2=""
    read -p "Ingrese Sufijo Id Container: " id_container2

    docker stop ${name_container_mariadb}${id_container2}
    docker rm ${name_container_mariadb}${id_container2}

    echo -e "Contenedor Eliminado..... "
}

exec_eliminar_image_mariadb() {
	clear	
    echo -e "----------- 52.- Eliminar Imagen MariaDB -------------"
    echo
    
    id_image2=""
    read -p "Ingrese Sufijo Id Image: " id_image2

    docker rmi -f ${name_image_mariadb}${id_image2}

    echo -e "Imagen Eliminada..... "
}