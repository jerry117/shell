echo "启动APP"
adb shell am start -S -W apppackage/XXXActivity
sleep 5
swipe_count=5

echo "清除设备中的dumpheap缓存文件"
adb shell rm -rf /data/local/tmp/dumpheap/

#win不行会报路径错误
echo "创建新的dumpheap文件目录"
adb shell mkdir /data/local/tmp/dumpheap/


#需要修改对应的操控，使用Mac
for (( i = 0; i < ${swipe_count}; i++ )); do
    echo "向下滑动列表"
    adb shell input swipe 700 2000 700 200
    adb shell am dumpheap com.xueqiu.android /data/local/tmp/dumpheap/dumpheap_${i}
    sleep 3
    adb pull /data/local/tmp/dumpheap/dumpheap_${i} `pwd`/test/dumpheap_${i}
    hprof-conv `pwd`/test/dumpheap_${i} `pwd`/test/dumpheap_${i}.jvm.hprof
done
