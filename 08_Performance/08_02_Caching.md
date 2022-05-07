## Caching

Utilizing resources such as CPU, memory, disk (read/write access) and network can factor into how long an application request takes to process.  Being able to remove deterministic actions (ex: the same function/API call does not change) within a certain set of time is an important pattern to implement in your various application layers. Caching reduces the latency and contention that is associated with handling large volumes of concurrent requests in the original data store.

Caching is a common technique that aims to improve the performance and scalability of a system. It does this by temporarily copying frequently accessed data to fast storage that's located close to the application.

![Read more icon](media/read-more.png "Read more")  [Caching guidance](https://docs.microsoft.com/azure/architecture/best-practices/caching)

### Disk cache

When memory is not readily available or some items are just too big to stream over a network connection due to latency issues, it may be appropriate to copy data to disk.  It is important to test whether a repeated operation takes more time to access from disk than it does to do the operation.

This caching option is a common pattern for when applications have users scattered all over the world.  By distributing the same files and content to locations that are closest to those users, the users will see improved latency and perceived application performance.

### Memory cache

Access to data in memory is much faster compared to retrieving data from disk. It is an effective means for storing modest amounts of static data, since the size of a cache is typically constrained by the amount of memory available on the machine hosting the process.

#### Local memory

If an application has access to local memory, it can utilize that memory to cache its data and access it more quickly than going to disk or over the network.  However, if the memory available to the application is less than ideal (potentially driven by operating system or hardware limits), another caching option must be chosen. If the application requires exceptionally low access rates, it will be necessary to send the data to a memory server.

#### Redis Cache

A common piece of software that helps with caching is called [Redis cache](https://redis.io/). As with all pieces of software, it can be run on-premises, in a virtual machine in the cloud (IaaS), or even as a platform-as-a-service offering (PaaS).

Redis cache works by putting data into memory via key/value pairs.  The application will typically serialize the data and then hand it off to Redis for quick retrieval later.  The Redis cache should be located close to the application. Query results should be retrieved and forwarded quickly.

[Azure Cache for Redis](https://docs.microsoft.com/azure/azure-cache-for-redis/cache-overview) is a platform as a service Microsoft Azure-hosted Redis environment that provides several levels of service such as [Enterprise, Premium, Standard, and Basic tiers](https://azure.microsoft.com/pricing/details/cache/).
