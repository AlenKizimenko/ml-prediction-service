import pickle


def load_model(path: str):
    with open(path, "rb") as file:
        return pickle.load(file)
