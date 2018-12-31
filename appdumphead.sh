echo "启动APP"
adb shell am start -S -W apppackage/XXXActivity
sleep 5
swipe_count=5

echo "清除设备中的dumpheap缓存文件"
adb shell rm -rf /data/local/tmp/dumpheap/

#win不行会报路径错误
echo "创建新的dumpheap文件目录"
adb shell mkdir /data/local/tmp/dumpheap/
