#判断前一个命令是否执行成功
#方法一
if [ $? -eq 0 ]; then echo "success"; else echo "fail"; fi
#方法二
if [ $? -ne 0 ]; then
    echo "fail"
else
    echo "success"
fi
