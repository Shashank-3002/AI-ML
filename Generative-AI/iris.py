import streamlit as st
import pandas as pd
from sklearn.datasets import load_iris
from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import train_test_split

@st.cache_data
def load_data():
    iris = load_iris()
    df = pd.DataFrame(data=iris.data, columns=iris.feature_names)
    df['species'] = iris.target
    return df, iris.target_names
    # X = pd.DataFrame(iris.data, columns=iris.feature_names)
    # y = pd.Series(iris.target)
    # return X, y, iris.target_names

df, target_names = load_data()

model = RandomForestClassifier()
model.fit(df.iloc[:, :-1], df['species'])
st.title("Iris Species Prediction App")
st.write("Enter the features of the iris flower to predict its species.")
sepal_length = st.sidebar.slider("Sepal Length (cm)", min_value=float(df['sepal length (cm)'].min()), max_value=float(df['sepal length (cm)'].max()), value=float(df['sepal length (cm)'].min()))
sepal_width = st.sidebar.slider("Sepal Width (cm)", min_value=float(df['sepal width (cm)'].min()), max_value=float(df['sepal width (cm)'].max()), value=float(df['sepal width (cm)'].min()))
petal_length = st.sidebar.slider("Petal Length (cm)", min_value=float(df['petal length (cm)'].min()), max_value=float(df['petal length (cm)'].max()), value=float(df['petal length (cm)'].min()))
petal_width = st.sidebar.slider("Petal Width (cm)", min_value=float(df['petal width (cm)'].min()), max_value=float(df['petal width (cm)'].max()), value=float(df['petal width (cm)'].min()))

input_data = [[sepal_length, sepal_width, petal_length, petal_width]]
prediction = model.predict(input_data)
predicted_species = target_names[prediction][0]
st.write("## Prediction Result")
st.write(f"The predicted species is: {predicted_species}")