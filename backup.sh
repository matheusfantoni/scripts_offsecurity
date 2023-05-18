#!/bin/bash

#####################
# ROTINA DE BACKUP  #
#####################

#Do quê será feito o backup:
backup_files="/var/www/html"
dest="/mnt/backup"

#Destino do backup:
day=$(date +%A)
hostname=$(hostname -s)
archive_file="$hostname-$day.tgz"

#Mensagem de início de backup:
echo "Realizando backup $backup_files para $dest/$archive_file"

#Comprimindo arquivos usando tar:
tar czf $dest/$archive_file $backup_files

#Mensagem de fim do backup:
echo "Backup finalizado!"

#Mensagem de verificação de hash:
echo "md5sum para check:"
md5sum $dest/$archive_file

#Listando arquivos em $dest para checar tamanho dos arquivos:
ls -lh $dest
