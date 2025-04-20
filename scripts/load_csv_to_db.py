import pandas as pd
from sqlalchemy import create_engine
import os
from dotenv import load_dotenv

# Load environment variables from .env file
load_dotenv()

# Database connection settings
DB_NAME = os.getenv("DB_NAME")
DB_USER = os.getenv("DB_USER")
DB_PASS = os.getenv("DB_PASS")
DB_HOST = os.getenv("DB_HOST")
DB_PORT = os.getenv("DB_PORT")

# Create SQLAlchemy engine
engine = create_engine(f"postgresql://{DB_USER}:{DB_PASS}@{DB_HOST}:{DB_PORT}/{DB_NAME}")

# Define project root and construct the data path
PROJECT_ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
DATA_DIR = os.path.join(PROJECT_ROOT, "data", "raw")
# DATA_DIR = os.path.join("..", "data", "raw")

# List of CSV files and their target table names
csv_table_map = {
    "exercise_0_customer_crm.csv": "customer_crm",
    "exercise_0_employee_engagement.csv": "employee_engagement",
    "exercise_0_performance_reviews.csv": "performance_reviews",
    "exercise_0_product_issues.csv": "product_issues"
}

# Load each CSV into its corresponding PostgreSQL table
for csv_file, table_name in csv_table_map.items():
    file_path = os.path.join(DATA_DIR, csv_file)
    print(f"Loading {file_path} into {table_name}...")

    df = pd.read_csv(file_path)
    df.to_sql(table_name, engine, if_exists="replace", index=False)

print("✅ All CSV files loaded into PostgreSQL successfully.")