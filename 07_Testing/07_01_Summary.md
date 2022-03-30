## 07 / Summary

As just discussed, testing your applications after they have been deployed to an existing or a new environment is yet another vital step in the development cycle.

With containers, you can be assured that the code will run as it should, but when multiple containers are involved or you move from one environment to another (such as AKS to Azure Service Fabric or some other container cloud provider), you can't be assured that all the same resources will be available or that the management plane has been configured properly.  Following the approaches defined in this section will help you understand the tools available and what you should be looking for.

### Checklist

- Perform functional testing on applications and databases.
- Perform performance testing on applications and databases.
- Utilize industry standard tools and benchmarks to ensure accurate and comparable results.
- Integrate reporting tools such as Azure Monitor, Grafana or Promethus into your testing suites