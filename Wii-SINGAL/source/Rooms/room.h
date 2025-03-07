// room_content.h
#ifndef ROOM_CONTENT_H
#define ROOM_CONTENT_H

//ROOM FUNCTIONS
void TEST0();
void rm_debug_select();
void rm_testanim();
void rm_testFMV();
void TEST2();
void rm_train1();
void rm_map1();

//ROOM VARIABLES
extern int RoomChanged;

extern int currentRoom;

//ROOM LIST
// Define Room Enumeration
enum RoomList {
    room_debug_select,
    room_TEST0,          // Assign unique values to each room
    room_testanim,
    room_testFMV,
    room_TEST2,
    room_train1,
    room_map1,
    NUM_ROOMS // This will keep track of the total number of rooms
};

// Define an array of room names
extern const char* roomNames[];

extern enum RoomList selRoom;


#endif // ROOM_CONTENT_H