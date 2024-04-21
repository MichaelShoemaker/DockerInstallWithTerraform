import datetime


current_datetime = datetime.datetime.now()

formatted_datetime = current_datetime.strftime("%Y-%m-%d_%H-%M-%S")

file_name = f"{formatted_datetime}.txt"

with open(file_name, "w") as file:
    file.write("This file was created at: " + formatted_datetime)