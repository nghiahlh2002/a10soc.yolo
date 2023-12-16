export LD_LIBRARY_PATH=/usr/local/lib/:$LD_LIBRARY_PATH

./darknet detect cfg/ttt5_224_160.cfg weight/ttt5_224_160_last.weights 
