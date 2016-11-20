import random

winner = ' '

board = [
    [' ', ' ', ' '],
    [' ', ' ', ' '],
    [' ', ' ', ' ']]

def printboard():
    print(' --- ')
    print('|' + board[0][2] + board[1][2] + board[2][2] + '|')
    print('|' + board[0][1] + board[1][1] + board[2][1] + '|')
    print('|' + board[0][0] + board[1][0] + board[2][0] + '|')
    print(' --- ')

def checkwin(a, b, c):

    if (a == b and b == c and a != ' '):
        return 1
    else:
        return 0

def checkall():

    for r in range(0,3):
        if checkwin(board[2 - r][0], board[2 - r][1], board[2 - r][2]) == 1 :
            return 1

    for c in range(0,3):
        if checkwin(board[0][c], board[1][c], board[2][c]) == 1 :
            return 1
        
    if checkwin(board[0][0], board[1][1], board[2][2]) == 1:
         return 1

    if checkwin(board[2][0], board[1][1], board[0][2]) == 1:
         return 1

    return 0;
    
def play(letter, x, y):
    
    if(board[2 - y][x] == ' '):
        board[2 - y][x] = letter
        if checkall() == 1:
            global winner
            winner = letter
        return 1;
    else:
        return 0;

done = 0

for t in range(0,4):

    done = 0
    while done == 0 and winner == ' ' :
        done = play('X', random.randrange(0, 3),random.randrange(0, 3))

    done = 0
    while done == 0 and winner == ' ' :
        done = play('O', random.randrange(0, 3),random.randrange(0, 3))

done = 0
while done == 0 and winner == ' ' :
    done = play('X', random.randrange(0, 3),random.randrange(0, 3))

printboard()
if(winner == ' '):
    print('Cat Wins')
else:
    print('Winner ' + winner)





