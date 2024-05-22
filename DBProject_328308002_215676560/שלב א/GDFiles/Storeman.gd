
[General]
Version=1

[Preferences]
Username=
Password=2345
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=
Name=STOREMAN
Count=10..20

[Record]
Name=SOLDIER_ID
Type=NUMBER
Size=
Data=List(select SOLDIER_ID from SOLDIER)
Master=

[Record]
Name=HOURS_PER_WEEK
Type=FLOAT
Size=22
Data=Random(0, 60)
Master=

[Record]
Name=STORE_ID
Type=NUMBER
Size=
Data=List(select STORE_ID from STORE)
Master=

