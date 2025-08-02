## **📌 Project Overview**

This project demonstrates the basics of using **Google Gemini (Generative AI)** with **LangChain** in a Google Colab environment.

---

## **📌 Sections of the Code**

### **1. Installation of Dependencies**

```python
!pip install langchain==0.1.12 -q
!pip install langchain-google-genai==0.0.7 -q
!pip install langchain-community==0.0.29 -q
!pip install google-generativeai>=0.3.2 -q
```

* **Dependencies Installed:**

  * `langchain` and `langchain-google-genai`: For interacting with the Gemini model.
  * `google-generativeai`: For interacting with Google's Gemini API.

---

### **2. Loading Gemini API Credentials**

Instead of hardcoding the API key, use a `config.txt` file for better security:

```python
with open('config.txt') as file:
    API_KEY = file.read().strip()

print(API_KEY)
```

* **Security Improvement:** API keys are loaded from a separate file (`config.txt`), ensuring they are not directly visible in the code.

---

### **3. Configuring Gemini API**

```python
import google.generativeai as genai

genai.configure(api_key=API_KEY)
```

* **API Configuration:** Initializes the Gemini API using the API key from the config file.

---

### **4. Initializing the Language Model**

```python
from langchain_google_genai import ChatGoogleGenerativeAI

gemini = ChatGoogleGenerativeAI(
    model='gemini-2.0-flash-thinking-exp-01-21',
    temperature=0.7,
    convert_system_message_to_human=True
)
```

* **Model:** `gemini-2.0-flash-thinking-exp-01-21` is used.
* **Temperature:** Controls creativity (0.7 allows moderate creativity).

---

### **5. Generating a Simple Text Response**

```python
response = gemini.invoke("Hello, Gemini!")
print(response.content)
```

* **Simple Interaction:** The model generates a response to the input text.

---

### **6. Customizing the System Instructions (Prompt)**

```python
system_prompt = "You are a professional assistant."

response = gemini.invoke(system_prompt)
print(response.content)
```

* **System Instructions:** Guide the model’s behavior and tone.

---

### **7. Advanced: Using Prompt Templates**

```python
from langchain.prompts import ChatPromptTemplate

prompt_template = ChatPromptTemplate.from_messages([
    ("system", "You are a professional assistant."),
    ("human", "{user_input}")
])

formatted_prompt = prompt_template.format_messages(user_input="Tell me a joke.")
response = gemini.invoke(formatted_prompt)
print(response.content)
```

* **Prompt Template:** Creates structured prompts for more complex interactions.

---

### **8. Security Enhancement: Hiding API Keys**

To further secure your API keys, use Google Colab’s environment variables or a hidden config file.

* **Upload Config:** Use the file upload icon in Colab to upload your `config.txt` file.
* **Read Securely:** Ensure your API key is not printed or exposed.
