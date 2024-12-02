import pytest
from app import create_app, db

# fixture for create and configure the client testing
@pytest.fixture(scope='module')
def test_client():
    app = create_app('testing')
    # give the context
    with app.app_context():
        db.create_all()  # Create the database for the tests
    with app.test_client() as client:
        yield client  # Allows the cliente use the env test
    with app.app_context():
        db.drop_all()  # Delelte the tables after the tests

# initialice and clean the db for each test
@pytest.fixture(scope="function")
def init_database():
    with create_app("testing").app_context():
        db.create_all()  # Create the table for each test
        yield db  # allows the db for the tests
        db.session.remove()
        db.drop_all()  # clean the db after each test
