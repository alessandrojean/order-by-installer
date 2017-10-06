<p align="center">
<img src="https://i.imgur.com/oSlvwO6.png"><br/>
<img src="https://img.shields.io/badge/presented-2015.11.25-green.svg"> <img src="https://img.shields.io/badge/grade-MB-blue.svg"> <img src="https://img.shields.io/badge/part-installer-orange.svg">
</p>

Term paper for the Information Systems Technician course, finished and presented in November, 2015.

The project consists in an administration software for a school, with the management done by a [software](https://github.com/alessandrojean/order-by-desktop), an [website](https://github.com/alessandrojean/order-by-web) and an [application](https://github.com/alessandrojean/order-by-android).

## Features
- Install automatically VertrigoServ;
- Import the database into your MySQL setup.

## Contents
- The NSIS installer project.

## Instructions

Compile the `installer.nsi` file with NSIS, and run.

You'll need to download a copy of the VertrigoServ installer and put it in the same folder you downloaded this repository.

You'll need also compile two `jar` from the [software](https://github.com/alessandrojean/order-by-desktop): one with your currently database login scheme, and another with the same database scheme, but with the password empty.

## License

    Copyright 2017 Order By

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
