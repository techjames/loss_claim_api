import pytest
from app import app

@pytest.fixture
def client(request):
    test_client = app.test_client()

    def teardown():
        pass

    request.addfinalizer(teardown)
    return test_client


def test_endpoint_line_of_business(client):
    response = client.get('/reports/large-loss/1')
    assert b'commercial' in response.data

def test_endpoint_average_premium(client):
    response = client.get('/reports/large-loss/1')
    assert b'average premium' in response.data
    assert response.status_code == 200

def test_endpoint_invalid(client):
    response = client.get('/reports/large-loss/z')
    assert response.status_code == 404