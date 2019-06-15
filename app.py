#!/usr/bin/env python

from flask import Flask, jsonify
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy.sql import func

app = Flask(__name__)

#app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://postgres:super@localhost:5432/Policies'
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://postgres:super@data:5432/Policies' #docker container
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)

# ORM module
import models

# filter threshold for incurred claims 
loss_claim = 1000000

@app.route('/reports/large-loss/<int:id>', methods=['GET'])
def get_tasks(id):

    try:
        
        line_of_business=models.LineOfBusiness.query.filter_by(id=id)
        average_premium=models.Policy.query.with_entities(func.avg(models.Policy.incurred)).filter_by(line_of_business=id). \
            filter(models.Policy.incurred>=loss_claim).scalar()
        
        num_safe = lambda x: int(average_premium) if average_premium is not None else 0

        return jsonify(["line_of_business"], [e.serialize() for e in line_of_business], [{"average premium" : num_safe(average_premium)}])
    except Exception as e:
	    return(str(e))


if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)