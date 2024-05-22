
[General]
Version=1

[Preferences]
Username=
Password=2246
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=
Name=OWNS
Count=400

[Record]
Name=SERIAL_NUMBER
Type=NUMBER
Size=
Data=List(select SERIAL_NUMBER from Item)
Master=

[Record]
Name=SOLDIER_ID
Type=NUMBER
Size=
Data=List(select SOLDIER_ID from Soldier)
Master=

