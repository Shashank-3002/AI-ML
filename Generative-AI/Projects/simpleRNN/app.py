import numpy as np
import tensorflow as tf
from tensorflow.keras.datasets import imdb
from tensorflow.keras.models import load_model
from tensorflow.keras.preprocessing import sequence

##Load the word index mapping from the IMDB dataset. This mapping is used to convert words in the reviews to their corresponding integer indices.
word_index = imdb.get_word_index()
reverse_word_index = {value: key for (key, value) in word_index.items()} ##The reverse mapping is created to convert integer indices back to words, which can be useful for interpreting the reviews and the model's predictions.

##Load the pre-trained model
model = load_model('simple_rnn_imdb.h5') ##The pre-trained model is loaded from the file 'simplernn_model.h5' using the load_model function. This allows us to use the model for making predictions on new reviews without having to retrain it.

##Helper function to decode the integer-encoded reviews back to text
def decode_review(encoded_review):
    return ' '.join([reverse_word_index.get(i - 3, '?') for i in encoded_review]) ##The function takes an integer-encoded review as input and returns the corresponding text review by mapping each integer back to its corresponding word using the reverse_word_index. The get method is used to handle cases where an index might not be found in the reverse mapping, returning a '?' in such cases.

#Function to preprocess the input review and make a prediction
def preprocess_text(text):
    words = text.lower().split() ##The input review is converted to lowercase and split into individual words.
    encoded_review = [word_index.get(word, 2)+3 for word in words] ##Each word in the review is converted to its corresponding integer index using the word_index mapping. If a word is not found in the mapping, it is assigned a default index of 2 (which typically represents an unknown token).
    padded_review = sequence.pad_sequences([encoded_review], maxlen=500) ##The encoded review is padded to a maximum length of 500 using the pad_sequences function. This ensures that the input to the model has a consistent shape, which is necessary for making predictions.
    return padded_review

##Streamlit app
import streamlit as st
st.title("IMDB Movie Review Sentiment Analysis")
st.write("Enter a movie review to predict its sentiment (positive or negative).")

user_input = st.text_area("Movie Review", "Type your review here...")
if st.button("Predict Sentiment"):
    preprocessed_input = preprocess_text(user_input)
    prediction = model.predict(preprocessed_input)
    sentiment = 'Positive' if prediction[0][0] >= 0.5 else 'Negative'

    ##Display the predicted sentiment and confidence score
    st.write(f"Predicted Sentiment: {sentiment} (Confidence Score: {prediction[0][0]:.4f})")

else:
    st.write("Please enter a movie review to predict its sentiment.")
