startDriver TuyaMCU
startDriver tmSensor

// may be needed, depends on device, some also use 9600
tuyaMCU_setBaudRate 115200

// dpID 1 is tempererature div 10
setChannelType 1 temperature_div10
linkTuyaMCUOutputToChannel 1 val 1
// dpID 2 is % humidity
setChannelType 2 Humidity
linkTuyaMCUOutputToChannel 2 val 2
// dpID 3 is battery state - low(0), mid(1) and high(2)
linkTuyaMCUOutputToChannel 3 enum 3
setChannelType 3 ReadOnlyLowMidHigh
setChannelLabel 3 Battery

// on tempererature change
addEventHandler OnChannelChange 1 SendGet http://192.168.0.75/log.php?t=$CH1
addEventHandler OnChannelChange 2 SendGet http://192.168.0.75/log.php?h=$CH2


//
// setup dpCache - temperature interval
//
// Show textfield for that
setChannelType 5 TextField
// setup display name
setChannelLabel 5 Temperature Interval
// Make value persistant (stored between reboots), 
// start value -1 means "remember last"
SetStartValue 5 -1
// set default value if not set
if $CH5==0 then "setChannel 5 1"
// link dpID 17 to channel 5, the type is val, extra '1' means that its dpCache variable
linkTuyaMCUOutputToChannel 17 val 5 1

setChannelType 6 TextField
setChannelLabel 6 Humidity Interval
SetStartValue 6 -1
if $CH6==0 then "setChannel 6 1"
linkTuyaMCUOutputToChannel 18 val 6 1



waitFor WiFiState 4
SendGet http://192.168.0.75/log.php?t=HEEELLLO
