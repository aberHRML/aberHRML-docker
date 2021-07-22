# lexmapr-docker

[![Project Status: Active - The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/0.1.0/active.svg)](http://www.repostatus.org/#active) [![Build Status](https://travis-ci.org/wilsontom/lexmapr-docker.svg?branch=master)](https://travis-ci.org/wilsontom/lexmapr-docker)
 ![License](https://img.shields.io/badge/license-GNU%20GPL%20v3.0-blue.svg "GNU GPL v3.0") [![Docker Pulls](https://img.shields.io/docker/pulls/wilsontom/lexmapr-docker.svg)](https://hub.docker.com/r/wilsontom/lexmapr-docker)


**Docker container for running [LexMapr](https://github.com/Public-Health-Bioinformatics/LexMapr)**

### Usage

* The LexMapping can be run from the docker cotainer using a single line, providing the files are named **input.csv** and **config.json**.

* Move these two files into a directory on the localhost which can be mounted to the docker container.

* The container and lexmapr command are then executed together using;

```sh
docker run --name lexmapr -v <LOCAL_DIR>:/data wilsontom/lexmapr-docker
```

* This is will create an **output.tsv** file in the <LOCAL_DIR>

`cat <LOCAL_DIR>/output.tsv`

```
Sample_Id       Sample_Desc     Cleaned_Sample  Matched_Components
small_simple1   Chicken Breast  chicken breast  ['breast:uberon_0000310']
small_simple2   Baked Potato    baked potato    ['potato (whole, baked):foodon_03302196']
small_simple3   Canned Corn     canned corn     ['corn (canned):foodon_03302665']
small_simple4   Frozen Yogurt   frozen yogurt   ['frozen:pato_0001985']
small_simple5   Apple Pie       apple pie       ['apple pie:foodon_00002475']
```

Currently the options for running lexmapr are
```sh
-p ifsac --no-cache
```
These settings cab be easily changed by editing the `entrypoint.sh` script.

