# LinkIn
## Ridiculously scaled social networking.

This is a project for Cloud and Data Management course at RIT. The idea is to place this application on Amazon Web Services and scale it so that it can handle a lot of requests. We'll be using techniques like sharding and master slave replication to horizontally scale the database. Then, to scale the application, all that is necessary is to create independent instances. Of course we're pre-optimizing for usage that will probably never exist, so don't take this as a serious implementation of social networking, but rather a test to see what is possible when scaling web applications.

This branch is just a plain old rails application with nothing special. Check out the master-slave and sharded branches for all the interesting scaling stuff.
