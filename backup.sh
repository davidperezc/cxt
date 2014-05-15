#!/bin/sh
BACKUP_DIR="/home/backup"
BACKUP_LIST="user1"

funcPermisos()
{
	chown -R $usuario:$usuario $BACKUP_DIR/$filename
}


if [ -z $BACKUP_DIR ]; then
	BACKUP_DIR="/BACKUP"
fi
if [ -n $BACKUP_LIST ]; then
	IFS=',';for user in $BACKUP_LIST;
	do
		DIR_COPIA=/home/$usuario
		date=`date '+%Y-%B-%d:%H:%M:%S'`
		if [ -d $DIR_COPIA ]; then
			filename="$user-$date-tgz"
			tar -czf $BACKUP_DIR/$filename $DIR_COPIA
			echo "Backup echo"
			funcPermisos
		else
			echo "Error backup"
		fi
	done
fi
