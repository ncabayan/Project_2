import json
import os

import pandas as pd
import numpy as np

import sqlalchemy
from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import Session
from sqlalchemy import create_engine

from flask import Flask, jsonify, render_template
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)

#Database Name: twitch_db
#localhost:5000

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/twitch_data')
def twitch_data():
    connection_string = 'mysql+pymysql://root:Ancestorcool123@localhost/twitch_db'
    engine = create_engine(connection_string)

    df = pd.read_sql('select * from twitch_overall',engine)

    #data = {}
    #for i in df.columns:
    #    data[i] = df[i].values.tolist()

    return jsonify(json.loads(df.to_json(orient='records')))

if __name__ == '__main__':
    app.run(debug=True)