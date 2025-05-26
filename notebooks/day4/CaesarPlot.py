import matplotlib.pyplot as plt


def CaesarDist(shift_key, text):
    
    ciphertext=""
    text = text.upper()
    dict_alpha_initial= {'A' : 0, 'B': 0, 'C': 0, 'D': 0, 'E': 0, 'F': 0, 'G':0, 'H':0, 'I':0, 'J':0, 'K':0, 'L':0, 'M':0, 'N':0, 'O':0, 'P':0, 'Q':0, 'R':0, 'S':0, 'T':0, 'U':0, 'V':0, 'W':0, 'X':0, 'Y':0, 'Z':0}
    dict_alpha_final= {'A' : 0, 'B': 0, 'C': 0, 'D': 0, 'E': 0, 'F': 0, 'G':0, 'H':0, 'I':0, 'J':0, 'K':0, 'L':0, 'M':0, 'N':0, 'O':0, 'P':0, 'Q':0, 'R':0, 'S':0, 'T':0, 'U':0, 'V':0, 'W':0, 'X':0, 'Y':0, 'Z':0}

    for letter in text:
        if letter.isalpha():
            base_val=65
            cipher_letter=chr(((ord(letter) - base_val + shift_key) % 26) + base_val)
            # example:letter = C, shift = 27:  67 -65 + 27 = 29 %26 = 3 + 65 = 68 which is D 
    
            ciphertext+= str (cipher_letter)
            
            dict_alpha_initial[letter]+=1
            dict_alpha_final[cipher_letter]+=1
        
        else:
            ciphertext+=letter
            
    print (f"Plain Text: {text}\n\nCiper Text: {ciphertext}\n ")    
            
    return dict_alpha_final
    


def VigenereDist(word_key, text):
    
    text = text.upper().replace(" ", "")
    word_key=word_key.upper()
    
    dict_alpha_initial= {'A' : 0, 'B': 0, 'C': 0, 'D': 0, 'E': 0, 'F': 0, 'G':0, 'H':0, 'I':0, 'J':0, 'K':0, 'L':0, 'M':0, 'N':0, 'O':0, 'P':0, 'Q':0, 'R':0, 'S':0, 'T':0, 'U':0, 'V':0, 'W':0, 'X':0, 'Y':0, 'Z':0}
    dict_alpha_final= {'A' : 0, 'B': 0, 'C': 0, 'D': 0, 'E': 0, 'F': 0, 'G':0, 'H':0, 'I':0, 'J':0, 'K':0, 'L':0, 'M':0, 'N':0, 'O':0, 'P':0, 'Q':0, 'R':0, 'S':0, 'T':0, 'U':0, 'V':0, 'W':0, 'X':0, 'Y':0, 'Z':0}
    
    ciphertext=""
    for i in range(len(text)):
        if text[i].isalpha():
            base_val=65

            cipher_index = ((ord(text[i]) - base_val + ord(word_key[i % len(word_key)]) - base_val) % 26)
            cipher_letter = chr(cipher_index + base_val)
    
            ciphertext+= str (cipher_letter)
                
            dict_alpha_initial[text[i]]+=1
            dict_alpha_final[cipher_letter]+=1
            
    print (f"Plain Text: {text}\n\nCiper Text: {ciphertext}\n ")
    
    return dict_alpha_final


def BarDist(dict_alpha_final):
    
    total_final = sum (int(val) for val in dict_alpha_final.values())
    percentages = [(val/total_final * 100) for val in dict_alpha_final.values()]
    
    plt.figure(figsize=(7,10))
    plt.title("Final frequency")
    plt.bar(dict_alpha_final.keys(), percentages, color='pink')
    plt.xlabel("Letters")
    plt.ylabel(" frequency percentage")
    plt.grid(axis='y', linestyle='--', alpha=0.8)
    plt.show()
    
    
'''
    total = sum (int(val) for val in dict_alpha_initial.values())
    percentages = [(val/total * 100) for val in dict_alpha_initial.values()]
    
    
    plt.figure(figsize=(7,10))
    plt.title("Initial frequency")
    plt.bar(dict_alpha_initial.keys(), percentages, color='pink')
    plt.xlabel("Letters")
    plt.ylabel(" frequency percentage")
    plt.grid(axis='y', linestyle='--', alpha=0.7)
    plt.show()

'''
    
plaintext= "The quiet forest stretched beyond the hills, where old oak trees whispered in the wind. Birds sang above the canopy, and sunlight filtered through leaves that danced like fire. A traveler walked slowly along the narrow path, tracing footsteps in soft earth. The world felt calm, as though time itself had paused to breathe."
ptext="get all soldiers meals"
final_caesar= CaesarDist(56, plaintext)
final_vigenere= (VigenereDist("fringe", plaintext))
BarDist(final_caesar)
BarDist(final_vigenere)