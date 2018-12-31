#判断前一个命令是否执行成功
#方法一
if [ $? -eq 0 ]; then echo "success"; else echo "fail"; fi
#方法二
if [ $? -ne 0 ]; then
    echo "fail"
else
    echo "success"
fi

#获取CPU和memory
#!/bin/sh
while true
do
time=$(date "+%Y-%m-%d %H:%M:%S")
echo "${time}" >> cpu_mem.txt
top -b -n 1 |grep -E "CPU:|Mem:" >> cpu_mem.txt
sleep 1
done
