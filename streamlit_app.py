import streamlit as st
import torch
import cv2
from segment_anything import sam_model_registry

def main():
    st.title("Hello Streamlit App")
    st.write("Welcome to the Hello Streamlit app!")
    name = st.text_input("Enter your name:")
    
    if st.button("Greet"):
        st.write(f"Hello, {name}! Nice to meet you!")

    st.write(f"opencv version: {cv2.__version__}")

    device = "cuda" if torch.cuda.is_available() else "cpu"
    st.write(f"Using device: {device}")
    
    # Load the SAM model
    sam = sam_model_registry["vit_l"](checkpoint="./sam_images/sam_vit_l_0b3195.pth")
    sam.to(device=device)

if __name__ == "__main__":
    main()
