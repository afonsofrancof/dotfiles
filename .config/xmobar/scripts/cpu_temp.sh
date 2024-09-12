#!/bin/sh

temp1=70
temp2=85
amd_or_intel=$(sensors | grep 'Package id 0:')


if [$amd_or_intel == ""]
then
	temp=$(sensors | grep 'AMD' | head -n 1 | grep -Po '\+\d+.+°C ' | sed -En 's/\+(.*)\..*°C/\1/p')
else
	temp=$(sensors | grep 'Package id 0:' | awk '{print $4}' | sed 's/+//'| sed 's/.0°C//')
fi

if [ "$temp" -ge "$temp2" ] ; then
    echo "<fc=#D79921><fn=6></fn></fc> <fc=#FB4934> $temp°C</fc>"
elif [ "$temp" -ge "$temp1" ] ; then
    echo "<fc=#D79921><fn=6></fn></fc> <fc=#FE8019> $temp°C</fc>"
else
    echo "<fc=#D79921><fn=6></fn></fc> <fc=#B8BB26> $temp°C</fc>"

fi
