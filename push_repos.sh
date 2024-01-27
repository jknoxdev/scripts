#!/bin/bash

cd ./notes              ; git add .; git commit -m "--refresh--$(date -I)"; git push; cd ../;
cd ./scripts		; git add .; git commit -m "--refresh--$(date -I)"; git push; cd ../;
cd ./n3s		; git add .; git commit -m "--refresh--$(date -I)"; git push; cd ../;
cd ./video-lan-checker	; git add .; git commit -m "--refresh--$(date -I)"; git push; cd ../;
cd ./jknoxdev		; git add .; git commit -m "--refresh--$(date -I)"; git push; cd ../;
cd ./blog		; git add .; git commit -m "--refresh--$(date -I)"; git push; cd ../;
cd ./coursework		; git add .; git commit -m "--refresh--$(date -I)"; git push; cd ../;
cd ./hack		; git add .; git commit -m "--refresh--$(date -I)"; git push; cd ../;
cd ./tools		; git add .; git commit -m "--refresh--$(date -I)"; git push; cd ../;
cd ./ctf-tools		; git add .; git commit -m "--refresh--$(date -I)"; git push; cd ../;

echo 'done!'
