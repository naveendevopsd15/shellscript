#!/bin/bash
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shellscript-logs"
LOGS_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOGS_FILE_NAME="$LOGS_FOLDER/$LOGS_FILE-$TIMESTAMP.log"

VALIDATE (){

    if [ $1 -ne 0 ]
    then
    echo -e "$2 .... $R FAILURE" 
    exit 1
    else
    echo -e "$2 .... $G SUCESS" 
    fi 

}

echo "script statred executing at: $TIMESTAMP" &>>$LOGS_FILE_NAME

if [ $USERID -ne 0 ]
then 
echo "ERROR:: You must have sudo access to execute this script" 
exit 1
fi

dnf list installed mysql &>>$LOGS_FILE_NAME

if [ $? -ne 0 ]
then
dnf install mysql -y &>>$LOGS_FILE_NAME
VALIDATE $? "Installing SQL"
else 
echo -e "Mysql is alredy.... $Y installed $N" 
fi 

dnf list installed git &>>$LOGS_FILE_NAME

if [ $? -ne 0 ]
then
dnf install git -y &>>$LOGS_FILE_NAME
VALIDATE $? "Installing Git"
else 
     echo -e "Git is alredy.... $Y installed $N" 
fi 