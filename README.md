<h1 align="center"> flutter-04-xylophone</h1>

## Let's add CI / CD in this project

## What is GitHub Actions?

GitHub Actions is a continuous integration and continuous delivery (CI/CD) platform that allows you to automate your build, test, and deployment pipeline.  

## What is CI/CD?

CI/CD stands for Continuous Integration and Continuous Delivery. It is a set of practices that allow development teams to deliver software faster and more reliably. CI/CD involves automating the build, test, and deployment processes, so that code changes can be automatically integrated into the main branch and deployed to production. This helps to reduce the risk of errors and improve the quality of software.

## How to use GitHub Actions?

1. Create a workflow folder in the .github directory
2. make a file named main.yml and write the following code:

```yml
on:
  push:
    branches:
      - main
      - master
name: "Build & Release"
jobs:
  build:
    name: Build & Release
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3

      - uses: actions/setup-java@v3
        with:
          distribution: 'zulu'
          java-version: '12'
      - uses: subosito/flutter-action@v2
        with:
          channel: 'stable'
          architecture: x64

      - run: flutter build apk --release --split-per-abi
      - run: |
          flutter build ios --no-codesign
          cd build/ios/iphoneos
          mkdir Payload
          cd Payload
          ln -s ../Runner.app
          cd ..
          zip -r app.ipa Payload
      - name: Push to Releases
        uses: ncipollo/release-action@v1
        with:
          artifacts: "build/app/outputs/apk/release/*,build/ios/iphoneos/app.ipa"
          tag: v1.0.${{ github.run_number }}
          token: ${{ secrets.TOKEN }}

```