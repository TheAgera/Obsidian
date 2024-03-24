
#### Missing Instructions

1. Delete extra layers
### Engraving Terminology


### Initial Setup Physical

The Vision Engraver 1612 S4 comes in a few different components: 
- Engraving Table with Pendant Holder 
- Pendant 
- Series 4 controller 
- Spindle with Nose Cone and Vacuum Tube. 

Please visit the Vision Engraving Installation Guide to see a more detailed installation guide. Physical cable connections and machine layout start at page 34. [https://www.visionengravers.com/support/Installation-Guides/IG_Vision_1612_1624_2424_2448_S4-Engraver.pdf]



Upon starting the vision engraver, any controls will be done with the Pedant. The machine will load the firmware in the initial setup, then display the home screen [insert picture here]. The pendant will display "Machine not Homed!" Press the button "Go to Home," to return the machine to x = 0 and y = 0. At this point, the arrow keys can be used to move the machine across the x, y, and z axes. 

At the time of writing, the rotary is already connected to the network and is obtaining an IP address through DHCP. If this needs to change, setting a static IP or enabling DHCP is done by going to the menu -> configuration -> Ethernet 
Holding the material on the surface: The Vision Engraving Series 4 controller manual lists methods provided by the manufacturer to hold material on the table surface. There are multiple ways to hold the material down: 
- Multi-Mat 
- Double Side Tape + Spare Sheet 
- Multi-Mat and double-sided tape 
The method of choice will be double-sided tape and a spare sheet. To do this, unscrew the thumbscrews holding the edge guides to the table [insert picture here]. It should be level with the sacrificial material that is being laid down, so it can fit into the corner. The material to be cut will be placed on top with tape around the edges to hold it down. Do not worry about the tape being cut slightly around the edges. 

Zeroing The Cutter: To zero the cutter,. Make sure the cutter does not fall onto the table. This can damage the cutter and table; it is best to hold onto the cutter while completing this action [insert picture here]. At this point, lower the spindle with the down arrow key on the pedant until the nose touches the material, and the spring compresses slightly.  unscrew the collar from the cutter with the supplied torque key Let your cutter slowly drop until it is touching the material surface. The tension screw on the collar can now be tightened. The cutter will now be zeroed to the vacuum nose cone. Adjust the depth of cut with the micrometer on the spindle [insert picture here]. 

Setting the surface: The following step is only necessary if the nose cone is not being used; thus, the proximity sensor cannot be used. This step is for the engraver to know where z = 0 is at. Since you can engrave sheets of varying height, the machine allows for the configuration of the 0 point. Remove the cutter from the spindle head. Find the SET SURFACE button on the pedant and use the up and down arrow keys to jog the spindle up and down [insert picture here]. Lower the spindle down with the down arrow until light pressure is being applied by the spindle to the cutting material [insert picture here]. The cue is to watch the spring on the spindle; it will slightly compress. Before pressing enter, the cutter(s) needs to be zeroed as well. Use the provided wrench to release the collar from the cutter and drop it into the spindle head [insert picture here]. At this point, the spindle and cutter will be level with the cutting material surface. Screw the collar into the head and re-tighten it with the wrench [insert picture here]. Repeat this process for any remaining cutters you plan on using for the job. Press ENTER on the pendant to set the surface.

### Initial Setup Software
Vision Pro software will not have to be setup or have any configurations done to it all, as it is currently installed on the engraving computer If this is being setup on a new computer, installation and setup are needed. There is an orange security flash drive [insert picture here]. This contains the files to install the Vision Pro software, drivers, and software for connection to the Vision Rotary. This flash drive is needed to run the software, as it contains a license key on the drive itself. 

The first step in the software initial setup will be to insert the orange security flash drive into an open USB slot on the computer. From there, inside the flash drive will be a file named "Start.exe" double-click that file, and a window will pop up [inset picture here] Click on "Step 1 - Setup Machine" to install the drivers and connectivity manager. After installation, a prompt to restart the computer will appear, please restart as soon as possible. The connectivity manager will then search for available vision engravers on the network, as noted by "Scanning..." displayed in the bottom left of the connectivity manager [picture]. Currently, the vision rotary is set using DHCP and is plugged into a network switch IT controls. 

If the Vision 1612 S4 is found with the correct IP, close the window and begin step 2: "Install Vision Software." The software is a simple installation; click next through each window prompt and continue with the recommended default installation options. At the Installation Shield Wizard, [insert picture here] please select the options "Vision Engraves S4" and "Vision 1612 S4". The next screen will ask you to install TTF fonts located on your machine, click "Skip."

At this point, click Finish in the Vision install shield and Exit the Vision Software setup. The Vision Expert 9 software and the Vision Manuals can be found on the desktop or in the Windows Search Bar [insert picture here].

### Creating AutoCAD drawing

The dimensions of this machine are 12x16, so it is best to keep what you are engraving no larger than that number. The best workflow for creating drawings meant for the Vision Engraver is to create a template, with a cut and engrave layer. The template DWG file will also have the common fonts loaded. On the file server [location undecided] is a template for use. Once the template drawing is open, open the drawing that contains the elements you wish to engrave, copy them, return to the normal drawing, right-click on blank space within the drawing, and paste. The copy and paste shortcuts of Ctrl + C and Ctrl + V can also be used to copy and paste between AutoCAD drawings. [maybe insert GIF of process happening]. When creating the drawing, there are a few rules to be followed. 
- No overlapping lines (use the overkill command) 
- All lines must be "ByLayer" [insert picture] 
- Use ROMANS font for small text, Sans Serif for BOLD 
- Have a separate color for items to be engraved and items to be cut 
- All text MUST be middle-justified [insert picture here] 
- While the table is 12x16, you will want to create your drawings in 12x16 inside AutoCAD Below is an example drawing with the correct settings DO NOT rotate the drawing 90 degrees inside AutoCAD, this wall cause text to become offset during the import process. [inset picture here] 
Now, the drawing must be saved in DXF format. To do this, click file -> saves as, or press Ctrl + Shift + S to open the file save dialog box. Click the drop-down arrow to the right of "Files of Type" and save as "AutoCAD LT 2018 DXF" [inset picture here]


### Opening Drawing and Preparing Engrave 

At this point, once the drawing is ready to print, double-click the icon Vision Expert 9. The program presents the following screen: click on "Import a File" if you are creating a new file, or open one you have already made [insert picture here]. 

If the import option is chosen, another file explorer dialog box will open. Navigate to where you saved the .DXF file from AutoCAD. After choosing the file, the import settings screen will be displayed. Please copy the settings in the picture below. [insert picture here]

Most likely, a screen saying "Font Not Found" will appear. Replace the missing font by clicking "Replace All," with one installed in the Vision Expert 9 library [insert picture here]. After the font replacement, the drawing will be loaded into the drawing grid. [insert picture here] 

Upon seeing the imported drawing, there are only a few features of use.
- Plate Size: Upon creating a new drawing, there will be a default plate size of 4x4 (Note the black square starting at coordinates 0,0). To change this, click Layout -> Plate Size. Set it to 12x16. This feature will display the extents of the engraving table. Drawing objects that are to be engraved need to fit inside the plate. [insert picture here]. 
- Engraving Tool Paths: These will need to be used on objects that create a shape (such as BOLD text). Find this setting at the top under "Engrave" -> Create Tool Path -> Fill. Highlight the object that needs a fill path before clicking the Fill button. The best settings for text are below [insert picture here] 
- Engraving Defaults: Find this under Engrave at the top and then Engraving Defaults. The setting important to this menu is "Engrave by Color." Also, make sure the selected driver is 1612 S4. Engrave by color allows each color to be sent as an individual job to the machine. For example, one color is for engraving, and one color is for cutting. This allows for easy changing of the cut depth or tool. [insert picture here] 

Once the fill paths are done and engrave by color is enabled, click the "Engrave" button on the left [insert small picture]. This will open a new screen, along with a pop-up for the cut toolbox and the color to be engraved. Nothing can be done until a color is selected and engrave is clicked. Now the drawing will be loaded into the engraving menu, and the dimensions of the table will be loaded. Anything outside the dimensions of the table will not be loaded into the current view. 

On the engraving screen, there are various pre-installed settings for different materials, or different cutting methods per material. At the time of writing, these are the best settings for engraving and cutting the laser-max plastic. See the following screenshots for Plastic (Engraving) and Plastic (Cutting) [insert pictures here]. 

The Vision Series 4 manual can provide more insight into each option, but for the purpose of creating panel tags, make sure the following options are correct [insert picture here]: 
- VACUUM (on) 
- PROX (on) 
- DRY RUN (off) 
- SPINDLE (on) 
- PUMP (off) 
- BRAILE (off) 
The button furthest to the right will be the button that sends the job over to the engraver. Upon clicking engrave, the color selection box will re-appear for any remaining colors. Selecting the color will send the job over to the engraver with the same options as the previous job.

### Preparing Rotary for Print

With the job sent over to the machine, the pendant will display the following [insert picture here]. Normally, the surface would have to be set manually; however, all Vision Engravers come standard with a proximity sensor. In the vision manuals, please see "1612, 1624, 2424, and 2448 table manual" for more information on setting the surface and the proximity sensor. 

Be sure to dial in the correct depth of cut on the micrometer. For engraving, 10 clicks from 0 will be the best [insert picture here]. For cutting, two full revolutions will just barely cut through the 1/16-inch plastic. Each click of the micrometer is .001 inch. 

At this point, ensure the vacuum, cutter, and material are secure. Once secure, the START button on the pendant can be pressed [insert picture here]. It is important to note the e-stop button at the top of the pendant. Push this button to immediately stop the machine if something unexpected occurs. [insert picture here] The machine will start the first job that was sent over, finish it, and will prompt to start another job. At this point, the cutter or depth of cut can be changed before starting the next job.

### Common Problems

##### Software
Please connect security device

Misaligned text when importing

##### Physical
Vacuum 




### Closing
