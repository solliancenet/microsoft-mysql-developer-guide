## 07 / Summary

As just discussed, testing your applications after they have been deployed to an existing or a new environment is yet another vital step in the development cycle.

By using containers, developers can be assured that the code will run in the same environment from which is was designed, however when multiple containers are involved or are moved from one environment to another (such as AKS to Azure Service Fabric or some other container cloud provider), it can't be assured that all the same resources will be available or that the management plane has been configured properly to support them.  Following the approaches defined in this section will help developers understand the tools available and what they should be looking for when designing microservices.

### Checklist

- Perform functional testing on applications and databases.
- Perform performance testing on applications and databases.
- Utilize industry standard tools and benchmarks to ensure accurate and comparable results.
- Integrate reporting tools such as Azure Monitor, Grafana or Promethus into your testing suites.
