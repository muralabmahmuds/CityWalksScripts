import os

# Input, CHANGE these directory locations
img_prefix = '/work/mahmuds/Dataset/CityWalks/'
lab_prefix = '/work/mahmuds/Dataset/CityWalks/'
img_folders = ['leftImg8bit/train', 'leftImg8bit/val']
lab_folders = ['gtFine/train', 'gtFine/val']

# Output
file_names = ['citywalks_train.txt', 'citywalks_val.txt']

for ff in range(len(file_names)):

	file_name = file_names[ff]
	img_folder = img_folders[ff]
	lab_folder = lab_folders[ff]

	img_list = sorted(os.listdir(img_folder))
	lab_list = sorted(os.listdir(lab_folder))

	img_path = [img_prefix + img_folder + '/' + x for x in img_list]
	lab_path = [lab_prefix + lab_folder + '/' + x for x in lab_list]

	file_open = open(file_name, 'w')
	for ii in range(len(img_path)):
		file_open.write("%s " % img_path[ii])
		file_open.write("%s\n" % lab_path[ii])

