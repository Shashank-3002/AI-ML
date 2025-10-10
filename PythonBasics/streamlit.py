import streamlit as st
import pandas as pd
import numpy as np

##Title of the application
st.title("Hi, This is my new project using stremlit")

##Create a simple DataFrame

df = pd.DataFrame({
    'first column': [1,2,3,4,5],
    'second column': [10,20,30,40,50]
})

##Display the DataFrame
st.write("Here is the new DataFrame")
st.write(df)

##Creating a line chart
chart_data = pd.DataFrame(
    np.random.randn(20,3),columns=['a','b','c']
)

st.line_chart(chart_data)


#Widgets in streamlit
st.title("Stream Widgets")

st.title("1. Streamlit Text Input")
name  = st.text_input("Enter your name:")

if name:
    st.write(f"Hello, {name}")

#Creating a slider to get the age of the user
age = st.slider("Select your age: ", 0,100,25)
st.write(f"Your age is {age}")

##Select box
options = ["Python","Java","C++","JavaScript"]
choice = st.selectbox("Choose your favourite language: ", options)
st.write(f"Your Favourite language is {choice}")

##File uploader using streamlit
upload_file = st.file_uploader("Choose a csv file", type="csv")

if upload_file is not None:
    df = pd.read_csv(upload_file)
    st.write(df)
    st.write(df.describe())
    st.write(df.head())
    st.write(df.tail())
    

