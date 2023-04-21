#!/bin/bash

# Array of dependencies
dependencies=(
    "body-parser:~1.18"
    "colors:~1.1"
    "config:~1.28"
    "cookie-parser:~1.4"
    "cors:~2.8"
    "dottie:~2.0"
    "epilogue-js:~0.7"
    "errorhandler:~1.5"
    "express:~4.16"
    "express-jwt:0.1.3"
    "fs-extra:~4.0"
    "glob:~5.0"
    "grunt:~1.0"
    "grunt-angular-templates:~1.1"
    "grunt-contrib-clean:~1.1"
    "grunt-contrib-compress:~1.4"
    "grunt-contrib-concat:~1.0"
    "grunt-contrib-uglify:~3.2"
    "hashids:~1.1"
    "helmet:~3.9"
    "html-entities:~1.2"
    "jasmine:^2.8.0"
    "js-yaml:3.10"
    "jsonwebtoken:~8"
    "jssha:~2.3"
    "libxmljs:~0.18"
    "marsdb:~0.6"
    "morgan:~1.9"
    "multer:~1.3"
    "pdfkit:~0.8"
    "replace:~0.3"
    "request:~2"
    "sanitize-html:1.4.2"
    "sequelize:~4"
    "serve-favicon:~2.4"
    "serve-index:~1.9"
    "socket.io:~2.0"
    "sqlite3:~3.1.13"
    "z85:~0.0"
)

# Loop through the dependencies and submit each one using curl
for dependency in "${dependencies[@]}"; do
	echo -e "Sending: ${dependency}\n"
	curl -i -s -k -X $'POST' \
    -H $'Host: gcu-cce-js-2944cfaffdc744ad75b4838a8b0a63f0-1.chals.io' -H $'User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/112.0' -H $'Accept: application/json, text/plain, */*' -H $'Accept-Language: en-US,en;q=0.5' -H $'Accept-Encoding: gzip, deflate' -H $'Content-Type: application/json' -H $'Content-Length: 72' -H $'Origin: https://gcu-cce-js-2944cfaffdc744ad75b4838a8b0a63f0-1.chals.io' -H $'Referer: https://gcu-cce-js-2944cfaffdc744ad75b4838a8b0a63f0-1.chals.io/' -H $'Sec-Fetch-Dest: empty' -H $'Sec-Fetch-Mode: cors' -H $'Sec-Fetch-Site: same-origin' -H $'Te: trailers' -H $'Connection: close' \
    -b $'language=en; cookieconsent_status=dismiss; continueCode=aWonDka9bzPpj5LOJZg16R4Ayxt8TXiMYH340yxK2EeMNm7VvlBwr38QqXY7' \
    --data-binary $'{\"captchaId\":4,\"captcha\":\"2\",\"comment\":\"'${dependency}'\",\"rating\":3}' \
    $'https://gcu-cce-js-2944cfaffdc744ad75b4838a8b0a63f0-1.chals.io/api/Feedbacks/'

done
