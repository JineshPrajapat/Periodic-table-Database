# Periodic Table Element Lookup

This script allows you to look up information about elements from the periodic table using the command line. It connects to a PostgreSQL database containing the periodic table data and retrieves element properties based on the provided arguments.

## Prerequisites

- PostgreSQL: Ensure that PostgreSQL is installed and running on your system.
- Database Setup: Create a database named "periodic_table" with the necessary tables and data for the periodic table elements.

## Script Overview

- Variable Definitions: The script defines the PSQL variable, which holds the PostgreSQL connection command with appropriate parameters to connect to the database.

- Argument Validation: The script checks if an element argument is provided. If no argument is provided, it displays an error message asking the user to provide an element as an argument. If an argument is provided, the script further checks if it is a number or a string to determine the type of query to execute.

- Database Query: Based on the provided argument, the script constructs an SQL query to retrieve element properties from the database. If the argument is a string, it uses a LIKE query to find elements matching the provided name. If the argument is a number, it queries the database using the atomic number.

- Result Handling: The script captures the result of the query in the ELEMENT variable. If no element is found in the database matching the query, the variable remains empty.

- Output: If an element is found in the database, the script parses the result and displays the retrieved properties. It prints information such as the atomic number, atomic mass, melting point, boiling point, symbol, name, and type of the element. If no element is found, the script displays an appropriate message indicating that the element could not be found in the database.
