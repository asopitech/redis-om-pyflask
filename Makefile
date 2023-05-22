.DEFAULT_GOAL := help
.PHONY: help
help: ## <Default> Display this help 
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: py_init
py_init:
	python3 -m venv venv
	. ./venv/bin/activate
	pip install --upgrade pip
	pip install -r requirements.txt

.PHONY: py_req
py_req:
	pip freeze > requirements.txt