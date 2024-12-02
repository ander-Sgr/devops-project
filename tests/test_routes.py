import json
from app.models import Data
def test_insert_data(test_client):
    data = {'name': 'test_insert'}
    response = test_client.post("/data",
                                data=json.dumps(data),
                                content_type='application/json')
    assert response.status_code == 201
    assert b"Data inserted successfully" in response.data