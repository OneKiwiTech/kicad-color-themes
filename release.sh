#!/bin/bash

cd kiwi-light
cp template.json metadata.json
sed -i '/download_/d' metadata.json
sed -i '/install_size/d' metadata.json

zip -r kiwi-light.zip colors resources metadata.json
mv kiwi-light.zip vn.onekiwi.theme-kiwi-light.zip

sha=$(sha256sum vn.onekiwi.theme-kiwi-light.zip | cut -d' ' -f1)
size=$(du -b vn.onekiwi.theme-kiwi-light.zip | cut -f1)
installSize=$(unzip -l vn.onekiwi.theme-kiwi-light.zip | tail -1 | xargs | cut -d' ' -f1)

cp template.json metadata.json
sed -i -e "s/SHA256/$sha/g" metadata.json
sed -i -e "s/DOWNLOAD_SIZE/$size/g" metadata.json
sed -i -e "s/INSTALL_SIZE/$installSize/g" metadata.json

ls -lh vn.onekiwi.theme-kiwi-light.zip metadata.json
mv metadata.json metadata-light.json