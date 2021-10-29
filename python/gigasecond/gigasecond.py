from datetime import datetime, timedelta


def add(moment: datetime) -> datetime:
    return moment + timedelta(seconds=int(1e9))
