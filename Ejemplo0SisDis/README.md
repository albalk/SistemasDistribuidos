EC2:
	Imagen: cloud9ubuntu (version reciente)
	Instancia: t2.medium
	Keys: vockey
	Network: default
	Storage: 20 Gib
	Sumary: 2 instancias

WinSCP:
	File protocol: SCP
	Host name: IP publica de EC"
	Avanzados: Autentificación: Private key file: keys ppk
	Username: ubuntu
	Guardar

Putty:
	unzip archivo.zip
	cd archivo
	sudo apt update
	sudo apt install gcc g++ cmake make
	cmake .
	make

Autentificacion:
sudo nano /etc/ssh/sshd_config
	//buscar passwordAuth y cambiar a yes
sudo service sshd restart
sudo passwd ubuntu
	//contraseña maquina 1 y 2: ubuntu

//Copiar ip publica de la maquina2
//editar en winscp la conexión y cambiar la ip elastica de la maquina 1 por la ip publica de la maquina 2
//Hacer los pasos de autentificacion anteriores
//comprobar que funciona
ssh ubuntu@ipPrivadaMaquina1
exit

Carpeta compartida:
mkdir shared
sudo apt update
sudo apt install sshfs
	//comprobar que funciona sshfs
sshfs ubuntu@172.31.59.252:/home/ubuntu/Ejemplo0 ./shared
	//volver a cambiar la ip de la maquina a la ip publica de la maquina 1

//conectarse con ssh de la maquina 1 a la 2
ssh ubuntu@IpPrivadaMaquina2
//copiar el servidor al home
cp shared/server .

//abrir client.cpp en la maquina1
//camabiar la ip de la conexion a la ip privada de la maquina 2
//compilar
//ejecutar server en maquina 2 y client en maquina 1
