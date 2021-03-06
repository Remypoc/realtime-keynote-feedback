# Opencv ressources installation

HOME_DIR="/home/ubuntu"

apt-get install -y build-essential cmake git pkg-config
apt-get install -y libjpeg8-dev libtiff5-dev libjasper-dev libpng12-dev
apt-get install -y libavcodec-dev libavformat-dev libswscale-dev libv4l-dev
apt-get install -y libgtk2.0-dev
apt-get install -y libatlas-base-dev gfortran

pip3 install numpy

cd $HOME_DIR
# Install opencv-3.2.0
wget https://github.com/opencv/opencv/archive/3.2.0.zip
unzip 3.2.0.zip
rm 3.2.0.zip
mv opencv-3.2.0 opencv
# Install opencv_contrib-3.2.0 (module)
wget https://github.com/opencv/opencv_contrib/archive/3.2.0.zip
unzip 3.2.0.zip
rm 3.2.0.zip

# Build sources
cd $HOME_DIR/opencv
mkdir build
cd build
sudo cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local \
           -D INSTALL_C_EXAMPLES=OFF \
           -D INSTALL_PYTHON_EXAMPLES=ON \
           -D OPENCV_EXTRA_MODULES_PATH=$HOME_DIR/opencv_contrib-3.2.0/modules \
           -D BUILD_EXAMPLES=ON ..
sudo make -j4
sudo make install
sudo ldconfig

cd $HOME_DIR
echo "export PYTHONPATH=$PYTHONPATH:/usr/local/lib/python3.5/dist-packages" >> \
    .bashrc
source .bashrc
