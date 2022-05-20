===============================
SimPart & StackViz File Formats
===============================

This section specifies in detail the open formats used by ViSimpl to read and store data, for information about how BlueConfig and HDF5 file formats store networks (called circuits) and activity data refer to the specifications of those formats.

Both SimPart and StackViz work with a network definition with positions in space and spike activation information. The network file specifies the 3D positions of the elements of the network and the activity file specifies the moment in time the each element has a spike ocurrence. 

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

----------------
JSON Groups file
----------------

The JSON groups file is the file that contains the groups and its properties and its generated using the **"Save"** button in the Groups tab in SimPart. The groups file can be loaded into SimPart using the **"Load"** button in the same tab.

The JSON groups file contains a json object with following fields: 
 - **date**: text value with the date of the selection.
 - **filename**: text value with the file name on disk of the network file of the selection.
 - **groups**: list of group definition json objects.

Each object in the "groups" defines a group and its properties. It has the following fields:
 - **active**: boolean indicating if the groups is active or not.
 - **function**: text containing the values that define the color transfer function. Pairs are separated by character ";" and values in the pair are separated by comma ",". The first value in the pair is a point in [0,1] and the second value of the pair is the ARGB color in that point.
 - **name**: text containing the name of the group.
 - **sizes**: text containing the values that define the sizes of the group. Pairs are separated by ";" and values in the pair are separated by comma ",". The first value of the pair is a point in [0,1] and the second value is the size in that point.
 - **gids**: text containig the ids of the elements in the groups. The ids can be expressed as ranges in the format **"lower_id:upper_id"** or just with the id number. The ids are joined by commas. 

.. code-block:: json
   :caption: JSON format of the groups file (example).

   {
      "date": "jue. ene. 13 20:37:42 2022",
      "filename": "network.csv",
      "groups": [
      {
         "active": true,
         "function": "0,#99e41a1c;0.227068,#be0000ff;0.583459,#ffffff1a;1,#7a6a191a",
         "gids": "0-40433,40436-40441",
         "name": "uno",
         "sizes": "0,20;1,10"
      },
      {
         "active": false,
         "function": "0,#99377eb8;1,#7a254158",
         "gids": "48713-84557",
         "name": "dos",
         "sizes": "0,20;1,10"
      },
      {
         "active": true,
         "function": "0,#994daf4a;1,#7a2e552c",
         "gids": "81801-124999",
         "name": "tres",
         "sizes": "0,20;1,10"
      }
     ]
   }


--------------------------
JSON Camera positions file
--------------------------

The JSON camera positions file is the file that contains the list of camera positions. Its generated using the **Save camera positions** option in the file menu of SimPart and loaded using the **Load camera positions** option in the same menu.

The JSON camera positions file contains a json object with following fields: 
 - **positions**: list of camera positions json objects.

Each position is a JSON object with the following fields:
 - **name**: Position name.
 - **position**: Camera coordinates.
 - **radius**: Aperture radius (distance to focus point).
 - **rotation**: Camera rotation matrix.

.. code-block:: json
   :caption: JSON format of the camera positions file (example).

   {
       "positions": [
           {
               "name": "home",
               "position": "-25,-25,-25",
               "radius": "2927.08",
               "rotation": "1,0,0,0,1,0,0,0,1"
           },
           {
               "name": "inside",
               "position": "-25,-25,-25",
               "radius": "788.348",
               "rotation": "1,0,0,0,1,0,0,0,1"
           }
       ]
   }



