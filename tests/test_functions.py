import importlib

from sample_app.functions import add  # noqa: E402


def test_add_positive_numbers():
    assert add(2, 3) == 5


def test_add_negatives():
    assert add(-2, -3) == -5


def test_add_mixed_signs():
    assert add(-2, 3) == 1


def test_add_zero():
    assert add(0, 0) == 0


def test_package_imports():
    # Basic sanity check that package can be imported
    pkg = importlib.import_module("sample_app")
    assert hasattr(pkg, "__version__")
