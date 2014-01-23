#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# flake8: noqa

from __future__ import unicode_literals

from flask.ext.assets import (
    Bundle,
)

jquery = Bundle('vendor/jquery/jquery.js')
angular = Bundle('vendor/angular/angular.js')

pure_css = Bundle(
    "vendor/pure/*.css",
)
