---
title: "GNU Privacy Guard"
description: "How to prove its identity and encrypt its communication?"
authors: ["glegoux"]
time_reading_minutes: 5
category: "Security"
---

First, it is important to distinguish: **PGP** (Pretty Good Privacy), **OpenPGP** and **GnuPG** also named **GPG** (Gnu Privacy Guard).
Phil Zimmerman made up PGP in 1991 as a way for people to communicate without eavesdropping. Going further 
back into the 1990s, there used to be a law in the US that restricted the export of cryptographic technology 
outside the US until 1992 after the World War II. Due to this patent and license around the source code and specification of 
the proprietary product PGP, it was not always practical for international use. That’s why the 
[OpenPGP Working Group](https://www.openpgp.org/about) was formed within the Internet Engineering Task Force (IETF) 
to define a free standard protocol OpenPGP inspired by PGP with [RFC4880](https://www.ietf.org/rfc/rfc4880.txt) and 
after the end of the US restriction to allow to everyone to implement a solution. In June 2010 Symantec Corporation bought PGP Inc., 
but it is acquired by [Broadcom Inc](https://www.broadcom.com) in 2019 that owns a propriety implementation of PGP now. 
[GnuPG](https://gnupg.org) is a free implementation of the OpenPGP standard very used in the world.

GnuPG proposes services as authentication, confidentiality, compression, compatibility and segmentation
with a hybrid cryptosystem combining the efficiency of symmetrical cryptosystem and the convenience of asymmetrical cryptosystem. 
Particularly, you can: 

* sign resources (electronic document, Git commit ...)
* encrypt/decrypt resources (email, sms, message, filesystem partition, stored data ...)

**References:**

* <https://help.github.com/en/github/authenticating-to-github/generating-a-new-gpg-key>
* <https://www.gnupg.org/index.html>
* <https://git.gnupg.org/cgi-bin/gitweb.cgi>
* <http://www.faqs.org/faqs/pgp-faq/part1/>
* <https://www.linuxjournal.com/content/signing-git-commits>
* <https://www.linode.com/docs/security/encryption/gpg-keys-to-send-encrypted-messages/#more-information>
