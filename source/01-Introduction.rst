.. note::
   This manual is still under development and there are some incomplete parts, marked as 'Work in progress'.

====================
ViSimpl Introduction
====================

After decades of independent morphological and functional brain research, a key point in neuroscience nowadays is to understand the combined relationships between the structure of the brain and its components and their dynamics on multiple scales, ranging from circuits of neurons at micro or mesoscale to brain regions at macroscale. With such a goal in mind there is a vast amount of research focusing on modeling and simulating activity within neuronal structures, and these simulations generate large and complex datasets which have to be analyzed in order to gain the desired insight. 

In such context we present **ViSimpl**, which integrates a set of visualization and interaction tools that provide a semantic view of brain data with the aim of improving its analysis procedures. ViSimpl provides 3D particle--based rendering that allows visualizing simulation data with their associated spatial and temporal information, enhancing the knowledge extraction process. It also provides abstract representations of the time--varying magnitudes supporting different data aggregation and disaggregation operations and giving also focus and context clues. In addition, ViSimpl tools provide synchronized playback control of the simulation being analyzed. Finally, ViSimpl allows performing selection and filtering operations in association with NeuroScheme application. All these views are loosely coupled and can be used independently, but they can also work together, both in centralized and distributed computing environments, as linked views enhancing the data exploration and analysis procedures.

---------------------
Hardware requirements
---------------------

ViSimpl application requires a graphic card that supports OpenGL 3.3 at least. It is also recommended (depending on dataset size) to use a multi-core CPU for parallel processing deployment. The size of the datasets that ViSimpl is able to load depends on the available memory on the machine. 

--------------
External Links
--------------

The homepage for ViSimpl is located at `ViSimpl Homepage`_ and the source code for the latest release is available in the `Github page`_. For reporting bugs please use the `Github Issues`_ page. If you have any questions or suggestions about ViSimpl refer to dev@vg-lab.es.

.. _Visimpl Homepage: https://vg-lab.es/visimpl/
.. _Github page: https://github.com/vg-lab/visimpl
.. _Github Issues: https://github.com/vg-lab/visimpl/issues

------------------------------------
SimPart and StackViz synchronization
------------------------------------

ViSimpl is composed of two applications: SimPart for 3D visualization (spatial data) and StackViz for time data manipulation (temporal data). For SimPart and StackViz to synchronize events a ZeroEQ discovery provider must be installed in the machine. ZeroEQ applications are linked using automatic discovery based on ZeroConf protocol or through explicit connection addressing using hostname and port because of that a service like Avahi on Linux or dnssd on Mac/Windows (like `Bonjour <https://developer.apple.com/bonjour/>`_) must be installed. If that service is not present ViSimpl and StackViz will still be usable but won't be able to synchronize. 

------------------------
Installation and running
------------------------

ViSimpl can be downloaded from the `ViSimpl Homepage`_ for Linux and Mac operating systems and executed locally. Additionally it can be executed using a docker image. 

^^^^^^^^^^^^^^^^^
Executing locally
^^^^^^^^^^^^^^^^^

The SimPart and StackViz application options and parameters are:

.. tabularcolumns:: |p{3.5cm}|p{3.5cm}|p{8.0cm}|

+------------------------+---------------------------------+------------------------------------------------------------------------------------------+
| **OPTION**             | **PARAMETER**                   | **DESCRIPTION**                                                                          |
+========================+=================================+==========================================================================================+
| ``--version``          | *none*                          | Shows the version of the application.                                                    |
+------------------------+---------------------------------+------------------------------------------------------------------------------------------+
| ``--help``             | *none*                          | Shows the options and arguments used                                                     |
|                        |                                 | for executing the application.                                                           |
+------------------------+---------------------------------+------------------------------------------------------------------------------------------+
| ``--testFile``         | *destination_path*              | Generates a test file dataset and saves it in the specified destination path. If the     |
|                        |                                 | destination path is not specified the test files will be saved in the same directory     |
|                        |                                 | as the application executable (if possible).                                             |
|                        |                                 | **Only available in SimPart**                                                            |
+------------------------+---------------------------------+------------------------------------------------------------------------------------------+
| ``-bc``                | *path_to_bc_file*               | Load BlueConfig file.                                                                    |
+------------------------+---------------------------------+------------------------------------------------------------------------------------------+
| ``-target``            | *target_label*                  | Specifies target label of the BlueConfig file.                                           |
+------------------------+---------------------------------+------------------------------------------------------------------------------------------+
| ``-csv``               | *path_to_network_file*          | Load CSV dataset files. Both the network and the activity files must be present.         |
|                        |                                 |                                                                                          |
|                        | *path_to_activity_file*         |                                                                                          |
+------------------------+---------------------------------+------------------------------------------------------------------------------------------+
| ``-rest``              | *url* *port*                    | Load data from the given url and port using NEST Rest API.                               |
+------------------------+---------------------------------+------------------------------------------------------------------------------------------+
| ``-se``                | *path_to_events_file*           | Load events file.                                                                        |
+------------------------+---------------------------------+------------------------------------------------------------------------------------------+
| ``-scale``             | *X,Y,Z*                         | Sets the 3D view scale in X,Y and Z axis.                                                |
+------------------------+---------------------------------+------------------------------------------------------------------------------------------+
| ``-zeq``               | *zeroeq_id*                     | Opens a ZeroEQ channel with the specified id.                                            |
+------------------------+---------------------------------+------------------------------------------------------------------------------------------+
| ``-ws``                | *width* *height*                | Specifies the size of the application window.                                            |
|                        |                                 |                                                                                          |
| ``--window-size``      |                                 |                                                                                          |
+------------------------+---------------------------------+------------------------------------------------------------------------------------------+
| ``-fs``                | *none*                          | Sets the application window to fullscreen mode.                                          |
|                        |                                 |                                                                                          |
| ``--fullscreen``       |                                 |                                                                                          |
+------------------------+---------------------------------+------------------------------------------------------------------------------------------+
| ``-mw``                | *none*                          | Maximizes the application window to the desktop resolution.                              |
|                        |                                 |                                                                                          |
| ``--maximize-window``  |                                 |                                                                                          |
+------------------------+---------------------------------+------------------------------------------------------------------------------------------+

If the options are incompatible or its parameters invalid the application will abort the execution and will show the help message in the console.

^^^^^^^^^^^^
Test dataset
^^^^^^^^^^^^

A test data for SimPart and StackViz can be generated by executing:

.. code-block:: bash

   ./visimpl --testFile

SimPart will start loading the test data automatically. If the application can't write the test files it will abort the execution and inform of the error, in that case a path must be specified where the user has permissions to write. 

.. code-block:: bash

   ./visimpl --testFile destination_path

^^^^^^^^^^^^^^
Docker example
^^^^^^^^^^^^^^

Executing **SimPart**:

.. code-block:: bash
  :linenos:
  :emphasize-lines: 10

  xhost +local:docker
  # Pull the image (do not use tag to download the latest image).
  docker pull vglab/visimpl
  # Download example data
  mkdir data
  cd data
  # Download a test dataset or move test files to data directory.
  cd ..
  # Run example
  docker run --gpus 1 -ti --rm -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v /etc/machine-id:/etc/machine-id -v $(pwd)/data:/data --privileged vglab/visimpl /usr/bin/visimpl.sh

To execute **StackViz**, follow the same steps but use **/usr/bin/stackviz.sh** in the docker call.

