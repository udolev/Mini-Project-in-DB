import random
import string

# Function to generate a random company name
def random_company_name():
    return random.choice(["Apple", "Microsoft", "Amazon", "Google", "Facebook", "Tesla", "Walmart", "NVIDIA", 
    "Visa", "Mastercard", "Disney", "Nike", "PayPal", "Intel", "HomeDepot", "Verizon", 
    "Comcast", "Netflix", "Adobe", "Salesforce", "Oracle", "Cisco", "Chevron", "ExxonMobil", 
    "Costco", "Starbucks", "IBM", "GoldmanSachs", "Qualcomm", "Medtronic", "Boeing", 
    "UnionPacific", "Target", "Amgen", "Pfizer", "UPS", "Ford", "Caterpillar", "Honeywell", 
    "Citigroup", "Aflac", "Paccar", "Broadcom", "Corning", "Halliburton", "Humana", 
    "EmersonElectric", "Altria", "Manulife", "Telus", "BlackBerry", "Bombardier", 
    "CanopyGrowth", "Enbridge", "BarrickGold", "LundinMining", "Cameco", "ImperialOil", 
    "Metro", "Dollarama", "SpinMaster", "Roots", "Dollarama", "CanadianTire", "OnexCorporation", 
    "OpenText", "Nordion", "Hexo", "Tilray", "AuroraCannabis", "Organigram", "AuxlyCannabisGroup", 
    "WeedMD", "MedMenEnterprises", "CrescoLabs", "CuraleafHoldings", "MolsonCoors", 
    "BostonProperties", "PublicStorage", "Prologis", "Internationa", "GameStop", "Petco", 
    "Chewy", "AutoZone", "OReillyAutoParts", "BestBuy", "BigLots", "PartyCity", "FootLocker", 
    "HibbettSports", "TractorSupply", "HarborFreightTools", "BarnesNoble", "BooksAMillion", 
    "Hollister", "AmericanEagle", "Gap", "J.Crew", "Fossil", "Champion", "Wrangler", 
    "Timberland", "NorthFace", "VF", "ClarksShoes", "Hermes", "Gucci", "Prada", "Fendi"
])

# Function to generate a random email
def random_email(company_name):
    domains = ["example.com", "mail.com", "company.com", "business.com"]
    return f"{company_name.lower()}@{random.choice(domains)}"

# Function to generate a random location
def random_location():
    locations = ["New York", "Los Angeles", "Chicago", "Houston", "Phoenix",
                 "Philadelphia", "San Antonio", "San Diego", "Dallas", "San Jose"]
    return random.choice(locations)

# File to write the SQL insert statements
with open('insert_suppliers.sql', 'w') as file:

    for i in range(1, 401):  # Generate 400 suppliers
        company_name = random_company_name()
        email = random_email(company_name)
        location = random_location()
        company_id = i

        # Create the SQL insert statement
        insert_statement = (
            f"INSERT INTO Supplier (Company_Name, Email, Location, Company_ID) "
            f"VALUES ('{company_name}', '{email}', '{location}', {company_id});\n"
        )

        # Write the insert statement to the file
        file.write(insert_statement)

    file.write('COMMIT;\n')  # Commit transaction

print('insert_suppliers.sql file created successfully.')