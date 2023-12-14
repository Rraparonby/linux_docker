#!/bin/bash

#----------------------------------- VARIABLES MARIADB---------------------------

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
 
# BUILD IMAGES
base_path_mariadb="./01_colegio_mariadb"


#----------------------------------- VARIABLES SPRING-BOOT ---------------------------

opcion_spring=0
linea_spring=""

new_name_image_spring="me_colegio_spring:0.1";
#message_spring="Hola nuevo container" 

share_code_host_spring="/02_code/"   # ${PWD}${share_host_spring}
share_code_container_spring="/home/me_apps/"

share_host_spring="/03_sharing/"   # ${PWD}${share_host_spring}
share_container_spring="/home/sharing/"

name_container_spring="me_colegio_spring_c01"                     
#id_container_spring="daddb910e6cf"

#id_image_spring="d93c8e1f7e02" 

config_host_spring="localhost"
config_port_spring="3000"
port_container_spring="3000"


#------- Usuario en Container SO -----------
user_name_spring="bydan_lnmn"     # root, node, bydan_lnmn
user_uid_spring=0   # id -u $USER, root=0, gradle=1000, bydan_lnmn=1001
user_guid_spring=0  # id -g $USER, root=0, gradle=1000, bydan_lnmn=1001

# BUILD IMAGES
base_path_spring="./02_colegio_spring"


#----------------------------------- VARIABLES REACT ---------------------------

opcion_react=0
linea_react=""

new_name_image_react="me_colegio_react:0.1";
#message_react="Hola nuevo container" 

share_code_host_react="/02_code/"   # ${PWD}${share_host_react}
share_code_container_react="/home/me_apps/"
share_code_container_react_modules="/home/me_apps/colegio_react/node_modules/"

share_host_react="/03_sharing/"   # ${PWD}${share_host_react}
share_container_react="/home/sharing/"

name_container_react="me_colegio_react_c01"
#id_container_react="daddb910e6cf"

#id_image_react="d93c8e1f7e02" 

config_host_react="localhost"
config_port_react="3007"      #"3000", "5173"
port_container_react="3007"   #"3000", "5173"


#------- Usuario en Container SO -----------
user_name_react="bydan_lnmn"     # root, node, bydan_lnmn
user_uid_react=1001   # id -u $USER, root=0, node=1000, bydan_lnmn=1001
user_guid_react=1001  # id -g $USER, root=0, node=1000, bydan_lnmn=1001

# BUILD IMAGES
base_path_react="./03_colegio_react"