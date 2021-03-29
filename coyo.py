import http.client
import json
import datetime
import os

import psycopg2
from psycopg2.extras import execute_values
from dotenv import load_dotenv



def main():
    # LOAD ENVIRONMENT VARIABLES
    load_dotenv()
    COYO_USERNAME = os.environ.get("COYO_USERNAME")
    COYO_PASSWORD = os.environ.get("COYO_PASSWORD")
    COYO_BASIC_AUTH_SECRET = os.environ.get("COYO_BASIC_AUTH_SECRET")
    print(COYO_USERNAME)
    print(COYO_PASSWORD)
    print(COYO_BASIC_AUTH_SECRET)

    # Create HTTP Client
    conn = http.client.HTTPSConnection("coyotraining.coyocloud.com")

    # Create API Token
    requestType = "POST"
    endpoint = "/api/oauth/token?access_token="
    payload = "grant_type=password&username={}&password={}".format(COYO_USERNAME, COYO_PASSWORD)
    headers = {
        'authorization': "Basic " + COYO_BASIC_AUTH_SECRET,
        'content-type': "application/x-www-form-urlencoded",
        'cache-control': "no-cache",
        }

    conn.request(requestType, endpoint, payload, headers)
    res = conn.getresponse()
    token = json.loads(res.read().decode("UTF-8"))["access_token"]

    # GET DATA
    # add optional params, pagesize/inactiveusers/adminFields
    # TODO: if max pagesize < amount of users, repeat this for each page
    requestType = "GET"
    endpoint="/api/users?_pageSize=1000&includeInactiveUsers=true&with=adminFields" 
    headers={
        'authorization':'Bearer ' + token,
        'content-type': "application/x-www-form-urlencoded",
        'cache-control': "no-cache",
        }

    conn.request(requestType, endpoint, payload, headers)

    res = conn.getresponse()
    data = json.loads(res.read().decode("UTF-8"))
    
    # Prepare Data Values as Array of Tuples for Postgresql Multiple Value Insert
    users = data["content"]
    dataValues = []

    for user in users:        
        # Extract name, email, date
        name = user["displayName"]
        email = user["email"]
        date = 0
        try:
            date = user["lastLogin"]
        except KeyError:
            pass
        last_login = datetime.datetime.fromtimestamp(date / 1e3)

        # Create Tuple with Insert Data as Tuple
        val = (name, email, last_login)
        dataValues.append(val)

    # Insert Data
    try: 
        # Create Connection
        connection = psycopg2.connect(user=os.environ.get("DB_USER"),
                                    password=os.environ.get("DB_PASSWORD"),
                                    host=os.environ.get("DB_HOST"),
                                    port=os.environ.get("DB_PORT"),
                                    database=os.environ.get("DB_DB"))

        cursor = connection.cursor()

        # Create Query
        query = 'INSERT INTO coyo_users (name, email, last_login) VALUES %s'

        # Batch Execute Query with dataValue Array
        execute_values(cursor, query, dataValues)

        # Commit Data
        connection.commit()

        #Log
        count = cursor.rowcount
        print(count, "Record inserted successfully into users table")

    except (Exception, psycopg2.Error) as error:
        print("Failed to insert record into users table: ", error)


    finally:
        # closing database connection.
        if connection:
            cursor.close()
            connection.close()
            print("PostgreSQL connection is closed")


if __name__ == "__main__":
    main()