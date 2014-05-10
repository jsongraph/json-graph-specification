json-graph-specification
========================

A proposal for representing graph structure es / edges) in JSON.

Design principles
-----------------

- Use meaningful property names that reflect the semantic type of the value.
- Property names should not be excessively long.
- Property names should be plural when value is an array.
- Properties that allow a ``null`` value can be omitted.
- Define a `JSON graph schema`_ for content validation purposes.

.. _properties:

Common Properties
-----------------

.. _id property:

**id property**

An `id` property is a primary key for an object (see Objects_) that is unique for the object type.  Its value is defined as a *JSON string* for flexibility.

**label property**

A `label` property provides a text display for an object.  Its value is defined as a *JSON string*.

**type property**

A `type` property provides a classification for an object.  Its value is defined as a *JSON string*.

**metadata property**

A `metadata` property allows for custom data on an object.  Its values is defined as a *JSON object*.


.. _objects:

Objects
-------

.. _node object:

**node object**

A node object represents a node in a graph.

**node properties**

- Includes all `Common Properties`_

.. _edge object:

**edge object**

An edge object represents an edge in a graph.

**edge properties**

- Includes all `Common Properties`_
- A `source` property provides the `id` value of the source `node object`_.  Its value is defined as a *JSON string*.
- A `target` property provides the `id` value of the target `node object`_.  Its value is defined as a *JSON string*.

.. _graph object:

**graph object**

A graph object represents a single conceptual graph.

**graph properties**

- Includes all `Common Properties`_
- A `nodes` property provides the nodes in the graph.  Its value is an array of `node object`_.
- An `edges` property provides the edges in the graph.  Its value is an array of `edge object`_.

.. _example:

Example
-------

**minimum (empty graph)**

.. code-block:: json

    {
        "graph": {
            "id": "default"
        }
    }

**minimum (nodes only)**

.. code-block:: json

    {
        "graph": {
            "id": "default",
            "nodes": [
                {
                    "id": "A",
                },
                {
                    "id": "B",
                }
            ]
        }
    }

**minimum (nodes and edges)**

.. code-block:: json

    {
        "graph": {
            "id": "default",
            "nodes": [
                {
                    "id": "A",
                },
                {
                    "id": "B",
                }
            ],
            "edges": [
                {
                    "source": "A",
                    "target": "B"
                }
            ]
        }
    }

**complete**

.. code-block:: json

    {
        "graph": {
            "id": "default",
            "type": "social",
            "label": "Social graph",
            "nodes": [
                {
                    "id": "0",
                    "type": "person",
                    "label": "Bob Smith",
                    "metadata": {
                        "nickname": "Bobby"
                    }
                },
                {
                    "id": "1",
                    "type": "person",
                    "label": "Patty Smith"
                    "metadata": {
                        "nickname": "Pat"
                    }
                }
            ],
            "edges": [
                {
                    "source": "0",
                    "target": "1",
                    "type": "married to",
                    "label": "- Married to -",
                    "metadata": {
                        "number of years": 6
                    }
                }
            ]
        }
    }

More `real world examples`_.

Schema
------

.. _schema:

The `JSON graph schema`_ (version 3) is provided for the json graph format.

.. _links:

Links
-----

- `JSON schema`_

.. _JSON graph schema: https://github.com/jsongraph/json-graph-specification/blob/master/schema.json
.. _JSON schema: http://json-schema.org
.. _real world examples: https://github.com/jsongraph/json-graph-specification/tree/master/examples
