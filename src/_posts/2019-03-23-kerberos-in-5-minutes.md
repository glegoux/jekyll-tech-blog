---
title: "Kerberos in 5 minutes"
description: "Kerberos is an authentication protocol for trusted hosts on untrusted networks."
authors: ["glegoux"]
time_reading_minutes: 5
category: "Security"
tags: "Kerberos"
---

[Kerberos](http://www.kerberos.org/) is a protocol to guarantee one subpart of the security of your Information Infrastructure (II). 
Among the key concepts of security: confidentiality, integrity, availability and non-repudiation. Kerberos allows to set up communications 
confidentiality and non-repudiation accesses, it is an **Authentication and Authorization System** (AAS). The step of authorization is very limited.  

This article is an introduction to Kerberos ecosystem. It can be interesting for a **manager** to understand key principles of Kerberos, a **non-technical person** to 
have a overview of this technology (2 first paragraphs), or for **technical person** particularly with **DevOps** skills to increase action field and go further if necessary (3 last paragraphs).

# What is Kerberos?

The goal of Kerberos is to prove the identity of each entity, then to secure communication, that's all. You can use **telnet, SSH, database, local system login, web API** or **web portal**... 
with Kerberos authentication method.  
  

> Kerberos allows to secure communications on untrusted networks but where each node is trusted

MIT

Kerberos is first a protocol and after a implementation. Kerberos builds on**symmetric key cryptography** to encrypt communication and requires a trusted third party to identify **mutual authentication** with a system of renewable tickets (each 10 hours by default).

The current important *Requests for Comments* (RFC) to understand Kerberos are [rfc4120](https://www.ietf.org/rfc/rfc4120.txt) and [rfc6649](https://www.ietf.org/rfc/rfc6649.txt)), see [all Kerberos RFCs](https://datatracker.ietf.org/doc/search/?name=Kerberos&sort=&rfcs=on).

The latest Kerberos version of Massachusetts Institute of Technology (MIT) implementation is [Kerberos V5 1.16.1 (2018-05-03)](https://web.mit.edu/kerberos/krb5-1.16/) written in Language C under [MIT License](https://web.mit.edu/kerberos/krb5-1.15/doc/mitK5license.html). You can see [all available releases](http://web.mit.edu/kerberos/dist/). The project is Open Source project and published on a [git mirror repository on Github](https://github.com/krb5/krb5) by [Github krb5 Organization](https://github.com/krb5). There are a [full online documentation](https://web.mit.edu/kerberos/krb5-1.15/doc/mitK5license.html) and [short guide pdf](http://www.kerberos.org/software/adminkerberos.pdf).

Kerberos’ name comes from Greek mythology, the three-headed guard dog of Hades.This technology is invented at MIT in the 1980s, became an **IETF Standard** in 1993, and the first MIT implementation release in 1987 until present with continuous improvements.

Three current widespread implementations are **MIT Kerberos**, **Heimdal**, **Active Directory** (AD) available allowing a multi-platform ecosystem (Windows or Linux server).

{% include article-image.html title="MIT Kerberos" src="kerberos-logo.jpg" %}

See [Frequently Asked Questions (FAQ)](http://www.kerberos.org/about/FAQ.html).

The MIT **Kerberos Consortium** ensures development and lasting quality of the Kerberos project since 2007 with past and present sponsors of **Apple, Google, Oracle, Stanford University, Microsoft** ...

Kerberos is a very famous tool using **Hadoop Distributed File System** (HDFS) used by **Spark** or **Mapreduce** and distributed by Cloudera, Hortonworks or MapR for the Linux world to secure a environment **Big Data**. But it is also famous in the Microsoft world as cornerstone of **Active Directory** tool used a lot of companies as the **Single Sign On** (SSO) solution for access to all applications and services.

# Pros and cons

You can read this paper: [Why is Kerberos a credible security solution?](https://www.kerberos.org/software/whykerberos.pdf)

## Pro's

* There is better performance when using of Kerberos. Because it uses symmetric key operations, which are orders of magnitude faster than public key operations used by SSL.
* User management is simpler. For example, revoking a user can be done by simply deleting the user from the centrally managed Kerberos KDC (key distribution center). Whereas in SSL, a new certificate revocation list has to be generated and propagated to all servers
* Thanks to its ticket system, Kerberos allows temporary access if a key session is stolen. 
* The passwords is never sent through network (even ciphered, robust against Man In the Middle attack). 
* Kerberos allows a mutual authentication, when a client is connected to  a service. The client knows which is the service and vice versa unlike SSL certificate where the server does not know a priori the client.

## Con's

* A brute force attack on Key Distribution Service (KDC) could compromise the entire network, since it contains all the passwords (in an encrypted version, but still). So the security of the KDC is essential.
* Kerberos assumes that the host it is running on is safe, so if an attacker can get hold of a client it can steal tickets and during the lifetime of the ticket do the same things a normal user could. On multi-user systems the above point even becomes more important. Meaning that the different users should not be able to access each others files and memory.
* Since anybody can request a (TGT) of any user, and that ticket is encrypted with the user's secret key (password), it is simple to perform an offline attack on this ticket by trying to decrypt it with different passwords. Kerberos 5 introduced to solve this problem.
* Kerberos is very dependent on the Domain Name Service (DNS), a service principal should have both:  DNS lookup and reverse DNS lookup working. If your DNS Server crashed your authentication system is out.
* The set up of Kerberos can be more constraining than another authentication system.

# How it works?

Imagine that a client wishes to access to a service through a Kerberos Authentication. The Kerberos authentication is divided into 3 main steps:

1. Getting a Ticket-Granting Ticket (TGT) from Authentication Server (AS)
2. Getting a Ticket-Granting Service (TGS) from Ticket-Granting Server (TGS)
3. Accessing to the Service

Here client (identified as user) and service are already registered in the Kerberos database in the same Realm (understanding same Kerberos perimeter), respectively as User Principal Name (UPN) and Service Principal Name (SPN). 

{% include article-google-drawing.html title="Kerberos authentication architecture" 
src="https://docs.google.com/drawings/d/e/2PACX-1vRFoa0U8YarJybG_tJJ4bxSaDj000n8XduoQyDVJQ77XHTovCd4EuGArkG9JhGDqATybKOHV9TSCVSh/pub?w=959&h=535" %}

You can use **Lightweight Directory Access Protocol** (LDAP) as principal database to store users and groups of your organization. Now you have a nice **Authentication, Authorization** and **Accounting** System (AAAS) :

* `Authentication` is managed by the KDC to guarantee the identity of an entity.
* `Authorization` is controlled by the Service directly to authorize access (you can also use Access Control List (ACL) for other permissions)
* `Accounting` is allowed by LDAP server.

{% include article-google-drawing.html title=" Kerberos authentication workflow with LDAP" 
src="https://docs.google.com/drawings/d/e/2PACX-1vRmsLxbS-kwQOzK20d0i3PZGADr1dmoWbG2ld-M2hIyXYjw1pGPuXtWO8LmBv9VaYJVh-E1aJOU7xoF/pub?w=959&h=542" %}

# How to test?

I suppose that you are comfortable with docker containers and command-line interface under Linux Operating System as Ubuntu. You can test directly Kerberos ecosystem in few commands.

To do that, just consult this Open Source project [kerberos-docker](https://github.com/criteo/kerberos-docker).

{% include article-google-drawing.html title="Kerberos/Docker icon" src="kerberos-docker-logo.png" %}

This servers cluster is deployed automatically with only one command. 

{% include article-google-drawing.html title="Kerberos architecture on docker for Kerberos/Docker project" 
src="https://docs.google.com/drawings/d/e/2PACX-1vSWzlGsP6c2XMkKZnJ8ncLx5rfaqR9vWJlvG8ksr5CxAKc1zeJ4aFUC-Zw4KpZt-ipcGJRcoY4P2q-o/pub?w=695&h=421" %}

Thanks to GSS-API implementation in C, OpenSSH use one method based on Kerberos authentication: **gssapi-with-mic**. That is a Message Authentication Code (MAC) methods renamed in Message Integrated Code (MIC) for disambiguation MAC address. Thus the suffix with-mic is used. But SSH continue to manage authorization (using Linux-PAM or/and AllowsUser, Allowsgroup,PermitRootLogin in /etc/ssh/sshd_config), and accounting is managed by the Operating System.

The layer of access authorization provided by Kerberos is really minimal and consists in a ~/.k5login file and a few configurations. See details [here](https://web.mit.edu/kerberos/krb5-latest/doc/admin/host_config.html#login-authorization). By default Kerberos applies a default authorization rule: if host H is in realm R, the Kerberos principal u@R is allowed access to the account u@H. You change the configuration of SSH server with KerberosAuthentication yes to connect directly the service without doing kinit. And you can use also another way to use the PAM module of Kerberos [pam_krb5.so](https://github.com/rra/pam-krb5) thanks to the configuration UsePAM yes. 

For developing your own kerberized application, you can read [Best Practices for Integrating Kerberos into Your Application](https://www.kerberos.org/software/appskerberos.pdf).

# Go further

To go further, you should know that with Kerberos you can do Delegation of authentication, Servers' replication and redundancy, Cross Realm Authentication. And it is important to distinguish Kerberos with SSL/HTTPS, SSH or JWT, Radius and Diameter.

# Annexes

## Key Concepts

`Authentication`: Action of checking that an entity is really this entity without impersonating another entity.

`Authorization`: Action of verifying that an entity have sufficient rights to access a system.

`Accounting`: Management of defined groups and users.

## General concepts

`Mutual authentication`: It is also called two-way authentication, is a process or technology in which both entities in a communications link authenticate each other. In a network environment, the client authenticates the server and vice-versa.

`AAS`: Authentication and Authorization System.

`AAAS`: Authentication, Authorization, Accounting/Auditing System.

`Client`: An entity that can obtain a ticket. This entity is usually either a user or a host. 

`Host`: A computer that can be accessed over a network. 

`DNS`: The Domain Name System is a hierarchical decentralized naming system for computers.

`Service`: Any program or computer you access over a network. Examples of services include “host” (a host, e.g., when you use telnet and rsh), “ftp” (FTP), “krbtgt” (authentication; cf. ticket-granting ticket), and “pop” (email). 

`RFC`: A Request for Comments (RFC) is a type of publication from the Internet Engineering Task Force (IETF) and the Internet Society (ISOC), the principal technical development and standards-setting bodies for the Internet.

`LDAP`: Lightweight Directory Access Protocol is a directory service protocol that runs on a layer above the TCP/IP stack. It provides a mechanism used to connect to, search, and modify Internet directories. It is essentially a database that contains information about users and groups in a tree structure

`HDFS`:  Hadoop Distributed File System is a Java-based file system that provides scalable and reliable data storage, and it was designed to span large clusters of commodity servers.

`SSO`: Single Sign On is a method allowing to an user to access to several applications thanks to one unique authentication.

`OpenSSH`: Implementation Open Source of Secure SHell (SSH) is a cryptographic network protocol for operating network services securely over an unsecured network.

`ACL`: Access Control List allows to manage permissions attached to an object.

`PAM`: A Pluggable Authentication Module allows to standardize security layer dynamically though system of same customizable modules for all applications. 

## Kerberos concepts

`Kerberos`: In Greek mythology, the three-headed dog that guards the entrance to the underworld. In the computing world, Kerberos is a network security package that was developed at MIT. 

`KDC`: Key Distribution Center. A machine that issues Kerberos tickets composed of Ticket-Granting Server (TGS), Authentication Server (AS) and database instances. 

`AS`: Authentication Service gives Ticket-Granting Ticket (TGT) to authenticate a client. 

`AD`: Active Directory is a Microsoft product which makes use of a Kerberos implementation.

`Keytab`: Shortcut for key table a key tab is the file containing one or more keys. A host or service uses a keytab file in much the same way as a user uses his/her password. 

`Realm`: A REALM is in Kerberos terms equivalent to a Domain in Domain Name Server (DNS) by convention in UPPERCASE.

`Principal`: You can understand that as UNIX username. There 2 types of principles: Service Principal Name (SPN) and User Principal Name (UPN). It is a string that names a specific entity to which a set of credentials may be assigned. 
It can have an arbitrary number of components:
component1/component2/...@REALM
The typical format of a typical Kerberos principal is primary/instance@REALM. 

`primary`: The first part of a Kerberos principal. In the case of a user, it is the username. In the case of a service, it is the name of the service.
`instance`: The second part of a Kerberos principal. It gives information that qualifies the primary. The instance may be null. In the case of a user, the instance is often used to describe the intended use of the corresponding credentials. In the case of a host, the instance is the fully qualified hostname.
`realm`: The logical network served by a single Kerberos database and a set of Key Distribution Centers. By convention, realm names are generally all uppercase letters, to differentiate the realm from the internet domain.
`Ticket`: A temporary set of electronic credentials that verify the identity of a client for a particular service (typically 8 or 10 hours of life time). 

`TGT`: Ticket-Granting Ticket. A special Kerberos ticket to guarantee authentication that permits the client to obtain additional Kerberos tickets within the same Kerberos realm given by Authentication Service (AS).

`TGS`: Ticket-Granting Service or Ticket-Granting Server (depends on context). The TGS exchange is initiated by a client when it wishes to obtain authentication credentials for a given server

`GSS-API`: Acronym for Generic Security Service Application Program Interface (GSSAPI, also GSS-API) is an application programming interface for programs to access security services.

`Session Key`:  Random number generated by the KDC when it builds a ticket. It is the shared secret that the KDC, the client, and the validating server have in common.

`KVNO`: It is an acronym for Key version number. Kerberos can hold multiple keys for a principal. To distinguish between those keys every key has version number. The number is incremented by one when the password or encryption is changed.

`KRBTGT Account`: This is a special account to create Ticket Granting Tickets.

`Key salt`: The salt is a string concatenated to the password to make sure the string2key function creates a unique encryption key, via a one-way hash. In Kerberos 5 the salt is the complete principal name including the realm. The reason the salt is used is to make sure the outcome of the one way hash is unique across realms.

# References

* ROBINSON Trevor (eztenia). **Kerberos**. Canonical Ltd. Ubuntu Article, November 2014. Link: https://help.ubuntu.com/community/Kerberos.
* MIGEON Jean. **Protocol, Installation and Single Sign On, The MIT Kerberos Admnistrator's how-to Guide**. MIT Kerberos Consortium, July 2008. p 62.
* BARRETT Daniel, SILVERMAN Richard, BYRNES Robert. **SSH, The Secure Shell: The Definitive Guide, 2nd Edition**. O'Reilly Media, June 2009. p. 672. Notes: Chapter 11. ISBN-10: 0596008953, ISBN-13: 978-0596008956
* GARMAN, Jason. **Kerberos: The Definitive Guide, 2nd Edition**. O'Reilly Media, March 2010. p. 272.  ISBN-10: 0596004036, ISBN-13: 978-0596004033.
* O’MALLEY Owen, ZHANG Kan, RADIA Sanjay, MARTI Ram, and HARRELL Christopher. **Hadoop Security Design**. Yahoo! Research Paper, October 2009. p 19.
* MATTHIAS Karl, KANE Sean. **Docker: Up & Running**. O'Reilly Media, June 2015. p. 232. ISBN-10: 1491917571, ISBN-13: 978-1491917572.
