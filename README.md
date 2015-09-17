# Phrase
A IOS library help to localize string with key

# How to use:

## Localizable.strings:
"MY_NAME" = "My name is: {myName}";
"TITLE" = "Hello";

## ViewController.swift:
let title = Phrase.from("TITLE").description

let myName = Phrase.from("MY_NAME")
            .put("myName", value: "Njai")
            .fomat().description

