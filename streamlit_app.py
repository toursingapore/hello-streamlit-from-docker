import streamlit as st
import torch
from segment_anything import sam_model_registry
from app.routers import inference

def main():
    st.title("Hello Streamlit App")
    st.write("Welcome to the Hello Streamlit app!")   
    name = st.text_input("Enter your name:")   
    if st.button("Greet"):
        st.write(f"Hello, {name}! Nice to meet you!")

    import cv2
    st.write(f"opencv version {cv2.__version__}")

    if torch.cuda.is_available():
       device = "cuda"
    else:
       device = "cpu"
    st.write(device)
    
    # Load the SAM model
    sam = sam_model_registry["vit_l"](checkpoint="./sam_images/sam_vit_l_0b3195.pth")    
    sam.to(device=device)


if __name__ == "__main__":
    main()
