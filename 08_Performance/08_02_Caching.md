## Caching

Utilizing resources such as CPU, memory, disk (read/write access) and network can factor into how long an application request takes to process.  Being able to remove actions that are deterministic (ex: the same function/API call does not change), within a certain set of time is an important pattern to implement in your various application layers.  Ultimately, it is time that you are trying to save.  Either for the application itself, or the users using the application.  

Caching is the process of preventing things that don't need to happen more than once or can be more efficiently delivered to a user via some kind of time savings.

### Disk cache

When memory is not readily available or some items are just too big to stream over a network connection due to latency issues, you may consider copying data to disk.  It is important to test whether a repeated operation takes more time to access from disk than it does to do the operation.  If in fact the disk is fast enough to offset the time to execute something, then it is a great candidate for disk caching.

This is a common pattern for when applications have users scatters all over the world.  You can distribute the same disk files to locations that are closest to those users and improve latency and the perceived application performance in doing so.

### Memory cache

Storing data in memory provided from my faster access than if you must retrieve it from disk locally or over a network.  This also included data that is on disk and has development or API layers that add to the access times.

#### Local memory

If an application has access to local memory, you can utilize a localize pattern to cache data and access it more quickly than going to disk or over the network.  However, if the memory available to the application is less than ideal, you will need to find another place to store your data if you want to utilzie the quickness of memory storage.

#### Redis Cache

A common piece of software that helps with caching is called Redis cache.  As with all pieces of software, it can be run on-premises, in a virtual machine in the cloud (Iaas), or even as a platform as a service offering (PaaS).

Redis cache works by putting data into memory via key/value pairs.  The application will typically serialize the data and then hand it off to Redis for quick retrieval later.  The Redis cache should be close to the application so that it can be queries quickly and the data retrievedand then forwarded just as quickly.

TODO
