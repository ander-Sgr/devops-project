def test_insert_data(test_client):
    response = test_client.post("/data", query_string='name': 'test_insert')
    assert response.status_code == 201
    assert b"Data inserted successfully" in response.data