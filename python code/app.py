#!/bin/python3
print("content:text/plain")
#print("Access-Control-Allow-Origin: *")
print()

import cgi
import openai

data_taker=cgi.FieldStorage()
user_input=data_taker.getvalue("user_input")
print("user_input")

openai.api_key = "sk-proj-9l7Qp5IAGJxa3_b8abgqCnYKLZ5719VbyWcSNKrJS711
lh_QOrurVtU8IjET3BlbkFJf_qsjyZYucD5cd4IMrmDUyJkkq9p6OlDBZGmdn6k3qLdFvv
WMHTA8Tk0jsA"
response = openai.Image.create(prompt=user_input, n=1, size="1024x1022
4")
image_url = response['data'][0]['url']
print(image_url)






import openai
import os

# Set your OpenAI API key
openai.api_key = os.getenv("OPENAI_API_KEY")

def generate_response(prompt):
    response = openai.ChatCompletion.create(
        model="gpt-3.5-turbo",
        messages=[
            {"role": "system", "content": "You are a helpful assistant."},
            {"role": "user", "content": prompt},
        ],
        max_tokens=150,
        n=1,
        stop=None,
        temperature=0.7,
    )
    return response.choices[0].message['content']

# Get user input and generate response
user_prompt = input("Enter your request: ")
response = generate_response(user_prompt)
print("ChatGPT:", response)
