# Integrating GStreamer into Your Swift Project

## Setting up GStreamer

1. **Install GStreamer Framework:**
   Obtain the GStreamer framework from the [official GStreamer website](https://gstreamer.freedesktop.org/data/pkg/ios/) and install it system-wide following the provided instructions.

2. **Add Initialization Files:**
   Integrate `gst_ios_init.h` and `gst_ios_init.m` files from your project resources into your Xcode project.

3. **Configure Plugin Settings:**
   Customize plugin settings as required in the `gst_ios_init.h` file to enable or disable specific plugins for your project.

4. **Create Bridging Header:**
   Create a bridging header file if not already present and include the line `#import "gst_ios_init.h"` in it.

5. **Configure Project Settings:**
   - Set the bridging header file path in the Objective-C Bridging Header setting.
   - Add the GStreamer framework headers path to the Header Search Path.
   - Include the GStreamer framework path in the Framework Search Path.
   - Add `-lresolv` and `-lc++` to Other Linker Flags.

6. **Add Required Frameworks:**
   Add essential frameworks and libraries to your project's target, including GStreamer.framework, libiconv.tbd, and others as specified.

7. **Initialize GStreamer:**
   Call `gst_ios_init()` in the `application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions)` method of your AppDelegate.
