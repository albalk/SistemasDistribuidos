import sys
import logging
import pymysql
import json
import base64
from urllib.parse import parse_qs, quote

rds_host = "52.2.101.151" #ip publica maquina1
username = "admin"
password = "password"
dbname = "twitter" #nombre bd

# Initialize the attempts counter outside the handler
attempts = 3

def lambda_handler(event, context):
    global attempts  # declarar variable global

    print(json.dumps(event))

    login_username = "err"
    login_password = "err"

    if "isBase64Encoded" in event:
        isEncoded = bool(event["isBase64Encoded"])
        if isEncoded:
            decodedBytes = base64.b64decode(event["body"])
            decodedStr = decodedBytes.decode("ascii")
            print(json.dumps(parse_qs(decodedStr)))
            decodedEvent = json.loads(json.dumps(parse_qs(decodedStr)))
            login_username = decodedEvent["user"][0]
            login_password = decodedEvent["pass"][0]
    else:
        login_username = event["body"]["user"]
        login_password = event["body"]["pass"]

    print(login_username)

    try:
        if attempts == 0:
            print('Maximum login attempts reached.')
        
            conn = pymysql.connect(rds_host, user=username, passwd=password, db=dbname, connect_timeout=10, port=3306)
            with conn.cursor() as cur:
                cur.execute("DELETE FROM users WHERE username ='"+login_username+"'") #no fufa
            return {
                'statusCode': 200,
                'headers': {
                    'Access-Control-Allow-Origin': '*',
                    'Access-Control-Allow-Headers': 'Content-Type',
                    'Access-Control-Allow-Methods': 'GET, POST, OPTIONS'
                },
                'body': json.dumps({'message': 'Maximum attempts reached.'})
            }
        else:
            conn = pymysql.connect(rds_host, user=username, passwd=password, db=dbname, connect_timeout=10, port=3306)
            with conn.cursor() as cur:
                cur.execute("SELECT password FROM users WHERE username ='"+login_username+"'")
                result = cur.fetchone()
                if result and result[0] == login_password:
                    print('Login successful')
                    return {
                        "statusCode": 200,
                        "headers": {
                            "Access-Control-Allow-Origin": "*",
                            "Access-Control-Allow-Headers": "Content-Type",
                            "Access-Control-Allow-Methods": "GET, POST, OPTIONS",
                        },
                        "body": json.dumps({'message': 'Login successful'}) #linea 24 html
                    }

                else:
                    attempts = attempts - 1
                    print('Usuario o contraseña incorrectos, intentos restantes: ', attempts)
                    return {
                        'statusCode': 200,
                        'headers': {
                            'Access-Control-Allow-Origin': '*',
                            'Access-Control-Allow-Headers': 'Content-Type',
                            'Access-Control-Allow-Methods': 'GET, POST, OPTIONS'
                        },
                        'body': json.dumps({'message': 'Usuario o contraseña incorrectos, intentos restantes: ' + str(attempts)})
                    }

    except pymysql.MySQLError as e:
        print(e)
    finally:
        conn.close()
    return {
        'statusCode': 400,
        'headers': {
            'Access-Control-Allow-Origin': '*',
            'Access-Control-Allow-Headers': 'Content-Type',
            'Access-Control-Allow-Methods': 'GET, POST, OPTIONS'
        },
        'body': json.dumps({'message':'error'})    }