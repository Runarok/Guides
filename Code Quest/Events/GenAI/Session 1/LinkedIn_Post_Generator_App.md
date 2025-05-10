

## **📌 Project Overview**

This project is a **LinkedIn Post Generator Web App** built using:

* **Streamlit:** A Python framework for building interactive web apps.
* **LangChain:** A library for working with LLMs (Large Language Models).
* **Google Gemini (Generative AI):** A language model used to generate the LinkedIn posts.
* **Ngrok:** For exposing the locally running app to the internet.

---

## **📌 Sections of the Code**

### **1. Installation of Dependencies**

```python
!pip install langchain==0.1.12 -q
!pip install langchain-google-genai==0.0.7 -q
!pip install langchain-community==0.0.29 -q
!pip install streamlit==1.32.2 -q
!pip install pyngrok==7.1.5 -q
!pip install google-generativeai>=0.3.2 -q
```

* **Dependencies Installed:**

  * `langchain` and `langchain-google-genai`: For interacting with the Gemini model.
  * `streamlit`: For building the app's front-end.
  * `pyngrok`: For making the local app accessible online.
  * `google-generativeai`: For interacting with Google's Gemini API.

---

### **2. Loading Gemini API Credentials**

```python
import os
from google.colab import userdata
os.environ['GOOGLE_API_KEY'] = userdata.get('GEMINI_API_KEY')
```

* **Purpose:** Load the Google Gemini API key as an environment variable.
* **Error in Your Code:** If the API key is not found in the environment, an error is raised.

---

### **3. Setting Up Gemini API**

```python
import google.generativeai as genai

# Set API Key
os.environ["GOOGLE_API_KEY"] = 'your_actual_api_key'

# Configure Gemini API
genai.configure(api_key=os.environ["GOOGLE_API_KEY"])
```

* **API Key Setup:** The API key is hardcoded here (you should avoid this for security).
* **`genai.configure()`:** Initializes the Gemini API with your API key.

---

### **4. Creating the Streamlit App**

```python
%%writefile linkedin_app.py
```

* **This saves the following code in a file named `linkedin_app.py`.**

#### **📌 Setting Up the Streamlit UI**

```python
import streamlit as st
from langchain_google_genai import ChatGoogleGenerativeAI
from langchain.prompts import ChatPromptTemplate
from langchain.schema import SystemMessage, HumanMessage

st.title("LinkedIn Post Generator")
```

* **`st.title()`:** Sets the title of the app.
* **Importing Components:**

  * `ChatGoogleGenerativeAI`: To connect with the Gemini model.
  * `ChatPromptTemplate`: For creating and formatting prompts.
  * `SystemMessage` and `HumanMessage`: For structuring the conversation.

---

#### **📌 Defining the System Instructions (Prompt)**

```python
system_prompt = """You are a professional LinkedIn post generator.
Your task is to create engaging, professional posts for LinkedIn based on the topic provided by the user.
- Keep posts between 150-300 words
- Include relevant hashtags (3-5)
- Maintain a professional but conversational tone
- Structure posts with short paragraphs for readability
"""
```

* This prompt is used to guide the model on how to generate the LinkedIn post.

---

#### **📌 Initializing the Language Model**

```python
gemini = ChatGoogleGenerativeAI(
    model='gemini-2.0-flash-thinking-exp-01-21',
    temperature=0.7,
    convert_system_message_to_human=True
)
```

* **Model Used:** `gemini-2.0-flash-thinking-exp-01-21`.
* **Temperature:** Controls creativity (0.7 allows moderate creativity).
* **`convert_system_message_to_human`:** Treats the instructions as a part of the conversation.

---

#### **📌 Setting Up the Prompt Template**

```python
prompt_template = ChatPromptTemplate.from_messages([
    ("system", system_prompt),
    ("human", "{user_input}")
])
```

* **Prompt Template:** Combines system instructions and user input.

---

#### **📌 Building the UI Layout**

```python
st.markdown("### Generate professional LinkedIn posts with AI")
st.markdown("Enter a topic or idea to get a LinkedIn post tailored to your needs.")
```

* **Instructions for the User:** Briefly explains what the app does.

```python
user_input = st.text_area(
    "What would you like to post about?",
    placeholder="Example: Sharing my thoughts on the future of AI in healthcare",
    height=100
)
```

* **Text Area:** Allows the user to enter a topic.

---

#### **📌 Generating the LinkedIn Post**

```python
if st.button("Generate Post"):
    if user_input:
        with st.spinner("Creating your LinkedIn post..."):
            messages = prompt_template.format_messages(user_input=user_input)
            response = gemini.invoke(messages)
            
            st.markdown("### Your LinkedIn Post:")
            st.markdown(response.content)
```

* **Button Triggered:** Generates the post only when the "Generate Post" button is clicked.
* **Prompt Preparation:** User input is merged with the system prompt.
* **API Call:** The formatted prompt is sent to the Gemini model.
* **Displaying the Post:** The generated post is shown on the page.

---

### **5. Running the Streamlit App Locally**

```python
!streamlit run linkedin_app.py --server.port=8989 &>./logs.txt &
```

* This command starts the Streamlit app on port **8989** and saves logs to `logs.txt`.

---

### **6. Setting Up Ngrok (For External Access)**

```python
import os
from pyngrok import ngrok

os.environ["NGROK_API_KEY"] = 'your_ngrok_api_key'
ngrok.set_auth_token(os.getenv("NGROK_API_KEY"))
```

* **Ngrok API Key:** Set for authentication.

```python
ngrok_tunnel = ngrok.connect(8001)
print("Streamlit App:", ngrok_tunnel.public_url)
```

* **Ngrok Tunnel:** Makes the local app accessible via a public URL.

---

### **7. Stopping the App**

```python
ngrok.kill()
```

* This stops the ngrok tunnel and the Streamlit app.

---

