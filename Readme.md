<h1>Flutter</h1>

AppBar
------

1. to add icons in the begining use (leadind widget)
2. To add icons in the center use (flexibleSpace widget)
3. To add icons in the end use (action widget)
4 . Toolbarheight : Toolbar is the place where all the widgets(i.e. title, icons, icon buttons) are placed inside the appbar.
5. Elevation : move towars z axis
6. backgroundColor : To set the background color
7. Center title: To center the title.
8. Toolbaropacity, Bottom Opacity : To reduce the opacity of the corresponding widgets
9. Bottom: To place something inside the the bottom of the app bar.
10. Shape: To customize the shape of the AppBar.


Body
----


1.Center : Center the contents inside it
2. Column: Arrange in column wise
3. Row : Arrange in row wise
4. Stack : Allows widgets to be stacked on top of each other.
5. GridView, ListView : for Corresponding views.
6. Container : Hold child widget
        1.padding, BoxDecoration, etc.
7. Input widgets : TextField


Bottom Navigation Bar
---------------
1. To add Icons in the bottom of the screen.


Drawer:
-------
1. Swipe from left of the screen to get a new screen that is drawer


SnackBar:
---------
1.To Display some error message or some messages in the bottom of the screen (i.e. Above the bottom navigation bar)


BottomSheet:
-----------
1. To display some messages in the

Expense Tracker
---------------
ListView()
showModalBottomSheet();
dateFormat();
textEditingController() 
TextField()
Dispose() method; = ?
Navigator class, Navigator.pop(context) close the current loaded widget,
Row inside row, column inside column, list indie the list causes error use expand method.
showDatePicker()
Async, await => wait for the process to be completed
? => allows null , ! => tell compiler that must not be null.
DropDownButtons() 
DropDownMenuItem()
Spacer()
trim() remove the empty spaces,
tryparse() used to convert the string to corresponding type 
showDialog();
Dismissible() => used to swipe the content in list view
SnackBar() => 


Theaming
--------
Gradient
MaterialApp->theme: ThemeData
copyWith() => used to copy the theme
themeMode


Todo Application
----------------
Must use the controller.clear() method to clear the previous entered text in textField
must use the Dipose() method while use the texteditingController.

Responsive Layout
------------------
1. To lock the orientation
2. Adjust the code based on the screen size (MediaQuery)

Difference between shrink-wrap and expand is……
---------------
1. **Expand** make the child to occupy the total space occupied by the parent widget,
2. **shrinkWrap** make the list to occupy only space required for the children and make it scrolable

Key
---
Used for identification purpose. (Same as exactly Fkey in blazor) 


**final** : can be set only once and cannot be changed, Assigned at runtime.
**var** : can be changed dynamically
**const** : value cannot be changed, value assigned at compile time.

Navigator.push 
----
  it automatically add the back button on the leading section of the app bar
  that hash navigator.pop() method inside it.




questions?
-------------
1. How to use multiple child widgets in body?
2. "    "   "   "  "        "     "    " column and row in body?

