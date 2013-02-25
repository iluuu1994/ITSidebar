ITSidebar
=========

`ITSidebar` is a very lightweight control for Mac OS X.
You can create sidebars similar to the one of Sparrow.

<img src="http://www.ilijatovilo.ch/github/ITSidebar.png" alt="" />

Why would I want to use this?
-----------------------------

`ITSidebar` is:

- Highly customizable
- Lightning-fast
- Completly free to use

Usage
-----

### Copy files

Copy the following files:

* `ITSidebar.h`
* `ITSidebar.m`
* `ITSidebarItemCell.h`
* `ITSidebarItemCell.m`
* `ITLeakWarningHelper.h`

Make sure to copy them to the project, and to add them to the target.
Please use your own images for the button cells.

### Use in a project

Make sure to check out the sample project.
First, drag a `NSScrollView` onto your window.
Then, select the document view, and set its custom class to `ITSidebar`.

Now you can connect an outlet to it, and use the following methods:

	// Add/Remove Cells
	- (ITSidebarItemCell *)addItemWithImage:(NSImage *)image target:(id)target action:(SEL)action;
	- (ITSidebarItemCell *)addItemWithImage:(NSImage *)image alternateImage:(NSImage *)alternateImage target:(id)target action:(SEL)action;
	
	- (ITSidebarItemCell *)addItemWithImage:(NSImage *)image;
	- (ITSidebarItemCell *)addItemWithImage:(NSImage *)image alternateImage:(NSImage *)alternateImage;
	
	- (void)removeRow:(NSInteger)row;
	
	// Select Cells
	- (void)selectItemAtIndex:(int)index;
	- (void)deselectAllItems;
	
	// Customisation
	- (void)setCellSize:(NSSize)cellSize;
	- (void)setBackgroundColor:(NSColor *)backgroundColor;
	- (void)setScrollerKnobStyle:(NSScrollerKnobStyle)knobStyle;
	
	- (ITSidebarItemCell *)selectedItem;
	- (int)selectedIndex;
	
	+ (Class)sidebarItemCellClass;
	
For subclassing and customisation, check out the example.
    
### License

DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE 
Version 2, December 2004 

Copyright (C) 2013 Ilija Tovilo <support@ilijatovilo.ch> 

Everyone is permitted to copy and distribute verbatim or modified 
copies of this license document, and changing it is allowed as long 
as the name is changed. 

DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE 
TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION 

0. You just DO WHAT THE FUCK YOU WANT TO.

### Help

If you have any questions, feel free to let me know at support@ilijatovilo.ch
