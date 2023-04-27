import schedule
import time

def job():
    print("I'm working...")
    return

schedule.every(1).seconds.do(job)

while True:
    schedule.run_pending()
    time.sleep(1) # wait one sec