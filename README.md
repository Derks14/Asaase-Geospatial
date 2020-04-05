# Asaase Geospatial System

A geospatial system capable of processing spatial data.
In this project,
I created my own web mapping service using Open Geospatial Consortium ( OGC ) web standards.
A mobile app was futher developed for the visualisation of OGC web mapping services, Google Maps with real time GPS

## Getting Started

Set Up Spatial Database Server and Web Map Server

1. Download input spatial data to populate the database.

    a. Download shapefile containing worldmap or countries data
    eg. http://www.naturalearthdata.com/ , http://www.gadm.org/version2

2. Set up a spatial database server:
    Install PostrgreSQL http://www.postgresql.org (user manual)
    Install PostGIS http://postgis.net/documentation/ (user manual)

3. Set up  a web map server:
    Install GeoServer see http://docs.geoserver.org/ (user manual)

4. Create a PostgreSQL database with PostGIS extension

5. Load the shapefiles into the PostGIS database

6. Connect PostGIS to Geoserver
    Publish the tables in the PostGIS database as layers to GeoServer

7. Preview the published layer in GeoServer using OGC Web Map Service ( WMS )