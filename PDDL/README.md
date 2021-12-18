# PDDL Training Plan

The PDDL implementation of the training plan uses the [metric-ff](https://fai.cs.uni-saarland.de/hoffmann/metric-ff.html) tool. There is a dockerfile that will create a container that will have this package available for testing.

## Build docker container
```
cd PDDL
docker build -t metric-ff .
docker run -it --rm -v ~/Documents/training_planner/PDDL:/src --entrypoint bash metric-ff
```

## Run commands
Once the container is built, you can use the tool to run the problem against the domain file

```
/Metric-FF-v2.1/ff -o domain.pddl -f maintenance_problem.pddl -s 0
/Metric-FF-v2.1/ff -o domain.pddl -f marathon_problem.pddl -s 0
```

