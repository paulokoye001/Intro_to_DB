import mysql.connector
from mysql.connector import Error

def create_database():
    try:
        # Connect to MySQL server
        connection = mysql.connector.connect(
            host="localhost",  # Change if using a remote MySQL server
            user="root",       # Change if using another MySQL user
            password="your_password"  # Replace with your actual MySQL password
        )

        if connection.is_connected():
            cursor = connection.cursor()
            
            # Create database if it does not exist
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
            
            print("Database 'alx_book_store' created successfully!")
        
    except mysql.connector.Error as e: 
        print(f"Error: {e}")

    finally:
        # Close the connection
        if connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection closed.")

# Run the function to create the database
if __name__ == "__main__":
    create_database()


