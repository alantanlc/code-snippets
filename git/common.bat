@echo off
echo.

rem set branch=release/23.06
rem set version=23.06.1

rem set branch=release/23.07
rem set version=23.07.1

rem set branch=release/23.08
rem set version=23.08.1

set branch=release/23.09
set version=23.09.1

rem set branch=release/java17_23.01.99
rem set version=23.7.OPTION2

rem set branch=release/java17_23.08.99
rem set version=23.8.OPTION2

rem set branch=release/java17_23.09.99
rem set version=23.9.OPTION2

rem set branch=release/java17_23.10.99
rem set version=23.10.OPTION2

rem set branch=feature/java17_23.01.99_internal_id
rem set version=23.INTERNALID

set install=mvn clean install -DprojectVersion=%version% -DdependencyVersion=%version%-SNAPSHOT -DcommonVersion=%version%-SNAPSHOT -DdbDataModelVersion=%version%-SNAPSHOT -DdatagridDataModelVersion=%version%-SNAPSHOT -DskipTests=true -f pom.xml

echo branch: %branch%
echo version: %version%
echo build cmd: %install%
echo.	

echo repo: I:\ds\projects\gxp\gxp-common
cd I:\ds\projects\gxp\gxp-common
git add .
git stash -- *
git checkout %branch%
git checkout --track
git pull
call %install%
echo.

echo repo: I:\ds\projects\gxp\gxp-db-data-model
cd I:\ds\projects\gxp\gxp-db-data-model
git add .
git stash -- *
git checkout %branch%
git checkout --track origin/%branch%
git pull
call %install%
echo.

echo repo: I:\ds\projects\gxp\gxp-datagrid-data-model
cd I:\ds\projects\gxp\gxp-datagrid-data-model
git add .
git stash -- *
git checkout %branch%
git checkout --track origin/%branch%
git pull
call %install%
echo.

set mavenPath=I:\ds\.m2_repo\com\jpmorgan\gxp\
ls -lrt %mavenPath%gxp-common\%version%-SNAPSHOT\gxp-common-%version%-SNAPSHOT.jar
ls -lrt %mavenPath%gxp-db-data-model\%version%-SNAPSHOT\gxp-db-data-model-%version%-SNAPSHOT.jar
ls -lrt %mavenPath%gxp-datagrid-data-model\%version%-SNAPSHOT\gxp-datagrid-data-model-%version%-SNAPSHOT.jar

cd I:\ds\projects\gxp
