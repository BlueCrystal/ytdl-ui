#!/usr/bin/env python
# -*- coding: utf8 -*-

from setuptools import setup

DESCRIPTION = 'webui for youtube-dl'
LONG_DESCRIPTION = 'Another webui for youtube-dl, powered by youtube-dl'

setup (
        name='ytdl_ui',
        version='0.2.3',
        packages=['ytdl_ui'],
        license='GPL-2.0',
        author='squizduos, d0u9, yuanyingfeiyu',
        author_email='squizduos@gmail.com',
        description=DESCRIPTION,
        long_description=LONG_DESCRIPTION,
        include_package_data=True,
        zip_safe=False,
        install_requires=[
            'Flask>=0.2',
            'youtube-dl',
        ],
        entry_points={
            'console_scripts': [
                'ytdl_ui = ytdl_ui:main'
            ]
        },
)
