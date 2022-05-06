## 08 / Summary

After developers benchmark their MySQL Flexible Server workloads, they can tune server parameters, scale compute tiers, and optimize their application containers to improve performance. Through Azure Monitor and KQL queries, teams monitor the performance of their workloads.

Caching is a very common way to increase the performance of applications. Through disk or memory-based cache, a developer and architect should always be on the lookout for deterministic areas that can be cached. Azure CDN provides caching via POP servers to users of global-scale web apps.

Lastly, an important balance should be struck between performance of the cache and costs.

### Checklist

- Monitor for slow queries.
- Periodically review the Performance Insight dashboard.
- Utilize monitoring to drive tier upgrades and scale decisions.
- Consider moving regions if the users' or application's needs change.
- Adjust server parameters for the running workload.
- Utilize caching techniques to increase performance.
- Get data closer to users by implementing content delivery networks.
