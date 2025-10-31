# HR Analytics Data Analysis Project

## 📘 Project Overview  
This project focuses on analyzing HR data to extract meaningful insights about **employee performance, attrition trends, and recruitment efficiency**.  
The process begins with **uncleaned raw datasets**, which were cleaned in **Excel**, loaded into an **SQL database** for querying and analysis, and finally visualized using **Power BI** dashboards.

---

## 🧩 Workflow Summary  
### 1. **Data Cleaning (Excel)**  
- Cleaned four raw datasets: `Employees`, `Attrition`, `Performance`, and `Recruitment`.  
- Removed duplicates, standardized column formats (e.g., date, salary), and ensured consistent naming across tables.  
- The cleaned data was exported as CSV files and imported into SQL for further processing.

---

### 2. **Database Creation & Analysis (SQL)**  
**File:** `HR_Analytics_Sql.sql`  

- Created four relational tables:  
  - `employee_master`: Basic employee data (ID, Name, Department, Role, Salary, Age, etc.)  
  - `attrition`: Records of employees who left the organization (reason, last working date)  
  - `performance`: Employee quarterly performance scores and manager feedback  
  - `recruitment`: Recruitment details (job role, source, hiring status, joining date)  

- Built foreign key relationships linking each dataset logically.  
- Executed analytical SQL queries to derive insights, such as:  
  - **Latest Performance Report:** For each employee, retrieving the most recent performance score.  
  - **Attrition Summary:** Listing employees who left, along with reason and department.  
  - **Average Salary by Department:** Highlighting pay structure variations across departments.  
  - **Recruitment Funnel:** Counting total, hired, and pending applications per job role and source.  
  - **Top Performers by Department:** Ranking employees based on performance score using `ROW_NUMBER()` window function.  

These queries formed the foundation of the Power BI dashboard metrics.

---

### 3. **Data Visualization (Power BI)**  
**File:** `HR_Analytics__Dashboard.pbix`  

- Connected directly to the SQL database to fetch cleaned and aggregated results.  
- Created a professional **multi-page dashboard** covering:  
  - **Employee Overview:** Headcount, gender ratio, and department distribution.  
  - **Attrition Analysis:** Attrition rate by department, reasons for leaving, and tenure breakdown.  
  - **Performance Insights:** Average performance scores by department and top-performing employees.  
  - **Recruitment Summary:** Applications by source, hired vs. pending, and role-based hiring insights.  
- Implemented **interactive visuals** — slicers, cards, tables, and bar/column charts for detailed drilldowns.  
- Used **DAX measures** to calculate KPIs such as average salary, attrition percentage, and total hires.

---

## 🛠 Tools & Technologies  
- **Excel** – Data cleaning and formatting  
- **SQL (PostgreSQL/MySQL)** – Data modeling, table creation, and analytics queries  
- **Power BI** – Data visualization and dashboard creation  
- **Git & GitHub** – Version control and project hosting  

---

## 📁 Repository Structure  
| File/Folder | Description |  
|--------------|-------------|  
| `HR_Analytics_Unclean_Dataset.zip` | Original uncleaned data |  
| `Employees.csv`, `Attrition.csv`, `Performance.csv`, `Recruitment.csv` | Cleaned datasets used in SQL |  
| `HR_Analytics_Sql.sql` | SQL scripts for table creation and HR analytics queries |  
| `HR_Analytics__Dashboard.pbix` | Power BI dashboard file visualizing HR insights |

---

## 📊 Key Insights  
- Identified departments with the **highest attrition rates** and key reasons behind exits.  
- Discovered correlation between **performance levels and retention**.  
- Evaluated **recruitment source efficiency** (e.g., referrals vs. external job portals).  
- Highlighted **salary disparities** and **performance-driven pay trends** across departments.
   ```bash
   git clone https://github.com/AnalystSatyam20/HR_Analytics_Data_Analysis_Project.git
