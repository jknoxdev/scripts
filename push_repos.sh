#!/bin/bash

cd ~/code/jknoxdev/notes             ; git add .; git commit -m "--refresh--$(date '+%Yw%V%w.%H%M')"; git push;
cd ~/code/jknoxdev/scripts	     ; git add .; git commit -m "--refresh--$(date '+%Yw%V%w.%H%M')"; git push;
cd ~/code/jknoxdev/n3s		     ; git add .; git commit -m "--refresh--$(date '+%Yw%V%w.%H%M')"; git push;
cd ~/code/jknoxdev/video-lan-checker ; git add .; git commit -m "--refresh--$(date '+%Yw%V%w.%H%M')"; git push;
cd ~/code/jknoxdev/jknoxdev	     ; git add .; git commit -m "--refresh--$(date '+%Yw%V%w.%H%M')"; git push;
cd ~/code/jknoxdev/blog		     ; git add .; git commit -m "--refresh--$(date '+%Yw%V%w.%H%M')"; git push;
cd ~/code/jknoxdev/coursework	     ; git add .; git commit -m "--refresh--$(date '+%Yw%V%w.%H%M')"; git push;
cd ~/code/jknoxdev/hack		     ; git add .; git commit -m "--refresh--$(date '+%Yw%V%w.%H%M')"; git push;
cd ~/code/jknoxdev/tools	     ; git add .; git commit -m "--refresh--$(date '+%Yw%V%w.%H%M')"; git push;
cd ~/code/jknoxdev/ctf-tools	     ; git add .; git commit -m "--refresh--$(date '+%Yw%V%w.%H%M')"; git push;

echo 'done!'
