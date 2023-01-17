import speech_recognition as sr

listener = sr.Recognizer()

try:
    with sr.Microphone() as data_taker:
        print("Say Something")
        voice = listener.listen(data_taker)
        instruct = listener.recognize_google(voice)
        instruct = instruct.lower()
    print(instruct)
except:
    pass
