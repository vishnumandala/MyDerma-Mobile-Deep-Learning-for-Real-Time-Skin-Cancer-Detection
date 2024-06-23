# Skin Lesions Classification with Deep Convolutional Neural Network

### **Dataset**

---

[**The HAM10000 dataset, a large collection of multi-source dermatoscopic images of common pigmented skin lesions**](https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/DBW86T)

---

## Files Tables

| Sr.No |  FileName |                                                                                                            |
| ----- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| 1     | Exploratory data analysis                                    |
| 2     | Baseline model                                               | 
| 3     | Fine-tuning the last convolutional block of VGG16            | 
| 4     | Fine-tuning the top 2 inception blocks of InceptionV3        | 
| 5     | Fine-tuning the Inception-ResNet-C of Inception-ResNet V2    | 
| 6     | Fine-tuning the last dense block of DenseNet 201             | 
| 7     | Fine-tuning all layers of pretrained Inception V3 on ImageNet |
| 8     | Fine-tuning all layers of pretrained DenseNet 201 on ImageNet | 
| 9     | Ensemble model of the fully fine-tuned Inception V3 and DenseNet


## Note

Check Compatability of keras,tensorflow versions while running the notebooks.