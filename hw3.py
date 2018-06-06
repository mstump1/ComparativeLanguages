#Write a Python 3 program (hw3.py) to demonstrate the use of iterators described in Chapter 6.
#Write a generator named powers that takes a single argument,
#a positive integer n, and generates triples (i, i2, i3) from i =1 to n.
#Use that generator to create a list of triples for the first 5 positive integers.
#Print the created list. Then get the iterator for the created list and use it in a while loop
#(i.e., use next) to print the middle number from the triples in the list (do not use for loop).
#Make sure to handle any exception.

#[(1, 1, 1), (2, 4, 8), (3, 9, 27), (4, 16, 64), (5, 25, 125)]
#1
#4
#9
#16
#25
def powers(n):
    #print("now")
    i = 1
    while(i <= n):
        yield i, i*i, i*i*i
        i += 1

    return

input = 5
#temp is the generator returned
temp = powers(input)

#l is the list of generated values
l = list(temp)
print(l)

#go through l using iter.next and print every middle number
for i in l:
    iterator = iter(i)
    iterator.next()
    print(iterator.next())