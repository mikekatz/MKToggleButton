MKToggleButton
==============

A binary toggle button that looks like the iOS7 toolbar toggles.

![MKToogleButton Screenshot](/Users/mike/Dropbox/repo/MKToggleButton/screenshot/MKToggleButton.png)

### Installation

MKToggleButton is available as a CocoaPods to install add to your podfile:

    pod "MKToggleButton"

### Usage

Tapping the button switches it between Normal and Selected state.
 
This button draws a rounded-rect button that fills in when selected. The fill/border colors use the control's tint color.
  
Use the selected state to set the titles. And use a `UIControlEventValueChanged` target to listen for changes. 
 
For example:
 
     MKToggleButton* button = [[MKToggleButton alloc] initWithFrame:CGRectZero];
     [button setTitle:@"Normal" forState:UIControlStateNormal];
     [button setTitle:@"Selected" forState:UIControlStateSelected];
     [button addTarget:self action:@selector(selected:) forControlEvents:UIControlEventValueChanged];


### License

Apache 2.0