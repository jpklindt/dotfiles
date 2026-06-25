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


pd=`cat /sys/class/power_supply/BAT0/power_now`;

bat_result=$(echo "scale=1; $pd/1000000" | bc)W;

bat_status=$(cat /sys/class/power_supply/BAT0/status);



energy_full=`cat /sys/class/power_supply/BAT0/energy_full`;

energy_now=`cat /sys/class/power_supply/BAT0/energy_now`;

bat_percentage=$(echo "scale=3; ($energy_now/$energy_full)*100" | bc);

bat_percentage=$(printf "%.1f" $bat_percentage);



remaining_energy=$(echo "$energy_full - $energy_now" | bc);

time_until_full="";



if [[ $bat_status == "Charging" ]]; then

    bat_result="+$bat_result";

    time_until_full=$(echo "scale=3; ($remaining_energy / $pd) * 60" | bc);

    time_until_full=$(printf "%.0f" $time_until_full);

    echo $time_until_full min \| $bat_result \| $bat_percentage% \| $signal_icon;

fi;



if [[ $bat_status == "Discharging" ]]; then

    echo $bat_result \| $bat_percentage% \| $signal_icon;

fi;

