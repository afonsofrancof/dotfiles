#!/bin/sh
freespace=$(btrfs fi usage / | grep -Po 'Free \(estimated\):.*' | awk '{print $3}')
echo "<fc=#7C6F64><fn=6></fn></fc>  <fc=#B8BB26> $freespace</fc>"
