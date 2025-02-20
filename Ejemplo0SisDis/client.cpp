#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include "utils.h"
#include "operaciones.h"

int main(int argc, char** argv){
    //iniciar conexion
    auto serverConection=initClient("127.0.0.1", 60000);   //ip de localhost
    
    /*//mensaje al servidor
    std::string mensaje="Hola server desde cliente\n";  //mensaje de tipo string
    
    //empaquetar mensaje
    std::vector<char> msgOut;
    msgOut.resize(mensaje.length());    //reservar espacio para pasar un vector de string a un vector de char
    std::copy(mensaje.begin(), mensaje.end(), msgOut.begin());  //copia datos desde el inicio del mensaje hasta el final, en el principio de msgOut
    //enviar mensaje
    sendMSG(serverConection.serverId,msgOut);*/
    //cerrar conexion

    operacion_t op;
    op.tipoOperacion=opSumaInt;
    op.sumaInt.operando1=5;
    op.sumaInt.operando2=7;

    std::vector<unsigned char> rpcOut;
    empaquetaOperacion(rpcOut, op);

    sendMSG(serverConection.serverId, rpcOut);
    std::vector<int>res;
    recvMSG(serverConection.serverId, res);
    std::cout<<"El resultado es "<<res[0]<<"\n";

    op.tipoOperacion=opSumaVector3Int;
    for(int i=0; i<3; i++){
        op.sumaVector3Int.operando1[i]=i;
        op.sumaVector3Int.operando2[i]=i;
    }
    rpcOut.resize(0);   //eliminar el rpcOut anterior //rpcOut.pop_back() solo elimina el ultimo y resize todo
    empaquetaOperacion(rpcOut, op);

    sendMSG(serverConection.serverId, rpcOut);
    res.resize(0);  //libera el rpcOut anterior
    recvMSG(serverConection.serverId, res);

    std::cout<<"El segundo resultado es ";

    for(auto &r:res){   //da una variable r que está apuntando al vector res de tipo auto// recorre de 0 a 3 y muestra el valor de los vectores
        std::cout<<r<<",";
    }
    std::cout<<"\n";

    closeConnection(serverConection.serverId); //si no se cierra ocupa memoria del cliente

    return 0;
}