🚀 End-to-End Global E-Commerce Sales Analytics

An end-to-end data analytics project that analyzes global e-commerce sales using AWS, Python, MySQL, and Power BI.

This project demonstrates a complete data pipeline workflow, starting from cloud data storage → data cleaning → database analysis → business intelligence dashboard creation.

The dataset contains 100,000+ transaction records, which were processed to extract meaningful business insights about sales performance, customer behavior, and product profitability.

🧠 Project Architecture
Raw Data
   ↓
AWS S3 (Cloud Storage)
   ↓
Python (Boto3) – Data Access & Cleaning
   ↓
Cleaned Dataset
   ↓
AWS RDS (MySQL Database)
   ↓
SQL Queries – Data Analysis
   ↓
Power BI Dashboard – Visualization
🛠️ Tech Stack
☁️ AWS S3 – Cloud data storage
🐍 Python (Boto3) – Accessing S3 and data processing
🗄️ AWS RDS (MySQL) – Cloud relational database
💻 MySQL – Data analysis using SQL queries
📊 Power BI – Interactive dashboard visualization
📂 Project Workflow
1️⃣ Data Upload to AWS S3

The raw e-commerce dataset was first uploaded to an AWS S3 bucket, which served as the cloud storage layer for the project.

S3 allowed centralized storage of the dataset and easy access for processing.

2️⃣ Accessing S3 Using Python (Boto3)

Python was connected to the S3 bucket using the Boto3 AWS SDK.

To establish secure access:

An AWS Access Key
A Secret Access Key

were generated from the AWS IAM console.

Using these credentials, Python scripts were able to retrieve the dataset from the S3 bucket for further processing.

3️⃣ Data Cleaning & Preprocessing

Data cleaning was performed in Python to ensure accuracy and usability.

Cleaning steps included:

Removing duplicate records
Handling missing values
Correcting inconsistent data
Formatting date columns
Ensuring proper numeric formats

After cleaning, the dataset contained 100,000+ structured transaction records ready for analysis.

4️⃣ Database Setup with AWS RDS

To perform SQL-based analysis, an AWS RDS MySQL database was created.

Steps performed:

Created an RDS MySQL instance
Configured database credentials and security settings
Created a database schema
Connected the database with MySQL Workbench

Because the project was built using the AWS Free Tier, uploading the full dataset was extremely slow.

Uploading 100K+ rows directly to RDS would take many hours, so a small sample dataset was uploaded to test connectivity and database functionality.

5️⃣ SQL Data Analysis

After validating the RDS setup, SQL queries were written to perform business analysis on the full cleaned dataset locally.

SQL analysis included:

Identifying top selling products
Analyzing customer segments
Evaluating profitability by category
Understanding regional sales distribution
Finding most frequently used payment methods
Analyzing order priorities and shipping costs

These queries helped generate valuable business insights from the data.

6️⃣ Power BI Dashboard Creation

Finally, the cleaned dataset was used to build an interactive Power BI dashboard.

The dashboard provides a visual overview of key business metrics and trends.

Dashboard Features
📈 Sales Performance Overview
💰 Profit Analysis
🏆 Top 10 Products by Sales
📦 Top 10 Products by Profit
🛍️ Product Sales by Category
📊 Quantity Sold by Product
🌍 Regional Sales Distribution
💳 Payment Method Analysis

The dashboard allows users to explore business insights interactively.

📊 Key Insights

Some important insights discovered from the analysis:

Certain product categories generate significantly higher sales and profits.
A small number of products contribute to a large portion of total revenue.
Customer segments show different purchasing patterns.
Some regions show higher sales volume but lower profit margins.
Payment method usage varies across different customer segments.

📁 Project Structure
end-to-end-global-ecommerce-sales-analytics
│
├── data
│   └── cleaned_ecommerce_data.csv
│
├── python_scripts
│   └── data_cleaning_s3_access.py
│
├── sql_queries
│   └── ecommerce_analysis_queries.sql
│
├── powerbi_dashboard
│   └── ecommerce_dashboard.pbix
│
├── images
│   └── dashboard_preview.png
│
└── README.md
🎯 Project Objectives

This project demonstrates the ability to:

Build an end-to-end data analytics pipeline
Work with cloud storage and cloud databases
Perform data cleaning and preprocessing
Use SQL for business analytics
Create interactive dashboards for decision making
🚀 Future Improvements

Potential future enhancements include:

Automating the pipeline using Apache Airflow
Building predictive models for sales forecasting
Deploying dashboards using Power BI Service
Implementing real-time data pipelines
👨‍💻 Author

Aman
Data Analytics | SQL | Python | AWS | Power BI
