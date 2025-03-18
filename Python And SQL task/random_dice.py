'''Write a python program to roll the dice and ask every time the user to roll the dice or not. 
Once the user enters no, calculate the sum of all the numbers given by dice.
Ensure you use exception handling such as if the user enters other than yes or nothen program 
must terminate with a message that user entered some text otherthan yes or no along with the sum of numbers that dice has given'''

from random import randrange

class invalid_user_input(Exception):
    pass 

def dice_face(roll : int) -> None :

    '''This function is to print the dice face based on the number user gets
        Input : Here the input will be the roll value the user is getting 
        Output : It will print the dice face based on the roll value'''
    if roll==1:
        print("+-------+")
        print("|       |")
        print("|   O   |")
        print("|       |")
        print("+-------+\n")
    
    elif roll==2:
        print("+-------+")
        print("| O     |")
        print("|       |")
        print("|     O |")
        print("+-------+\n")
    elif roll==3:
        print("+-------+")
        print("| O     |")
        print("|   O   |")
        print("|     O |")
        print("+-------+\n")
    
    elif roll==4:
        print("+-------+")
        print("| O   O |")
        print("|       |")
        print("| O   O |")
        print("+-------+\n")
    elif roll==5:
        print("+-------+")
        print("| O   O |")
        print("|   O   |")
        print("| O   O |")
        print("+-------+\n")
    else:
        print("+-------+")
        print("| O   O |")
        print("| O   O |")
        print("| O   O |")
        print("+-------+\n")

def dice_roll(user_input : str) -> int:
    '''This function is to roll the dice and generate the random number to the user
    Input : It takes the user_input i.e. string input
    Output : It will return the roll value of the dice'''
  

    roll=randrange(1,7)
    return roll
    
print('\n')
print('--------------------------------------------------------------------------------------------------------------\n')
print("Welcome to Dice Game dice 🏁\n")

total=0

while(True):
    
    print("Do you want to role the dice? \n")
    
    user_input=input("Y for yes and N for no: ").upper()
    
    try:
        if user_input not in ['Y','N']:
            
            raise invalid_user_input("Game Over!!\nUser entered some text other than Y or N 🤦‍♂️\n")
        
        elif user_input=='N':
            
            print(f"\nYour final score is {total}\n")
            
            break
        
        else:
            roll=dice_roll(user_input)
            
            print(f'\nYou rolled a {roll}')
            
            dice_face(roll)
            
            total+=roll
            
        # elif user_input=='Y':
        #     roll=randrange(1,7)
        #     print(f"You rolled a {roll}\n")
        #     dice_face(roll)
        #     total+=roll
        # elif user_input=='N':
        #     print(f'Your final score: {total}')
        #     break
        
    except invalid_user_input as error:
        
        print(f"\nYour final score is {total}\n")
        
        print(error)
        print('\n')
        
        break
       
    finally:
        pass

print("Thank you for playing the game !! ❤")


