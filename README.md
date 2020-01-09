# Sonar Scanner Drone Plugin

### Requirements:
  * sonar-scanner.properties. This file have to be on your project root directory, use this file to add specific (coverage path, files) information for your project. Ex: 
  ```
  sonar.javascript.lcov.reportPaths=coverage/lcov.info
  sonar.coverage.exclusions=test/**/*.test.js,src/api.js,src/index.js
  ```

### Docker Usage:
In the root project run the follow command
```bash
$ docker run -it -rm -e SONAR_HOST=<sonar-url> \ 
-e SONAR_HOST=<> \ 
-e SONAR_TOKEN=<sonar-token> \ 
-e PLUGIN_PROJECT_KEY=<project-key> \ 
-e PLUGIN_SOURCES_DIR=<src-path> \ 
-e DRONE_BUILD_NUMBER=<any-number> \
-v $(pwd):/home \
 <container-name>
```

### Maintainer
  * Miguel Herrera <miguel.herrera0@walmart.com>
 