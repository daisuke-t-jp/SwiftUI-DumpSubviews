# SwiftUI-DumpSubviews

Dump

```
class[_UIHostingView<ContentView>]
->class[PlatformViewHost<PlatformViewRepresentableAdaptor<SystemScrollView>>]
-->class[HostingScrollView]
--->class[_UIHostingView<ScrollViewContentContainer>]
---->class[CGDrawingView]
---->class[CGDrawingView]
---->class[CGDrawingView]
--->class[_UIScrollViewScrollIndicator]
---->class[UIView]
--->class[_UIScrollViewScrollIndicator]
---->class[UIView]
```

The content of the ScrollView is at `_UIHostingView<ScrollViewContentContainer>`.
