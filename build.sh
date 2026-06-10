
git clone git://code.qt.io/qt/qt5.git qt6
cd qt6
git switch 6.7.2
perl init-repository --module-subset="qt5compat,qtbase,qtdeclarative,qttools,qttranslations,qtshadertools"

cd ..
mkdir build-qt6
cd build-qt6
../qt6/configure -prefix $PWD/qtbase -release -static -accessibility -qt-zlib -qt-libpng -no-cups -no-sql-sqlite -no-qml-debug -nomake examples -nomake tests -no-freetype
ninja
cmake -DFEATURE_no_prefix:BOOL=OFF .
ninja install


export PATH=$(pwd)/qtbase/bin:$PATH

cd ..
