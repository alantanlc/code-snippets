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

rem set branch=release/GRP_develop_java17
rem set version=23.7.OPTION2

rem set branch=release/GRP_develop_java17_23.08.99
rem set version=23.8.OPTION2

rem set branch=release/GRP_develop_java17_23.09.99
rem set version=23.9.OPTION2

rem set branch=release/GRP_develop_java17_23.10.99
rem set version=23.10.OPTION2

rem set branch=feature/GRP_develop_java17_opt2_internal_id
rem set version=23.INTERNALID

set install=mvn clean install -DprojectVersion=%version% -DdependencyVersion=%version%-SNAPSHOT -DcommonVersion=%version%-SNAPSHOT -DdbDataModelVersion=%version%-SNAPSHOT -DdatagridDataModelVersion=%version%-SNAPSHOT -DskipTests=true -f pom.xml

echo branch: %branch%
echo version: %version%
echo build cmd: %install%
echo.	

echo repo: I:\ds\projects\gxp\gxp-registry-service
cd I:\ds\projects\gxp\gxp-registry-service
git add .
git stash -- *
git checkout %branch%
git checkout --track origin/%branch%
git pull
call %install%
echo.

echo repo: I:\ds\projects\gxp\gxp-config-service
cd I:\ds\projects\gxp\gxp-config-service
git add .
git stash -- *
git checkout %branch%
git checkout --track origin/%branch%
git pull
call %install%
echo.

echo repo: I:\ds\projects\gxp\gxp-utils
cd I:\ds\projects\gxp\gxp-utils
git add .
git stash -- *
git checkout %branch%
git checkout --track origin/%branch%
git pull
echo.

echo repo: I:\ds\projects\gxp\gxp-datagrid-server
cd I:\ds\projects\gxp\gxp-datagrid-server
git add .
git stash -- *
git checkout %branch%
git checkout --track origin/%branch%
git pull
echo.

echo repo: I:\ds\projects\gxp\gxp-payment-service
cd I:\ds\projects\gxp\gxp-payment-service
git add .
git stash -- *
git checkout %branch%
git checkout --track origin/%branch%
git pull
echo.

echo repo: I:\ds\projects\gxp\gxp-clearing-service
cd I:\ds\projects\gxp\gxp-payment-service
git add .
git stash -- *
git checkout %branch%
git checkout --track origin/%branch%
git pull
echo.

echo repo: I:\ds\projects\gxp\gxp-refdata-loader-service
cd I:\ds\projects\gxp\gxp-refdata-loader-service
git add .
git stash -- *
git checkout %branch%
git checkout --track origin/%branch%
git pull
echo.

echo repo: I:\ds\projects\gxp\gxp-regression-suite
cd I:\ds\projects\gxp\gxp-regression-suite
git add .
git stash -- *
git checkout %branch%
git checkout --track origin/%branch%
git pull
echo.

cd I:\ds\projects\gxp
