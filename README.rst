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

Usage
-----

Once deployed, building a forumla is simple::

    $ heroku run <forumla>
    "./build.sh -f $1 -p ./python -x $1.tar.bz2 -r envy-versions"

Configuration
-------------

Fairly self explanatory:

- ``AWS_ACCESS_KEY_ID``
- ``AWS_SECRET_ACCESS_KEY``


Distribution "Spec"
-------------------

``runtime-name.tar.bz2``, which contains ``PYTHONHOME``, including symlinks to python interpreters.