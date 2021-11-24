# Global variables
END_READ_FILE = 7
END_WRITE_FILE = 65536

def Read_File(fileName):

    counter = 0
    lines = []
    file = open(fileName, "r") # Opening file
    
    for line in file: # Reading file line by line
        counter += 1
        lines.append(line)
        
        if(counter == END_READ_FILE):
            break
        
    file.close() # Closing file
    return lines

def Read_Character(fileName):

    chars = []
    # Opening file
    file = open(fileName, "r")

    # Reading file line by line
    for line in file:

        # Reading line char by char
        for char in line:

            chars.append(char)

    # Closing file
    file.close()

    return chars

def ASCII_Converter(chars):

    convertedChars = []

    for char in chars:

        convertedChars.append(ord(char))
            
    return convertedChars

def Write_File(fileName, lines, chars):

    counter = 0
    file = open(fileName, "w") # Opening file writing mode 
    
    for line in lines: # Initial text

        file.write(line)

    # First four lines reserved for hardware
    for i in range(4):
        
        #Text Fomat
        file.write(str(i) + " :   " + str(0) + ";")
        file.write("\n")
        counter += 1

    # Writing file char by char
    for char in chars:


        file.write( str(counter) + " :   " + str(char) + ";")

        file.write("\n")
        counter += 1

        if(counter == END_WRITE_FILE):

            break
   
    file.write("END;")  # Last line
    file.write("\n")
    file.close() # Closing file
    
#Calling the methods

readLines = Read_File("ejemplo.mif")
readChars = Read_Character("ejemplo.txt")
convertedChars = ASCII_Converter(readChars)
Write_File("ejemplo.mif", readLines, convertedChars)
