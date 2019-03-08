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
Iterations =  50 / 50

 32/271 [==>...........................] - ETA: 0s - loss: 0.0113 - acc: 1.0000
 64/271 [======>.......................] - ETA: 0s - loss: 0.0111 - acc: 1.0000
 96/271 [=========>....................] - ETA: 0s - loss: 0.0116 - acc: 1.0000
128/271 [=============>................] - ETA: 0s - loss: 0.0111 - acc: 1.0000
160/271 [================>.............] - ETA: 0s - loss: 0.0112 - acc: 1.0000
192/271 [====================>.........] - ETA: 0s - loss: 0.0114 - acc: 1.0000
224/271 [=======================>......] - ETA: 0s - loss: 0.0155 - acc: 0.9978
256/271 [===========================>..] - ETA: 0s - loss: 0.0151 - acc: 0.9980
271/271 [==============================] - 1s 4ms/step - loss: 0.0147 - acc: 0.9982

32/68 [=============>................] - ETA: 0s
68/68 [==============================] - 0s 1ms/step

32/68 [=============>................] - ETA: 0s
68/68 [==============================] - 0s 1ms/step
Accuracy = 0.9117647058823529
Prediction  array [0.1621124  0.00876429 0.80469954 0.02442372]

```
*This means that the model has predicted the given voice as **HAPPY** with ``91.176%`` accuracy*

## DataSets
This dataset is available here [Emo-db](http://www.emodb.bilderbar.info/download/)
