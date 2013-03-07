Python Versions
===============

This is a set of scripts that creates stable builds of many Pythons.

Targeting Heroku only, for now.

Versions
--------

Official support for:

- Latest CPython 2.7
- Latest CPython 3.3

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

Once deployed, building a forumla is simple::

    $ heroku run ./brew <forumla> <bucket>
    # Builds specified Python to ``./python``.

Releasing a forumla is simple::

    $ heroku run ./bottle <forumla> <bucket>
    # Builds specified Python and uploads the resulting tarball to the given S3 bucket.

Distribution "Spec"
-------------------

``runtime-name.tar.bz2``, which contains ``PYTHONHOME``, including symlinks to python interpreters.