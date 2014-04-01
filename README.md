ITSidebar
=========

`ITSidebar` is a very lightweight control for Mac OS X.
You can create sidebars similar to the one of Sparrow.

![](./ITSidebar.png)

v2.0?
-----

Since many people found this repository useful, and it's quite outdated,
I decided to rewrite the control from the ground to use Core Animation.

That's what this branch is for.


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
	- (void)setSelectedIndex:(int)selectedIndex;
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

    Copyright (c) 2013 - 2014, Ilija Tovilo
    All rights reserved.
    
    Redistribution and use in source and binary forms, with or without
    modification, are permitted provided that the following conditions are met:
        * Redistributions of source code must retain the above copyright
          notice, this list of conditions and the following disclaimer.
        * Redistributions in binary form must reproduce the above copyright
          notice, this list of conditions and the following disclaimer in the
          documentation and/or other materials provided with the distribution.
        * Neither the name of the organization nor the
          names of its contributors may be used to endorse or promote products
          derived from this software without specific prior written permission.
    
    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
    ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
    WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
    DISCLAIMED. IN NO EVENT SHALL ILIJA TOVILO BE LIABLE FOR ANY
    DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
    (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
    LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
    ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
    (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
    SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

### Help

If you have any questions, feel free to let me know at support@ilijatovilo.ch
