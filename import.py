import pandas as pd
from sqlalchemy import create_engine
from sqlalchemy.exc import SQLAlchemyError


engine = create_engine("postgresql://chocolate:chocisgood@localhost:5432/postgres")

chocolate_sales_df = pd.read_csv('data/chocolate_sales.csv')
print(chocolate_sales_df.head())
print(chocolate_sales_df.shape)

try:
    with engine.connect() as connection:
        with connection.begin():
            chocolate_sales_df.to_sql(
                'chocolate_sales_data',
                con=connection,
                if_exists='append',
                index=True
            )
except SQLAlchemyError as e:
    print(f"Database error: {e}")