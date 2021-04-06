===============================
ViSimpl & StackViz File Formats
===============================

This section specifies in detail the open formats used by ViSimpl and StackViz to read and store data, for information about how BlueConfig and HDF5 file formats store networks (called circuits) and activity data refer to the specifications of those formats.

Both ViSimpl and StackViz work with a network definition with positions in space and spike activation information. The network file specifies the 3D positions of the elements of the network and the activity file specifies the moment in time the each element has a spike ocurrence. 

----------------
CSV Network File
----------------

The network file consists on a particle definition for each line, with the format: 
::

    [GID,]X,Y,Z

- **GID** is the unique identifier of the particle in unsigned 32 bits [unsigned long int]. This element is optional, if not included the particle ids will be assigned sequentially from zero.
- **X,Y,Z** are the positions in 3D space in 32 bits [float]
  
There is no need to order the lines and an identifier is repeated only the last position will be used. 
  
-----------------
CSV Activity File
-----------------

The activity file consists on a spike ocurrence for each line, with the format:
::

    GID,time

- **GID** is the unique identifier of the particle in unsigned 32 bits [unsigned long int].
- **time** is the time when the spike ocurrs in 32 bits [float].
  
There is no need to order the lines and an identifier can have multiple spike events. 
  
------------------------
JSON Subsets/Events File
------------------------

The subset and events file is specified in JSON format with only two keys "subsets" and "timeframes".

.. code-block:: json
   :caption: JSON format of the Subsets/Events file.

    {
      "subsets": [
        { "subset_1_name": "X:Y,Z" },
        { "subset_2_name": ":X,Y:Z" }
      ],
      "timeframes": [
        { "subset_1_name": ":A;B:C" },
        { "subset_2_name": "D:E;F:G" }
      ]
    }


The subsets values consists on a subset name and a the GIDs of the subset in the following format separated by commas:
::

    GID_start:GID_end
    
or individually:
::

    GID
    
.. note::

   If the **GID_start** is absent the subset is implied to start from 0, so ":20" will be interpreted as "0:20".

The timeframes values consists on a subset name (considered also the event name) and the activation times in the following format separated by semicolons:
::

  Time_start:Time_end

.. note::  

    If the **Time_start** is absent the timeframe is implied to start from 0, so ":0.25" will be interpreted as "0:0.25".


  

