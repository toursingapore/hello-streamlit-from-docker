import streamlit as st

def main():
    st.title("Hello Streamlit App")

    st.write("Welcome to the Hello Streamlit app!")
    
    name = st.text_input("Enter your name:")
    
    if st.button("Greet"):
        st.write(f"Hello, {name}! Nice to meet you!")

    import cv2
    st.write(cv2.__version__)

if __name__ == "__main__":
    main()
