<<<<<<< HEAD
import os
if os.path.exists("/media/SAFE/TXTs and MDs/Encoded/output.txt"):
    os.rename("/media/SAFE/TXTs and MDs/Encoded/output.txt", "/media/SAFE/TXTs and MDs/Encoded/output.txt.bak")
    print("Previous Output detected!!")
    # os.remove("output.txt")

infile = open("input.txt", 'r')
outfile = open("/media/SAFE/TXTs and MDs/Encoded/output.txt", "a")
codefile = open('/media/SAFE/TXTs and MDs/encode.code', 'r')

def Encode(message):
    Output=[]
    Msg=list(message.replace(" "," ").strip("\n"))
    words=""
    for char in Msg:
        if char == " ":
            Output.append(words)
            words=""
        else:
            words = words + Map[char]
    Output.append(words)
    return ' '.join(Output)


def Mapping():
    Codes = codefile.readlines()
    mapping = {}
    for code in Codes:
        A = code.strip("\n").split(" ")
        mapping[A[0]] = A[~0]
    return mapping

Messages = infile.readlines()
Map=Mapping()
for message in Messages:
    print(Encode(message), "\n", file=outfile)
=======
import keyboard as kb

# Using readlines()
file1 = open('code.code', 'r')
Lines = file1.readlines()
mapping={}
for line in Lines:
    line=line.strip("\n")
    A = line.split(":")
    # print(A[0], ">>", A[1])
    mapping[A[0]] = A[1]
# print(mapping)

Output=[]
#
# # One-Time && Terminal
# message=input("Enter your Message:")
# Msg=list(message.replace(" ",""))
# for char in Msg:
#     # print(mapping[char])
#     Output.append(mapping[char])
# print(''.join(Output))
#

# kb.read_key()
# kb.is_pressed()

message=kb.get_typed_strings(kb.record(until='escape'))
print(message)

# message=input("Enter your Message:")
for word in message:
    words=[]
    Msg=list(word.replace(" ",""))
    for char in word:
        if char != " ":
            words.append(mapping[char])
    word = ''.join(words)
    Output.append(word)
print(Output)
>>>>>>> parent of 5b36bf9 (Sun Oct 16 04:54:20 AM IST 2022)
