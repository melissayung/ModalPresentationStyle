# Modal Presentation Style

This small demo project demonstrates the difference between the two modal presentation styles **OverFullScreen** and **OverCurrentContext** when presenting a modal view controller. 

The idea of using either of these presentation styles is that

> the views beneath the presented content are not removed from the view hierarchy when the presentation finishes. So if the presented view controller does not fill the screen with opaque content, the underlying content shows through (Apple's Documentation)

A good use case is to present a loading screen with a semi transparent background.

However, the difference between those two types **OverFullScreen** and **OverCurrentContext** is only apparent when the presenting view controller has its property **definesPresentationContext** set to **true**.

###OverFullScreen
The presented view controller will be displayed over the full screen

###OverCurrentContext
The presented view controller will only over the content of the view controller that has the **definesPresentationContext** property set to true
