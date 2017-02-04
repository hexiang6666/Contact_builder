Contact_builder 2.3
==================
### Description
Contatc_builder is a programm that can add contatc element for computational model of [RealESSI] (http://sokocalo.engr.ucdavis.edu/~jeremic/Real_ESSI_Simulator/)(UC Davis Realistic Earthquake Soil Structure Interaction). Currently this programme is written for 27 node brick element. 

### Installation

#### Building Dependencies

1) Boost and Python

```bash
sudo apt-get install libboost1.48-all-dev
sudo apt-get install build-essential
sudo apt-get install python-dev 
```

2) Octave

```bash
# For ubuntu 12
sudo apt-get install liboctave-pkg-dev 
# For ubuntu 14 onwards 
sudo apt-get install liboctave-dev 
```

#### Compiling gmESSI translator

1) Get the latest version of gmESSI from github

```bash
git clone https://github.com/SumeetSinha/gmESSI.git
```

2) Compile 

```bash
cd gmESSI
make -j ${nop}
make install
```

#### Installing Sublime plugins

1) gmsh-Tools :: [.msh and .geo]

	a) Open Sublime 
	b) Go to Preference/Package Control
	c) Select Add Repository
	d) Enter the plugin github repo https://github.com/SumeetSinha/gmsh-Tools
	e) Again, open Preferences/Package Control
	f) Select Install Package
	g) Search for gmsh-Tools and install it.


2) gmESSI-Tools:: [.gmessi]

	a) Open Sublime 
	b) Go to Preference/Package Control
	c) Select Add Repository
	d) Enter the plugin github repo https://github.com/SumeetSinha/gmESSI-Tools
	e) Again, open Preferences/Package Control
	f) Select Install Package
	g) Search for gmESSSI-Tools and install it.

#### Running Examples 

1) Run an example to check the correctness of installation


---
[UCD CompGeoMech](http://sokocalo.engr.ucdavis.edu/~jeremic/)

Created by: [Hexiang Wang]

Request for adding features on sumeet.kumar507@gmail.com
