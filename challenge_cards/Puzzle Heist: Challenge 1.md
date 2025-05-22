## Puzzle Heist (The Cipher Box Challenge): Challenge 1

### Difficulty Level: Hard

### Instructions

**Round 1: Shifting an Alphabet**
You are given the word: `mAkErSpAcE`

1. Find the 7th letter in the word.
2. Shift that 7th letter forward by the number of unique vowels in the given word.
3. Convert the letter to ASCII code. _(Look up what they are.)_
4. Count the number of unique consonants in the word and add it to the ASCII code.
5. Add the digits of the final number until you get a single digit number.

That’s your first digit!

**Round 2: Slice of Meaning**
You are given the sentence:
`"Cyber security is a shared responsibility, not just an IT concern."`

1. m = (count the number of words with less than five letters)
2. n = (count the number of words with more than five letters) + 1
3. Reverse the _n_ th word in the sentence.
4. Remove all the vowels from the _m_ th word.
5. Add the new _n_ th word and the new _m_ th word. (Can strings be added? Reason!)
6. Count the number of letters in this new word.
7. Keep adding the digits of the number until you get a single digit number.

That’s your second digit!

**Round 3: The Grip Map**
You are given a 6x4 letter grid:

```
T  R  A  C  E  
H  A  C  K  S  
O  N  L  I  N  
E  D  A  T  A  
P  A  S  S  W  
O  R  D  S  !
```
You are also given these coordinates:
(0,0), (1,2), (2,3), (3,1), (4,4), (5,0), (2,0), (3,3), (5,2)

1. Use the coordinates to extract letters from the grid. Each pair represents (row, column). _Look up how matrices work._
2. Combine the letters into a sequence.
3. Reverse the string.
4. Count the number of unique consonants in the reversed string.
5. Add the digits of the final number until you get a single digit number.

That’s your third digit.

Were any of the steps here unnecessary?

**Round 4: The Pattern Key**
You are given the letter sequence:
`"B E H K N"`

1. Identify the pattern in the sequence.
2. Determine the next letter that would follow in the sequence.
3. x = the position of that letter in the alphabet. (A=1, ..., Z=26)
4. y = number of letters in the given sequence
5. z = y mod x

And, that’s your fourth digit!

**Final Step: Unlock the Box**
Combine the four digits you discovered in each round.
This 4-digit code will open your team’s puzzle box.
Good luck! :)
