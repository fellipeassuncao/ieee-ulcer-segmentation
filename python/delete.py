import os

superpixels = ['disf5', 'ers','lsc','seeds','slic','snic']
files = [str(i)+'/'+str(i)+'_14_GRAB_SEEDS_DISTRIBUITION.jpg', 
         str(i)+'/'+str(i)+'_14_GRAB_SEEDS_DISTRIBUITION.jpg',
         str(i)+'/'+str(i)+'_14_GRAB_SEEDS_DISTRIBUITION.jpg',
         str(i)+'/'+str(i)+'_14_GRAB_SEEDS_DISTRIBUITION.jpg',
         str(i)+'/'+str(i)+'_14_GRAB_SEEDS_DISTRIBUITION.jpg',
         str(i)+'/'+str(i)+'_14_GRAB_SEEDS_DISTRIBUITION.jpg',]
path = 'master-ulcer-segmentation-felipe\files\database\tests\disf5'
path_dir_name = os.listdir(path)

for i in path_dir_name:
    for file in files:
        if i == '.ipynb_checkpoints':
        continue

        myfile = path+file
        print("Deletando o arquivo", myfile)

        ## If file exists, delete it ##
        if os.path.isfile(myfile):
            os.remove(myfile)
        else:    
        ## Show an error ##
            print("Error: %s file not found" % myfile)