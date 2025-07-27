# ClinicalQMS - Open Source Clinical Quality Management System

[![MIT License](https://img.shields.io/badge/License-MIT-green.svg)](https://choosealicense.com/licenses/mit/)
[![Ruby](https://img.shields.io/badge/Ruby-3.4.5-red.svg)](https://www.ruby-lang.org/en/)
[![Rails](https://img.shields.io/badge/Rails-8.0.2-red.svg)](https://rubyonrails.org/)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-14+-blue.svg)](https://www.postgresql.org/)

An open-source Ruby on Rails-based quality management system designed for clinical research operations, featuring comprehensive staff performance tracking through an EDC-style query management system.

## 🚀 Vision

Create a community-driven, compliance-ready quality management system that enables clinical research organizations worldwide to efficiently track operations while providing detailed insights into staff performance and data quality metrics.

## ✨ Key Features

### 🔍 Query Management System
- **Polymorphic Query Association**: Attach queries to any entity (Patient, Visit, Adverse Event, Study, Document)
- **Auto-generated Query Numbers**: EDC-style unique identifiers
- **Intelligent Assignment**: Automatic routing based on entity ownership and user roles
- **Complete Lifecycle Management**: Open → Answered → Closed → Cancelled workflow
- **Escalation Engine**: Automatic escalation for overdue queries

### 🏥 Clinical Research Data Management
- Study/Protocol management with version control
- De-identified patient records with HIPAA compliance
- Visit tracking and completion status
- Adverse event reporting and documentation
- Protocol deviation management with CAPA
- Document management with version control

### 📊 Staff Performance Analytics
- Response time analytics and quality scores
- Volume analysis with workload balancing
- Trend analysis and performance benchmarking
- Query density analysis by staff member

### 🔐 Enterprise Security & Compliance
- Multi-provider SSO authentication framework
- 21 CFR Part 11 compliance ready
- HIPAA compliance features
- Complete audit trail with Paper Trail
- Role-based access control

### 🔌 Integration Framework
- **Multi-CTMS Support**: Clinical Conductor, OnCore, Oracle Clinical, Epic MyChart Research
- **eSource Platform Integration**: Medidata Rave, Veeva Vault EDC, OpenClinica, Castor EDC
- **eRegulatory Systems**: Veeva Vault RIM, MasterControl, DocumentTracker
- **SSO Providers**: Microsoft, Okta, Auth0, Google, AWS SSO, SAML/LDAP

## 🛠 Technology Stack

- **Framework**: Ruby on Rails 8.0.2
- **Database**: PostgreSQL 14+
- **Authentication**: Multi-provider SSO (Microsoft, Okta, Auth0, Google, SAML)
- **Authorization**: Pundit for role-based permissions
- **Audit Trail**: Paper Trail for complete change tracking
- **API**: GraphQL and REST with OpenAPI documentation
- **Background Jobs**: Sidekiq
- **Deployment**: Docker with Kubernetes support

## 📋 Prerequisites

- Ruby 3.4.5+
- PostgreSQL 14+
- Node.js (for asset compilation)
- Redis (for background jobs)

## 🚀 Quick Start

### 1. Clone the Repository
```bash
git clone https://github.com/roseparkresearch/clinical-qms.git
cd clinical-qms
```

### 2. Install Dependencies
```bash
# Install Ruby gems
bundle install

# Install system dependencies (macOS)
brew install postgresql redis
```

### 3. Database Setup
```bash
# Start PostgreSQL
brew services start postgresql@14

# Create and migrate database
rails db:create
rails db:migrate
```

### 4. Start the Application
```bash
# Start Rails server
rails server

# In another terminal, start background jobs
bundle exec sidekiq
```

### 5. Access the Application
Visit `http://localhost:3000` in your browser.

## 🏗 Core Models

### Query System
- **Query**: Polymorphic model attachable to any entity
- **Study**: Protocol and study management
- **Patient**: De-identified patient records
- **Visit**: Visit tracking and scheduling
- **User**: Authentication and role management

### Clinical Data
- **AdverseEvent**: AE reporting with severity and causality
- **Deviation**: Protocol deviation tracking with CAPA
- **Document**: Version-controlled document management

## 🔌 Integration Architecture

The system supports multiple integration patterns:

- **Enterprise Service Bus**: Message-driven architecture with Kafka
- **API Gateway**: Centralized integration hub with protocol translation
- **Multi-Protocol Support**: REST, GraphQL, SOAP, HL7 FHIR
- **Plugin Registry**: Dynamic plugin loading for custom integrations

## 🧪 Testing

```bash
# Run the test suite
rails test

# Run RuboCop for code quality
bundle exec rubocop

# Run security analysis
bundle exec brakeman
```

## 📊 User Roles

- **QA Manager**: Full system access, query creation/closure, performance reporting
- **Clinical Research Coordinator**: Data entry, query responses, personal performance view
- **Principal Investigator**: Study oversight, critical query review, team performance monitoring
- **Data Manager**: Data validation, query pattern analysis, system administration
- **Admin**: System administration and configuration

## 🐳 Docker Deployment

```bash
# Build the Docker image
docker build -t clinical-qms .

# Run with docker-compose
docker-compose up -d
```

## 🤝 Contributing

We welcome contributions from the clinical research community! Please see our [Contributing Guidelines](CONTRIBUTING.md) for details.

### Development Process
1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Code Standards
- Follow Ruby and Rails best practices
- Maintain 90%+ test coverage
- Use RuboCop for code style consistency
- Include comprehensive documentation

## 📖 Documentation

- [Installation Guide](docs/installation.md)
- [API Documentation](docs/api.md)
- [Integration Guide](docs/integrations.md)
- [User Manual](docs/user-guide.md)
- [Developer Guide](docs/development.md)

## 🔒 Security

For security concerns, please email security@roseparkresearch.com instead of using the issue tracker.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Rose Park Research, Inc. for open-sourcing this solution
- The clinical research community for feedback and contributions
- All contributors who help make clinical research more efficient

## 📞 Support

- **Community Support**: GitHub Issues and Discussions
- **Commercial Support**: Available for enterprise deployments
- **Documentation**: Comprehensive guides and API documentation

---

**Built with ❤️ for the global clinical research community**
