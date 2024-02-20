---
title: "Datacenter"
description: "How to choose between a traditional datacenter and a cloud provider?"
authors: ["glegoux"]
time_reading_minutes: 5
category: "Infrastructure"
---

# What is a datacenter?

A **datacenter** is a building containing many servers connected to the Internet. Most major
companies own theirs datacenters like [Google](https://www.google.com/about/datacenters/),
[Facebook](https://engineering.fb.com/category/data-center-engineering/),
[Amazon](https://aws.amazon.com/compliance/data-center/data-centers/). Traditionally, the companies
hosted their park of servers by building the datacenters, but now it can rent a **private room**,
a **private cage**, a cabinet, a **rack** or a **emplacement**
empty or equipped in a datacenter. It works like for a flat, instead of being owner it can be a
tenant, all formulae are possible. Except if the company needs many servers and/or use
directly a **traditional datacenter** again, it can also use a **cloud provider**
as [Google Cloud](https://cloud.google.com/) or [AWS](https://aws.amazon.com/) with an online
service to rent a set of dedicated or shared **logical services/server** with **virtualization**
or **containerization**, or a **bare-metal server (physical server)**.

A simple datacenter has this kind of architecture:

{% include content/image.html
  title="Datacenter buildings"
  src="datacenter.png"
%}

TODO: describe schema https://new.abb.com/data-centers/fr-ch/

A datacenter consumes a lot of energy in $MWh$, and should have an stable and an important
throughput $Tbit/s$. In a datacenter all things are redundant, to be resilient in case of
failure (backups, electric arrivals, ) to do easily disaster recovery. You can estimate
how many servers has a datacenter from its electricity consumption in $kWh$, or its surface in $ft^2$.
A datacenter have in average several tens of thousands servers, so that always at least one has
an issue during a short period of time.

Here are the aspects that a datacenter looks out:

* **Redundancy/backup** - the level of redundancy varies widely based on the quality of a data
  center; in high tier data centers, multiple redundancies in power and backup servers are built
  into the infrastructure.
* **Efficiency** - the amount of electricity used at a large data center rivals that of a small
  town. Whenever possible, data centers attempt to cut down on costs by optimizing cooling processes
  and using energy-efficient hardware.
* **Security** - proper physical security, both in terms of electronic surveillance, access
  controls, and on-site security guards reduce the risk associated with bad actors attempting to
  gain site access.
* **Environmental controls/factors** - maintaining the right environmental conditions is necessary
  for the proper functioning of electronic hardware. Keeping both temperature and humidity within
  acceptable parameters requires the proper balance of air conditioning, humidity control, and
  airflow regulation. In areas that are vulnerable to earthquakes, properly secured servers are also
  a necessary concern.
* **Maintenance and monitoring** - on-site or on-call network engineers are needed in order stay on
  top of server crashes and other hardware failures. Proper response helps to ensure server uptime
  and eliminate reductions in quality of service. Bandwidth - a data center is incomplete without
  the bandwidth necessary to handle all the requisite network traffic. Bandwidth considerations are
  a central component in data center infrastructure, with external network connections and internal
  data center topology both designed around sufficient network capacity.

For example, a datacenter of Google looks like that:

{% include content/youtube-video.html
   title="Inside a Google Datacenter"
   src="https://www.youtube.com/embed/XZmGGAbHqa0"
%}

Currently [Equinix](https://www.equinix.com/data-centers) is the leader of **datacenter provider**
for the 3 world business areas: AMER, ASIA, EMEA. Equinix provides also datacenters to different
Cloud providers or other companies.

{% include content/image.html
   title="Equinix"
   src="equinix.png"
%}

It is enough hard to estimate how many datacenters there are in the world, because some of them are
secrets or too small, and from when a group of servers be considered as a datacenter. But in order
of magnitude it is in 2021 several millions among several thousands big datacenter, and several
hundreds for **hyper-scale data centers**. You can have a list non-exhaustive with [CloudScene](https://cloudscene.com/).

Here you can see the Data Center Infrastructure Management (DCIM) of Cisco, and an overview of 
the architecture of a datacenter:

{% include content/youtube-video.html
   title="The Cisco Data Center Architecture in 10 minutes"
   src="https://www.youtube.com/embed/QH9vxKz-REY"
%}

# How to choose a datacenter?

Map location and interconnection ...

TODO

# How manage servers directly a datacenter?

TODO

## Network and Nodes

The company connects its **secure LAN** with a **Virtual Network** to datacenter. If an employee is
outside of the office, he can connect to the company VPN to access to servers of datacenter. The
protocols **BGP** (Border Gateway Protocol) and **MPLS** (MultiProtocol Label Switching) allows to
connects to several sites in the worlds, like different datacenters of the company can be
interconnected between them and with the physical offices of the company. Of course the company have
several LANs one for the **employees** of the **R&D** (Research & Development) and the **IIT**
(Industrial Information Technology) departments then can access to datacenter services (only for a
network point of view), and the **guests or other employees** can be another LAN to access only few
internal services, and the Internet.

{% include content/google-drawing.html 
   title="Datacenter networks"
   src="https://docs.google.com/drawings/d/e/2PACX-1vQGbac_UdZlS6EIjjmQBDBBGpdNdpMErchLwLbCMN1Y7SdrLy56sdqdUI968UqHjEdl-MF9vfO4Oee4/pub?w=968&h=786"
%}

**Router** and **Switch** are both network connecting devices. Router works at network layer and is 
responsible to find the shortest path for a packet whereas Switch connects various devices in a network. 
Router connects devices across multiple networks. **Switch** is a smart **Hub**. 

A duplex communication system is a point-to-point system composed of two or more connected parties
or devices that can communicate with one another in both directions. Duplex systems are employed in
many communications networks, either to allow for simultaneous communication in both directions
between two connected parties or to provide a reverse path for the monitoring and remote adjustment
of equipment in the field. There are two types of duplex communication systems: full-duplex (FDX)
and half-duplex (HDX).

In a full-duplex system, both parties can communicate with each other simultaneously. An example of
a full-duplex device is plain old telephone service; the parties at both ends of a call can speak
and be heard by the other party simultaneously. The earphone reproduces the speech of the remote
party as the microphone transmits the speech of the local party. There is a two-way communication
channel between them, or more strictly speaking, there are two communication channels between them.

In a half-duplex or semiduplex system, both parties can communicate with each other, but not
simultaneously; the communication is one direction at a time. An example of a half-duplex device is
a walkie-talkie, a two-way radio that has a push-to-talk button. When the local user wants to speak
to the remote person, they push this button, which turns on the transmitter and turns off the
receiver, preventing them from hearing the remote person while talking. To listen to the remote
person, they release the button, which turns on the receiver and turns off the transmitter.

Following are the important differences between Router and Switch.

Sr. No.	Key	Router	Switch
1	Objective	Router main objective is to connect various networks.	Switch main objective is to connect various devices in a network.
2	Layer	Router works in Network Layer.	Switch works in Data Link Layer.
3	Usage	Router is used in LAN and MAN.	Switch is used only in LAN.
4	Data Format	Router sends data in form of packets.	Switch sends data in form of packets and frames.
5	Mode of Transmission	Router follows duplex mode of transmission.	Switch also follows duplex mode of transmission.
6	Collision	Less collision in case of Router.	In full duplex mode, no collision happens in switch too.
7	NAT Compatability	Compatible with NAT.	Not compatible with NAT.
8	Type	Routing type is Adaptive and Non-adaptive routing.	Switching type is Circuit, Packet and Message switching.

The servers room are organised by Rack, PoD, Cluster and Zone:

{% include content/google-drawing.html
   title="Topology of servers network"
   src="https://docs.google.com/drawings/d/e/2PACX-1vSbiMi2Q9FkSUDHdsSqYWW4SmDgPXxEzKwuFkifYUymsOT2zcWltmZ_T80iK0UOc0V30apf8TkPXAxg/pub?w=1025&h=313"
%}

A point of delivery, or PoD, is "a module of network, compute, storage, and application components
that work together to deliver networking services. The PoD is a repeatable design pattern, and its
components maximize the modularity, scalability, and manageability of data centers.".

## Racks of Servers

Providing physical support in every data center are the **server racks**, which house the essential
hardware, from computer servers to patch panels. ... The framework of a **rack** can be open like
a **shelf** or closed like a **cabinet**. A **Rack Unit** or **U** is an Electronic Industries
Alliance or more commonly "EIA" standard measuring unit for rack mount type equipment. A Rack Unit
is equal to 1.75" in height. To calculate the internal usable space of a rack enclosure you would
simply multiply the total amount of Rack Units by 1.75 inches (44.45 mm). The height of chassis containing 
server(s) should be a multiple of Rack Unit.

{% include content/google-drawing.html
   title="Remote work features"
   src="https://docs.google.com/drawings/d/e/2PACX-1vQKdAlS_wgMf8Lp8mrZM8NRSNwUOLJpm-GGQKqqirFHfngXQpEHGuBqw5QZ9hdZP5Utp6MVkAGDsaly/pub?w=462&h=644"
%}

TODO

https://community.hpe.com/t5/ProLiant-Servers-ML-DL-SL/what-is-difference-between-Small-Form-Factor-SFF-SAS-and-SATA/td-p/4572468#.YEzJotwo-Hs

EXAMPLE:
https://community.hpe.com/t5/ProLiant-Servers-ML-DL-SL/what-is-difference-between-Small-Form-Factor-SFF-SAS-and-SATA/td-p/4572468#.YE1Tutwo_b3

{% include content/youtube-video.html
   title="HPE ProLiant DL380 Gen10 Rack Server"
   src="https://www.youtube.com/embed/_6nOsJwHkEU"
%}

Schema one Server

SAN vs NAS https://fr.wikipedia.org/wiki/R%C3%A9seau_de_stockage_SAN

IPMI ILo vs SSH in and out

LOGO intel + HP

For example:
HPE ProLiant DL380 Gen10 Server

RAID 0

Partition vs Volume

CPU vs GPU

* https://www.diffen.com/difference/SATA_vs_Serial_Attached_SCSI
HVMe
RAID
https://outoftech.com/comment-fonctionne-le-stockage-de-donnees-dans-un-datacenter/
https://buy.hpe.com/us/en/servers/proliant-dl-servers/proliant-dl300-servers/proliant-dl380-server/hpe-proliant-dl380-gen10-server/p/1010026818?q=1010026818:name-asc:facet_formfactor:Rack&text=1010026818&textSearch=&pageSize=10

https://community.hpe.com/t5/ProLiant-Servers-ML-DL-SL/what-is-difference-between-Small-Form-Factor-SFF-SAS-and-SATA/td-p/4572468#.YE1TR9wo_b2
https://community.hpe.com/t5/ProLiant-Servers-ML-DL-SL/what-is-difference-between-Small-Form-Factor-SFF-SAS-and-SATA/td-p/4572468#.YE09X9wo_b1
https://www.datacenters.com/news/data-center-power-costs-and-requirements

## Operating System, Container and Virtual Machine

TODO

## Hybrid-Cloud

TODO

{% include content/image.html
   title="Equinix Cloud Exchange Providers.png"
   src="ecx-providers.png"
%}

{% include content/youtube-video.html
   title="Equinix Cloud Exchange Fabric™ Overview"
   src="https://www.youtube.com/embed/_fLgVb3oAF8"
%}

## Team organization

TODO

# Conclusion

TODO

https://blogs.gartner.com/david_cappuccio/2018/07/26/the-data-center-is-dead
https://www.gartner.com/smarterwithgartner/the-data-center-is-almost-dead
https://www.businessnewsdaily.com/4982-cloud-vs-data-center.html

Once your data center reaches a certain size, it is nearly impossible to accurately manage your data
center infrastructure manually. Spreadsheets and Visio diagrams can’t cut it when it comes to
tracking assets, power, space, cooling and network capacity. Leading data center professionals turn
to software solutions referred to as Data Center Infrastructure Management (DCIM) to take control of
their data center operations.

DCIM

OpeX/CAPeX
Disaster recovery plan and automatic backup.

If you want to browse MT/s kWh vs kA
https://www.datacenters.com/news/data-center-power-costs-and-requirements


# References

* Cloudflare, **What is a Data Center?**. Cloudflare, March 2021. 
  [Link](https://www.cloudflare.com/learning/cdn/glossary/data-center/).
* RackSolutions, **How many servers does a data center have?**. RackSolutions, September 2020.
  [Link](https://www.racksolutions.com/news/blog/how-many-servers-does-a-data-center-have).
* RackSolutions, **Blade servers vs Rack servers**. RackSolutions, February 2018.
  [Link](https://www.racksolutions.com/news/data-center-optimization/blade-server-vs-rack-server)
* LightWave, **Types of Racks in Data Centers: Rack vs. Shelf vs. Cabinet vs. Suite**. LightWave, March 2021. 
  [Link](https://www.lightwavenetworks.com/different-types-of-server-racks/).
* Datacenter Knowledge. **State data center industry 2018 where we are and waht expect**. Datacenter Knowledge, March 2018.
  [Link](https://www.datacenterknowledge.com/afcom/state-data-center-industry-2018-where-we-are-and-what-expect)
* Cisco. **Cisco Annual Internet Report (2018–2023)**. Cisco, March 2020.
  [Link](https://www.cisco.com/c/en/us/solutions/collateral/executive-perspectives/annual-internet-report/white-paper-c11-741490.html)
* RASMUSSEN Neil and NILES Suzanne. **Data Center Projects: Growth Model**. Schneider Electric, 2011. White Paper 143.
  [Link](https://download.schneider-electric.com/files?p_enDocType=White+Paper&p_File_Name=SNIS-6UJ2MQ_R1_EN.pdf&p_Doc_Ref=SPD_SNIS-6UJ2MQ_EN)
