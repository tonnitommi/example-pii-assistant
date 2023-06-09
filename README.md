#  Example: Anonymize PII data using Microsoft Presidio

This example starts a simple Robocorp Assistant with only one text input. Write anything in,
and in the next view the PII data has been replaced with placeholders.

If your input is for example

`I am Draco Malfoy and my phone number is +358 666 1234 and email is draco@hogwarts.edu.`

it will become

`I am <PERSON> and my phone number is <PHONE_NUMBER> and email is <EMAIL_ADDRESS>.`

This is how it looks in real life:

[![Screencast of PII anonymization](http://img.youtube.com/vi/yrmXPqtvlDw/0.jpg)](http://www.youtube.com/watch?v=yrmXPqtvlDw "Robocorp Portal: PII anonymizer Assistant Example")

The example uses a very basic configuration of [Microsoft Presidio](https://microsoft.github.io/presidio/)
and only works in English as of now. The expansion possibilities are endless, including writing
custom recognizers.

Note that the first time Assistant runs, it will need to download the spaCy language pack,
which will take some time.
