from setuptools import setup, find_packages
import os

version = '0.1'

setup(
    name='ploneintranet.pagerank',
    version=version,
    description="Personalized pagerank for Plone intranet",
    long_description=open("README.txt").read() + "\n" +
    open(os.path.join("docs", "HISTORY.txt")).read(),
    # Get more strings from
    # http://pypi.python.org/pypi?:action=list_classifiers
    classifiers=[
        "Framework :: Plone",
        "Programming Language :: Python",
    ],
    keywords='',
    author='Guido A.J. Stevens',
    author_email='guido.stevens@cosent.net',
    url='https://github.com/ploneintranet/ploneintranet.pagerank',
    license='GPL',
    packages=find_packages(exclude=['ez_setup']),
    namespace_packages=['ploneintranet'],
    include_package_data=True,
    zip_safe=False,
    install_requires=[
        'setuptools',
        'plonesocial.suite'
        # -*- Extra requirements: -*-
    ],
    extras_require={
        'test': [
            'plone.app.testing',
        ]
    },
    entry_points="""
    # -*- Entry points: -*-
    
    [z3c.autoinclude.plugin]
    target = plone
    """,
)
