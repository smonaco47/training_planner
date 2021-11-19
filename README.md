# training_planner


Download latest package https://fai.cs.uni-saarland.de/hoffmann/metric-ff.html

Build:
```
docker run -it -v /src:..path_to_folder ubuntu bash

cd /src

sudo apt-get update 
sudo apt-get upgrade 
sudo apt-get install flex bison make

make

./ff -p ../../lets_eat/ -o domain.pddl -f problem.pddl -s 0
```
Other option: https://github.com/KCL-Planning/DiNo