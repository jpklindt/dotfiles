signal_all=`iwconfig wlp2s0 | grep Link | head -c 28 | tail -c 5`;
signal_level=`(echo $signal_all | head -c 2)`;


essid=$(iwconfig wlp2s0 | grep "ESSID" | awk -F ':' '{print $2}' | sed 's/"//g')
if [ "$essid" = "off/any" ]; then
    signal_icon=`(echo "󰤭")`;
elif [ "$signal_level" -le 30 ]; then
    signal_icon=`(echo "󰤟")`;
elif [ "$signal_level" -le 50 ]; then
    signal_icon=`(echo "󰤢")`;
elif [ "$signal_level" -le 65 ]; then
   signal_icon=`(echo "󰤥")`;
elif [ "$signal_level" -le 80 ]; then
   signal_icon=`(echo "󰤨")`;
else
    signal_icon=`(echo "󰤩")`;
fi

echo $signal_icon;
