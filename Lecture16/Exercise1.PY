#!/usr/bin/python3

import os

personal = {}

personal["Name"] = input("\nWhats your name ? ")
personal["Age"] = int(input("\nHow old are you ? "))
personal["Colour"] = input("\nWhat's your favourite colour ? ")
personal["Python"] = input("\nDo you like python ? ")
personal["World"] = input("\nThe world is flat: TRUE OR FALSE ? ")

def Interrogation(name,age,colour,python,world) :
    for character in name :
        if not character.isalpha() :
            return print("Please try and type your name this time ok ?? ")
    if age > 99 or age < 3 :
        return print("Why are you messing with me we both know that's not your age!! ")
    else :
        print(f"I see you are the prime age of {age}! ")
    if colour.isalpha() :
        print("That's the prettiest colour in existence! ")
    else :
        return print("Thats not a colour silly ")
    if python.upper() == "YES" :
        print("I thought i would like you as a person ")
    else :
        return print("Honestly I hate you!!! ")
    if world.upper() == "TRUE" :
        print("You are one of the smart ones ")
    else :
        return print("You must be living on another planet then ")
    return print("Amazing!!")

Interrogation(*list(personal.values()))

