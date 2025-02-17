# QUILL: 3D QED particle-in-cell code

**QUILL** (simulator for **QU**antum effects in **I**ntense **L**aser-p**L**asma  interactions) is a fully three-dimensional parallel particle-in-cell (PIC) code developed at the Institute of Applied Physics RAS, Nizhny Novgorod, Russia.
To our knowledge, it was the first PIC code with implementation of the Monte Carlo QED approach to investigate the development of electron–positron cascades.

The code is able to model the following processes using the Monte Carlo technique:

* photon emission by an electron in the strong field, with radiation reaction effects;
* electron–positron pair creation from gamma photons (Breit–Wheeler process).

The Maxwell solvers implemented in the code are FDTD, NDFX (the scheme used in A. Pukhov's VLPL code), and hybrid five-point FDTD (the scheme reduces numerical Cherenkov instability).
The particles pushers implemented in the code use Vay or Boris scheme.

# Dependencies

In order to build and run Quill, the following dependencies are required:
* C++ compiler with C++11 support;
* CMake (version 3.10 or higher);
* MPI implementation;
* Python3 interpreter (*optional*: NumPy and Matplotlib for data analysis).

Quill is developed and tested on Linux with the use of *g++* and *clang++* compilers and *OpenMPI*.

# Build

To build Quill, run CMake in the `build` folder, e.g.
```
cd build
cmake ..
make
```
Or use your preferred way of building with CMake.

Building in any other folder is not recommended, as scripts rely on executables being present in the `build` folder.

Quill can be compiled without QED support by setting the CMake option QUILL_ENABLE_QED to OFF (ON by default),
```
cmake .. -DQUILL_ENABLE_QED=OFF
```

# Input files

Example input files can be found in the `conf/examples` folder.
All possible parameters in the input file are described in the `quill.conf.example` file.

# Run

To run Quill, use the `run.sh` script from the `quill3d` folder and pass the name of the input file as a parameter.
For example,
```
./run.sh /home/user/my-problem
```

By default, `run.sh` relies on `mpirun`.
Rewrite the script itself if different behavior is required.

The number of MPI threads is determined by the `n_sr` parameter in the input file and should never be explicitly set to a different value.

*Note:* In order to run Quill, a Python interpreter is required on all nodes;
it is used to parse the input file.

# Analyze results

Results can be graphically analyzed with the `qplot` Python package located in the `python` folder.
Refer to the documentation within the package itself.
Documentation in IPython or Jupyter Notebooks/Lab can also be accessed using the `?` command, e.g. `qplot.density?`

Low-level data reading is available in the `resread` package.

The `qplot` package depends on the `matplotlib` and `numpy` packages; `resread` depends only on `numpy`.
