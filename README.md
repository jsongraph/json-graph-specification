# json-graph-specification

A proposal for representing graph structures in JSON.

## Changes

Jan 2020 - Updated to Version 2 by [Travis Giggy](https://github.com/tgig)
  - Major change - nodes changed from a Array/List to a Map/Dictionary
  - Minor changes - updated JSONSchema reference, added the top-level id attribute back
  - Cleaned up the JSONSchema definitions taking advantage of updates to JSONSchema
  
## Design principles

- Use meaningful property names that reflect the semantic type of the value.
- Property names should not be excessively long.
- Property names should be plural when value is an array.
- Properties that allow a `null` value can be omitted.
- Define a
  [JSON graph schema](https://github.com/jsongraph/json-graph-specification/blob/master/json-graph-schema_v2.json)
  for content validation purposes.

## Structure Overview (Version 2)

### node object

A node object represents a node in a graph.

### node properties

- Each _node_ object must contain a string key which is the unique id for the node
- A _label_ property provides a text display for an object. Its value is defined as a _JSON string_.
- A _metadata_ property allows for custom data on an object. Its values is defined as a JSON object.

### edge array

Edges are an array of objects, each of which represents an edge in the graph.

### edge properties

- A source property references the key value of the source [node object](#node object). Its value is
  defined as a _JSON string_.
- A relation property provides the interaction between source and target nodes. Its value is defined
  as a _JSON string_.
- A target property references the key value of the target node object. Its value is defined as a
  _JSON string_.
- A directed property provides the edge mode (e.g. directed or undirected). Its value is _JSON true_
  for directed and _JSON false_ for undirected. The edge direction is determined by _graph.directed_
  property if not present.
- A metadata property allows for custom data on an object. Its values is defined as a JSON object.

### graph object

A graph object represents a single conceptual graph.

### graph properties

- An optional id property provides an identifier for this graph object
- A type property provides a classification for an object. Its value is defined as a _JSON string_.
- A label property provides a text display for an object. Its value is defined as a _JSON string_.
- A directed property provides the graph mode (e.g. directed or undirected). Its value is _JSON
  true_ for directed and _JSON false_ for undirected. This property default to _JSON true_
  indicating a directed graph.
- A nodes property provides the nodes in the graph. Its value is an array of [node object](#node
  object).
- An edges property provides the edges in the graph. Its value is an array of edge objects.
- A metadata property allows for custom data on an object. Its values is defined as a JSON object.

### graphs object

A graphs object groups zero or more graph objects into one JSON document.

- The graphs object is defined as a _JSON array_.

## Examples

### empty single graph

```json
{
  "graph": {}
}
```

### empty multi graph

```json
{
  "graphs": []
}
```

### nodes-only single graph

```json
{
  "graph": {
    "nodes": {
      "A": {},
      "B": {}
    }
  }
}
```

### nodes/edges single graph

```json
{
  "graph": {
    "nodes": {
      "A": {},
      "B": {}
    },
    "edges": [
      {
        "source": "A",
        "target": "B"
      }
    ]
  }
}
```

### complete single graph

```json
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
```

### complete multi graph

```json
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
```

More
[real world examples](https://github.com/jsongraph/json-graph-specification/tree/master/examples).

## Schema

The
[JSON graph schema](https://github.com/jsongraph/json-graph-specification/blob/master/json-graph-schema_v2.json)(version 2)
is provided for the json graph format.

## Media Type

The media type to describe JSON Graph Format is _application/vnd.jgf+json_. The approach to use a
media type suffix like _+json_ is described by [RFC 6839](https://tools.ietf.org/html/rfc6839).

In addition to the media type a _profile_ media type parameter MUST be set to a URL that
dereferences to the JSON schema for JSON Graph Format. The expected usage of the _profile_ media
type parameter is defined by [RFC 6906](https://tools.ietf.org/html/rfc6906). For example to
communicate plain JSON Graph Format content the _Content-Type_ header could be set as:

```http
Content-Type: application/vnd.jgf+json
```

A child schema of JSON Graph Format can communicate its JSON schema using additional _profile_ media
type parameters. Each _profile_ media type parameter MUST dereference a JSON schema. For example the
BEL JSON Graph Format could be communicated as:

```http
Content-Type: application/vnd.jgf+json;
          profile=http://jsongraphformat.info/schema.json;
          profile=http://jsongraphformat.info/child-schemas/bel-json-graph.schema.json
```

## NPM support

You can import the schema into your JS projects by installing it via NPM and requiring it.

```shell
npm install --save json-graph-specification
```

```javascript
var JSONGraph = require('json-graph-specification')
```

## Clients

1.  [jay-gee-eff](https://www.npmjs.com/package/jay-gee-eff) - An npm package for manipulating JGF
    files in nodejs.
2.  [jay-gee-eff-for-web](https://www.npmjs.com/package/jay-gee-eff-for-web) - An npm package for
    using JGF graphs with OOP in the web, i.e. web browsers, without capabilities of file handling,
    but a fully fledged JGF feature set.

## Project Tests

See [TESTING](https://github.com/jsongraph/json-graph-specification/blob/master/TESTING.rst).

## Related Standards {#links}

Graph data in JSON is usually modelled in application-specific ad-hoc formats. In addition there are
several text-based graph formats:

- [Graph Modelling Language](https://gephi.org/users/supported-graph-formats/gml-format/) (GML)
- [DOT](<https://en.wikipedia.org/wiki/DOT_(graph_description_language)>) (graphviz syntax)
- [Pajekt NET format](https://gephi.org/users/supported-graph-formats/pajek-net-format/)
- [Netdraw VNA format](https://gephi.org/users/supported-graph-formats/netdraw-vna-format/)
- [UCINET DL Format](https://gephi.org/users/supported-graph-formats/ucinet-dl-format/)
- Trivial Graph Format (TGF)
- [GUESS format](https://gephi.org/users/supported-graph-formats/gdf-format/) (GDF)
- [Tulip TLP format](http://tulip.labri.fr/TulipDrupal/?q=tlp-file-format)

and XML-based graph formats:

- Directed Graph Markup Language (DGML)
- [Graph Exchange XML Format](https://gephi.org/gexf/format) (GEXF)
- Graph eXchange Language (GXL)
- [GraphML](http://graphml.graphdrawing.org/)
- DotML (XML representation of DOT)
- XGMML (XML representation of GML)

Several semi-standardized JSON-based graph formats are found in applications, for instance
[Cytoscape JSON](http://js.cytoscape.org/#notation/elements-json). Simple graphs can also be
expressed [in CSV format](https://gephi.org/users/supported-graph-formats/csv-format/).

## Links

- [JSON schema](http://json-schema.org)
