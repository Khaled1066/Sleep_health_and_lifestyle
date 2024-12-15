# Sleep Health and Lifestyle Dataset Analysis

## Overview
This project analyzes a dataset that explores the relationships between sleep health, lifestyle factors, and physiological metrics. Using Python-based tools, the project examines trends and correlations to uncover insights that could inform healthier habits and better sleep quality.

## Dataset Features
The dataset contains the following key variables:

### Demographics
- **Person ID**: A unique identifier for each individual.
- **Gender**: Male or Female.
- **Age**: Age of the individual.
- **Occupation**: Profession of the individual.

### Sleep Metrics
- **Sleep Duration**: Average time of sleep in hours.
- **Quality of Sleep**: Rated on a scale from 1 (worst) to 10 (best).
- **Sleep Disorder**: Presence of conditions like insomnia or sleep apnea.

### Lifestyle Metrics
- **Physical Activity Level**: Scale from 1 to 100, indicating activity level.
- **Stress Level**: Rated on a scale from 1 (low) to 10 (high).
- **Daily Steps**: Number of steps taken in a day.

### Health Metrics
- **BMI (Body Mass Index)**: Categorized as underweight, normal, overweight, or obese.
- **Blood Pressure**: Includes systolic and diastolic values.
- **Heart Rate**: Beats per minute.

### Calculated Scores
- **BMI Score**: Numerical assessment based on height and weight.
- **Blood Pressure Score**: Categorization of blood pressure values.
- **Daily Steps Score**: Scored assessment of activity levels.

## Project Objectives
- Identify correlations between lifestyle factors (e.g., physical activity, stress) and sleep quality.
- Investigate the impact of health metrics (e.g., BMI, blood pressure) on sleep disorders.
- Provide actionable insights for improving sleep and overall health.

## Tools and Libraries Used
- **Data Manipulation**: `pandas`, `numpy`
- **Data Visualization**: `matplotlib`, `seaborn`, `plotly`
- **Statistical Analysis**: `scipy`, `statsmodels`

## Structure
- `notebooks/`: Jupyter Notebook files for analysis and visualizations.
- `data/`: Dataset used for the analysis.
- `output/`: Generated plots and statistical summaries.
- `presentation/`: PowerPoint summarizing key insights from the analysis.

## Visualizations
Key visualizations explore:
- The relationship between sleep quality and physical activity levels.
- Trends in daily steps across BMI categories.
- The effect of stress levels on sleep duration and heart rate.

## How to Use
1. Clone this repository:
    ```bash
    git clone https://github.com/yourusername/sleep-health-analysis.git
    ```
2. Install dependencies:
    ```bash
    pip install -r requirements.txt
    ```
3. Run the Jupyter Notebook for analysis:
    ```bash
    jupyter notebook notebooks/sleep_analysis.ipynb
    ```
4. Explore the presentation in the `presentation/` folder for a summary of insights.

## Contributions
Contributions are welcome! If you have ideas for improving this analysis or expanding its scope, please open an issue or submit a pull request.


---

Feel free to reach out with questions or feedback!
