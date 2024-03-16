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

### Creating AutoCAD drawing
Similar to the glowforge, the drawings opened by this machine will need to be in a seperate file. You can import entire large drawings, however there are somethings to be certain of. NO autocad items on by color, needs to be by layer, and cannot have duplicate layers. The time required to import a large drawing is not worth it from a time perspective. You can create about multiple templates in one file, but I wouldn't go over ten. 
The dimensions of the Envision Laser is 12x16, however we need to keep room for tape, so the border will be 10x14. Put what you wish to engrave inside that border, then save the file as a .dxf 2018.
Inside the Envision software, you will need to do some initial setup. ** TEST TO SEE IF THE VISION SOFTWARE CAN WORK ON OTHER COMPUTERS https://www.reddit.com/r/techsupport/comments/1544rfh/exact_clone_of_usb_flash_drive_including_device/ **

### Initial Setup Physical

The Vision Engraver 1612 S4 comes in a few different components:
- Engraving Table w/ Pendant Holder
- Pendant
- Series 4 controller
- 

### Initial Setup Software
Vision pro software will not have to be setup or have any configurations done to it all.
If the this is being setup on a new computer, a few things must take place. There is a orange security flash drive, this contains the files to install the vision pro software, drivers, and connect to the vision rotary. This flash drive is needed to run the software, as it contains a license key on the drive it self. 

The first step to software initial setup will be to insert the orange security flash drive into an open USB slot on the computer. From there, inside the flash will be a file named "Start.exe" double-click that file and a window will pop up [inset picture here] Click on "Step 1 - Setup Machine" to install the drivers and connectivity manager. The connectivity manager will then search for available vision engravers on the network. Currently, the vision rotary is set using DHCP and is plugged into a network switch IT controls. The ip is [insert current IP here]. 

From there, close the window and begin step 2 "Install Vision Software" The software is a simple installation, just click next through each window prompt, continue the reccomened default installation options. When you go to the following screen [insert picture here] please select the option "Vision Engraves S4" and "Vision 1612 S4" The next screen will ask to install TTF fonts located on your machine. Click continue to allow usage of any fonts currently installed on your machine. The fonts will install, click finish, and finish again.



After installation, there will be the connectivity manager, vision pro expert 9, and vision manuals. 
