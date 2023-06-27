# Human Resource Employee Data - Exploratory Data Analysis & Visualization

This repository contains the Human Resource Employee Data and the associated exploratory data analysis (EDA) conducted using MySQL and visualized using Microsoft Power BI. The dataset includes information such as employee location, age, name, hire date, and termination date.

## Dataset Description

The Human Resource Employee Data consists of the following fields:

- Location: The geographical location where the employee is based.
- Employee Age: The age of the employee.
- Employee Name: The name of the employee.
- Hire Date: The date when the employee was hired.
- Gender: The genger of the employee.
- Job Title: The assigned ob title to the employee.
- Department: The department which the employee is assigned to.
- Birth Date: Date of Birth of employee.
- Race: Physical differences that groups and cultures consider socially significant. 
- Termination Date: The date when the employee's employment was terminated, if applicable.

## Exploratory Data Analysis

Exploratory Data Analysis (EDA) was performed on the Human Resource Employee Data using MySQL and visualized using Microsoft Power BI. The purpose of the EDA was to gain insights into the dataset and understand the patterns, relationships, and distributions of the employee data.

The analysis included the following steps:

1. **Data Import**: The dataset (HumanResources.csv) was imported into a MySQL database for further analysis.

2. **Data Cleaning**: Data cleaning techniques were applied to handle missing values, incorrect data types, and any other inconsistencies in the dataset.

3. **Data Exploration**: Various SQL queries were used to explore the dataset. This involved examining the distribution of employee ages, identifying the locations with the highest number of employees, analyzing the hiring trends over time, and investigating the attrition rate per department. The queries were exported and saved.

4. **Visualization**: The insights gained from the data exploration were then visualized using Microsoft Power BI. Interactive dashboards and visualizations were created to present the findings in a clear and concise manner. The Power BI reports included charts, graphs, and tables to showcase the relevant information and trends discovered during the analysis.

## Repository Structure

- **data**: This directory contains the Human Resource Employee Data in a suitable format for import into a MySQL database.

- **sql_scripts**: This directory contains the SQL scripts used for data import, cleaning, and analysis.

- **power_bi**: This directory contains the Power BI files with the visualizations and dashboards created during the analysis.

## Usage

To reproduce the EDA and visualize the results:

1. Set up a MySQL database and import the dataset provided in the **data** directory.

2. Execute the SQL scripts in the **sql_scripts** directory in the following order:
   - `cleaning.sql`: Cleans the data by handling missing values and inconsistencies.
   - `analysis.sql`: Performs the exploratory data analysis and generates insights.
  Save each query in csv format.

3. Open Power BI and import the csv files in the **power_bi** directory using Get Data from text/csv individually.

4. Connect the Power BI files to the MySQL database and refresh the data sources.

5. The csv files will be used to create the interactive dashboard.

## License

The Human Resource Employee Data and the associated code in this repository are available under the [MIT License](LICENSE).

## Acknowledgments

We would like to thank all contributors who participated in the data collection and analysis process.

If you have any questions or suggestions, please feel free to reach out to us. We appreciate your feedback!
