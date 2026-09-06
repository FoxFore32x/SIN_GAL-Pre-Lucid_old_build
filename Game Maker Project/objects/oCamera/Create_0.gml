// Camera smoothing
setCamX = 0;
setCamY = 0;
finalCamX = 0;
finalCamY = 0;
camTrailSpd = 0.25;
lookX = 0;
lookY = 0;

// Visible room area (internal resolution)
view_w = 640;
view_h = 480;

scrollX = 0;
scrollY = 0;
scrollSpdX = 0;
scrollSpdY = 0;

scrollBGX = array_create(10, 0);
scrollBGY = array_create(10, 0);
scrollBGSpdX = array_create(10, 0);
scrollBGSpdY = array_create(10, 0);

foreLayer_xOff = 0;
foreLayer_yOff = 0;
backLayer_xOff = 0;
backLayer_yOff = 0;

// GUI matches visible area
//display_set_gui_size(view_w, view_h);

//Zoom
camZoom = 1;
camZoomTarget = 1;