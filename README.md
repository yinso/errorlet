# Errorlet - a simple customer error library

A simple custom error library for you to use more than just an error message string, because a string sometimes just isn't enough.

# Install

    npm install errorlet
    
# Usage

    var errorlet = require('errorlet');
    
    // make a custom error and throw it.
    throw errorlet.create({error: 'http_error:not_found', message: 'this is the custom error message', httpCode: 404});


