from app import db

class Policy(db.Model):
    __tablename__ = 'policy'
    id = db.Column(db.Integer, primary_key=True)
    description = db.Column(db.String())
    line_of_business = db.Column(db.Integer, db.ForeignKey("line_of_business.id"))
    incurred = db.Column(db.Integer)
    

    def __init__(self, description, line_of_business, incurred):
        self.description = description
        self.line_of_business = line_of_business
        self.incurred = incurred

    def __repr__(self):
        return '<id {}>'.format(self.id)
    
    def serialize(self):
        return {
            'id': self.id, 
            'description': self.description,
            'line_of_business': self.line_of_business,
            'incurred': self.incurred
        }

class LineOfBusiness(db.Model):
    __tablename__ = 'line_of_business'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String())

    def __init__(self, name):
        self.name = name

    def __repr__(self):
        return '<id {}>'.format(self.id)
    
    def serialize(self):
        return {
            'id': self.id, 
            'name': self.name
        }