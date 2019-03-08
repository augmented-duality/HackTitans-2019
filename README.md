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
With epocs 50 the accuracy of _0.83_ is observed. Based on the models output the Emotion behind the voice is captured and a song from the pre-defined lib is played to either console the person or to entertain the person.
