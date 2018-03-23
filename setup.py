from setuptools import setup, find_packages

setup(
    name='PipelineTester',
    packages=find_packages(exclude=['docs', 'tests*']),
    include_package_data=True,
    install_requires=[
        'flask',
    ],
    setup_requires=[
        'pytest-runner',
    ],
    tests_require=[
        'pytest',
    ],
)
