FILE=sqlite-jdbc.jar
if [ -f "$FILE" ]; then
    echo "$FILE exists."
else
    echo "$FILE does not exist."
    curl -L -H "Accept: application/zip" https://github.com/xerial/sqlite-jdbc/releases/download/3.36.0.3/sqlite-jdbc-3.36.0.3.jar -o sqlite-jdbc.jar
fi