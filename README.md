# ML with R

Predicting diabetes from medical indicators using Generalised Linear Models — with a full evaluation suite covering accuracy, recall, precision, F1, and AUC.

## Problem

The Pima Indians Diabetes Dataset contains 768 patients with 8 medical predictors (glucose, BMI, blood pressure, etc.) and a binary outcome: positive or negative for diabetes. The goal: build a logistic regression model that predicts diabetes status and rigorously evaluate its performance.

## Approach

1. **Load** the Pima Indians Diabetes dataset from `mlbench`
2. **Split** 80/20 with stratified sampling to preserve class balance
3. **Fit** a GLM with binomial family (logistic regression)
4. **Predict** on held-out test set with probability thresholds
5. **Evaluate** with a comprehensive metrics suite

## Results

| Metric | Score |
|--------|-------|
| Accuracy | 0.804 |
| Sensitivity (Recall) | 0.910 |
| Specificity | 0.604 |
| Precision | 0.780 |
| F1 Score | 0.681 |
| AUC | 0.893 |
| Kappa | 0.543 |

**Confusion Matrix:**

|  | Actual Neg | Actual Pos |
|--|-----------|-----------|
| Predicted Neg | 91 (TN) | 21 (FN) |
| Predicted Pos | 9 (FP) | 32 (TP) |

The model is strong at identifying negative cases (91% sensitivity) but struggles more with positive cases (60% specificity) — a common trade-off in medical classification where false negatives are costly.

## Key Findings

- **Glucose** is the strongest predictor (p < 2e-16) — not surprising given its direct link to diabetes
- **BMI** and **pedigree function** are also highly significant — weight and genetics both matter
- **Triceps** and **insulin** are not statistically significant in this model — they may be redundant when glucose is already in the model
- **AUC of 0.893** indicates good discriminative ability, but there's room to improve on the minority class (positive cases)

## Setup

```bash
git clone https://github.com/wsamuelw/ml-with-r.git
cd ml-with-r
```

```r
install.packages(c("caret", "tidyverse", "mlbench", "pROC", "MLmetrics"))
source("predict diabetes with glm.R")
```

## Data

**Pima Indians Diabetes Dataset** — included via the `mlbench` package. 768 rows, 8 features, binary target.

| Feature | Description |
|---------|------------|
| pregnant | Number of pregnancies |
| glucose | Plasma glucose concentration |
| pressure | Diastolic blood pressure |
| triceps | Triceps skin fold thickness |
| insulin | 2-hour serum insulin |
| mass | BMI |
| pedigree | Diabetes pedigree function |
| age | Age |

## Evaluation Metrics Explained

| Metric | What It Measures | When It Matters |
|--------|-----------------|-----------------|
| Accuracy | Overall correct predictions | Balanced datasets |
| Recall | How many positives you catch | When missing positives is costly (medical screening) |
| Precision | How many predicted positives are correct | When false alarms are costly |
| F1 Score | Balance of precision and recall | Imbalanced datasets |
| AUC | Discrimination ability across all thresholds | Comparing models |
| Kappa | Agreement beyond chance | Accounting for class imbalance |

## Tech Stack

- **caret** — train/test splitting and confusion matrix
- **mlbench** — dataset source
- **pROC** — AUC calculation
- **MLmetrics** — additional evaluation metrics
- **tidyverse** — data wrangling

## References

- [Pima Indians Diabetes Dataset](https://www.kaggle.com/uciml/pima-indians-diabetes-database)
- [GLM documentation](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/glm.html)
- [caret package](https://topepo.github.io/caret/)

## License

MIT
