// Get original image info
orig = getTitle();
getDimensions(width, hight, channels, slices, frames)

// Duplicate the first time frame as reference (T=1)
selectWindow(orig);
run("Duplicate...", "title=Reference duplicate frames=1");

// Create empty stack to hold subtracted results
newImage("Subtracted_Hyperstack", "32-bit black", width, hight, channels, slices, frames - 1);

// Loop over time frames (T=2 to T=nFrames)
for (t = 2; t <= frames; t++) {
    // Duplicate current time frame
    selectWindow(orig);
    run("Duplicate...", "title=Current_T duplicate frames=" + t);

    // Subtract the reference from current time point
    imageCalculator("Subtract create stack", "Current_T", "Reference");
    rename("Subtracted_T" + t);

    // Copy result into final hyperstack
    for (z = 1; z <= slices; z++) {
        // Set slice in source
        selectWindow("Subtracted_T" + t);
        setSlice(z);
        run("Copy");

        // Set slice in target hyperstack
        selectWindow("Subtracted_Hyperstack");
        Stack.setPosition(1, z, t - 1);  // channel, slice, frame
        run("Paste");
    }

    // Cleanup
    close("Current_T");
    close("Subtracted_T" + t);
}

// Cleanup reference
close("Reference");

// Done
selectWindow("Subtracted_Hyperstack");
