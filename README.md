# Project Name: Oracle-web-app-HA

## Overview

This project is related to a web application based on Flask. 
Flask is a popular Python framework for developing web applications quickly and easily.

The whole architecture is a Flask application that interacts with an Oracle Autonomous Database as backend. 

The application is containerized using Docker, and deployed to Oracle Cloud Infrastructure.

The application is presented in different architectures representing the different HA architectures we can deploy on Oracle Cloud Infrastructure. More in details, they are:
-   HA within a single availability domain (exploiting different fault domains). For further details, please look [Oracle-web-app-HA-single-ad](oracle-web-app-ha-single-ad/README.md)
-   HA within a single region (exploiting different availability domains). For further details, please look [Oracle-web-app-HA-multi-ad](oracle-web-app-ha-multi-ad/README.md)
-   HA exploiting multiple regions. For further details, please look [Oracle-web-app-HA-multi-regions](oracle-web-app-ha-multi-regions/README.md)

