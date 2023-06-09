# A graph-based superpixel segmentation method for measuring pressure ulcers

![A graph-based superpixel segmentation method for measuring pressure ulcers](https://www.youtube.com/watch?v=KzlREg0j8ME "A graph-based superpixel segmentation method for measuring pressure ulcers")

Monitoring wound healing is a necessary procedure to help health services control pressure ulcers. The correct diagnosis depends on clinical observations by doctors and nurses during patient visits. The evaluation of the wound area represents one of the most important data. Usually, health professionals assess ulcers through visual inspection, using rulers and decals. These ones, in direct contact with these lesions, may cause discomfort and inducing other infections, and consequently, worsen the patient's clinical condition. Understanding and knowing these injuries allows for better preventive and therapeutic actions. In this paper, we aim to present an automatic and effective method for ulcer delineation according to the following pipeline: (i)graph-based superpixel segmentation; (ii)superpixel feature extraction; (iii)superpixel classification; (iv)ulcer segmentation; and (v)feature description. The main idea is to automatically compute pressure ulcer measurements for identifying the lesion area, allowing the follow-up of the scar evolution.  Our graph-based superpixel segmentation method outperformed five other state-of-the-art approaches, as well as deep learning models, reaching 92.6% sensitivity, 98.6% specificity, 97.6% precision, 96.6% accuracy, and 90.4% intersection over the union.

![Methodology](/screenshots/method.JPG "Methodology")

Resources and extra documentation for the manuscript "A graph-based superpixel segmentation method for measuring pressure ulcers" published in IEEE Latin America Transactions. The code is organized by the type of programming language used in the project in the following order Java (main project) -> Matlab (extract some superpixels) -> Python (extract another superpixels and do the statistics and overlapping for generated masks in DISF, ERS, SNIC).

## Requirements

- Matlab 2021b or later.
- Python 3.10 or later.

- Check dependences in pom.xml

## Screenshots
### Classification
![Classification](/screenshots/classificacao.JPG "Classification")

### Segmentation
![Segmentation](/screenshots/segmentation.PNG "Segmentation")

### Labeling
![Labeling](/screenshots/labeling.png "Labeling")

### SVM and GrabCut Methods
![GrabCut SVM](/screenshots/grabcutsvm.JPG "GrabCut SVM")
### DISF Results and Examples
![DISF Results and Examples](/screenshots/exemplosdisf.JPG "DISF Results and Examples")

## Instruction for running the GUI JAVA
The original project created by Silva e Machado (2021) is disponible in:
[Original Java Project](https://github.com/RodolfoHerman/ulcer-segmentation)

Open the project path in your preferred IDLE and type in the terminal:

- mvn clean install
- mvn exec:java -Dexec.mainClass="com.rodolfo.ulcer.segmentation.Main"

## Instruction for running the Python Notebook

We develop this code using Google Colab.
We mount the drive using the path hierarchy like developed in code.

[Python Notebook](https://github.com/fellipeassuncao/master-project/blob/main/python/main.ipynb)
