import streamlit as st
from sklearn.datasets import load_breast_cancer
from sklearn.model_selection import train_test_split
from sklearn.tree import DecisionTreeClassifier
import pandas as pd

# Load dataset
data = load_breast_cancer()
df = pd.DataFrame(data.data, columns=data.feature_names)
df['target'] = data.target

# Train/test split
X_train, X_test, y_train, y_test = train_test_split(
    data.data, data.target, test_size=0.2, random_state=42
)

# Train Decision Tree model
model = DecisionTreeClassifier()
model.fit(X_train, y_train)
score = model.score(X_test, y_test)

# Streamlit UI
st.title("Breast Cancer Prediction App (Decision Tree)")
st.write(f"Model accuracy on test set: {score:.2f}")

st.header("Enter feature values to predict")
input_data = []
for feature in data.feature_names:
    val = st.number_input(f"{feature}", value=float(df[feature].mean()))
    input_data.append(val)

if st.button("Predict"):
    prediction = model.predict([input_data])
    st.write("Prediction:", "Malignant" if prediction[0] == 0 else "Benign")