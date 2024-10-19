#!/bin/bash

echo "Running Paleoplay for ${INPUT_USER} and API key ${INPUT_TINIFY_API_KEY}"
paleoplay --user ${INPUT_USER} --tinify-api-key ${INPUT_TINIFY_API_KEY}
