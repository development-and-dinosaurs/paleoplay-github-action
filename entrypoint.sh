#!/bin/bash

echo "Running Paleoplay for ${INPUT_USER}"
paleoplay post --user ${INPUT_USER} --tinify-api-key ${INPUT_TINIFY_API_KEY}
