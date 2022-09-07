MYSHELL=`ps -p $$ | grep -o "\w*$" | tail -n1`
echo $MYSHELL
