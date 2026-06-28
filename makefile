# Makefile for Green Shield

.PHONY: help install train test api clean

help:
	@echo "Available commands:"
	@echo "  make install    Install dependencies"
	@echo "  make train      Train the model"
	@echo "  make test       Run tests"
	@echo "  make api        Start API server"
	@echo "  make clean      Clean temporary files"

install:
	pip install -r requirements.txt

train:
	python scripts/train_model.py --config config/config.yaml --data_dir data/processed --raw_dir data/raw

test:
	pytest tests/

api:
	python scripts/deploy_api.py --host 127.0.0.1 --port 8000

clean:
	find . -type d -name "__pycache__" -exec rm -rf {} +
	find . -type f -name "*.pyc" -delete