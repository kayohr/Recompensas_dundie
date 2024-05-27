.PHONY: install virtualenv ipython clean test


install:
	@echo "Installing for dev environment"
	@python -m pip install -e '.[dev]'


virtualenv:
	@python -m pip -m venv .venv


ipython:
	@ipython

test:
	@pytest -s -vvv

watch:
	# @.venv/bin/ptw
	@ls **/*.py | entr pytest


clean:            ## Clean unused files.
	@find ./ -name '*.pyc' -exec rm -f {} \;
	@find ./ -name '__pycache__' -exec rm -rf {} \;
	@find ./ -name 'Thumbs.db' -exec rm -f {} \;
	@find ./ -name '*~' -exec rm -f {} \;
	@rm -rf .cache
	@rm -rf .pytest_cache
	@rm -rf .mypy_cache
	@rm -rf build
	@rm -rf dist
	@rm -rf *.egg-info
	@rm -rf htmlcov
	@rm -rf .tox/
	@rm -rf docs/_build