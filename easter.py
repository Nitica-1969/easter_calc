from datetime import date, timedelta
print("This program calculates the date of Easter both for Eastern and Western churches in the provided year")
print("The year you want to know the dates of Easter: ", end=' ')
year = int(input())
def W_Easter(year):
    a = year % 19
    b = year // 100
    c = year % 100
    d = b // 4
    e = b % 4
    i = c // 4
    k = c % 4
    g = (8*b + 13) // 25
    h = (19*a + b - d - g + 15) % 30
    l = (32 + 2*e + 2*i - h - k) % 7
    m = (a + 11*h + 19*l) // 433
    month = (h + l - 7*m + 90) // 25
    day = (h + l - 7*m + 33*month + 19) % 32
    Easter_date = date(year,month,day)
    print("Easter date for Western Churches is: ",Easter_date)
def E_Easter(year):
    a = year % 4
    b = year % 7
    c = year % 19
    d = (19*c + 15) % 30
    e = (2*a + 4*b - d + 34) % 7
    #julian = (3*(year // 400) + (year // 100) % 4) - 2
    julian = (year // 100) - (year // 400) - 2
    month = (d + e + 114) // 31
    day = 1 + (d + e + 114) % 31
    Easter_date = date(year,month,day) + timedelta(days = julian)
    print("Easter date for Eastern Churches is: ",Easter_date)
def Easter(year):
    a = year % 4
    b = year % 7
    c = year % 19
    d = (19*c + 15) % 30
    e = (2*a + 4*b - d + 34) % 7
    #julian = (3*(year // 400) + (year // 100) % 4) - 2
    month = (d + e + 114) // 31
    day = 1 + (d + e + 114) % 31
    Easter_date = date(year,month,day)
    print("Easter date in Julian calendar is: ",Easter_date)
if year > 1582:
    W_Easter(year)
    E_Easter(year)
else:
    Easter(year)
#julian = (year // 100) - (year // 400) - 2
#print(julian)
#julian = (3*(year // 400) + (year // 100) % 4) - 2
#print(julian)
input("Press any key to close the window...")