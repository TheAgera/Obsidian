
#### Notes for 7-1

##### Tasks for the Day
- Problems Affecting End-Users:
	- The Brady 600 not working, the machine might be working okay, but the paper roll might not  be loaded correctly. If I determine the machine is working correctly.
	- The glowforge has a roughly every few day issue of not focusing on the material. Lenses have all been cleaned yet still happens. Sent Email, can't figure this out
	- Bryan Clor, unable to communicate with PLCs on his PC. Leaving PC after hours for troubleshooting
	- Kyle McNulty still have issues with Sage desktop. I remember his DHCP ip kept getting dropped.

##### Wazuh
- Alerts will be split into four categories: low, medium, high, and critical. 
- Multiple alert channels/avenues will need to be created. In the OSSEC.conf, itll be 
- The level of each rule will need to be adjusted accordingly.
- My plan:
	- Have an alert stream for each level of severity 
	- Critical (Level 15) is a text message to phones, immediate action
	- High (12,13,14) Email Alert
	- Medium (8,9,10,11) idk where these goes
	- Low (0-7) Can stay on wazuh in the dashboard.
	- I need to figure out what we need alerts on, and what we need active responses on. Struggling because there are SO many options to choose from. Need to break this into smaller steps

