# Testing

## Tests exist to:

- validate json graph schema as draft v4 of [JSON schema](http://json-schema.org)
- validate examples against the json graph schema

## How-to

- Install python3
- Install a virtual environment: `virtualenv venv`
- Activate virtual environment: `. venv/bin/activate`
- Install testing etc dependencies with `pip install -r requirements.txt`
- Run tests: `python -m unittest test.test-examples`

## Travis-CI

<!-- prettier-ignore-start -->
Automated testing with Travis-CI at [travis](https://travis-ci.org/jsongraph/json-graph-specification).
<!-- prettier-ignore-end -->
