# vars
DOCKER_COMPOSE = docker-compose
APP_SERVICE = app
TEST_SERVICE = env_test
COVERAGE_REPORT_URL = http://localhost:8000

# commands
.PHONY: help runs tests coverage stop clean

help:
	@echo "Commands availables:"
	@echo	" run		   	- up the main service (app)"
	@echo	" tests			- runs the service of testing"
	@echo	" coverage		- URL for open the report coverage on your browser"
	@echo	" stop			- stops and delete the containers."
	@echo	" clean			- delete the volumes and clean the envarioment"

run:
	$(DOCKER_COMPOSE) up -d $(APP_SERVICE)

tests:
	$(DOCKER_COMPOSE) up -d --build $(TEST_SERVICE)
	$(DOCKER_COMPOSE) exec $(TEST_SERVICE) pytest --cov=$(APP_SERVICE) --cov-report=html

coverage:
	@echo $(COVERAGE_REPORT_URL)

stop:
	$(DOCKER_COMPOSE) down

clean: stop
	$(DOCKER_COMPOSE) down --volumes --remove-orphans

# docker-compose exec env_test pytest --cov=app --cov-report=html