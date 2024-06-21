import pandas as pd
import requests
import math

# List of CSV file paths and corresponding cityIds
csv_files_and_city_ids = [
    ('Data/restaurants/Cairo restaurants.csv', "65e6225cb6ce0786d8fb22b2"),
    ('Data/restaurants/Marsa Matrouh restaurants.csv', "65e6225cb6ce0786d8fb22b7"),
    ('Data/restaurants/Gharbia restaurants.csv', "65e6225cb6ce0786d8fb22ba"),
    ('Data/restaurants/Ismailia restaurants.csv', "65e6225cb6ce0786d8fb22be"),
    ('Data/restaurants/Suez restaurants.csv', "65e6225cb6ce0786d8fb22bf"),
    ('Data/restaurants/Asyut restaurants.csv', "65e6225cb6ce0786d8fb22c6"),
    ('Data/restaurants/Aswan restaurants.csv', "65e6225cb6ce0786d8fb22cb"),
    ('Data/restaurants/Red Sea restaurants.csv', "65e6225cb6ce0786d8fb22cc"),
    ('Data/restaurants/Dakahlia restaurants.csv', "65e6225cb6ce0786d8fb22b8"),
    ('Data/restaurants/Fayoum restaurants.csv', "65e6225cb6ce0786d8fb22c4"),
    ('Data/restaurants/Sohag restaurants.csv', "65e6225cb6ce0786d8fb22c8"),
    ('Data/restaurants/Qena restaurants.csv', "65e6225cb6ce0786d8fb22c9"),
    ('Data/restaurants/Luxor restaurants.csv', "65e6225cb6ce0786d8fb22ca"),
    ('Data/restaurants/Giza restaurants.csv', "65e6225cb6ce0786d8fb22b3"),
    ('Data/restaurants/Monufia restaurants.csv', "65e6225cb6ce0786d8fb22bb"),
    ('Data/restaurants/Port Said restaurants.csv', "65e6225cb6ce0786d8fb22bd"),
    ('Data/restaurants/Al-Sharqia restaurants.csv', "65e6225cb6ce0786d8fb22c0"),
    ('Data/restaurants/South Sinai restaurants.csv', "65e6225cb6ce0786d8fb22c1"),
    ('Data/restaurants/Minya restaurants.csv', "65e6225cb6ce0786d8fb22c3"),
    ('Data/restaurants/New Valley restaurants.csv', "65e6225cb6ce0786d8fb22c7"),
    ('Data/restaurants/Qalyubia restaurants.csv', "65e6225cb6ce0786d8fb22b4"),
    ('Data/restaurants/Alexandria restaurants.csv', "65e6225cb6ce0786d8fb22b5"),
    ('Data/restaurants/Beheira restaurants.csv', "65e6225cb6ce0786d8fb22b6"),
    ('Data/restaurants/Kafr el-Sheikh restaurants.csv', "65e6225cb6ce0786d8fb22b9"),
    ('Data/restaurants/Damietta restaurants.csv', "65e6225cb6ce0786d8fb22bc"),
    ('Data/restaurants/North Sinai restaurants.csv', "65e6225cb6ce0786d8fb22c2"),
    ('Data/restaurants/Beni Suef restaurants.csv', "65e6225cb6ce0786d8fb22c5")
]


# Function to clean float values
def clean_float(value):
    if isinstance(value, float):
        if math.isnan(value) or math.isinf(value):
            return 0.0
    elif isinstance(value, str) and value.strip() == '':
        return 0.0
    try:
        return float(value)
    except ValueError:
        return 0.0


# Function to handle different types of values in 'Number of ratings' column
def clean_number_of_ratings(value):
    try:
        return int(str(value).replace(',', ''))
    except (ValueError, TypeError):
        return 0


# Function to ensure all values are JSON compliant
def clean_json_compatible(value):
    if isinstance(value, float):
        if math.isnan(value) or math.isinf(value):
            return 0.0
    return value


# Try different encodings if utf-8 fails
encodings = ['utf-8', 'cp1256', 'ISO-8859-1', 'cp1252', 'utf-32']

# Define the endpoint URL
url = 'http://localhost:3000/restaurants/addRestaurants'  # Replace with your endpoint URL

for csv_file_path, cityId in csv_files_and_city_ids:
    for encoding in encodings:
        try:
            df = pd.read_csv(csv_file_path, encoding=encoding,
                             dtype={'Number of ratings': 'str'})  # Read 'Number of ratings' as string
            break
        except UnicodeDecodeError:
            continue
    else:
        raise ValueError(f"Could not decode the CSV file {csv_file_path} with the provided encodings")

    # Format the data to match the restaurantSchema
    restaurants = []

    for index, row in df.iterrows():
        if pd.notna(row['Photo 1']) and row['Photo 1'].strip() != '':
            number_of_ratings = clean_number_of_ratings(row['Number of ratings'])
            rate = clean_float(row['Rating'])
            longitude = clean_float(row['Longitude'])
            latitude = clean_float(row['Latitude'])
            print(row['Name'])
            restaurant = {
                "cityId": cityId,  # Example cityId, replace with actual if different
                "name": row['Name'],
                "description": row['Place description'],
                "location": row['location Link'],
                "address": row['Address'],
                "longitude": str(longitude),  # Ensure longitude is string
                "latitude": str(latitude),  # Ensure latitude is string
                "picture": row['Photo 1'],  # Assuming you only want the first photo
                "rate": rate,
                "numberOfRatings": number_of_ratings,
                "activeNow": False,  # Default value as per your schema
            }
            restaurants.append({k: clean_json_compatible(v) for k, v in restaurant.items()})

    # Split the data into chunks to avoid large payloads
    chunk_size = 100
    for i in range(0, len(restaurants), chunk_size):
        chunk = restaurants[i:i + chunk_size]
        response = requests.post(url, json=chunk)
        if response.status_code == 201:
            print(f'Chunk {i // chunk_size + 1} from {csv_file_path} added successfully')
        else:
            print(f'Failed to add chunk {i // chunk_size + 1} from {csv_file_path}', response.status_code,
                  response.text)
    print(csv_file_path, '======> Done')
