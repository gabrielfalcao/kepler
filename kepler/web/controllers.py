#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Copyright © 2013 Gabriel Falcão <gabriel@propellr.com>
#
from __future__ import unicode_literals
import time
import json
import socket
from kepler import settings
from flask import Blueprint, render_template, session, url_for, request
from kepler.framework.http import json_response
from kepler.framework.handy.functions import get_ip
from twilio.rest import TwilioRestClient

module = Blueprint('web', __name__)


@module.context_processor
def inject_basics():
    return dict(
        settings=settings,
        messages=session.pop('messages', []),
        github_user=session.get('github_user_data', None),
        json=json,
        len=len,
        full_url_for=lambda *args, **kw: settings.absurl(
            url_for(*args, **kw)
        ),
        ssl_full_url_for=lambda *args, **kw: settings.sslabsurl(
            url_for(*args, **kw)
        ),
        static_url=lambda path: "{0}/{1}?{2}".format(
            settings.STATIC_BASE_URL.rstrip('/'),
            path.lstrip('/'),
            time.time()
        ),
    )


@module.route('/')
def index():
    return render_template('index.html')


@module.route('/email/single', methods=['GET'])
def send_single_email():
    return render_template('send.html')


@module.route('/email/single', methods=['GET'])
def send_bulk_email():
    return render_template('email=.html')


@module.route('/assets', methods=['GET'])
def asset_deployment():
    return render_template('email=.html')
