from app import db

def test_create_data(test_client, init_database):
    from app.models import Data
    data = Data(name="Test field name")
    db.session.add(data)
    db.session.commit()
    
    assert data.id is not None
    retrieved_data = db.session.get(Data, data.id)
    assert retrieved_data is not None
    assert retrieved_data.name == "Test field name"
