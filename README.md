S3-Outlet
------------

Component that stores results from the Opener Web Services chain into a SQLite 
Database and shows them into your browser.

### Confused by some terminology?

This software is part of a larger collection of natural language processing tools known as "the OpeNER project". You can find more information about the project at [the OpeNER portal](http://opener-project.github.io). There you can also find references to terms like KAF (an XML standard to represent linguistic annotations in texts), component, cores, scenario's and pipelines.

Quick Use Example
-----------------

Installing the s3-outlet can be done by executing:

    gem install opener-s3-outlet

Please bare in mind that all components in OpeNER take KAF as an input and output KAF by default.

### Webservices

You can launch a webservice by executing:

    s3-outlet-server

This will launch a mini webserver with the webservice. It defaults to port 9292, so you can access it at <http://localhost:9292>.

To launch it on a different port provide the `-p [port-number]` option like this:

    s3-outlet-server -p 1234

It then launches at <http://localhost:1234>

Documentation on the Webservice is provided by surfing to the urls provided above. For more information on how to launch a webservice run the command with the ```-h``` option.


### Daemon

Last but not least the s3-outlet comes shipped with a daemon that can read jobs (and write) jobs to and from Amazon SQS queues. For more information type:

    s3-outlet-daemon -h


Description of dependencies
---------------------------

This component runs best if you run it in an environment suited for OpeNER components. You can find an installation guide and helper tools in the [OpeNER installer](https://github.com/opener-project/opener-installer) and an
[installation guide on the Opener Website](http://opener-project.github.io/getting-started/how-to/local-installation.html)

At least you need the following system setup:

### Depenencies for normal use:

* JRuby 1.7.9 or newer
* Ruby 1.9.3 or newer

The Core
--------

The component is a fat wrapper around the actual language technology core. You can find the core technologies in the following repositories:

* (link to) Related Core readmes

Where to go from here
---------------------

* [Check the project websitere](http://opener-project.github.io)
* [Checkout the webservice](http://opener.olery.com/s3-outlet)

Report problem/Get help
-----------------------

If you encounter problems, please email support@opener-project.eu or leave an issue in the 
[issue tracker](https://github.com/opener-project/s3-outlet/issues).


Contributing
------------

1. Fork it <http://github.com/opener-project/s3-outlet/fork>
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
