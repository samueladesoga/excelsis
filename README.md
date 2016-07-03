# Contentful Demo

Sample static site using Middleman and Contentful.

The site is live at [contentful-demo.netlify.com](http://contentful-demo.netlify.com/).

## Installation

Clone the repo:

    $ git clone https://github.com/dtcristo/contentful-demo.git
    $ cd contentful-demo

Copy the example environment configuration and fill it out:

    $ cp .env.example .env
    $ nano .env

Install dependencies:

    $ bundle install

Pull in Contentful data and start Middleman server:

    $ middleman contentful
    $ middleman server
