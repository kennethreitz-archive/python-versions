Python Versions
===============

This is a set of scripts that creates stable builds of many Pythons. Targeting Heroku only, for now.

**Note**: This code is now deprecated in favor of `bob-builder <http://bob-builder.readthedocs.org/en/latest/>`_ and the `Python Buildpack Build Scripts <https://github.com/heroku/heroku-buildpack-python/tree/master/builds>`_.

Versions
--------

Official support for:

- Latest CPython 2.7
- Latest CPython 3.4

See also, `full list <https://github.com/kennethreitz/python-versions/tree/master/formula>`_.


Deployment
----------

::

    $ git clone git@github.com:kennethreitz/python-versions.git
    $ heroku create
    $ git push heroku master
    $ heroku config:set AWS_ACCESS_KEY_ID=xxxx AWS_SECRET_ACCESS_KEY=xxxx

Usage
-----

Once deployed, building a formula is simple::

    $ heroku run ./brew <formula> <bucket>
    # Builds specified Python to ``./python``.

Releasing a formula is simple::

    $ heroku run ./bottle <formula> <bucket>
    # Builds specified Python and uploads the resulting tarball to the given S3 bucket.

Distribution "Spec"
-------------------

``runtime-name.tar.bz2``, which contains ``PYTHONHOME``, including symlinks to python interpreters.
