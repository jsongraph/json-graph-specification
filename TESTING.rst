Testing
=======

Ruby build and tests exist in `.build`_ to:

- validate json graph schema as draft v4 of `JSON schema`_
- validate examples against the json graph schema

.. _howto:

How-to
------

- Install `ruby`.
- Install `bundler` with ``gem install bundler``.
- Install testing dependencies with ``bundle install`` from `.build`_ dir.
- Run:

  - From `.build`_: ``rake``
  - From project root: ``BUNDLE_GEMFILE=.build/Gemfile bundle exec rake -f .build/Rakefile``

.. _travis-ci:

Travis-CI
---------

Automated testing with Travis-CI at `travis`_.

.. _.build: https://github.com/jsongraph/json-graph-specification/tree/master/.build
.. _JSON schema: http://json-schema.org
.. _travis: https://travis-ci.org/jsongraph/json-graph-specification
