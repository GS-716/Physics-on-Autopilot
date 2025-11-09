VENDOR = ROOT / "vendor"
OUTREACH = VENDOR / "notebooks-collection-opendata"
REPO_URL = "https://github.com/atlas-outreach-data-tools/notebooks-collection-opendata.git"

def ensure_repo():
    VENDOR.mkdir(parents=True, exist_ok=True)
    if OUTREACH.exists():
        subprocess.check_call(["git", "pull", "--ff-only"], cwd=str(OUTREACH))
    else:
        subprocess.check_call(["git", "clone", "--depth", "1", REPO_URL, str(OUTREACH)])
