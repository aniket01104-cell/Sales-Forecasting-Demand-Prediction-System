import gradio as gr
import joblib
import numpy as np

model = joblib.load("final_model.pkl")


def predict_sales(
    year, month, dayofweek,
    lag_1, lag_3, lag_7, lag_14, lag_30,
    rolling_mean_7, rolling_mean_14, rolling_mean_30,
    rolling_std_7,
    day, quarter,
    is_weekend, is_month_start, is_month_end
):
    try:
        dow = dayofweek - 1
        iw = 1 if is_weekend == "Yes" else 0
        ims = 1 if is_month_start == "Yes" else 0
        ime = 1 if is_month_end == "Yes" else 0
        values = [
            year, month, dow,
            lag_1, lag_3, lag_7, lag_14, lag_30,
            rolling_mean_7, rolling_mean_14, rolling_mean_30,
            rolling_std_7, day, quarter, iw, ims, ime
        ]
        values = [0 if v is None else v for v in values]
        features = np.array([values])
        prediction = model.predict(features)[0]
        return f"Expected Sales: ₹ {round(prediction, 2)}"
    except Exception as e:
        return f"Error: {str(e)}"


custom_css = """

@import url('https://fonts.googleapis.com/css2?family=DM+Sans:wght@300;400;500;600&family=DM+Mono:wght@400;500&display=swap');

*, *::before, *::after {
    font-family: 'DM Sans', -apple-system, BlinkMacSystemFont, sans-serif !important;
    box-sizing: border-box !important;
}

html {
    background: #030b06 !important;
}

body {
    margin: 0 !important;
    padding: 0 !important;
    min-height: 100vh !important;
    background:
        radial-gradient(ellipse 55% 65% at 8% 30%, rgba(16, 200, 90, 0.42) 0%, transparent 65%),
        radial-gradient(ellipse 40% 40% at 92% 70%, rgba(10, 160, 70, 0.22) 0%, transparent 60%),
        radial-gradient(ellipse 35% 30% at 50% 5%, rgba(20, 180, 80, 0.16) 0%, transparent 55%),
        linear-gradient(160deg, #020a04 0%, #030c06 50%, #020904 100%) !important;
    background-attachment: fixed !important;
}

.gradio-container {
    background: transparent !important;
    width: 100% !important;
    max-width: 100% !important;
    min-width: 0 !important;
    margin: 0 !important;
    padding: 48px 60px !important;
}

.contain, .app, main {
    max-width: 100% !important;
    width: 100% !important;
}

h1 {
    font-size: 32px !important;
    font-weight: 600 !important;
    color: #e0ffe8 !important;
    letter-spacing: -0.5px !important;
    text-align: center !important;
    margin-bottom: 8px !important;
}

h3 {
    font-size: 15px !important;
    font-weight: 400 !important;
    color: #3a8a55 !important;
    text-align: center !important;
    margin-bottom: 40px !important;
}

h2 {
    font-size: 11px !important;
    font-weight: 700 !important;
    color: #38855a !important;
    text-transform: uppercase !important;
    letter-spacing: 1.8px !important;
    margin-top: 0 !important;
    margin-bottom: 12px !important;
    border-bottom: 1px solid rgba(20, 160, 80, 0.20) !important;
    padding-bottom: 8px !important;
}

h4 {
    font-size: 20px !important;
    font-weight: 600 !important;
    color: #b8f0cc !important;
    margin-bottom: 14px !important;
    margin-top: 6px !important;
}

label {
    font-size: 12px !important;
    font-weight: 500 !important;
    color: #4a9a68 !important;
    letter-spacing: 0.2px !important;
}

p, li {
    color: #3d7a55 !important;
    font-size: 14px !important;
    line-height: 1.85 !important;
}

input[type="number"], textarea {
    background: rgba(2, 14, 7, 0.88) !important;
    color: #b8f0cc !important;
    border: 1px solid rgba(20, 140, 70, 0.30) !important;
    border-radius: 6px !important;
    font-family: 'DM Mono', monospace !important;
    font-size: 14px !important;
    transition: border-color 0.18s ease, box-shadow 0.18s ease !important;
}

input[type="number"]:focus, textarea:focus {
    border-color: rgba(30, 180, 90, 0.55) !important;
    box-shadow: 0 0 0 3px rgba(20, 160, 80, 0.10) !important;
    outline: none !important;
}

.gr-row, .row {
    display: flex !important;
    flex-direction: row !important;
    flex-wrap: nowrap !important;
    gap: 20px !important;
    width: 100% !important;
    align-items: flex-start !important;
}

.gr-column {
    flex: 1 1 0% !important;
    min-width: 0 !important;
    max-width: 50% !important;
    width: 50% !important;
}

button.primary, button[data-testid="base-button-primary"] {
    background: linear-gradient(135deg, #0d4422 0%, #186635 50%, #0d4422 100%) !important;
    color: #c8ffe0 !important;
    font-size: 13px !important;
    font-weight: 600 !important;
    letter-spacing: 1.2px !important;
    text-transform: uppercase !important;
    border: 1px solid rgba(30, 160, 80, 0.35) !important;
    border-radius: 8px !important;
    height: 48px !important;
    transition: all 0.2s ease !important;
    width: 100% !important;
}

button.primary:hover {
    background: linear-gradient(135deg, #165a2e 0%, #228844 50%, #165a2e 100%) !important;
    box-shadow: 0 4px 24px rgba(20, 180, 80, 0.30) !important;
    transform: translateY(-1px) !important;
}

.output-class textarea {
    font-family: 'DM Mono', monospace !important;
    font-size: 17px !important;
    font-weight: 500 !important;
    color: #40e880 !important;
    text-align: center !important;
    background: rgba(1, 10, 5, 0.92) !important;
    border: 1px solid rgba(20, 160, 80, 0.30) !important;
    border-radius: 8px !important;
    min-height: 54px !important;
    max-height: 62px !important;
    padding: 14px !important;
    line-height: 1.4 !important;
}

input[type="range"] {
    accent-color: #20a050 !important;
}

span {
    color: #285a38 !important;
    font-size: 11px !important;
    font-family: 'DM Mono', monospace !important;
}

hr {
    border: none !important;
    border-top: 1px solid rgba(20, 140, 70, 0.18) !important;
    margin: 20px 0 !important;
}

svg {
    opacity: 0.45 !important;
    color: #306845 !important;
}

.gr-radio label, .gr-check-radio label {
    color: #4a9a68 !important;
    font-size: 13px !important;
}

"""


with gr.Blocks(css=custom_css) as app:

    gr.Markdown("""
# Sales Prediction Tool

### Forecast future sales using machine learning
""")

    with gr.Row():
        with gr.Column():
            gr.Markdown("## Date Details")
            year = gr.Number(label="Year", value=2024)
            month = gr.Slider(1, 12, step=1, label="Month")
            day = gr.Slider(1, 31, step=1, label="Day")
            dayofweek = gr.Slider(1, 7, step=1, label="Day of Week")
            quarter = gr.Slider(1, 4, step=1, label="Quarter")

        with gr.Column():
            gr.Markdown("## Special Day Flags")
            is_weekend = gr.Radio(["Yes", "No"], label="Is Weekend", value="No")
            is_month_start = gr.Radio(["Yes", "No"], label="Month Start", value="No")
            is_month_end = gr.Radio(["Yes", "No"], label="Month End", value="No")

    with gr.Row():
        with gr.Column():
            gr.Markdown("## Past Sales")
            lag_1 = gr.Number(label="Yesterday Sales", value=0)
            lag_3 = gr.Number(label="3 Days Ago Sales", value=0)
            lag_7 = gr.Number(label="7 Days Ago Sales", value=0)
            lag_14 = gr.Number(label="14 Days Ago Sales", value=0)
            lag_30 = gr.Number(label="30 Days Ago Sales", value=0)

        with gr.Column():
            gr.Markdown("## Sales Trends")
            rolling_mean_7 = gr.Number(label="7-Day Avg Sales", value=0)
            rolling_mean_14 = gr.Number(label="14-Day Avg Sales", value=0)
            rolling_mean_30 = gr.Number(label="30-Day Avg Sales", value=0)
            rolling_std_7 = gr.Number(label="Sales Variability", value=0)

    predict_btn = gr.Button("Predict Sales")

    output = gr.Textbox(label="Prediction Output", lines=2, elem_classes="output-class")

    predict_btn.click(
        fn=predict_sales,
        inputs=[
            year, month, dayofweek,
            lag_1, lag_3, lag_7, lag_14, lag_30,
            rolling_mean_7, rolling_mean_14, rolling_mean_30,
            rolling_std_7, day, quarter,
            is_weekend, is_month_start, is_month_end
        ],
        outputs=output
    )

    gr.Markdown("""
#### What Each Input Means

---

## Date Details

- Year — Year of prediction (example: 2024)
- Month — Month number (1–12)
- Day — Date of the month
- Day of Week — 1 means Monday, 7 means Sunday
- Quarter — Business quarter from 1 to 4

---

## Special Day Flags

- Is Weekend — Select Yes if Saturday or Sunday
- Month Start — Select Yes if date is near beginning of month
- Month End — Select Yes if date is near end of month

---

## Past Sales

- Yesterday Sales — Sales from the previous day
- 3 / 7 / 14 / 30 Days Ago Sales — Historical sales values
- If unknown, keep values as 0

---

## Sales Trends

- 7 / 14 / 30 Day Average Sales — Average sales over previous days
- Example: last 7-day average sales = 1500
- Sales Variability — Measures how much sales fluctuate
- Stable sales usually have low variability (50–100)
- Highly changing sales usually have high variability (200–500)
- If unsure, keep value as 0

---

## Tips

- You can leave past sales fields as 0 if unknown
- Model uses historical patterns to predict future demand
- Works best with realistic input values
""")



app.launch()