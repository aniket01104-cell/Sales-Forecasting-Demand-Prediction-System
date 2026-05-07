# \---

# title: Sales Forecasting Demand Prediction

# emoji: 🤖

# colorFrom: purple

# colorTo: pink

# sdk: gradio

# sdk\_version: 6.14.0

# python\_version: '3.13'

# app\_file: app.py

# pinned: false

# license: mit

# \---

# 📈 AI-Powered Sales Forecasting \& Demand Prediction System

An end-to-end machine learning and time series forecasting project designed to predict future sales demand using historical sales data, advanced feature engineering, statistical forecasting models, deep learning architectures, interactive dashboards, and cloud deployment.

The project combines:

* Machine Learning
* Time Series Forecasting
* Deep Learning
* Business Intelligence
* Cloud Deployment

to deliver a real-world business forecasting solution.

\---

# 🚀 Live Demo

🔗 Hugging Face Deployment: **\[https://huggingface.co/spaces/Aniket1104/sales-forecasting-demand-prediction]**

🔗 GitHub Repository: **\[https://github.com/aniket01104-cell/Sales-Forecasting-Demand-Prediction-System]**

\---

# 📌 Project Overview

Businesses rely heavily on accurate demand forecasting to optimize:

* Inventory management
* Supply chain planning
* Revenue forecasting
* Seasonal sales planning
* Resource allocation

This project analyzes historical sales trends and predicts future demand using multiple forecasting approaches including:

* Regression Models
* Time Series Models
* Deep Learning Models

The best-performing model is then deployed using Gradio for real-time sales prediction.

\---

# 🧠 Key Features

✅ Advanced Feature Engineering  
✅ Machine Learning Forecasting  
✅ Time Series Analysis  
✅ Deep Learning (LSTM \& GRU)  
✅ Interactive Gradio Web App  
✅ Tableau Dashboard Visualization  
✅ Model Performance Comparison  
✅ Business Recommendations  
✅ Cloud Deployment Ready

\---

# 🛠️ Tech Stack

## Programming \& Analysis

* Python
* Pandas
* NumPy

## Machine Learning

* Scikit-learn
* Random Forest
* Ridge Regression

## Time Series Forecasting

* Prophet
* ARIMA
* SARIMA

## Deep Learning

* TensorFlow
* Keras
* LSTM
* GRU

## Visualization \& Dashboard

* Tableau
* Matplotlib
* Seaborn

## Deployment

* Gradio
* Hugging Face Spaces

\---

# 📂 Project Structure

```bash
AI-Powered-Sales-Forecasting-and-Demand-Prediction-System/
│
├── data/
│   ├── sales.csv
│   ├── df\\\\\\\\\\\\\\\_daily.csv
│   └── df\\\\\\\\\\\\\\\_feature\\\\\\\\\\\\\\\_engineered.csv
│
├── notebooks/
│   ├── 01\\\\\\\\\\\\\\\_data\\\\\\\\\\\\\\\_cleaning.ipynb
│   ├── 02\\\\\\\\\\\\\\\_feature\\\\\\\\\\\\\\\_engineering.ipynb
│   └── 03\\\\\\\\\\\\\\\_model\\\\\\\\\\\\\\\_building.ipynb
│
├── dashboard/
│   └── tableau\\\\\\\\\\\\\\\_dashboard.png
│
├── sql/
│   └── sql\\\\\\\\\\\\\\\_queries.sql
│
├── app.py
├── final\\\\\\\\\\\\\\\_model.pkl
├── requirements.txt
├── runtime.txt
└── README.md
```

\---

# 📊 Exploratory Data Analysis

The dataset was analyzed to identify:

* Sales trends
* Seasonal patterns
* Quarterly growth
* Yearly revenue growth
* Daily fluctuations

## Key Insights

* Strong seasonal sales spikes
* Consistent yearly sales growth
* High sales variability during peak periods

\---

# ⚙️ Feature Engineering

Several time-series based features were created to improve prediction accuracy.

## Lag Features

* 1-Day Lag
* 3-Day Lag
* 7-Day Lag
* 14-Day Lag
* 30-Day Lag

## Rolling Statistics

* 7-Day Rolling Mean
* 14-Day Rolling Mean
* 30-Day Rolling Mean
* Rolling Standard Deviation

## Date Features

* Month
* Day
* Quarter
* Day of Week

## Special Flags

* Weekend Indicator
* Month Start
* Month End

\---

# 🤖 Models Implemented

|Model|Type|
|-|-|
|Tuned Random Forest|Machine Learning|
|Ridge Regression|Linear ML|
|Prophet|Time Series|
|ARIMA|Statistical Forecasting|
|SARIMA|Seasonal Forecasting|
|LSTM|Deep Learning|
|GRU|Deep Learning|

\---

# 📈 Final Model Performance

|Model|MAE|RMSE|
|-|-|-|
|Ridge Regression|1585.02|2323.17|
|Prophet|1730.58|2358.55|
|Tuned Random Forest|1600.44|2371.78|
|LSTM|1732.76|2494.93|
|GRU|1756.58|2504.56|
|ARIMA|1606.34|2519.57|
|SARIMA|2146.63|2567.73|

\---

# 🏆 Best Model Selected

**Ridge Regression** achieved the lowest error metrics and was selected as the final production model.

\---

# 🖥️ Tableau Dashboard

The interactive dashboard provides:

* Total Sales KPI
* Average Daily Sales
* Maximum Sales Day
* Monthly Seasonality Analysis
* Quarterly Sales Analysis
* Yearly Sales Trends
* Daily Sales Trend Visualization

\---

# 🌐 Gradio Deployment

A fully interactive web application was built using Gradio where users can:

* Input historical sales values
* Select date information
* Configure sales trend metrics
* Predict future sales instantly

## Deployment Features

* Custom modern UI styling
* Responsive layout
* Real-time prediction engine
* User guidance section

\---

# 📉 Business Impact

This forecasting system can help businesses:

* Improve inventory planning
* Reduce overstock and stockouts
* Optimize procurement strategies
* Forecast seasonal demand
* Improve operational efficiency
* Support data-driven business decisions

\---

# 💡 Future Improvements

Possible future enhancements include:

* Real-time API integration
* External economic indicators
* Holiday/event-based forecasting
* Automated retraining pipeline
* Advanced ensemble models
* Stream processing
* Multi-store forecasting

\---

# 👨‍💻 Author

**Aniket Pingle**

* Data Science \& Analytics Enthusiast
* Machine Learning \& Forecasting Projects
* Tableau Dashboard Development
* SQL + ML + Deployment Projects

\---

# ⭐ If You Like This Project

Give this repository a ⭐ on GitHub!

