def test_create_data(test_client):
    from app.models import Data
    data = Data(name="Test field name")
    db.session.add(data)
    db.session.commit()
    
    result = Data.query.first()
    assert result is not None
    assert result.name == "Test field name"
    