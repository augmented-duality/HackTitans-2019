# Human Emotion Recognition from Speech 

## Motivation and Idea
Usually in TV shows some person will be playing background song(s) . He/She takes decison based on the topic being discussed in the room(say) . He plays songs of his own choice . The person need to be little knowledgeable to do this task . But being a human he / she might makes mistakes and needs better experience to learn .
My idea is to automate this process. So this application `plays` the `songs` based on the __emotions in the speech__ .<br>
I have considered briefly 4 *Emotion classes* 
* 1. Neutral
* 2. Angry
* 3. Happy
* 4. Sad <br>

## Idea Implementation
I have built a **Deep Neural Network** of two hidden layers. For each class, I have considered 100 training examples of recorded human voices in .wav format . The model is trained with all the class datasets . I have used __LSTM neural networks__ as input layers. The output layer is just a 4 nodes layer which gives an array of probability values of each classes . The class having max-probability value is considered as the predicted output .
With epocs ``50`` the accuracy of ``0.91176`` is observed. Based on the models output the Emotion behind the voice is captured and a song from the pre-defined lib is played to either console the person or to entertain the person.

A sample prediction output will be
```
Iterations =  10 / 10

 32/271 [==>...........................] - ETA: 0s - loss: 0.3922 - acc: 0.8047
 64/271 [======>.......................] - ETA: 0s - loss: 0.3542 - acc: 0.8320
 96/271 [=========>....................] - ETA: 0s - loss: 0.3596 - acc: 0.8411
128/271 [=============>................] - ETA: 0s - loss: 0.3626 - acc: 0.8359
160/271 [================>.............] - ETA: 0s - loss: 0.3651 - acc: 0.8375
192/271 [====================>.........] - ETA: 0s - loss: 0.3651 - acc: 0.8385
224/271 [=======================>......] - ETA: 0s - loss: 0.3683 - acc: 0.8359
256/271 [===========================>..] - ETA: 0s - loss: 0.3720 - acc: 0.8301
271/271 [==============================] - 1s 4ms/step - loss: 0.3703 - acc: 0.8330

32/68 [=============>................] - ETA: 0s
68/68 [==============================] - 0s 991us/step

32/68 [=============>................] - ETA: 0s
68/68 [==============================] - 0s 1ms/step

Accuracy = 0.8786764705882353
prediction array[0.16733351 0.03139864 0.04068724 0.76058054]

```
*This means that the model has predicted the given voice as **SAD** with ``87.86%`` accuracy*

## DataSets
This dataset is available here [Emo-db](http://www.emodb.bilderbar.info/download/)
