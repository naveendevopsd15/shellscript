#!/bin/bash

NUMBER=$1
# -gt, -lt, -eq, -ge, -le

if [ $NUMBER -gt 100 ]
then 
echo "The Given Number is greater than 100"
else
echo "The Given Number is less than  than 100"
fi