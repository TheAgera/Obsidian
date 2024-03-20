## What do the users need to know?
	How not to break the machine or cause any further damage
	Rotary Terms
	Initial Setup (AutoCAD, Envision, and rotary)

#### Steps Invovled
1. Install the envision software, set up drivers, connect to the rotary!!!
2. Creating AutoCAD drawing
3. Saving .DWG to .DXF, open in Vision Expert 9
4. .DXF settings ![[cadlink_hazmQyV0Zb.png]]
5. Font Replacement (investigate how doing the font replacement affects windows font)
6. Once imported, delete layers, send to machine by color.
7. In the engrave screen, configure the plastic engrave and plastic cut settings
8. END OF COMPUTER WORK
9. On machine, secure you material with tape
10. zero cutters (will need to do each time machine is rebooted)
11. set cut depth with micrometer
12. begin cut

### Initial Setup Physical

The Vision Engraver 1612 S4 comes in a few different components:
- Engraving Table w/ Pendant Holder
- Pendant
- Series 4 controller
- Spindle w/ Nose Cone and Vacuum tube.
Upon starting the vision engraver, any controls will be done with the Pedant. The machine will load the firmware in the initial setup, then will display the home screen  [insert picture here]. 
The pendant will display "Machine not Homed!" press the button "Go to Home," to return the machine to x = 0 and y = 0. At this point, the arrow keys can be used to move the machine across the x, y, and z axis. 

At the time of writing, the rotary is already connected to the network and is obtaining and an IP address through DHCP. If this needs to change, setting a static IP or enabling DHCP is done by going to the menu -> configuration -> Ethernet

Holding the material on the surface: The vision engraving series 4 controller manual lists methods provided from the manufacturer to hold material on the table surface. There are multiple ways to hold the material down:
- Multi-Mat
- Double Side Tape + Spare Sheet
- Multi-Mat + Double sided tape
The method of choice will be double sided tape + spare sheet. To do this, unscrew the thumbscrews holding the edge guides to the table [insert picture here]. It should be level with the sacrificial material that is being laid down, so it can fit into the corner. The 

Zeroing The Cutter: To zero the cutter, unscrew the collar from the cutter with the supplied torque key. Before doing this, make sure the cutter does not fall onto the table. This can damage the cutter and table, it is best to hold onto the cutter while completeting this action [insert picture here]. At this point, lower the spindle down with the down arrrow key on the pedant until the nose touches the material, and the spring compresses slightly. Let your cutter slowly drop until it is touching the material surface. The tension screw on the collar can now be tighten. The cutter will now be zerod the vaccum nose cone. Adjust the depth of cut with the micrometer on the spindle.

Setting the surface: This step is for the engraver to know where z = 0 is at. Since you can engrave sheets of varying height, the machine allows for configuration of the 0 point. Remove the cutter from the spindle head. Find the SET SURFACE button on the pedant and use the up and down arrow keys to jog the spindle up and down [insert picture here]. Lower the spindle down with the down arrow until light pressure is being applied by the spindle on to the cutting material[ insert picture here ].  The cue is to watch the spring on the spindle, it will slightly compress. Before pressing enter, the cutter(s) need to be zeroed as well. Use the provided wrench to release the collar from the cutter and drop it into the spindle head [insert picture here]. At this point, the spindle and cutter will be level with the cutting material surface. Screw the collar into the head and re-tighten with the wrench [insert picture here]. Repeat this process for any remaining cutters you plan on using for the job. Press ENTER on the pendant to set the surface.

### Initial Setup Software
Vision pro software will not have to be setup or have any configurations done to it all, as it currently installed on the engraving computer
If the this is being setup on a new computer, a few things must take place. There is a orange security flash drive [insert picture here], this contains the files to install the vision pro software, drivers, and connect to the vision rotary. This flash drive is needed to run the software, as it contains a license key on the drive it self. 

The first step to software initial setup will be to insert the orange security flash drive into an open USB slot on the computer. From there, inside the flash drive will be a file named "Start.exe" double-click that file and a window will pop up [inset picture here] Click on "Step 1 - Setup Machine" to install the drivers and connectivity manager. The connectivity manager will then search for available vision engravers on the network, noted by "Scanning..." displayed in the bottom left of the connectivity manager. Currently, the vision rotary is set using DHCP and is plugged into a network switch IT controls. 

If the Vision 1612 S4 is found with the correct IP, close the window and begin step 2 "Install Vision Software" The software is a simple installation, click next through each window prompt, continue with the recommended default installation options. At the InstallShield Wizard, [insert picture here] please select the option "Vision Engraves S4" and "Vision 1612 S4" The next screen will ask to install TTF fonts located on your machine. Click continue to allow usage of any fonts currently installed on your machine. The fonts will install, click finish, and finish again. install Vision VEF Fonts, Corel WFN fonts, and Adobe Type 1 Fonts. These fonts do not need to be installed.

At this point, click Finish in the Vision install shield and Exit the Vision Software setup. The Vision Expert 9 software and the Vision Manuals can be found on the desktop or in the windows Search Bar[insert picture here].

### Creating AutoCAD drawing

The dimensions of this machine are 16x12, thus it is best to keep what you are engraving no larger than that number. When creating the drawing there are few rules to be followed.
- No overlapping lines (use overkill command)
- All lines must be "ByLayer" [insert picture]
- Use ROMANS font for small text, Comic Sans for BOLD
- Have a separate color for items to be engraved and items to be cut
- All text MUST be Middle justified [insert picture here]
- While the table is 16x12, you will want to create your drawings in 12x16 inside AutoCAD
Below is an example drawings with the correct settings [inset picture here]

Now, the drawing must be saved in a .dxf format. To do this, click file -> saves as, or press Ctrl + Shift + S to open the file save dialog box. Click the drop down arrow the right of "Files of Type" and save as "AutoCAD LT 2018 DXF" [inset picture here] 


### Opening Drawing and Preparing Engrave 

At this point, once the drawing is ready to print, double click the icon Vision Expert 9. The program presented with the following screen, click on "Import a File" if you are creating a new file, or open one you have already made [insert picture here].

If the import option is chosen, another file explorer dialog box will open, navigate to where you saved the .DXF file from AutoCAD. After choosing the file you will presented with the following screen. Please copy the settings in the picture below. [insert picture here]

Most likely, a screen saying "Font Not Found" will appear, replace the missing font with one installed in the Vision Expert 9 library [insert picture here] After the font replacement, you will see your drawing loaded into the drawing grid. [insert picture here]

Upon seeing the imported drawing, there are only a few features of use. 
- Plate Size: Upon creating a new drawing, there will be a default plate size of 4x4 (Note the black square starting at coordinates 0,0). To change this, click Layout -> Plate Size. Set to 12x16. This feature will display the extends of the engraving table. Drawing objects that are to be engraved need to fit inside the plate. [insert picture here]. 
- Engraving Tool Paths: These will need to be used on objects that create a shape (such as BOLD text). Find this setting at the top under "Engrave" -> Create Tool Path -> Fill. Highlight the object that needs a fill path before clicking the Fill button. The best settings for text are below [insert picture here]
- Engraving Defaults: Find this under Engrave at the top and then Engraving Defaults. The setting important in this menu is "Engrave by Color" also make sure the selected driver is 1612 S4. Engrave by color allows each color to be sent as an individual job to the machine. For example, one color is for engrave, one color is for text. This allows for easy changing of the cut depth or tool. [insert picture here]
Once the fill paths are done and engrave by color is enabled, click the "Engrave" button on the left [insert small picture]. This will open a new screen along with a pop-up for cut toolbox and the color you are currently wishing to engrave. You cannot do anything until you select the color and press engrave. Now the drawing will be loaded into the engrave menu, and the dimensions of the table will be loaded. Anything outside the dimensions of the table will not be loaded into the current view.

In the engraving screen exist various pre-installed settings for different materials, or different cutting methods per material. At the time of writting, these are the best found settings for engraving and cutting the lasermax plastic. See the following screenshots for Plastic(Engraving) and Plastic(Cutting) [insert pictures here] 

The vision series 4 manual can provide more insight into each option, but for the purpose of creating panel tags, make sure the follow options are correct [insert picture here]:
- VACUUM (on)
- PROX (on)
- DRY RUN (off)
- SPINDLE (on)
- PUMP (off)
- BRAILE (off)
The button furthest to the right will be the button that sends the job over to the engraver. Upon clicking engrave, the color selection box will re-appear for any remaining colors. Selecting the color will send the job over to the engraver with the same options as the previous job.

### Preparing Rotary for Print

With the job sent over to the machine, the pendant will display the following [insert picture here].  Normally, the surface would have to be set manually, however all Vision engravers come standard with a proxmity sensor. In the vision manuals, please see "1612, 1624, 2424, and 2448 table manual" for more information on setting the surface and the proxmity sensor. At this point, ensure the vaccum, cutter, and material are secure, once secure the START button on the pendant can be pressed. 