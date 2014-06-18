ScrollViewBug
=============

Demonstration of bug with UIScrollView and auto layout in iOS 8.

Following the notes for the pure auto layout approach in https://developer.apple.com/library/ios/technotes/tn2154/_index.html works in iOS 7 but not iOS 8. Setting the content size explicitly fixes the issue, but should be unnecessary.
