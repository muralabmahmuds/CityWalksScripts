import os

# Input, CHANGE these directory locations
prefix = ''
img_folders = ['leftImg8bit/train', 'leftImg8bit/test', 'leftImg8bit/val']

# Output
file_names = ['CityWalks_train_names.txt', 'CityWalks_test_names.txt', 'CityWalks_val_names.txt']

for ff in range(len(file_names)):

	file_name = file_names[ff]
	img_folder = img_folders[ff]

	img_list = sorted(os.listdir(img_folder))

	img_path = [x for x in img_list]

	file_open = open(file_name, 'w')
	for ii in range(len(img_path)):
		file_open.write("%s\n" % img_path[ii])
