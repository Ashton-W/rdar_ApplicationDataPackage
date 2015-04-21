#!/bin/bash

echo ""
echo "> Run these tests with a fresh simulator. 'Reset content and settings' in the simulator window that opens afterwards."
echo "> Press any key to continue"
read confirmation

xcodebuild -project ApplicationPackage.xcodeproj -scheme 'ApplicationPackage' -sdk iphonesimulator test

echo "> Scheme 'ApplicationPackage' should have failed tests."

xcodebuild -project ApplicationPackage.xcodeproj -scheme 'With Container' -sdk iphonesimulator test

echo "> Scheme 'With Container' should have passed tests."

echo ""
echo "> You can run the app and add data, then tests will pass."
