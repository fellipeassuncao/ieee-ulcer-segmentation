# A graph-based superpixel segmentation method for measuring pressure ulcers

Monitoring wound healing is a necessary procedure to help health services control pressure ulcers. The correct diagnosis depends on clinical observations by doctors and nurses during patient visits. The evaluation of the wound area represents one of the most important data. Usually, health professionals assess ulcers through visual inspection, using rulers and decals. These ones, in direct contact with these lesions, may cause discomfort and inducing other infections, and consequently, worsen the patient's clinical condition. Understanding and knowing these injuries allows for better preventive and therapeutic actions. In this paper, we aim to present an automatic and effective method for ulcer delineation according to the following pipeline: (i)graph-based superpixel segmentation; (ii)superpixel feature extraction; (iii)superpixel classification; (iv)ulcer segmentation; and (v)feature description. The main idea is to automatically compute pressure ulcer measurements for identifying the lesion area, allowing the follow-up of the scar evolution.  Our graph-based superpixel segmentation method outperformed five other state-of-the-art approaches, as well as deep learning models, reaching 92.6% sensitivity, 98.6% specificity, 97.6% precision, 96.6% accuracy, and 90.4% intersection over the union.

![Methodology](/screenshots/method.JPG "Methodology")

Resources and extra documentation for the manuscript "A graph-based superpixel segmentation method for measuring pressure ulcers" published in IEEE Latin America Transactions. The code is organized by the type of programming language used in the project in the following order Java (main project) -> Matlab (extract some superpixels) -> Python (extract another superpixels and do the statistics and overlapping for generated masks in DISF, ERS, SNIC). 

## Project Hierarchy  and Folder Description

The project hierarchy and folders description is as follows

## Requirements

- Matlab 2021b or later.
- Python 3.10 or later.

- Check dependences in pom.xml

## Screenshots
### Classification
![Classification](/screenshots/classificacao.JPG "Classification")

### Segmentation
<p align="center">
![Segmentation](/screenshots/segmentation.PNG "Segmentation")
</p>
### Labeling
<p align="center">
![Labeling](/screenshots/labeling.png "Labeling")
</p>

### SVM - GrabCut
![GrabCut SVM](/screenshots/grabcutsvm.JPG "GrabCut SVM")
### DISF Results and Examples
![DISF Results and Examples](/screenshots/exemplosdisf.JPG "DISF Results and Examples")

## Instruction for running the GUI JAVA

- mvn clean install
- mvn exec:java -Dexec.mainClass="com.rodolfo.ulcer.segmentation.Main"

## Instruction for running the Notebook Python

We develop this code using Google Colab.
We mount the drive using the path hierarchy described in "Project Hierarchy  and Folder Description"
