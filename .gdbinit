#source /usr/share/gef/gef.py
source  /usr/share/pwndbg/gdbinit.py

source 
define hook-run
python
import angelheap
angelheap.init_angelheap()
end
end

