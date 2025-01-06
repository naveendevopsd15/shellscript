#!/bin/bash

USERID =$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

VALIDATE (){

    if [ $1 -ne 0]
    then
    echo -e "$2 .... $R FAILURE" $N
    exit 1
    else
    echo -e"$2 .... $G SUCESS" $N
    fi 

}

if [ $USERID -ne 0]
then 
echo "ERROR:: You must have sudo access to execute this script" 
exit 1

dnf list installed mysql

if [ $? -ne 0]
then
dnf install mysql -y
VALIDATE $? "Installing SQL"
else 
echo -e " $Y Mysql is alredy installed " $N
fi 

dnf list installed git
if [ $? -ne 0]
then
dnf install git -y
VALIDATE $? "Installing Git"
else 
echo -e " $Y Git is alredy installed " $N
fi 

