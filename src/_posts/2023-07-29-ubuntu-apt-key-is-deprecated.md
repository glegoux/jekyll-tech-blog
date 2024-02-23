---
title: "Ubuntu: apt-key is deprecated"
description: "apt-key is deprecated from Ubuntu 22.04 LTS (Jammy Jellyfish) for security flaws: don’t use it anymore whatever your Linux environment."
authors: ["glegoux"]
time_reading_minutes: 13
category: "Security"
---

`apt-key` is deprecated from Ubuntu 22.04 LTS (Jammy Jellyfish) for security flaws: don’t use it anymore whatever your Linux environment.
Instead of using it, consider the command gpg now. Then move your public keys relative to your APT package manager to a 
new location with the binary format OpenPGP, and specify the option Signed-By (signed-by) for all your used package repositories.

Let’s follow this plan together to properly use your secure package management and see if you are not infected by these security flaws:

-   🔒Understand the security flaws
-   💡 Explore its workstation environment for  `apt`  and  `apt-key`
-   🔨 Use directly the  `gpg`  command to manage your new keys
-   ➡️ Migrate your current trusted public security keys to the correct format and location
-   ✅ Check the migration and stop the use`apt-key`,  `/etc/apt/trusted.gpg`,  `/etc/apt/trusted.gpg.d/`
-   ❔Questions
-   🚀 Go further

# 🔒 Understand the security flaws

`apt-key`  is a sub-command of  `apt`  to secure the management packages with asymmetric  security keys. As you know, package management is a sensible area for security; it is an access door for an attacker to install malicious packages. That’s why when a package is installed, cryptography is used to validate that the installed package is really the one wishes (see  [Debian Wiki: SecureApt](https://wiki.debian.org/SecureApt)).

{% include content/image.html
src="https://miro.medium.com/v2/resize:fit:700/1*xnkb2pC2ouw_pA97-n8Mjg.png"
abs_url=true
title="Security risks in package management"
source_author=true
%}

Here are the milestones of the lifecycle of a package until be installed:

1.  The package is produced on a build machine;
2.  The package is signed on the build machine with a private key;
3.  The signed package is uploaded to a repository (download mirror);
4.  The client system downloads the package (with its package dependencies before if needed) thanks to the metadata and the usage of its package manager from an authorized repository (or from cache);
5.  The signature of the package is verified (with its package dependencies before if needed) with the associated public key;
6.  If the signature is valid, the package is installed.

The developers of Debian and Ubuntu realized that the apt-key command has had flaws for a long time (see  [Security tracker: package apt](https://security-tracker.debian.org/tracker/source-package/apt)  and particularly  [CVE-2011–3374](https://security-tracker.debian.org/tracker/CVE-2011-3374)). While  `apt-key`  was not guaranteed to work people continue to use it, that’s why now this command line has been marked as deprecated (see  [Fully deprecate apt-key, schedule removal for Q2/2022 (ee284d59) · Commits · APT Developers / apt · GitLab](https://salsa.debian.org/apt-team/apt/-/commit/ee284d5917d09649b68ff1632d44e892f290c52f)) and will be deleted. Support for the function ends with Debian 11 (Bullseye) and Ubuntu 22.04 (Jammy Jellyfish).

The problem is to move all tech ecosystems because numerous documentations or blog posts are not up-to-date on this aspect, even the tech giant like  [Google: Linux Software Repositories](https://www.google.com/linuxrepositories/)  where the usage of  `apt-key`  is still referenced in July 2023.

{% include content/image.html
src="https://miro.medium.com/v2/resize:fit:700/1*uOECpGoz2jU0l2rwQ1t1fw.png"
abs_url=true
title="The home page of the Google Linux Software Repositories is not up-to-date with the usage of apt-key"
source="https://www.google.com/linuxrepositories"
%}

Let’s understand an attack scenario among several ones possible. Even if by default, APT checks the validity of the signature of each package to install, and if it is invalid, a warning message is printed and the package is not installed. It is not sufficient because APT needs also to know which trusted public GPG key belongs to which package repository.

{% include article/read-more.md
src="https://medium.com/@glegoux/ubuntu-22-04-jammy-jellyfish-apt-key-is-deprecated-2dbbee8aec84"
%}
