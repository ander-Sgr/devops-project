import pytest
from app import create_app, db
from app.models import db

@pytest.fixture(scope='module')
def test_client():
    app = create_app('testing')
    with app.test_client as client:
        with app.app_context():
            db.create_all()
        yield client
        with app.app_context():
            db.drop_all()

@pytest.fixture(scope="function")
def init_database():
    """
    This fixture initialice and clean the db for eeach test
    """
    with create_app("testing").app_context():
        db.create_all()
        yield
        db.session.remove()
        db.drop_all()