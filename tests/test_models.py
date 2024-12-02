from app import db

def test_create_data(test_client, init_database):
    from app.models import Data
    data = Data(name="Test field name")
    db.session.add(data)
    db.session.commit()
