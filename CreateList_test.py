import os

# Input, CHANGE these directory locations
img_prefix = '/work/mahmuds/Dataset/CityWalks/'
lab_prefix = '/work/mahmuds/Dataset/CityWalks/gtFine/test/'
img_folders = ['leftImg8bit/test']

# Output
file_names = ['cityscapes_test.txt']

for ff in range(len(file_names)):

	file_name = file_names[ff]
	img_folder = img_folders[ff]

	img_list = sorted(os.listdir(img_folder))

	img_path = [img_prefix + img_folder + '/' + x for x in img_list]
	lab_path = lab_prefix + 'gttest_dummy.png'

	file_open = open(file_name, 'w')
	for ii in range(len(img_path)):
		file_open.write("%s " % img_path[ii])
		file_open.write("%s\n" % lab_path)

