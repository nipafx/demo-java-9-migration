@echo off
echo "--- COMPILATION & PACKAGING ---"

echo " > creating clean directories"
del /s /q build
rmdir /s /q build
mkdir build
mkdir build\classes
mkdir build\jars
mkdir build\class-path
mkdir build\module-path

copy deps\*.* build\class-path


echo " > creating monitor.utils"
dir /S /B monitor.utils\src\main\java\*.java > sources.txt
set JARS=
for %%f in (build\class-path\*.jar) do call set JARS=%%JARS%%;"%%f"
javac --class-path %JARS% --module-path build/module-path -d build/classes/monitor.utils @sources.txt
del sources.txt
jar --create --file build/jars/monitor.utils.jar -C build/classes/monitor.utils .
copy build\jars\monitor.utils.jar build\class-path


echo " > creating monitor.observer"
dir /S /B monitor.observer\src\main\java\*.java > sources.txt
set JARS=
for %%f in (build\class-path\*.jar) do call set JARS=%%JARS%%;"%%f"
javac --class-path %JARS% --module-path build/module-path -d build/classes/monitor.observer @sources.txt
del sources.txt
jar --create --file build/jars/monitor.observer.jar -C build/classes/monitor.observer .
copy build\jars\monitor.observer.jar build\class-path


echo " > creating monitor.observer.alpha"
dir /S /B monitor.observer.alpha\src\main\java\*.java > sources.txt
set JARS=
for %%f in (build\class-path\*.jar) do call set JARS=%%JARS%%;"%%f"
javac --class-path %JARS% --module-path build/module-path -d build/classes/monitor.observer.alpha @sources.txt
del sources.txt
jar --create --file build/jars/monitor.observer.alpha.jar -C build/classes/monitor.observer.alpha .
copy build\jars\monitor.observer.alpha.jar build\class-path


echo " > creating monitor.observer.beta"
dir /S /B monitor.observer.beta\src\main\java\*.java > sources.txt
set JARS=
for %%f in (build\class-path\*.jar) do call set JARS=%%JARS%%;"%%f"
javac --class-path %JARS% --module-path build/module-path -d build/classes/monitor.observer.beta @sources.txt
del sources.txt
jar --create --file build/jars/monitor.observer.beta.jar -C build/classes/monitor.observer.beta .
copy build\jars\monitor.observer.beta.jar build\class-path


echo " > creating monitor.statistics"
dir /S /B monitor.statistics\src\main\java\*.java > sources.txt
set JARS=
for %%f in (build\class-path\*.jar) do call set JARS=%%JARS%%;"%%f"
javac --class-path %JARS% --module-path build/module-path -d build/classes/monitor.statistics @sources.txt
del sources.txt
jar --create --file build/jars/monitor.statistics.jar -C build/classes/monitor.statistics .
copy build\jars\monitor.statistics.jar build\class-path


echo " > creating monitor.persistence"
dir /S /B monitor.persistence\src\main\java\*.java > sources.txt
set JARS=
for %%f in (build\class-path\*.jar) do call set JARS=%%JARS%%;"%%f"
javac --class-path %JARS% --module-path build/module-path -d build/classes/monitor.persistence @sources.txt
del sources.txt
jar --create --file build/jars/monitor.persistence.jar -C build/classes/monitor.persistence .
copy build\jars\monitor.persistence.jar build\class-path


echo " > creating monitor.rest"
dir /S /B monitor.rest\src\main\java\*.java > sources.txt
set JARS=
for %%f in (build\class-path\*.jar) do call set JARS=%%JARS%%;"%%f"
javac --class-path %JARS% --module-path build/module-path --add-modules java.xml.bind,java.xml.ws.annotation --patch-module java.xml.ws.annotation=build/class-path/jsr305-3.0.2.jar -d build/classes/monitor.rest @sources.txt
del sources.txt
jar --create --file build/jars/monitor.rest.jar -C build/classes/monitor.rest .
copy build\jars\monitor.rest.jar build\class-path


echo " > creating monitor"
dir /S /B monitor\src\main\java\*.java > sources.txt
set JARS=
for %%f in (build\class-path\*.jar) do call set JARS=%%JARS%%;"%%f"
javac --class-path %JARS% --module-path build/module-path -d build/classes/monitor @sources.txt
del sources.txt
jar --create --file build/jars/monitor.jar -C build/classes/monitor .
copy build\jars\monitor.jar build\class-path

set JARS=
