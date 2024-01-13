import sys
import logging
import pymysql
import json
import base64
from urllib.parse import parse_qs

rds_host = "18.205.0.33" #ip publica maquina1

username = "admin"
passwd ="indiana"
dbname = "calculadora"

bucketUrl = "https://oscarmarcos2023.s3.us-east-1.amazonaws.com/" #nuestro bucket

def lambda_handler(event , context):
    print(json.dumps(event));
    
    user="err";
    email="err";
    passwd="err";
    recuperacion="error";
    if "isBase64Encoded" in event:
        isEncoded=bool(event["isBase64Encoded"]);
    
        if isEncoded :
            decodedBytes = base64.b64decode(event["body"]);
            decodedStr = decodedBytes.decode("ascii") ;
            print(json.dumps(parse_qs(decodedStr)));
            decodedEvent=json.loads(json.dumps(parse_qs(decodedStr)));
            user=decodedEvent["user"][0];
            email=decodedEvent["email"][0];
            passwd=decodedEvent["password"][0];
            recuperacion=decodedEvent["recuperacion"][0];

    else:
        user=event["body"]["user"];
        email=event["body"]["email"];
        passwd=event["body"]["password"];
        recuperacion=event["body"]["recuperacion"];
        
    print(user);
  
    try:
        conn = pymysql.connect(rds_host, user=username, passwd=passwd, db=dbname, connect_timeout=10, port=3306)
        print(1);
        with conn.cursor() as cur:
            cur.execute("insert into users values('"+user+"','"+passwd+"','"+email+"','"+recuperacion+"')");
            print(2);
            conn.commit();
            print(3);
            cur.close();
            return {
            'statusCode': 200,
            'headers': { 'Access-Control-Allow-Origin' : '*' },
            'body' : 'true'    }
    except pymysql.MySQLError as e:    
        print (e)
        
        
        
    conn.close();
    print(4);
    return {
        'statusCode': 200,
        'headers': { 'Access-Control-Allow-Origin' : '*' },
        'body' : 'false'    }
