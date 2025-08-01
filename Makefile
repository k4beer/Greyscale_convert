
# Makefile modified for Colab environment
# Assuming OpenCV is installed in standard system paths

IDIR=./
CXX = nvcc

# Manually specify OpenCV include and library paths for Colab
OPENCV_CFLAGS = -I/usr/include/opencv4
OPENCV_LIBS = -L/usr/lib/x86_64-linux-gnu -lopencv_stitching -lopencv_alphamat -lopencv_aruco -lopencv_barcode -lopencv_bgsegm -lopencv_bioinspired -lopencv_ccalib -lopencv_dnn_objdetect -lopencv_dnn_superres -lopencv_dpm -lopencv_face -lopencv_freetype -lopencv_fuzzy -lopencv_hdf -lopencv_hfs -lopencv_img_hash -lopencv_intensity_transform -lopencv_line_descriptor -lopencv_mcc -lopencv_quality -lopencv_rapid -lopencv_reg -lopencv_rgbd -lopencv_saliency -lopencv_shape -lopencv_stereo -lopencv_structured_light -lopencv_phase_unwrapping -lopencv_superres -lopencv_optflow -lopencv_surface_matching -lopencv_tracking -lopencv_highgui -lopencv_datasets -lopencv_text -lopencv_plot -lopencv_ml -lopencv_videostab -lopencv_videoio -lopencv_viz -lopencv_wechat_qrcode -lopencv_ximgproc -lopencv_video -lopencv_xobjdetect -lopencv_objdetect -lopencv_calib3d -lopencv_imgcodecs -lopencv_features2d -lopencv_dnn -lopencv_flann -lopencv_xphoto -lopencv_photo -lopencv_imgproc -lopencv_core

CXXFLAGS = $(OPENCV_CFLAGS)
LDFLAGS = $(OPENCV_LIBS)

all: clean build

build:
	$(CXX) convertRGBToGrey.cu --std c++17 $(CXXFLAGS) $(LDFLAGS) -o convertRGBToGrey.exe -Wno-deprecated-gpu-targets -I/usr/local/cuda/include -lcuda

run:
	./convertRGBToGrey.exe $(ARGS)

clean:
	rm -f convertRGBToGrey.exe
