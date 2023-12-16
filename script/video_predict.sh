export LD_LIBRARY_PATH=/usr/local/lib/:$LD_LIBRARY_PATH

#./darknet detector demo cfg/coco.data cfg/ttt5_224_160.cfg weight/ttt5_224_160_last_2.weights data/video-1651117754.mp4
#./darknet detector demo cfg/coco.data cfg/ttt5_224_160.cfg weight/ttt5_224_160_last_2.weights data/animal.mp4
#./darknet detector demo cfg/coco.data cfg/ttt5_224_160.cfg weight/ttt5_224_160_last_2.weights data/videoplayback.mp4
./darknet detector demo cfg/coco.data cfg/ttt5_224_160.cfg weight/ttt5_224_160_last_2.weights data/tokyo.mp4
