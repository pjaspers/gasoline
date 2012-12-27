# Gasoline makes Campfire better

I'm an avid [Campfire](http://campfirenow.com) user and [Propane](http://propaneapp.com) is still my go to app for talking to it. At least on OSX, on iOS I'm using <plug>[Butane](http://getbutane.com)</plug>.

Since Propane 1.1.2 they've added a way to add some javascript, to augment the experience even more. Like adding avatars:

![Fancy screenshot](http://f.cl.ly/items/1q3a3v163W2I0A1B3j1H/Screen%20Shot%202012-08-07%20at%2000.10.59.png)

The only downside to that approach was managing the file. So that's where Gasoline comes in. It's a gem that installs the command line utility `gasoline` which can download gists and append them to the patch file.

## Installation

`gem install gasoline`

## Usage

Some default drops are included and can be installed using:

`gasoline ignite`

Adding new functionality is done by running (for example):

`gasoline add "Githubber" "https://gist.github.com/3288393" "Add github repo descriptions to your Campfire rooms"`

After adding a gist (or multiple) make sure to ignite them: `gasoline ignite`

## More drops

- [Sounds](https://gist.github.com/686d56fcc7d7081232c6) Adds some extra sounds to Campfire

- [Avatars](https://gist.github.com/065d1dc1906c153e4edc) Adds avatars to friendly faces

- [Cloud App](https://gist.github.com/431f7c803ddb0d751a40) Adds support for Cloud.ly links

- [Flickr](https://gist.github.com/6dcf1366df5203157fda) Adds support for Flickr links

- [Build Colorizer](https://gist.github.com/4cf99c91eefc6d325d2c) Colors build output messages

- [Instagram](https://gist.github.com/3258692) Instagram support

- [HTML5Audio](https://gist.github.com/1288515) Adds html5 audio support

- [Githubber](https://gist.github.com/3288393) Add github repo descriptions to your Campfire rooms

- [Gists](https://gist.github.com/3288317) Inlines gists

- [speakerdeck](https://gist.github.com/4377786) Embeds SpeakerDeck slide inline.

## Contributing

Fork it! Improve it! Test it! Rewrite it! (technology)
[![Build Status](https://secure.travis-ci.org/pjaspers/gasoline.png?branch=master)](http://travis-ci.org/pjaspers/gasoline)