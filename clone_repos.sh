#!/bin/bash
git config --global user.email "techbiotic@posteo.de"
git config --global user.name "jknoxdev"

echo '--- notes    ---';cd ~/code/jknoxdev ; git clone git@github.com:jknoxdev/notes.git ;
echo '--- scripts  ---';cd ~/code/jknoxdev ; git clone git@github.com:jknoxdev/scripts.git ;
echo '--- n3s      ---';cd ~/code/jknoxdev ; git clone git@github.com:jknoxdev/n3s.git ;
echo '--- videolan ---';cd ~/code/jknoxdev ; git clone git@github.com:jknoxdev/video-lan-checker.git ;
echo '--- jknoxdev ---';cd ~/code/jknoxdev ; git clone git@github.com:jknoxdev/jknoxdev.git ;
echo '--- blog     ---';cd ~/code/jknoxdev ; git clone git@github.com:jknoxdev/blog.git ;
echo '--- courswrk ---';cd ~/code/jknoxdev ; git clone git@github.com:jknoxdev/coursework.git ;
echo '--- hack     ---';cd ~/code/jknoxdev ; git clone git@github.com:jknoxdev/hack.git ;
echo '--- toosl    ---';cd ~/code/jknoxdev ; git clone git@github.com:jknoxdev/tools.git ;
echo '--- ctf-toos ---';cd ~/code/jknoxdev ; git clone git@github.com:jknoxdev/ctf-tools.git ;
echo '--- ghp-site ---';cd ~/code/jknoxdev ; git clone git@github.com:jknoxdev/jknoxdev.github.io.git ;

echo '--- ghp-site ---';cd ~/code/jknoxdev ; git clone git@github.com:jknoxdev/www.b3x9.github.io.git ;
echo '--- ghp-site ---';cd ~/code/jknoxdev ; git clone git@github.com:jknoxdev/shop.b3x9.github.io.git ;
echo '--- ghp-site ---';cd ~/code/jknoxdev ; git clone git@github.com:jknoxdev/blog.b3x9.github.io.git ;
echo '--- ghp-site ---';cd ~/code/jknoxdev ; git clone git@github.com:jknoxdev/jknox.b3x9.github.io.git ;
echo 'done!'
