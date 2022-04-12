## Caching

Utilizing resources such as CPU, memory, disk (read/write access) and network can factor into how long an application request takes to process.  Being able to remove actions that are deterministic (ex: the same function/API call does not change), within a certain set of time is an important pattern to implement in your various application layers.  Ultimately, caching saves time, either for the application itself, or for the users using the application.

Caching is the process of preventing things that don't need to happen more than once or can be more efficiently delivered to a user via some kind of time savings.

### Disk cache

When memory is not readily available or some items are just too big to stream over a network connection due to latency issues, it may be appropriate to consider copying data to disk.  It is important to test whether a repeated operation takes more time to access from disk than it does to do the operation.

This is a common pattern for when applications have users scattered all over the world.  By distributing the same files and content to locations that are closest to those users, the users will see improved latency and perceived application performance.

### Memory cache

Storing data in memory provides much faster access than if it is retrieved from disk locally or over a high-latency network.

#### Local memory

If an application has access to local memory, it can utilize that local memory to cache its data and access it more quickly than going to disk or over the network.  However, if the memory available to the application is less than ideal (potentially driven by operating system or hardware limits), it will be necessary to find another place to store the data. If the application needs the speed of memory access rates, it will be necessary to send the data to a memory server.

#### Redis Cache

A common piece of software that helps with caching is called [Redis cache](https://redis.io/).  As with all pieces of software, it can be run on-premises, in a virtual machine in the cloud (IaaS), or even as a platform-as-a-service offering (PaaS).

Redis cache works by putting data into memory via key/value pairs.  The application will typically serialize the data and then hand it off to Redis for quick retrieval later.  The Redis cache should be close to the application so that it can be queried, retrieved, and forwarded quickly.

[Azure Cache for Redis](https://docs.microsoft.com/en-us/azure/azure-cache-for-redis/cache-overview) is a platform as a service Microsoft Azure hosted Redis environment that provides several levels of service such as [Enterprise, Premium, Standard, and Basic tiers](https://azure.microsoft.com/en-us/pricing/details/cache/).
