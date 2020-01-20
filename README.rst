json-graph-specification
========================

A proposal for representing graph structures in JSON.

Links
-----

**Continuous Integration**

.. image:: https://travis-ci.org/jsongraph/json-graph-specification.svg?branch=master
    :target: https://travis-ci.org/jsongraph/json-graph-specification

**Gitter Chat**

.. image:: http://img.shields.io/badge/gitter-join%20chat-brightgreen.svg
    :target: https://gitter.im/jsongraph

Design principles
-----------------

- Use meaningful property names that reflect the semantic type of the value.
- Property names should not be excessively long.
- Property names should be plural when value is an array.
- Properties that allow a ``null`` value can be omitted.
- Define a `JSON graph schema`_ for content validation purposes.

.. _structure:

Structure
-------

.. _node object:

**node object**

A node object represents a node in a graph.

**node properties**

- Each `node` object must contain a string key which is the unique id for the node
- A `label` property provides a text display for an object. Its value is defined as a *JSON string*.
- A `metadata` property allows for custom data on an object. Its values is defined as a JSON object.

.. _edge array:

**edge array**

Edges are an array of objects, each of which represents an edge in the graph.

**edge properties**

- A `source` property references the `key` value of the source `node object`_. Its value is defined as a *JSON string*.
- A `relation` property provides the interaction between `source` and `target` nodes.  Its value is defined as a *JSON string*.
- A `target` property references the `key` value of the target `node object`_. Its value is defined as a *JSON string*.
- A `directed` property provides the edge mode (e.g. directed or undirected). Its value is *JSON true* for directed and *JSON false* for undirected. The edge direction is determined by *graph.directed* property if not present.
- A `metadata` property allows for custom data on an object. Its values is defined as a JSON object.

.. _graph object:

**graph object**

A graph object represents a single conceptual graph.

**graph properties**

- An optional `id` property provides an identifier for this graph object
- A `type` property provides a classification for an object. Its value is defined as a *JSON string*.
- A `label` property provides a text display for an object. Its value is defined as a *JSON string*.
- A `directed` property provides the graph mode (e.g. directed or undirected). Its value is *JSON true* for directed and *JSON false* for undirected. This property default to *JSON true* indicating a directed graph.
- A `nodes` property provides the nodes in the graph. Its value is an array of `node object`_.
- An `edges` property provides the edges in the graph. Its value is an array of `edge object`_.
- A `metadata` property allows for custom data on an object. Its values is defined as a JSON object.

.. _graphs object:

**graphs object**

A graphs object groups zero or more `graph object`_ into one JSON document.

- The `graphs object`_ is defined as a *JSON array*.


.. _examples:

Examples
--------

.. _empty single graph:

**empty single graph**

.. code-block:: json

    {
        "graph": {}
    }

.. _empty multi graph:

**empty multi graph**

.. code-block:: json

    {
        "graphs": []
    }

.. _nodes-only single graph:

**nodes-only single graph**

.. code-block:: json

    {
        "graph": {
            "nodes": {
                "A": {
                },
                "B": {
                }
            }
        }
    }

.. _nodes/edges single graph:

**nodes/edges single graph**

.. code-block:: json

    {
        "graph": {
            "nodes": {
                "A": {
                },
                "B": {
                }
            },
            "edges": [
                {
                    "source": "A",
                    "target": "B"
                }
            ]
        }
    }

.. _complete single graph:

**complete single graph**

.. code-block:: json

    {
        "graph": {
            "directed": false,
            "type": "graph type",
            "label": "graph label",
            "metadata": {
                "user-defined": "values"
            },
            "nodes": {
                "0": {
                    "type": "node type",
                    "label": "node label(0)",
                    "metadata": {
                        "user-defined": "values"
                    }
                },
                "1": {
                    "type": "node type",
                    "label": "node label(1)",
                    "metadata": {
                        "user-defined": "values"
                    }
                }
            },
            "edges": [
                {
                    "source": "0",
                    "relation": "edge relationship",
                    "target": "1",
                    "directed": false,
                    "label": "edge label",
                    "metadata": {
                        "user-defined": "values"
                    }
                }
            ]
        }
    }

.. _complete multiple graph:

**complete multi graph**

.. code-block:: json

    {
        "graphs": [
            {
                "directed": true,
                "type": "graph type",
                "label": "graph label",
                "metadata": {
                    "user-defined": "values"
                },
                "nodes": {
                    "0": {
                        "type": "node type",
                        "label": "node label(0)",
                        "metadata": {
                            "user-defined": "values"
                        }
                    },
                    "1": {
                        "type": "node type",
                        "label": "node label(1)",
                        "metadata": {
                            "user-defined": "values"
                        }
                    }
                },
                "edges": [
                    {
                        "source": "0",
                        "relation": "edge relationship",
                        "target": "1",
                        "directed": true,
                        "label": "edge label",
                        "metadata": {
                            "user-defined": "values"
                        }
                    }
                ]
            },
            {
                "directed": true,
                "type": "graph type",
                "label": "graph label",
                "metadata": {
                    "user-defined": "values"
                },
                "nodes": {
                    "0": {
                        "type": "node type",
                        "label": "node label(0)",
                        "metadata": {
                            "user-defined": "values"
                        }
                    },
                    "1": {
                        "type": "node type",
                        "label": "node label(1)",
                        "metadata": {
                            "user-defined": "values"
                        }
                    }
                },
                "edges": [
                    {
                        "source": "1",
                        "relation": "edge relationship",
                        "target": "0",
                        "directed": true,
                        "label": "edge label",
                        "metadata": {
                            "user-defined": "values"
                        }
                    }
                ]
            }
        ]
    }

More `real world examples`_.

Schema
------

.. _schema:

The `JSON graph schema`_ (version 3) is provided for the json graph format.

Media Type
----------

The media type to describe JSON Graph Format is *application/vnd.jgf+json*. The approach to use a media type suffix like *+json* is described by `RFC 6839`_.

In addition to the media type a *profile* media type parameter MUST be set to a URL that dereferences to the JSON schema for JSON Graph Format. The expected usage of the *profile* media type parameter is defined by `RFC 6906`_. For example to communicate plain JSON Graph Format content the *Content-Type* header could be set as:

.. code-block:: http

    Content-Type: application/vnd.jgf+json

A child schema of JSON Graph Format can communicate its JSON schema using additional *profile* media type parameters. Each *profile* media type parameter MUST dereference a JSON schema. For example the BEL JSON Graph Format could be communicated as:

.. code-block:: http

    Content-Type: application/vnd.jgf+json;
              profile=http://jsongraphformat.info/schema.json;
              profile=http://jsongraphformat.info/child-schemas/bel-json-graph.schema.json

NPM support
-----------

You can import the schema into your JS projects by installing it via NPM and requiring it.

.. code-block:: shell

    npm install --save json-graph-specification


.. code-block:: javascript

    var JSONGraph = require("json-graph-specification");

Clients
-----------
1. `jay-gee-eff`_ - An npm package for manipulating JGF files in nodejs.
2. `jay-gee-eff-for-web`_ - An npm package for using JGF graphs with OOP in the web, i.e. web browsers, without capabilities of file handling, but a fully fledged JGF feature set.

Project Tests
-------------

See `TESTING`_.

.. _links:

Related Standards
-----------------

Graph data in JSON is usually modelled in application-specific ad-hoc
formats. In addition there are several text-based graph formats:

-  `Graph Modelling Language <https://gephi.org/users/supported-graph-formats/gml-format/>`__ (GML)
-  `DOT <https://en.wikipedia.org/wiki/DOT_(graph_description_language)>`__ (graphviz syntax)
-  `Pajekt NET format <https://gephi.org/users/supported-graph-formats/pajek-net-format/>`__
-  `Netdraw VNA format <https://gephi.org/users/supported-graph-formats/netdraw-vna-format/>`__
-  `UCINET DL Format <https://gephi.org/users/supported-graph-formats/ucinet-dl-format/>`__
-  Trivial Graph Format (TGF)
-  `GUESS format <https://gephi.org/users/supported-graph-formats/gdf-format/>`__ (GDF)
-  `Tulip TLP format <http://tulip.labri.fr/TulipDrupal/?q=tlp-file-format>`__

and XML-based graph formats:

-  Directed Graph Markup Language (DGML)
-  `Graph Exchange XML Format <https://gephi.org/gexf/format>`__ (GEXF)
-  Graph eXchange Language (GXL)
-  `GraphML <http://graphml.graphdrawing.org/>`__
-  DotML (XML representation of DOT)
-  XGMML (XML representation of GML)

Several semi-standardized JSON-based graph formats are found in
applications, for instance
`Cytoscape JSON <http://js.cytoscape.org/#notation/elements-json>`__.
Simple graphs can also be expressed `in CSV
format <https://gephi.org/users/supported-graph-formats/csv-format/>`__.

Links
-----

- `JSON schema`_

.. _JSON graph schema: https://github.com/jsongraph/json-graph-specification/blob/master/json-graph-schema.json
.. _JSON schema: http://json-schema.org
.. _real world examples: https://github.com/jsongraph/json-graph-specification/tree/master/examples
.. _TESTING: https://github.com/jsongraph/json-graph-specification/blob/master/TESTING.rst
.. _RFC 6839: https://tools.ietf.org/html/rfc6839
.. _RFC 6906: https://tools.ietf.org/html/rfc6906
.. _jay-gee-eff: https://www.npmjs.com/package/jay-gee-eff
.. _jay-gee-eff-for-web: https://www.npmjs.com/package/jay-gee-eff-for-web
