# tests/conftest.py
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent  # repo root
SRC = ROOT / "app"  # package lives at repo root (sample_app/)
if str(ROOT) not in sys.path:
    # ensure repo root is importable so "import sample_app" works
    sys.path.insert(0, str(ROOT))
