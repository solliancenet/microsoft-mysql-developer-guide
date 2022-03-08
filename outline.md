Outline (Combined)

Introduction

	Target Audience (L200-L300) (Marko: L200-L300 refer to technical level, I think we still need to define the type of audience we are targeting)
	
		Azure MySQL application development topics.
		
		Architectural examples and samples.
	
	What the guide is, what the guide isn't.
	
		Learn to build, test and deploy Azure MySQL projects.
		
		Integrate MySQL with other Azure Services.

Introduction to Azure Database for MySQL

	What is MySQL?
	
	MySQL Hosting Options
	
		Iaas/PaaS
	
	Why Azure?
	
	Azure Database for MySQL (Features and Concepts)
	
		Pricing Tiers
		
		Unsupported features

Getting Started

	Environment setup
	
		Azure
		
			Subscriptions
			
			Authentication (control vs data plane)
			
			Creating Landing zones
	
		Windows
		
			Visual Studio
			Visual Studio Code
				MySQL extension
			IntelliJ
			Eclipse
		
		Linux
		
			TBD
		
		MacOS
		
			Visual Studio Code
			
	SDKs
	
		Language Support
		
			NodeJS
			
			Java
			
			Windows/.NET Core, Framework
	
	Get started with Azure Free Account
	
		Create Azure free account
		
		Guide to deploy Az DB for MySQL with Azure free account
	
	Create Database
		
		Azure Portal
		
		Azure CLI
		
		ARM Template

	Connect & query databases
		
		MySQL Workbench
		
		Azure CLI

		PHP

		Python
		
		Java

		.NET

		Connect to server in VNET
		
		Connect using TLS/SSL
	
	DB server Configuration
		
		Network
		
		Security
		
		Business Continuity

	DB Server Monitoring and tuning



End to end development

	Type of MySQL applications
	
		Web App
		
		Function App
		
		Microservices
		
		Batch
		
	Guide to choose the right service to host the application
	
		On Prem / Cloud - Azure, non-Azure
		
		Azure Cloud - App Services / Containers / AKS / 3rd party on Azure
	
	Integrating with other Azure Services
	
		Azure VMs
		
		Azure App Service
		
		Containerized Apps (ACI, ACR, App Svc)
		
		Azure Kubernetes Service 

		3rd party services: CMS like Wordpress, LMS like Moodle, e-commerce like Magento, 

	Versioning
	
		GitHub
		
		AzureDev Ops
		
		Code vs Database
	
	CI/CD
	
		Deployment Tools
		
			ARM
			
			Powershell
			
			CLI
			
			Azure DevOps
			
			GitHub
			
			Terraform
			
		Deployment targets
		
			Azure VM
			
			Azure App Svc / Slots
			
			MicroServices - ACI / ACR / AKS
			
			Choosing the right target.
		
		Configurations / Key Vault 
	

Monitoring

	Azure Monitor / Log Analytics
	
	App Insights
	
	Debugging
	
Securing

	Managed Service Identities
	
	Virtual Networks
	
	Private Endpoints
	
	Azure Firewall
	
	Application Gateway
	
	Security Baselines
	
	Azure Defender
	
	Azure Sentinel / Log Analytics

Testing

	JMeter
	
Performance

	Load Balancers
	
	Caching (app level + database level)
	
	Connection Pooling
	
	Read-replication
	
	Scaling

Troubleshooting 
	
	Connection Errors
	

Best Practices

	Networking

Architecting with Azure Database for MySQL

	Industry focused (gaming, ecommerce)
	
	Multi-node / instances
	
	Geo-routing (Azure Front Door)
	
Case Studies

	Reference customers and applications
	
	
Resources

	All links / accounts
