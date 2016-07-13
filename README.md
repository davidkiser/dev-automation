# dev-automation


Windows Install Procedure

Note: On Thinkpads, you may need to go into the bios and enable Virtualization support before using virtualbox

1) Install Vagrant 
   http://www.vagrantup.com 
2) Install Virtualbox  
   http://www.virtualbox.org/wiki/Downloads 
3) Install putty (if you have git installed, and installed the openssh client that is bundled with it, this may not be needed) 
   http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html 
4) Github vagrant files  
   https://github.com/davidkiser/dev-automation
5) Reboot  


Mac/OSX  

Same procedures as above, but you can skip putty, the bios junk, and probably rebooting


LAB EXERCISE

Using what you have learned,  create a simple ubuntu based vagrant box that sets its private networking IP to 192.168.10.10 
and launches a shell provisioner that installs apache using apt-get,  starts it up,  and  uses wget/curl to copy a simple index.html  
page from another site, or echo to create a simple html page at the documents root for apache ( hint: /var/www/html/index.html ).
