# -*- coding: utf-8 -*-
# flake8: noqa
from __future__ import absolute_import

from flask.ext.assets import (
    Bundle,
)

from kepler.base.assets import jquery, angular, pure_css

web_scripts = Bundle('js/*.js')
web_less = Bundle('css/*.less', filters=('less',))
web_css = Bundle('css/*.css')


BUNDLES = [
    ('css-web', Bundle(pure_css, web_less, web_css,
                       #filters=('cssmin',),
                       output='kepler.css')),
    ('js-web', Bundle(jquery, angular, web_scripts,
                      #filters=('jsmin',),
                      output='kepler.js')),
]
