Script for openwrt
Show online status by led

1. Put file online_led.sh to path /usr/bin/

2. Make file online_led.sh executable

3. Add to Scheduled Tasks:
*/1 * * * * /usr/bin/online_led.sh
