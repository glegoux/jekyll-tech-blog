---
title: "Access to a computer from USB key"
description: "Somebody with USB key can take control of your computer"
authors: ["glegoux"]
time_reading_minutes: 5
category: "Security"
---

Imagine that you are in one of the following situations:

1. You have forgotten your password to connect to personal workspace of your computer, but you want reset it.
2. After a wrong manipulation, you can not access to personal data of your computer, but you want retrieve this access.
3. You found a computer without supervision whom you are not the owner, but you want see the content of the file system.

With a bootable USB key on Ubuntu, you can resolve these situations, first by mounting the file system of the targeted computer with all permissions, then by changing the password of any local user, and finally by connecting to the targeted workspace and exploring the file system.

First, plug your USB drive into the target computer, choose your key as the boot device for the target computer to boot to the Ubuntu system on your USB drive. On a DELL computer, press `F12` to access this selection. This information is visible on the welcome screen of the manufacturer of your computer.

{% include article-image.html title="DELL welcome screen" src="welcome-screen-dell.png" %}

Start by choosing the following option: 

{% include article-image.html title="Advanced startup options" src="hack1.png" %}

Then select the `recovery mode`:

{% include article-image.html title="Getting started in recovery mode" src="hack2.png" %}

Launch a `root shell`:

{% include article-image.html title="Choosing the root shell" src="hack3.png" %}

You access a device as a `root` user.

<pre class="info">
If you need to access the internet, select the network entry before. To verify that you have access to the web you can <i>ping 8.8.8.8</i> on the Google DNS server, then make <i>nslookup  8.8.8.8</i> to check that the DNS resolution works. If that does not work, add this line <i>nameserver 8.8.8.8</i> to the file <i>/etc/resolv.conf</i> (this will be deleted when you restart the computer) and restart your service <i>network-manager</i> with <i>service network-manager restart</i>.
</pre>

For the moment the file system is only in `read only`, type the following command to mount the file system in` read / write` at the root of your key:
 
~~~ terminal
mount -o remount, rw /
~~~

Now you can copy the file system to an external hard drive, and then you can choose the new user password by typing:

~~~ terminal
passwd <username>
~~~
 
<pre class="info">
If you do not know the users on this machine, you can do <i>ls /home</i>. Certainly a user of this machine corresponds to a directory name in <i>/home/</i>, or even view the file <i>/etc/passwd</i>, or else you can create a user as you are <i>root</i>.
</pre>

Type in the new password and confirm.

You can shut down the computer.

~~~ terminal
shutdown -h now
~~~

You can now turn on the computer normally and log in with the chosen user and password.

<pre class="error">
Beware the morality of this article is that a person physically accessing your computer does not need login /password to access your computer. If you want to protect yourself from this attack, you must <b>encrypt your hard drive</b>.
</pre>

Well done :smile:!
