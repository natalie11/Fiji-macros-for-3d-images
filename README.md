# Fiji macros for 3d images
Macros for reproducible processing of 3D image stacks 

ISeeDeadPixels - This macro finds consistently bright pixel locations in a 3D image stack and sets them to zero. It was created to remove aberrant bright pixels that appeared in consistent locations from HREM image stacks, caused by issues with the camera sensor.

SubtractionMacro - This macro take a 4D image (3D plus time) and substracts the 3D image at time=0 from all subsiquent timepoints. It generates a 4D hyperstack showing change in pixel intensity over time.
