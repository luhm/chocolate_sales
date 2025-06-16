# STEP-BY-STEP BUILD IN POWER BI
Let me guide you through the setup process from data to dashboard:

## 🔶 STEP 1: Load Your Data

- Open Power BI Desktop
- Click "Get Data" → Choose your source (e.g., Excel, CSV)
- Load the data table with columns:
    - Salesperson
    - Country
    - Product
    - Date of Sale
    - Amount
    - Boxes

## 🔶 STEP 2: Create Calculated Fields (DAX)

In the Data Model, create important measures:

```
Total Revenue = SUM('Sales'[Amount])
Total Boxes = SUM('Sales'[Boxes])
Average Sale Amount = AVERAGE('Sales'[Amount])
Revenue per Box = [Total Revenue] / [Total Boxes]
```

## 🔶 STEP 3: Build Visuals

- Card Visuals → Drag your measures like Total Revenue, Total Boxes, etc.
- Line Chart → Date of Sale on X-axis, Total Revenue on Y-axis
- Bar Chart (Top Salespeople) → Salesperson vs. Total Revenue
- Map (Geography) → Use "Country" in a Filled Map with Total Revenue
- Bar Chart (Products) → Product vs. Total Revenue or Total Boxes
- Combo Chart → Date vs Revenue (Line) and Boxes (Column)

## 🔶 STEP 4: Add Slicers for Interactivity

- Drag in Slicer visuals for:
    - Country
    - Product
    - Salesperson
    - Date (use date hierarchy)

Set interactions so other visuals respond to slicer changes.
