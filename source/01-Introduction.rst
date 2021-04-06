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

.. note::
   Work in progress.

