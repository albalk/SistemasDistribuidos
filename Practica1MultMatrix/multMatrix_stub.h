#pragma once
#include <vector>
#include <string>
#include <stdio.h>
#include <stdlib.h>
#include "utils.h"
#include "operaciones.h"

typedef struct matrix_t{
    int rows;
    int cols;
    int* data;
}matrix_t;

//solo se encarga de comunicaciones
class multMatrix {
    private:
        std::string ip="172.31.50.30";
        int port=60000;
        connection_t serverConection;
    public:
        multMatrix(){ //constructor
            //conectar con servidor
            serverConection=initClient(ip, port);
            multMatrixOp op=constructorOp;
            std::vector<unsigned char> rpcOut;
            std::vector<unsigned char> rpcIn;

            pack(rpcOut, op); //empaqueta la operacion

            //enviar paquete
            sendMSG(serverConection.serverId, rpcOut);
            //recibir paquete
            recvMSG(serverConection.serverId, rpcIn);

            int ok = unpack<unsigned char>(rpcIn); //desempaqueta MSG_OK
            //si no es ok error
            if(ok!=MSG_OK){
                std::cout<<"Error"<<__FILE__<<":"<<__LINE__<<"\n";
            }

        };

        ~multMatrix(){ //destructor
            //cerrar conexion
            multMatrixOp op=destructorOp;
            std::vector<unsigned char> rpcOut;
            std::vector<unsigned char> rpcIn;

            pack(rpcOut, op); //empaqueta la operacion

            //enviar paquete
            sendMSG(serverConection.serverId, rpcOut);
            //recibir paquete
            recvMSG(serverConection.serverId,  rpcIn);

            int ok = unpack<unsigned char>(rpcIn); //desempaqueta MSG_OK
            //si no es ok error
            if(ok!=MSG_OK){
                std::cout<<"Error"<<__FILE__<<":"<<__LINE__<<"\n";
            }

            closeConnection(serverConection.serverId); //cierra la conexión

        };

        matrix_t* readMatrix(const char* fileName){
            //enviar la informacion al servidor (nombre del archivo)
                //crear paquete
                multMatrixOp op=readMatrixOp;
                std::vector<unsigned char> rpcOut;
                std::vector<unsigned char> rpcIn;
                
                //empaquetar nombre de funcion
                pack(rpcOut, op);

                //empaquetar el tamaño del fichero
                int tam = strlen(fileName)+1;
                pack(rpcOut, tam);

                //empaquetar nombre del fichero
                packv(rpcOut, fileName, tam);

                //enviar paquete
                sendMSG(serverConection.serverId, rpcOut);
            
            //recibir numero de filas y columnas en la estructura
                //recibir paquete
                recvMSG(serverConection.serverId,  rpcIn);
                //crear la estructura resultado
                matrix_t* m=new matrix_t[1];
                
            //rellenarla desempaquetando datos
                //desempaqueta las dimensiones de la matriz 
                m->rows=unpack<int>(rpcIn);
                m->cols=unpack<int>(rpcIn);
                //reserva memoria para las nuevas dimensiones
                m->data=new int [m->rows * m->cols];
                //desempaqueta el contenido
                unpackv(rpcIn, m->data, m->rows * m->cols);

                //desempaquetar ok
                int ok = unpack<unsigned char>(rpcIn);
                //si no es ok error
                if(ok!=MSG_OK){
                    std::cout<<"Error"<<__FILE__<<":"<<__LINE__<<"\n";
                }
                    
                return m; 
            
        };

        matrix_t *multMatrices(matrix_t* m1, matrix_t *m2){
            //enviar la informacion al servidor (nombre de la funcion, m1, m2)
                //crear paquete
                multMatrixOp op=multMatricesOp;
                std::vector<unsigned char> rpcOut;
                std::vector<unsigned char> rpcIn;

                //empaquetar nombre de funcion
                pack(rpcOut, op);

                //empaquetar filas y columnas de m1
                pack(rpcOut, m1->rows);
                pack(rpcOut, m1->cols);
                //empaquetar el contenido de m1
                packv(rpcOut, m1->data, m1->rows * m1->cols);
                //empaquetar filas y columnas de m2
                pack(rpcOut, m2->rows);
                pack(rpcOut, m2->cols);
                //empaquetar el contenido de m2
                packv(rpcOut, m2->data, m2->rows * m2->cols);
                //enviar paquete
                sendMSG(serverConection.serverId, rpcOut);

            //recibir numero de filas y columnas en la estructura
                //recibir paquete
                recvMSG(serverConection.serverId,  rpcIn);
                //crear la estructura resultado
                matrix_t* m=new matrix_t[1];
                //al multiplicar las dimensiones de la matriz resultado son el numfilas de m1 y numColumnas de m2
                m->rows=m1->rows;
                m->cols=m2->cols;
                m->data=nullptr;
                

            //rellenarla desempaquetando datos
                //desempaquetar ok
                int ok = unpack<unsigned char>(rpcIn);

                //coger el tamaño
                    //redimensionar la variable
                    m->data=new int[m1->rows*m2->cols];
                    //desempaquetar el contenido
                    unpackv(rpcIn, m->data, m->rows * m->cols);
                //si no es ok error
                if(ok!=MSG_OK){
                    std::cout<<"Error"<<__FILE__<<":"<<__LINE__<<"\n";
                }
                    
                return m; 
        };

        void writeMatrix(matrix_t* m, const char *fileName){
            //enviar la informacion al servidor (nombre del archivo)
                //crear paquete
                multMatrixOp op=writeMatrixOp;
                std::vector<unsigned char> rpcOut;
                std::vector<unsigned char> rpcIn;

                //empaquetar nombre de funcion
                pack(rpcOut, op);
                //empaquetar filas y columnas
                pack(rpcOut, m->rows);
                pack(rpcOut, m->cols);

                //empaquetar el tamaño del fichero
                int tam = strlen(fileName)+1;
                pack(rpcOut, tam);
                //empaquetar nombre del fichero
                packv(rpcOut, fileName, tam);
                //enviar paquete
                sendMSG(serverConection.serverId, rpcOut);
            
            //recibir numero de filas y columnas en la estructura
                //recibir paquete
                recvMSG(serverConection.serverId,  rpcIn);
                
                //desempaquetar ok
                int ok = unpack<unsigned char>(rpcIn);
                //si no es ok error
                if(ok!=MSG_OK){
                    std::cout<<"Error"<<__FILE__<<":"<<__LINE__<<"\n";
                }      
        };
        
        matrix_t *createIdentity(int rows, int cols){
            //enviar la informacion al servidor (nombre de la funcion, filas, columnas)
                //crear paquete
                multMatrixOp op=createIdentityOp;
                std::vector<unsigned char> rpcOut;
                std::vector<unsigned char> rpcIn;

                //empaquetar nombre de funcion
                pack(rpcOut, op);
                //empaquetar filas y columnas
                pack(rpcOut, rows);
                pack(rpcOut, cols);
                //enviar paquete
                sendMSG(serverConection.serverId, rpcOut);

            //recibir numero de filas y columnas en la estructura
                //recibir paquete
                recvMSG(serverConection.serverId,  rpcIn);
                //crear la estructura resultado
                matrix_t* m=new matrix_t[1];
                m->rows=rows;
                m->cols=cols;
                m->data=nullptr;
                

            //rellenarla desempaquetando datos
                //desempaquetar ok
                int ok = unpack<unsigned char>(rpcIn);
                //si no es ok error
                if(ok!=MSG_OK){
                    std::cout<<"Error"<<__FILE__<<":"<<__LINE__<<"\n";
                }else{
                    //coger el tamaño
                    //redimensionar la variable
                    m->data=new int[rows*cols];
                    //desempaquetar
                    unpackv(rpcIn, m->data, m->rows * m->cols);
                }
                    
                return m; 
        };

        matrix_t *createRandMatrix(int rows, int cols){
            //enviar la informacion al servidor (nombre de la funcion, filas, columnas)
                //crear paquete
                multMatrixOp op=createRandMatrixOp;
                std::vector<unsigned char> rpcOut;
                std::vector<unsigned char> rpcIn;
                    
                //empaquetar nombre de funcion
                pack(rpcOut, op);
                //empaquetar filas y columnas
                pack(rpcOut, rows);
                pack(rpcOut, cols);
                //enviar paquete
                sendMSG(serverConection.serverId, rpcOut);

            //recibir numero de filas y columnas en la estructura
                //recibir paquete
                recvMSG(serverConection.serverId,  rpcIn);
                //crear la estructura resultado
                matrix_t* m=new matrix_t[1];
                m->rows=rows;
                m->cols=cols;
                m->data=nullptr;

            //rellenarla desempaquetando datos
                //desempaquetar ok
                int ok = unpack<unsigned char>(rpcIn);
                
                //coger el tamaño
                    //redimensionar la variable
                    m->data=new int[rows*cols];
                    //desempaquetar
                    unpackv(rpcIn, m->data, m->rows * m->cols);
                
                //si no es ok error
                if(ok!=MSG_OK){
                    std::cout<<"Error"<<__FILE__<<":"<<__LINE__<<"\n";
                }
                    
                return m; 
                    

        };

};