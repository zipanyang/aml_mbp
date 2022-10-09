repo init -u git://git.myamlogic.com/linux/manifest.git -b master -m br-ipc-c3-mbp.xml --repo-url=git://git.myamlogic.com/tools/repo.git
cd .repo/manifests/
git apply ../../patch/br-ipc-c3.xml.patch
cd -
repo sync -c
ln -s `pwd`/buildroot/package .
cd buildroot
git apply ../patch/buildroot-c3.patch
cd -
cd vendor/amlogic/ipc/mbp/sample
git apply ../../../../../patch/sample-c3.patch
cd -
cp script/Makefile vendor/amlogic/ipc/mbp/

