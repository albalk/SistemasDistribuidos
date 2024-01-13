import sys
import logging
import pymysql
import json
import base64
from urllib.parse import parse_qs

rds_host = "18.205.0.33"
username = "admin"
password = "indiana"
dbname = "calculadora"
bucketUrl = "https://oscarmarcos2023.s3.amazonaws.com/"

# Initialize the attempts counter outside the handler

def lambda_handler(event, context):
    global attempts  # Use the global variable

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
            login_password = decodedEvent["rec"][0]
    else:
        login_username = event["body"]["user"]
        login_password = event["body"]["rec"]

    print(login_username)

    try:
            conn = pymysql.connect(rds_host, user=username, passwd=password, db=dbname, connect_timeout=10, port=3306)
            with conn.cursor() as cur:
                cur.execute("SELECT recuperacion FROM users WHERE username ='"+login_username+"'")
                result = cur.fetchone()
                if result and result[0] == login_password:
                    print('Login successful')
                    cur.execute("SELECT password FROM users WHERE username ='"+login_username+"'")
                    frase = cur.fetchone()
                    return {
                        'statusCode': 200,
                        'headers': {
                            'Access-Control-Allow-Origin': '*',
                            'Access-Control-Allow-Headers': 'Content-Type',
                            'Access-Control-Allow-Methods': 'GET, POST, OPTIONS'
                        },
                        'body': json.dumps({'message': frase})
                    }
                else:
                    print('Invalid username or password, attempts left: ',)
                    return {
                        'statusCode': 200,
                        'headers': {
                            'Access-Control-Allow-Origin': '*',
                            'Access-Control-Allow-Headers': 'Content-Type',
                            'Access-Control-Allow-Methods': 'GET, POST, OPTIONS'
                        },
                        'body': json.dumps({'message': 'Wrong username or phrase'})
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