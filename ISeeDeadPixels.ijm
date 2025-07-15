// Store original stack name
original_img = getTitle();

// Find pixels that are consistently bright (averaging over 128 across the whole z-stack)
run("Z Project...", "projection=[Average Intensity]");
setAutoThreshold("Default no-reset");
run("Threshold...");
setThreshold(0, 128);
run("Convert to Mask");
run("Close");
DeadPixels = getTitle();

// Create a stack with dead pixels set to 0
imageCalculator("AND create stack", original_img,DeadPixels);
close(DeadPixels);

