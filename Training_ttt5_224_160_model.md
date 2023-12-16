# Tiny-tiny-tiny-yolo model(ttt5_224_160.cfg) training method  

**[AlexeyAB](https://github.com/AlexeyAB/darknet.git) recommends ensamble training for YOLO**.  
For ensamble training, we need **2-dataset imagenet and COCO**.  
And *classification task* by imagenet dataset and *object detection task* by COCO dataset.  

### Requirement
Bash  
Python  
Opencv-python   
Wget command  
[darknet_sdl](https://github.com/k5iogura/darknet_sdl) or [AlexeyAB](https://github.com/AlexeyAB/darknet.git) 

## Classification task by imagenet

### Preparation dataset
First of all, to get imagenet dataset, we need registration and downloading permission of WebMaster Stanford Univ. But not easy,,,  
Another way to get imagenet dataset is downloading URLs from imagenet Website and download many images using 'wget' command.  

**git clone [AlexeyAB](https://github.com/AlexeyAB/darknet.git) , and use scripts in it.**  
these scripts perform downloading many jpeg images from internet, and finaly you get 3-files, trainval_1000c.txt, train_1000c.txt, val_1000c.txt.  
3-files mean jpeg image path-list on your PC for 1000 category training, validation and all.  
Images downloading from intenet takes a long time, **few days**.  

### Run classification training

After long time, image downloading is done.  
For training process, we have to git clone [AlexeyAB](https://github.com/AlexeyAB/darknet.git).  

$ git clone https://github.com/AlexeyAB/darknet.git  
$ cd darknet  

Next is to create darknet control card(cfg/*.data) like belllow,  
$ cat classifier_500c.data  
classes=500  
train  = <'path'>/get_imagenet/train_500c.txt  
valid  = <'path'>/get_imagenet/val_500c.txt  
labels = <'path'>/get_imagenet/darknet.labels_500c.txt  
backup = INET  
top = 5  

And issue training command,  
$ mkdir INET  
$ darknet classifier train classifier_500c.data cfg/ttt5_pre.cfg  
Classification training takes a long time too, **1week on tesla v100**.  
Classification training may not finished after 1week.  
After training, you can see weights in INET/ directory.

## Object detection task by VOC

### Preparation dataset

Other side, COCO dataset downloading is easy.  We just type 3 commands or use script in it,  
$ wget https://pjreddie.com/media/files/VOCtrainval_11-May-2012.tar  
$ wget https://pjreddie.com/media/files/VOCtrainval_06-Nov-2007.tar  
$ wget https://pjreddie.com/media/files/VOCtest_06-Nov-2007.tar  
detail of download COCO dataset is in [AlexeyAB](https://github.com/AlexeyAB/darknet.git).  

### Run object detection training

Next is to create darknet control card(cfg/*.data) like bellow,  
$ cat cfg/coco.data  
classes= 80  
train  = <'path'>/train.txt  
valid  = <'path'>/2012.txt  
names = data/voc.names  
backup = COCO_WEIGHTS  

And issu training command,  
$ mkdir COCO_WEIGHTS  
$ darknet partial cfg/ttt5_pre.cfg INET/ttt5_pre.weights INET/ttt5_pre_7.weights 7  
$ darknet detector train cfg/coco.data cfg/ttt5_224_160.cfg INET/ttt5_pre_7.weights INET/ttt5_pre_7.weights  
COCO object detection trainig take **a week on GTX 1050**.  
After training, you can see weights file in COCO_WEIGHTS/ directory.  

We get accuracy of training by issue command bellow,  
$ darknet detector recall cfg/coco.data cfg/ttt5_224_160.cfg  COCO_WEIGHTS/ttt5_224_160_final.weights  
