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

    echo $time_until_full min \| $bat_result \| $bat_percentage% \| ;

fi;



if [[ $bat_status == "Discharging" ]]; then

    echo $bat_result \| $bat_percentage% \| ;

fi;

if [[ $bat_status == "Full" ]]; then
    echo 100% \| ;
fi
