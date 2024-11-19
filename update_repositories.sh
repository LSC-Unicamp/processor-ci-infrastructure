#!/usr/bin/bash

#git clone --recursive https://github.com/LSC-Unicamp/processor-ci-controller.git
#git clone https://github.com/LSC-Unicamp/processor-ci.git
#git clone --recursive https://github.com/LSC-Unicamp/processor-ci-tests.git
#git clone https://github.com/LSC-Unicamp/processor-ci-website.git
#git clone https://github.com/LSC-Unicamp/processor-ci-infraestructure.git
#git clone https://github.com/LSC-Unicamp/processor_ci_communication.git

# Update repositories
git --git-dir=/eda/processor-ci-controller/.git --work-tree=/eda/processor-ci-controller pull
git --git-dir=/eda/processor-ci/.git --work-tree=/eda/processor-ci pull
git --git-dir=/eda/processor-ci-tests/.git --work-tree=/eda/processor-ci-tests pull
git --git-dir=/eda/processor-ci-website/.git --work-tree=/eda/processor-ci-website pull
git --git-dir=/eda/processor-ci-infraestructure/.git --work-tree=/eda/processor-ci-infraestructure pull
git --git-dir=/eda/processor_ci_communication/.git --work-tree=/eda/processor_ci_communication pull

cd /eda/processor-ci-website

# Update website

. env/bin/activate

pip install -r requirements.txt

mkdocs build

rsync -a --no-perms  /eda/processor-ci-website/site /eda/processor-ci-infrastructure/nginx/data/