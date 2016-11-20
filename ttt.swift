//: Playground - noun: a place where people can play

import UIKit
import Darwin

var winner = " "
var done = 0
var board = [[" ", " ", " "],[" ", " ", " "],[" ", " ", " "]]

func printboard()
{
    print(" --- ")
    print("|" + board[0][2] + board[1][2] + board[2][2] + "|")
    print("|" + board[0][1] + board[1][1] + board[2][1] + "|")
    print("|" + board[0][0] + board[1][0] + board[2][0] + "|")
    print(" --- ")
}

func checkwin(a: String, b: String, c: String) -> Int
{
    if (a == b && b == c && a != " ")
    {
        return 1
    }
    
    return 0
}

func checkall() -> Int
{
    for r in 0...2
    {
        if(checkwin(a: board[2 - r][0], b: board[2 - r][1], c: board[2 - r][2]) == 1)
        {
            return 1
        }
    }

    for c in 0...2
    {
        if(checkwin(a: board[0][c], b: board[1][c], c: board[2][c]) == 1 )
        {
            return 1
        }
    }
    
    if(checkwin(a: board[0][0], b: board[1][1], c: board[2][2]) == 1)
    {
        return 1
    }

    if(checkwin(a: board[2][0], b: board[1][1], c: board[0][2]) == 1)
    {
        return 1
    }

    return 0
}


func play(letter: String, x: UInt32, y: UInt32) -> Int
{
    let c = Int(2 - y)
    let	 h = Int(x)
    
    if(board[c][h] == " ")
    {
        board[c][h] = letter
        
        if(checkall() == 1)
        {
            winner = letter
        }
        
        return 1;
    }
    return 0;
}

done = 0

for t in 0...3
{
    done = 0
    
    while(done == 0 && winner == " ")
    {
        done = play(letter: "X", x: arc4random_uniform(3) ,y: arc4random_uniform(3) )
    }

    done = 0
    
    while(done == 0 && winner == " ")
    {
        done = play(letter: "O", x: arc4random_uniform(3) ,y: arc4random_uniform(3) )
    }
}

done = 0

while(done == 0 && winner == " ")
{
    done = play(letter: "X", x: arc4random_uniform(3) ,y: arc4random_uniform(3) )
}

printboard()

if(winner == " ")
{
    print("Cat Wins")
}
else
{
    print("Winner " + winner)
}
