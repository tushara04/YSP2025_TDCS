## Uniquely Decodable Code and Huffman Coding"

### Difficulty Level: Hard

### Instructions
You have been give the sentence: 
`Hi, by doing this activity, you just learned what uniquely decodable code is. Good job!`

1. Make a frequency table: count how many times each character appears (including space, punctuations, and uppercase and lowercase letters separately).
2. Construct a Huffman Tree: use bottom-up approach and combine the two least frequency characters at each step; show the final tree with characters as leaf nodes.
3. Assign code: for each character, write down the binary code, tracing from the root to each leaf. 
```
Left edge: 0
Right edge: 1
```
4. Encode: encode the full sentence into a binary string using the Huffman code you wrote.
5. Decode: given the binary string, decode it back to the original sentence. 
Share your thoughts after doing this activity.
