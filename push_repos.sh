#!/bin/bash

#surge --domain jknoxdev.surge.sh ~/code/jknoxdev/jknoxdev/www/ &


echo '--- notes    ---';cd ~/code/jknoxdev/notes             ; git add .; git commit -m "--$(echo $(hostname))--$(date '+%Y%V%w%H%M')--"; git push;
echo '--- scripts  ---';cd ~/code/jknoxdev/scripts	     ; git add .; git commit -m "--$(echo $(hostname))--$(date '+%Y%V%w%H%M')--"; git push;
echo '--- n3s      ---';cd ~/code/jknoxdev/n3s		     ; git add .; git commit -m "--$(echo $(hostname))--$(date '+%Y%V%w%H%M')--"; git push;
echo '--- videolan ---';cd ~/code/jknoxdev/video-lan-checker ; git add .; git commit -m "--$(echo $(hostname))--$(date '+%Y%V%w%H%M')--"; git push;
echo '--- jknoxdev ---';cd ~/code/jknoxdev/jknoxdev	     ; git add .; git commit -m "--$(echo $(hostname))--$(date '+%Y%V%w%H%M')--"; git push;
echo '--- blog     ---';cd ~/code/jknoxdev/blog		     ; git add .; git commit -m "--$(echo $(hostname))--$(date '+%Y%V%w%H%M')--"; git push;
echo '--- courswrk ---';cd ~/code/jknoxdev/coursework	     ; git add .; git commit -m "--$(echo $(hostname))--$(date '+%Y%V%w%H%M')--"; git push;
echo '--- hack     ---';cd ~/code/jknoxdev/hack		     ; git add .; git commit -m "--$(echo $(hostname))--$(date '+%Y%V%w%H%M')--"; git push;
echo '--- toosl    ---';cd ~/code/jknoxdev/tools	     ; git add .; git commit -m "--$(echo $(hostname))--$(date '+%Y%V%w%H%M')--"; git push;
echo '--- ctf-toos ---';cd ~/code/jknoxdev/ctf-tools	     ; git add .; git commit -m "--$(echo $(hostname))--$(date '+%Y%V%w%H%M')--"; git push;


echo 'waiting for all commands to complete'
wait
echo 'done!'
