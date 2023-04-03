import openai
import speech_recognition as sr
import pyaudio

# Set OpenAI API key
openai.api_key = 'your_openai_api_key_here'

# Define speech recognition function
def recognize_speech():
    r = sr.Recognizer()
    with sr.Microphone() as source:
        print("Speak:")
        audio = r.listen(source)
    try:
        text = r.recognize_google(audio, language='en-US')
        return text
    except sr.UnknownValueError:
        print("Could not understand audio")
        return ''
    except sr.RequestError as e:
        print("Could not request results from Google Speech Recognition service; {0}".format(e))
        return ''

# Generate text with OpenAI GPT-3
def generate_text(prompt):
    response = openai.Completion.create(
        engine="davinci",
        prompt=prompt,
        max_tokens=1024,
        n=1,
        stop=None,
        temperature=0.5,
    )

    message = response.choices[0].text
    return message.strip()

# Start the application
if __name__ == '__main__':
    while True:
        text = recognize_speech()
        if text:
            prompt = f"What should I write about {text}?"
            message = generate_text(prompt)
            print(message)
