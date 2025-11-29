import streamlit as st
import pandas as pd

st.title("Streamlit Text Input Example")
name = st.text_input("Enter your name:")

age = st.slider("Select your age:", min_value=0, max_value=120, value=25)
if name:
    st.write(f"Hello, {name}! You are {age} years old.")
options = ["Python", "JavaScript", "Java", "C++", "Ruby"]
choice = st.selectbox("Select your favorite programming language:", options)
st.write(f"You selected: {choice}")

data = {
    "Name": ["Alice", "Bob", "Charlie"],
    "Age": [24, 30, 22],
    "City": ["New York", "Los Angeles", "Chicago"]
}
df = pd.DataFrame(data)
st.write("Here is a sample DataFrame:")
st.dataframe(df)

uploaded_file = st.file_uploader("Upload a CSV file", type=["csv", "txt"])
if uploaded_file is not None:
    uploaded_df = pd.read_csv(uploaded_file)
    st.write("Uploaded DataFrame:")
    st.dataframe(uploaded_df.describe())