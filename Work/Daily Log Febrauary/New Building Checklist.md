
#### 2/7/24
Before being inside the building, let's prep the network rack to go down there. 
By this week network rack should drop in ready. We should also put keystones in the patch panel to make sure doors can close with the wires and everything works the way we think, finish as much cabling. Once cables work, you can remove keystones. 



Half access control, wifi, cameras, finish access, runs to office, conference room
Then bootload of office 365, two conference rooms, configured and added with calendars in office. 

Rollout office 365 multifactor auth

### Powershell Script Runspace Ideas
- First idea is to try and raise more events, one for item in runspace updated, and another for runspace completed
- Second idea is to create the runspace at the start of my gui, so that when I do my button click, it is simply calling that runspace. I could go one step further and make a new script and gui that works through the runspace, making sure it the name is there, and then if the script is being called etc.
- BeginInvoke() is needed to run ASync, however when using Out-Null it does not work together, because the code needs to be completed before the out-null is called. Therefore, the idea is to try and speed up that process. 

Okay, so by using WPFGui.Host.UI.Write("$variable")
I can trouble shoot the code by stripping down my script and using the write to host to figure out what is wrong. It seems to be the way my events are being executed is wrong.

## 2/12/24 

For the new building today, we are going to bring down the new network rack around the afternoon and set up a single access point. Not sure if the building has a WAN connection yet but weshalle see