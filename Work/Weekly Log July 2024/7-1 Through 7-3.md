
#### Notes for 7-1

##### Tasks for the Day
- Problems Affecting End-Users:
	- The Brady 600 not working, the machine might be working okay, but the paper roll might not  be loaded correctly. If I determine the machine is working correctly.
	- The glowforge has a roughly every few day issue of not focusing on the material. Lenses have all been cleaned yet still happens. Sent Email, can't figure this out
	- Kyle McNulty still have issues with Sage desktop. I remember his DHCP ip kept getting dropped. Dylan 

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
	- Need to look at the data my computer has pulled (has sysmon configured) against it 01, and 05, and see what rules are being triggered. For example Wazuh thinks PDQ is a virus. 

##### Notes for 7-2 

###### Tasks for the day
- Create an exclusion rule on 92213 to ignore files created by PDQ
	- Image: C:\WINDOWS\AdminArsenal\PDQInventory-Scanner\service-1\exec\PDQInventoryScanner.exe TargetFilename: C:\Users\pdq\AppData\Local\Temp\__PSScriptPolicyTest_qvxomwbc.fu1.ps1
	- 

###### Notes
- It seems my only option is I can exclude files using the real-time monitoring.
- With the sysmon alerts rule ID for PDQ
- We can do rules for multiple events, /var/ossec/ruleset/rules/0595-win-sysmon-rules.xml bottom of the page.

##### Notes for 7-3
###### Tasks for the day
- Problems Affecting End Users:
	- Brady 600 machine, investigate after 3:30 when processing leaves. Might be working and the thermal roll is loaded incorrectly. Machine reports no errors, but does not print anything onto the roll. Also reported strange noises
	- Glowforge focusing issue, waiting on reply. 
	- Kyle McNulty Sage problems. IP seems to drop, might be a DHCP issue.
- Create override rules in local_rules.xml on the Wazuh manager to stop the false alarms from Visual studio. Was able to do this, here is an example OVERRIDE rule made in local_rules.xml on the wazuh manager
	  <rule id ="115013" level="3">
		  <if_sid>92213</if_sid>
		  <field name ="win.eventdata.image" type="pcre2">C:\\\\Program\ Files\ \(x86\)\\\\Microsoft\\\\Edge\\\\Application\\\\msedge.exe</field>
		  <field name="win.eventdata.targetFilename" type="pcre2">C:\\\\Users\\\\ksuess\\\\AppData\\\\Local\\\\chrome_.*</field>
		  <description>Ignore PSScript PolicyTest</description>
		</rule>

- Go through and add exclusions