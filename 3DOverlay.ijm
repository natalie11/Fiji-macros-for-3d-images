// Get original image info
orig = getTitle();
getDimensions(width, hight, channels, slices, frames);

// Set segmentation name
seg = "Segmentation_Breast_MRI_021_Dense_and_Vessels.seg.tif"

// Loop over slices
for (z = 1; z <= slices; z++) {
    // Set slice
    selectWindow(seg);
    setSlice(slices-z+1);
    selectWindow(orig);
    setSlice(z);
    
    run("Add Image...", "image=Segmentation_Breast_MRI_021_Dense_and_Vessels.seg.tif x=0 y=0 opacity=40 zero");
}