import pickle
from pathlib import Path


def load_model(path: str):
    model_path = Path(path)
    if not model_path.is_file():
        raise FileNotFoundError(f"Model file not found: {model_path}")

    with model_path.open("rb") as file:
        return pickle.load(file)
