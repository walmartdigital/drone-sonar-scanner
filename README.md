# Sonar Scanner Drone Plugin by Walmart

### Requirements:

- sonar-project.properties. This file have to be on your project root directory, use this file to add specific (coverage path, files) information for your project. Ex:

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
-e PLUGIN_SOURCES_DIRECTORY=<src-path> \
-e DRONE_BUILD_NUMBER=<any-number> \
-v $(pwd):/home \
 <container-name>
```

### Drone Usage:

Copy this code block to drone and replace on `<>`

```yaml
code_analysis:
  image: walmartdigital.azurecr.io/sonar-scanner-drone-plugin:latest
  project_key: walmart/<product-name>
  sources_directory: <sources-path>
  secrets: [sonar_host, sonar_token]
```

### Maintainer:

- Miguel Herrera <miguel.herrera0@walmart.com>
