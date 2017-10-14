# Slide Out Menu
This slide menu was created programaticaly in Swift 3.
Very simple and easy to integrate.

You can do it by yourself following this code and implement it to any project you have.
The menu has a tableView asign to it but it can be anything you want.

The logic is to use 2 container views in the MainView.
1st one will display the MenulLeft
2nd one will display the Content of the views

I am using a public variable for the width of the MenuLeft that can be changed from any view:
public var menuWidthGap : CGFloat = 70

By default it's set to 70 but you can change it to your wishes.
The tableView will still have the "aspectFit dimensions" so the buttons will still be visible.

I added a tap gesture recognizer so when your menu is open, when you click outside of the menu the animation will trigger to close the menu.

Best of luck!
