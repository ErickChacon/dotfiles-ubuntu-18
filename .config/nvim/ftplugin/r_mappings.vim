
nmap <buffer> <silent> <leader>ro :call RObjBrowserNerd()<CR>

" Mappings to control graphics devices
nmap <buffer> <LocalLeader>rgn :RSend dev.new()<CR>
nmap <buffer> <LocalLeader>rgo :RSend dev.off(which = dev.cur())<CR>
nmap <buffer> <LocalLeader>rgl :RSend dev.list()<CR>
nmap <buffer> <LocalLeader>rgc :RSend dev.cur()<CR>
nmap <buffer> <LocalLeader>rgk :RSend dev.set(which = dev.next())<CR>
nmap <buffer> <LocalLeader>rgj :RSend dev.set(which = dev.prev())<CR>
nmap <buffer> <LocalLeader>rgs :RSend dev.set(
nmap <buffer> <LocalLeader>rgq :RSend graphics.off()<CR>

