@echo off
echo ""
echo "--- LAUNCH ---"

echo " > run monitor"
echo ""

set JARS=
for %%f in (build\class-path\*.jar) do call set JARS=%%JARS%%;"%%f"
java --class-path %JARS% --module-path build/module-path --add-modules java.xml.bind monitor.Main

set JARS=
