#!/bin/bash

update_number=$(checkupdates | wc -l)
echo "<fc=#7C6F64><fn=6>󰣇 </fn></fc> <fc=#B8BB26>$update_number</fc>"
