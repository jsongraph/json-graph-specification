Testing
=======

Ruby build and tests exist to:

- validate json graph schema as draft v4 of `JSON schema`_
- validate examples against the json graph schema

.. _howto:

How-to
------

- Install `ruby`.
- Install `bundler` with ``gem install bundler``.
- Install testing dependencies with ``bundle install``.
- Run tests using rake:

  - ``bundle exec rake``

.. _travis-ci:

Travis-CI
---------

Automated testing with Travis-CI at `travis`_.

.. _JSON schema: http://json-schema.org
.. _travis: https://travis-ci.org/jsongraph/json-graph-specification
