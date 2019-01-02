echo "启动APP"
app_name="com.xxx.client.dev"
app_lanuch="com.xxx.client.startup.SplashActivity"

echo "重置电池数据"
adb shell dumpsys batterystats --reset
adb shell dumpsys batterystats --enable full-wake-history

adb shell am start -S -W ${app_name}/${app_lanuch}
sleep 10

echo "进行monkey测试"
adb shell monkey -p ${app_name} --throttle 20 30

#针对6.0和以下的，win
echo "采集电池数据"
adb bugreport > /c/Users/Administrator/Desktop/bugreport.txt

#针对7.0和以上的，Mac
echo "采集电池数据"
adb bugreport `pwd`/bugreport.zip

