<div align="center">
  <img src="https://images.squarespace-cdn.com/content/v1/5f5908d1fc93772d79901335/1600194319074-2RVN3VAOO43MBNFOL9H9/Screen_Shot_2020-09-09_at_12.04.52_PM-removebg-preview.png?format=1500w">
</div>
<div align="center">
  <strong>NTELX provides analytical insights and risk management for global trade and international supply chains</strong>
  <br>
  <a href="https://www.ntelx.com/casestudies">View Case Studies »</a>
  <br>
  <br>
  <br>
</div>

# NXFolio
**NXFolio** is a platform that can serve as the basis for carrier and freight systems, community systems, order management systems, and other logistics and supply chain related solutions as might be imagined.  The foundation of the platform is a relational data model that manages data on orders, invoices, payments, shipments, shipment routing, rates, administrative and shipping events, entities and entity relationships, associated documentation, addresses and contact details, and various necessary reference data.  Riding atop this data model is a web-based application enabling the management of orders, payments, shipments, and entities.  NTELX successfully implement this platform in various solutions and makes this platform available to the community.<br>
<br>
### Capabilities of NXFolio
NXFolio is a software platform that captures and synchronizes data to facilitate trade and transport processes.  It serves as the foundation for cargo community systems, single window systems, and other systems that accelerate trade processing, transport operations, and enables transparency and traceability in supply chain/logistics environments.  The standards-compliant, web-accessible architecture of the platform provides for rapid deployment and rollout, and the flexibility to meet local needs and evolving requirements.  Using a flexible data architecture, NXFolio ensures that you can capture all relevant details of your supply chain and provides you with a platform for the integration of logistics data with trade partners and stakeholders.<br>
<br>
<a href="https://ntelx-public-images.s3.amazonaws.com/shipment-any-cols.png"><img src="https://ntelx-public-images.s3.amazonaws.com/accessorial.png" width="400" height="300"/></a>
<a href="https://ntelx-public-images.s3.amazonaws.com/foliodb-overview-2.png"><img src="https://ntelx-public-images.s3.amazonaws.com/foliodb-overview-2.png" width="400"/></a>
<br/>
### Address Book
NXFolio includes an Address Book module that allows the management of simple and complex business organizations.  Within this module, an organization can have locations and each location can have multiple contacts.  Organizations can have contacts directly as well.  When creating an organization, you can specify its name as well as multiple addresses.  Each organization, location, or contact can have multiple addresses.  Each organization can be referenced by various identifiers, such SIC code, DUNS number, EIN/tax ID, etc.<br>
<br>
The organization hierarchy represents the primary structure of organizations, locations and contacts in the system.  The database structure allows for hierarchical structures of unlimited depth (parent company with child companies, each of which have further subsidiaries, etc. - each of which have multiple addresses and contact details).<br>
<br>
NXFolio allows users to specify associations (if any exist) between two organizations. Users have an option to specify the type of association.<br>
<br>
Each organization may have a Role in the system.  This enables advanced organization based permissions.  For example, a parent company could be able to view and manage activities of a child company in addition to its own, while the child company can only manage its own activities and has no visibility into the activities of a parent or sibling company.<br>
<br>
Communication method represents a mechanism for communicating with an organization. Common examples of communication methods are Email address, Phone number, Fax number, etc. These contact methods are the means used by the system to inform Involved Parties of changes in shipment status.
<br>
### Shipment
The Shipment module of NXFolio enables the management of shipments.  Shipments can be created and updated, with details including Involved Parties (Shippers, Consignees, etc.), identifiers such as Bill of Lading number or Booking Number, routing details and conveyances, and more.<br>
<br>
Shipment Home shows all shipments that are not closed. If the user has appropriate permissions, it provides links to view edit or delete the shipments.  The listing provides a summary of each shipment, including the mode of transportation, reference identifiers, the current status, origin and destination, and the date/time that the shipment was last updated.<br>
<br>
The Shipment Details provide the full data on a shipment, including all Involved Parties, routing details, equipment/containers associated with the shipment, package level details, etc.<br>
<br>
### Events
Events in NXFolio are any physical or administrative action taken against a Shipment, Invoice, or Order.  Events may include loads onto and discharges from vessels, in-gate/out-gate movements at ports, releases and approvals, etc.  Event details include the action, the entity conducting the action, the reporter of the event, and the date/time of the event.<br>
<br>
### Orders
The Order module of NXFolio provides for the management of Orders, such as Purchase Orders.  NXFolio provides a way to create, view, and release orders in full or in part.  The status of Orders can be viewed and managed.<br>
<br>
Each Order consists of one or more line items.  The Seller has the ability to release all or any combination of the line items that are in the order.<br>
<br>
### Invoices & Payments
NXFolio contains a basic invoicing and payments capability.  Invoice and Payment details can be stored and simple actions, such as approvals, can be initiated in the user interface.  For full functionality, such as integration with payment processors and custom workflows, this functionality must be supplemented with custom extensions (i.e. payment processor API connectors, bank data files, data exchanges with third party systems, etc.).<br>
<br>
<br>
<br>
Keep up-to-date with release announcements and security updates by subscribing
to
[announce@ntelx.org](https://groups.google.com/a/ntelx.org/forum/#!forum/announce).


## Installation
NXFolio Data Model is tested and supported on Postgres 14.2 version. The installation step creates the necessary database schema, tables, sequences, and indexes. It also creates supply chain reference data. There are two options to install NXFolio Data Model:
  1. **Install with pgAdmin (recommmended)**
  2. Install with psql


### Install with pgAdmin
Install PostgreSQL 14.2 [Refer to the download page](https://www.postgresql.org/download/).


1. Create a new user **foliodbowner** 

```
CREATE USER foliodbowner WITH LOGIN NOSUPERUSER INHERIT CREATEDB CREATEROLE PASSWORD 'reset_password';

```

2. Create a new database **foliodb**
```
CREATE DATABASE foliodb WITH OWNER = foliodbowner
```

3. To create schema, tables, sequences, and indexes copy the DDL from **ddl/nxfolio-ddl.sql** into pgAdmin query tool and execute.

4. To create reference data copy the insert statements from **data/** folder into pgAdmin query tool and execute. 

### Install with psql
Install PostgreSQL 14.2 [Refer to the download page](https://www.postgresql.org/download/). 

1. Connect to psql with root/superuser

```
psql -h <host> -p <port> -d postgres -U <user_name>

```
If you are running Postgress locally at default port 5432 with default database postgres and user postgres

```
psql -h 127.0.0.1 -p 5432 -d postgres -U postgres

```
Notes: In some Mac version the port could be 5433.

2. After connecting to psql create user **foliodbowner**

```
postgres=# CREATE USER foliodbowner WITH PASSWORD 'reset_password' CREATEDB;
```

3. Quit psql by typing \q and connect again with user **foliodbowner**

```
psql -h <host> -p <port> -d postgres -U foliodbowner
```

4. Create a new database **foliodb**
```
postgres=# CREATE USER foliodbowner WITH PASSWORD 'reset_password' CREATEDB;
```
5. Connect to **foliodb** database
```
postgres=# \c foliodb foliodbowner
```
6. Execute DDL script at **ddl/nxfolio-ddl.sql** 
```
foliodb=> \i <path-to-ddl-file>/ddl/nxfolio-ddl.sql
```

## ER Diagram (a quick look)
  
  




### Shipment
The center transactional entity Shipment in NXFolio captures every data point that is possible in the global supply chain.

<div align="center">
<img src="https://ntelx-public-images.s3.amazonaws.com/shipment.png"  width="50%" height="50%">
</div>

### Payment

<div align="center">
<img src="https://ntelx-public-images.s3.amazonaws.com/Payment.png" width="50%" height="50%">
</div>

### Accessorial

<div align="center">
<img src="https://ntelx-public-images.s3.amazonaws.com/accessorial.png" width="50%" height="50%">
</div>


### Document

<div align="center">
<img src="https://ntelx-public-images.s3.amazonaws.com/Document.png" width="50%" height="50%">
</div>

<br />
<br />

**Note**: NXFolio uses DBeaver to geneate ER diagram that follows IDEF1X standards
<div align="left">
  <img src="https://ntelx-public-images.s3.amazonaws.com/ER-IDEF1X.png" width="250" height="200" >
  </div>

## Reference Data
There are more than 80 reference tables that capture various business data required in global trade.

Table  | Description | Example |
-- | --- | --- | 
ACCESSORIALTYPE|Accessorial freight charges are fees added to a shipper's freight invoice for services the motor freight carrier performed beyond the standard pick-up and delivery operation designated at the time a shipment is tendered. These can be FUEL SURCHARGE, HAZMAT CHARGE, INSURANCE etc. |FUEL SURCHARGE, HAZMAT CHARGE, INSURANCE etc.|
ADDRESSTYPE|Different address types like billing, shipping and office address||
APPOINTMENTREASON|||
BOLSTATUSTYPE|Bill of lading status|REGULAR BILL, SEC 321 TARIFF ACT 1930, FROB E CARGO LADEN IN FOREIGN, ONE ENTRY PER C4 CODE|
COMMODITYCLASS|A list based on National Motor Freight Classification|NMFC CLASS 100, NMFC CLASS 250|
COMMODITYCLASSGROUP|Group of commodity class|NMFC, NMFC-All, FAK|
COMMODITYCLASSTYPE|Type of commodity class||
COMMUNICATIONMETHODTYPE|Communication method type|EMAIL, MOBILE, PHONE,EFORWARD|
CONTAINERTYPE|Type of containers, either ISO standard or a local standard|20GP, 20PF, 22B0, 22RT|
CONVEYANCECATEGORY|Conveyance category|TRUCK, VESSEL, RAILWAY|
CONVEYANCEMAKETYPE|Type of conveyance make|FORD, PETERBILT, KENWORTH, MACK|
CONVEYANCEMODELTYPE|Type of conveyance model|MSL, P385, P387|
CONVEYANCESTATUS|Conveyance status|IN ROUTE, MAINTENANCE|
CONVEYANCETYPE|Conveyance type|18 Wheeler, Tank Truck, 40 FEET CONTAINER|
COUNTRY|List of countries|AUSTRALIA, BANGLADESH, BELIZE|
DATARESOLUTIONTYPE|List of all reference tables|Example|
DATETIMESTAMPREFERENCETYPE|Type of various date that system may capture|INVOICE DATE, INSPECTION DATE, BILL OF LADING DATE|
DETERMINANT|Type of weight and volume|Shipment Gross Weight, Package Gross Volume, Total Weight, Total Chargeable Weight|
DOCSUBMISSIONSTATUS|Document submission status|SUBMITTED, RECEIVED|
DOCUMENTFORMATTYPE|Document file format|JPEG, DOC, PDF|
DOCUMENTSTATUS|Document status|CREATED, NEW, ON HOLD|
DOCUMENTTYPE|Type of business document|Commercial Document, Customs Document, Government Documents|
DOMAINOBJECT|Type of domain object in NXFolio|DOCUMENT, EQUIPMENT, EVENT|
EDI_ISO_EQUIPMENTTYPE|ISO container type codes for EDI messaging|20DV - 20 DRY VAN, 20RH - 20 REEFER/HEATED, 2020 - INSULATED/VENTED|
EQUIPMENTSTATUS|Equipment status|EMPTY, LOADED|
EVENTCATEGORY|Type of event categories|TRANSPORTATION, BUSINESS, SYS EVENT|
EVENTREFERENCETYPE|Type of event references|CODECO MESSAGE REFERENCE NUMBER, AIR WAYBILL NUMBER, FORWARDERS/AGENTS REFERENCE NUMBER, HOUSE OCEAN BILL NUMBER|
EVENTTYPE|Type of event|ARRIVED, ARRIVED AT CUSTOMS, AWAITING CLEARANCE, CARRIER RELEASE|
EXPORTINFORMATIONTYPE|Export Information|Shipments for Federal agencies and their employees for their exclusive use, Single gift parcels covered by Bureau of Export Administration General License Gift, Shipments under U.S. government contract for the construction of facilities overseas|
FREIGHTPAYMENTTYPE|Type of freight payment|COLLECT, PREPAID|
HAZMATMATERIALTYPE|Type of Hazmat Material|HAZARDOUS MATERIAL CONTACT, HAZARDOUS MATERIAL CODE QUALIFIER, UN HAZARDOUS MATERIAL|
INBONDTYPE|Type of Inbond|IMMEDIATE TRANSPORTATION, IMMEDIATE EXPORTATION, TRANSIT|
INCOTERMSTYPE|Incoterms are the terms used in international trade to define the seller’s and buyer’s responsibilities as part of the sales contract. |FREE CARRIER, CARRIAGE PAID TO, DELIVERED EX SHIP, NON-PRIVILEGED FOREIGN|
INSPECTIONORCHECKTYPE|Type of inspection|ALERT SHORTAGES, DEVICE BROKEN, DEVICE NUMBER NO MATCH, DEVICE TEST FAILED|
INVOICECHARGETYPE|Type of invoice charge|FREIGHT CHARGES, FUEL SURCHARGE, DELIVERY AREA SURCHARGE COMM, WEIGHING & RESEARCH ADJUST|
INVOICESTATUS|Invoice status|ADJUSTED, APPROVED|
INVOLVEDPARTYREFERENCETYPE|Any referencing identifier for the involved party.|Business tax ID/EIN, DUNS number, etc.|
INVOLVEDPARTYTYPE|Indication of the type of party involved with the shipment.|Consignor/Shipper, Consignee, Notify Party, etc.|
ITEMCLASSIFICATIONTYPE|Type of item  classification|PART NUMBER, MODEL NUMBER, SCHEDULE B NUMBER|
ITLCLASSIFICATION||ELECTRONIC GOODS, SCHEDULE B|
MARKSNUMBERSTYPE|The type of marks numbers (on the bill of lading)||
METHODOFPAYMENT|Method of payment|Credit card, ACH bank transfer, etc.|
ORDERSTATUS|Status of the order|Planned, in-progress, etc.|
ORDERTYPE|The type of order|Sales, purchase, distribution|
ORGHIERARCHYTYPE|The type of organization/entity|Organization, location, port, etc.|
ORGREFERENCETYPE|A referencing identifier for an organization|Business Tax ID/EIN, DUNS number, etc.|
ORGROLE|The role of the organization on the shipment|Buyer, Seller, Consignee, Notify Party, etc.|
OTHERMEASURETYPE|The type for other measurements tacken.|customs weight, billed weight, etc.|
PACKAGEREFERENCETYPE|Reference identifiers for the package|Tracking numbers, bill of lading numbers, etc.|
PACKAGETYPE|Type of packaing|Boxes, bins, pallets, bags, etc.|
PAYMENTTERMSTYPE|Payment terms|Prepaid, collect|
RATECALCULATIONTYPE|Type of rate calculation|Standard Internal Tables, External Engine|
RATECOSTTYPE|Type of rate cost|FIXED, VARIABLE, MINIMUM|
SECURITYDEVICETYPE|Type of security device|Seal, tag|
SECURITYDEVICEVALUETYPE|Values relating to the security device.|Transponer ID, GPS Lat/long, Seal|
SELLPACKTYPE|Unit sale packaging|Container, pallet, bundle, etc.|
SERVICELEVEL|An offered service level.|Express, overnight, economy, standard, etc.|
SERVICETYPE|A type of cargo service offered.|Break bulk, pier to pier, container yard, etc.|
SHIPMENTCHARGETYPE|A charge type for the shipment.|Accessorial, transportation, etc.|
SHIPMENTINSTRUCTIONTYPE|Instructions regarding the shipment.|CARGO DESCRIPTION, HANDLING INSTRUCTIONS, HAZMAT INSTRUCTIONS|
SHIPMENTREFERENCETYPE|Any referencing identifier for the shipment.|Bill of Lading Number, Booking Number, customs declaration number, etc.|
SHIPMENTSTATUS|The status of the shipment|BOOKING ACCEPTED, DELAYED, CUSTOMERHOLD|
SHIPMENTTERMS|Standard terms referenced in the shipment/bill of lading|CARRIAGE AND INSURANCE PAID TO, EX QUAY, FREE ON BOARD|
STATEPROVINCE|State or Province|Alabama, APO - AA|
STOPFUNCTION|The reason or purpose for at stop.|Discharge, port of entry, etc.|
TIMEZONE|Time zones|EST - Eastern Standard Time in U.S.|
TRANSACTIONSTATUSTYPE|A general category of transactions.|Origin, cancellation, confirmation, etc.|
TRANSPORTMODE|The mode of transportation.|Ocean, Air, Rail, Truck, etc.|
UNITCATEGORY|The general category of measurements.|Length, weight, time, etc.|
UNITOFMEASURE|The unit of measure.|Kilogram, pounds, etc.|
UNITSYSTEM|Metric or English/Imperial|METRIC, ENGLISH|
VESSELROLE|pre-carriage, on-carriage, next vessel||



## Usage
Use examples liberally, and show the expected output if you can. It's helpful to have inline the smallest example of usage that you can demonstrate, while providing links to more sophisticated examples if they are too long to reasonably include in the README.

## Support
Tell people where they can go to for help. It can be any combination of an issue tracker, a chat room, an email address, etc.

## Roadmap
If you have ideas for releases in the future, it is a good idea to list them in the README.

## Contributing
State if you are open to contributions and what your requirements are for accepting them.

For people who want to make changes to your project, it's helpful to have some documentation on how to get started. Perhaps there is a script that they should run or some environment variables that they need to set. Make these steps explicit. These instructions could also be useful to your future self.

You can also document commands to lint the code or run tests. These steps help to ensure high code quality and reduce the likelihood that the changes inadvertently break something. Having instructions for running tests is especially helpful if it requires external setup, such as starting a Selenium server for testing in a browser.

## Authors and acknowledgment
Show your appreciation to those who have contributed to the project.

## License
For open source projects, say how it is licensed.

## Project status
If you have run out of energy or time for your project, put a note at the top of the README saying that development has slowed down or stopped completely. Someone may choose to fork your project or volunteer to step in as a maintainer or owner, allowing your project to keep going. You can also make an explicit request for maintainers.
