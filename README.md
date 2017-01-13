# LogParser

Parses a log file to display the most visited pages.

## Installation

Clone this repo and execute:

    $ bundle

## Usage

Execute:

    $ bin/parser webserver.log

Outputs:

    Most page views
    /about/2 90 visits
    /contact 89 visits
    /index 82 visits
    /about 81 visits
    /help_page/1 80 visits
    /home 78 visits

    Most unique page views
    /index 23 visits
    /home 23 visits
    /contact 23 visits
    /help_page/1 23 visits
    /about/2 22 visits
    /about 21 visits
