CREATE SCHEMA IF NOT EXISTS "foliodb";


CREATE TABLE "foliodb".accessorial (
    accessorialid double precision NOT NULL,
    tariffid double precision NOT NULL,
    accessorialtypecode character varying(5) NOT NULL,
    costdeterminantid double precision,
    costdeterminantuom character varying(5),
    applicabilitydeterminantid double precision,
    applicabilitydeterminantuom character varying(5),
    rateid double precision,
    accessorialname character varying(50),
    minimumcost numeric(15,2),
    maximumcost numeric(15,2),
    fixedcost numeric(15,2),
    startdate timestamp(0) without time zone,
    enddate timestamp(0) without time zone,
    isbuyrate double precision,
    issellrate double precision,
    currencycode character varying(5),
    notes character varying(2000),
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".accessorialcost (
    accessorialcostid double precision NOT NULL,
    accessorialid double precision,
    coefficient numeric(5,3),
    linearconstant numeric(15,2),
    lowrange double precision,
    highrange double precision,
    rangeuom character varying(5),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".accessorialcostid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".accessorialeffectrangetype (
    accessorialeffectrangetypecode character varying(5) NOT NULL,
    accessorialeffectrangetypename character varying(50),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".accessorialid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".accessoriallocation (
    accessoriallocationid double precision NOT NULL,
    stopfunctioncode character varying(5),
    orgid double precision,
    addressid double precision,
    regionid double precision,
    geolocationid double precision,
    accessorialid double precision,
    zipcoderangeid double precision,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".accessoriallocationid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".accessorialtype (
    accessorialtypecode character varying(5) NOT NULL,
    accessorialtypename character varying(50),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".address (
    addressid double precision NOT NULL,
    addresstypecode character varying(5),
    countrycode character(2) NOT NULL,
    orgid double precision,
    timezoneid character varying(5),
    isprimary character(1) NOT NULL,
    contactname character varying(100),
    addressline1 character varying(100),
    addressline2 character varying(100),
    city character varying(100),
    stateprovince character varying(100),
    stateprovincecode character varying(4),
    zippostcode character varying(20),
    latitude character varying(5),
    longitude character varying(5),
    notes character varying(3000),
    containerfreedays double precision,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL,
    orgname character varying(100)
);

CREATE SEQUENCE "foliodb".addressid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".addresstype (
    addresstypecode character varying(5) NOT NULL,
    addresstypename character varying(50) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".appointment (
    apptid double precision NOT NULL,
    apptstatuscode character varying(10),
    notes character varying(500),
    shipmentid double precision,
    orderid double precision,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL,
    apptreasoncode character varying(10) NOT NULL,
    appointmentslotid double precision
);

CREATE TABLE "foliodb".appointmentreason (
    appointmentreasoncode character varying(20) NOT NULL,
    appointmentreasonname character varying(100),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".appointmentslot (
    appointmentslotid double precision NOT NULL,
    startdate timestamp(0) without time zone,
    enddate timestamp(0) without time zone,
    capacity double precision,
    availablecapacity double precision,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL,
    addressid double precision
);

CREATE SEQUENCE "foliodb".appointmentslotid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE "foliodb".apptid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE "foliodb".apptslotid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".apptstatustype (
    apptstatuscode character varying(10) NOT NULL,
    apptstatusname character varying(50),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".bolstatustype (
    bolstatustypecode character varying(5) NOT NULL,
    bolstatustypename character varying(100) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".businessactivities (
    businessactivitiescode character varying(5) NOT NULL,
    businessactivitiesname character varying(50) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".carriercontainertype (
    carriercontainertypecode character varying(20) NOT NULL,
    carrierorgid double precision,
    containertypecode character varying(20),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".commodityclass (
    commodityclassid double precision NOT NULL,
    commodityclasstypecode character varying(20) NOT NULL,
    commodityclasscode character varying(20) NOT NULL,
    commodityclassname character varying(50),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".commodityclassgroup (
    commodityclassgroupid double precision NOT NULL,
    commodityclasstypecode character varying(20) NOT NULL,
    commodityclassgroupname character varying(50),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".commodityclassgroupmembership (
    commodityclassgroupid double precision NOT NULL,
    commodityclassid double precision NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".commodityclasstype (
    commodityclasstypecode character varying(20) NOT NULL,
    commodityclasstypename character varying(50),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".communicationmethod (
    communicationmethodid double precision NOT NULL,
    communicationmethodtypecode character varying(5) NOT NULL,
    orgid double precision,
    involvedpartyid double precision,
    value character varying(100),
    notes character varying(3000),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".communicationmethodid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".communicationmethodtype (
    communicationmethodtypecode character varying(5) NOT NULL,
    communicationmethodtypename character varying(50) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".contactsalutation (
    contactsalutationcode character varying(5) NOT NULL,
    contactsalutationname character varying(50) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".container (
    containerid double precision NOT NULL,
    containergroupid double precision,
    containeridentifier character varying(50) NOT NULL,
    containerinitial character varying(20),
    containernumber character varying(30),
    containercheckdigit character varying(5),
    containerstatus character varying(50),
    isocodenew character varying(20),
    isocodeold character varying(100),
    equipmenttypecode character varying(5),
    containertypedescription character varying(4000),
    scac character varying(100),
    ownerscac character varying(20),
    ownername character varying(100),
    orgid double precision,
    ownerorgid double precision,
    manufacture character varying(100),
    manufacturedate timestamp(0) without time zone,
    serialnumber character varying(100),
    cscnumber character varying(100),
    material character varying(100),
    paintcolor character varying(100),
    internalheight double precision,
    inernalheightuom character varying(5),
    internallength double precision,
    internallengthuom character varying(5),
    internalwidth double precision,
    internalwidthuom character varying(5),
    externalheight double precision,
    externalheightuom character varying(5),
    externallength double precision,
    externallengthuom character varying(5),
    externalwidth double precision,
    externalwidthuom character varying(5),
    usablevolume double precision,
    usablevolumeuom character varying(5),
    doorheight double precision,
    doorheightuom character varying(5),
    doorwidth double precision,
    doorwidthuom character varying(5),
    stackheight double precision,
    stackheightuom character varying(5),
    maxgrossweight double precision,
    maxgrossweightuom character varying(5),
    tonnagerating double precision,
    isrefrigerated character(1),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL,
    containertypecode character varying(20),
    internalheightuom character varying(5)
);

CREATE TABLE "foliodb".containergroupmapping (
    containertypecode character varying(50),
    containertypegroupid double precision
);

CREATE TABLE "foliodb".containergroupmembership (
    containergroupmembershipid double precision NOT NULL,
    containertypegroupid double precision,
    containertypecode character varying(20),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".containerid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".containerownermembership (
    containerid double precision NOT NULL,
    containerinitial character varying(20) NOT NULL,
    containernumber character varying(20) NOT NULL,
    orgid double precision NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".containerstatus (
    containerstatuscode character varying(5) NOT NULL,
    containerstatusname character varying(50) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".containerterminalactivity (
    containerterminalactivityid double precision NOT NULL,
    apptreasoncode character varying(10) NOT NULL,
    modecode character varying(10),
    begindate timestamp(0) without time zone NOT NULL,
    enddate timestamp(0) without time zone NOT NULL,
    manifestquantity double precision,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL,
    locationid double precision NOT NULL,
    companyorgid double precision NOT NULL,
    projectedmanifestquantity double precision,
    actualmanifestquantity double precision,
    source character varying(20)
);

CREATE SEQUENCE "foliodb".containerterminalactivityid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".containerterminalactivityitem (
    containerterminalitemid double precision NOT NULL,
    containerid character varying(50),
    containerterminalactivityid double precision,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL,
    apptid double precision
);

CREATE TABLE "foliodb".containertype (
    containertypecode character varying(20) NOT NULL,
    containertypename character varying(100) NOT NULL,
    containertypedescription character varying(3000),
    edicode character varying(50),
    height double precision,
    length double precision,
    width double precision,
    heightuom character varying(5),
    lengthuom character varying(5),
    widthuom character varying(5),
    volume character varying(5),
    volumeuom character varying(5),
    usablevolume double precision,
    usablevolumeuom character varying(5),
    tareweight double precision,
    tareweightuom character varying(5),
    grossweight double precision,
    grossweightuom character varying(5),
    isrefrigerated character(1),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".containertypegroup (
    containertypegroupid double precision NOT NULL,
    containertypegroupname character varying(100),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".containertypemode (
    containertypemodeid double precision NOT NULL,
    containertypecode character varying(20) NOT NULL,
    modecode character(2) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    laststatusupdateuserid character varying(8),
    laststatusupdatetimestamp timestamp(0) without time zone,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL,
    containertypegroupid double precision
);

CREATE TABLE "foliodb".conveyagencytype (
    conveyagencytypecode character varying(5) NOT NULL,
    conveyagencytypename character varying(50) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".conveyance (
    conveyanceid double precision NOT NULL,
    conveyancetypecode character varying(5) NOT NULL,
    uniqueidentifier character varying(100),
    conveyancemaketypecode character varying(5),
    conveyancemodeltypecode character varying(5),
    conveyancemodelvalue character varying(50),
    axlecount double precision,
    length double precision,
    lengthuom character varying(5),
    width double precision,
    widthuom character varying(5),
    height double precision,
    heightuom character varying(5),
    draft double precision,
    draftuom character varying(5),
    displacement double precision,
    displacementuom character varying(5),
    tareweight double precision,
    tareweightuom character varying(5),
    volume double precision,
    volumeuom character varying(5),
    manufacturedate timestamp(0) without time zone,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone,
    domainname character varying(50)
);

CREATE TABLE "foliodb".conveyancecategory (
    conveyancecategorycode character varying(5) NOT NULL,
    conveyancecategoryname character varying(50),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".conveyancecolortype (
    conveyancecolortypecode character varying(5) NOT NULL,
    conveyancecolortypename character varying(50) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".conveyanceid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".conveyancemaketype (
    conveyancemaketypecode character varying(5) NOT NULL,
    conveyancetypecode character varying(5),
    conveyancemaketypename character varying(50) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".conveyancemodeltype (
    conveyancemodeltypecode character varying(5) NOT NULL,
    conveyancemaketypecode character varying(5),
    conveyancemodeltypename character varying(50) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".conveyancestatus (
    conveystatuscode character varying(5) NOT NULL,
    conveystatusname character varying(50),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".conveyancetype (
    conveyancetypecode character varying(5) NOT NULL,
    conveyancecategorycode character varying(5),
    conveyancetypename character varying(50) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".conveyinstance (
    conveyinstanceid double precision NOT NULL,
    conveyanceid double precision,
    currentstatus character varying(10) NOT NULL,
    effectivedate timestamp(0) without time zone NOT NULL,
    expirationdate timestamp(0) without time zone,
    carriercode character varying(10),
    conveyancename character varying(50),
    conveyagencytypecode character varying(5),
    conveyagencyidentifer character varying(50),
    colorprimary character varying(5),
    colorsecondary character varying(5),
    callsign character varying(50),
    registeredcountrycode character(2),
    description character varying(4000),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone,
    domainname character varying(50) NOT NULL,
    latitude double precision,
    longitude double precision
);

CREATE SEQUENCE "foliodb".conveyinstanceid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".conveyinstanceorgassoc (
    conveyinstanceorgassocid double precision NOT NULL,
    conveyinstanceid double precision,
    orgid double precision,
    involvedpartytypecode character varying(5),
    effectivedate timestamp(0) without time zone,
    expirationdate timestamp(0) without time zone,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".conveyinstanceorgassocid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".conveyreference (
    conveyreferenceid double precision NOT NULL,
    conveyreferencetypecode character varying(5) NOT NULL,
    conveyreferencevalue character varying(50) NOT NULL,
    conveyanceid double precision,
    conveyinstanceid double precision,
    effectivedate timestamp(0) without time zone,
    expirationdate timestamp(0) without time zone,
    issuedby character varying(50),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".conveyreferenceid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".conveyreferencetype (
    conveyreferencetypecode character varying(5) NOT NULL,
    conveyreferencetypename character varying(50) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".country (
    countrycode character(2) NOT NULL,
    countryname character varying(50) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".currencyvalue (
    currencyvalueid double precision NOT NULL,
    currencycode character varying(5) NOT NULL,
    effectivedate timestamp(0) without time zone NOT NULL,
    multiplyby double precision NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".dataresolutionlog (
    dataresolutionlogid double precision NOT NULL,
    dataresolutionvalueid double precision,
    shipmentid double precision,
    legid double precision,
    legstopid double precision,
    eventid double precision,
    addresstype character varying(1),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL,
    packageid double precision,
    orderid double precision,
    involvedpartyid double precision,
    invoiceid double precision,
    legcontainerid double precision,
    orgid double precision
);

CREATE SEQUENCE "foliodb".dataresolutionlogid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".dataresolutiontype (
    resolvetypecode character varying(10) NOT NULL,
    resolvetypename character varying(50),
    membertable character varying(30),
    domainname character varying(50) NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone NOT NULL,
    lastupdatetimestamp timestamp(0) without time zone,
    lastupdateuserid character varying(8),
    status character varying(10) NOT NULL
);

CREATE TABLE "foliodb".dataresolutionvalue (
    dataresolutionvalueid double precision NOT NULL,
    referencecode character varying(100),
    referencevalue character varying(50),
    resolveid double precision,
    xml bytea,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL,
    resolvetypecode character varying(10)
);

CREATE SEQUENCE "foliodb".dataresolutionvalueid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".datetimestampreference (
    datetimestampreferenceid double precision NOT NULL,
    domainobjectcode character varying(5),
    domainobjectid double precision,
    shipmentid double precision,
    legid double precision,
    legcontainerid double precision,
    legroutedetailsid double precision,
    eventid double precision,
    invoiceid double precision,
    invoicedetailid double precision,
    invoicelineitemid double precision,
    orderid double precision,
    orderreleaseid double precision,
    packageid double precision,
    datetimestampreferencetypecode character varying(5) NOT NULL,
    datetimestampreferencevalue timestamp(0) without time zone,
    datetimestampreferencequalifer character varying(5),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".datetimestampreferenceid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".datetimestampreferencetype (
    datetimestampreferencetypecode character varying(5) NOT NULL,
    datetimestampreferencetypename character varying(50) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".deliverytimegroup (
    deliverytimegroupid double precision NOT NULL,
    deliverytimegroupname character varying(50),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".deliverytimegroupmembership (
    laneid double precision NOT NULL,
    deliverytimegroupid double precision NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".determinant (
    determinantid double precision NOT NULL,
    domainobjectcode character varying(5) NOT NULL,
    attributecode character varying(5),
    attributename character varying(50) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".determinantid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".dockreceipt (
    dockreceiptid double precision NOT NULL,
    legid double precision NOT NULL,
    measuredbyname character varying(50),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    laststatusupdateuserid character varying(8),
    laststatusupdatetimestamp timestamp(0) without time zone,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".docsubmission (
    docsubmissionid double precision NOT NULL,
    documentid double precision,
    docsubmissionstatuscode character varying(5),
    docsubmissionnote character varying(3000),
    docsubmitteddate timestamp(0) without time zone,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".docsubmissionid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".docsubmissionstatus (
    docsubmissionstatuscode character varying(5) NOT NULL,
    docsubmissionstatusname character varying(50),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".docsubmissionstatushistory (
    docsubmissionstatushistoryid double precision NOT NULL,
    docsubmissionid double precision NOT NULL,
    fromsubmissionstatuscode character varying(5),
    tosubmissionstatuscode character varying(5),
    remarks character varying(3000),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".docsubmissionstatushistoryid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".document (
    documentid double precision NOT NULL,
    documentname character varying(100) NOT NULL,
    documenttemplatenumber double precision,
    documentstatuscode character varying(5),
    documentnote character varying(3000),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL,
    documenttypecode character varying(5),
    documentformattypecode character varying(5),
    folderid double precision,
    filename character varying(100),
    label character varying(100),
    asgnd_userid character varying(8)
);

CREATE TABLE "foliodb".documentdata (
    documentid double precision NOT NULL,
    documentsourcexmlpath character varying(1024),
    generatedoutputtextpath character varying(1024),
    generatedoutputbinarypath character varying(1024),
    generatedbinarydata bytea,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL,
    analysisstatuscode character varying(10),
    documentformattypecode character varying(10),
    filename character varying(100),
    documentidentifier character varying(50),
    textdata character varying(500)
);

CREATE TABLE "foliodb".documentdomainobjectmembership (
    domainobjectcode character varying(5) NOT NULL,
    domainobjectid double precision NOT NULL,
    documentid double precision NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".documentfield (
    documentfieldid double precision NOT NULL,
    htmlfieldname character varying(50),
    attributevalue character varying(100),
    documentid double precision,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL,
    templatehtmlfieldid character varying(50)
);

CREATE SEQUENCE "foliodb".documentfieldid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".documentformattype (
    documentformattypecode character varying(5) NOT NULL,
    documentformattypename character varying(50) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".documentid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".documentstatus (
    documentstatuscode character varying(5) NOT NULL,
    documentstatusname character varying(50) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".documentstatushistory (
    documentstatushistoryid double precision NOT NULL,
    documentid double precision NOT NULL,
    fromdocumentstatuscode character varying(5) NOT NULL,
    todocumentstatuscode character varying(5),
    remarks character varying(3000),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".documentstatushistoryid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".documenttemplate (
    documenttemplateid double precision NOT NULL,
    documentformattypecode character varying(5),
    documenttypecode character varying(5),
    documenttemplatename character varying(100),
    documenttemplateurl character varying(1024),
    documenttemplatehtml text,
    timetoreleaseamshold timestamp(0) without time zone,
    timetocancel timestamp(0) without time zone,
    effectivebegindate timestamp(0) without time zone,
    effecttiveenddate timestamp(0) without time zone,
    autoapprove character(1) NOT NULL,
    autosubmit character(1) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL,
    description character varying(500)
);

CREATE SEQUENCE "foliodb".documenttemplateid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".documenttype (
    documenttypecode character varying(5) NOT NULL,
    documenttypename character varying(50) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".domainobject (
    domainobjectcode character varying(5) NOT NULL,
    domainobjectname character varying(50),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL,
    domainobjecturl character varying(150),
    domainobjectquery character varying(150)
);

CREATE TABLE "foliodb".dvecost (
    dvecostid double precision NOT NULL,
    dvetypecode character varying(5) NOT NULL,
    orderreleaseitemid double precision NOT NULL,
    dveamount numeric(15,2) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".dvetype (
    dvetypecode character varying(5) NOT NULL,
    dvetypename character varying(50),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".edi_iso_equipmenttype (
    equipmenttypecode character varying(5) NOT NULL,
    equipmenttypename character varying(100) NOT NULL,
    equipmenttypegroupcode character varying(5),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL,
    modecode character(2)
);

CREATE TABLE "foliodb".edi_iso_equipmenttypegroup (
    equipmenttypegroupcode character varying(5) NOT NULL,
    equipmenttypegroupname character varying(100) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".edi_iso_packagetype (
    packagetypecode character varying(5) NOT NULL,
    packagetypename character varying(50) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".edimessagelog (
    edimessagelogid double precision NOT NULL,
    msgtype character varying(10) NOT NULL,
    filename character varying(100),
    username character varying(100),
    msgstatus character varying(50),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone,
    domainname character varying(50),
    errorlog character varying(1000),
    receivedtimestamp timestamp(0) without time zone,
    transportationstatus character varying(10),
    edipartner character varying(10),
    msgtransport character varying(10)
);

CREATE SEQUENCE "foliodb".edimessagelogid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".editransactionset (
    editransactionsetcode character varying(20) NOT NULL,
    editransactionsetname character varying(50),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".emesgstandard (
    emesgstandardid double precision NOT NULL,
    standardcode character varying(15),
    standardname character varying(15)
);

CREATE TABLE "foliodb".emesgtype (
    emesgtypeid double precision NOT NULL,
    messagetype character varying(15),
    standardcode character varying(15),
    version character varying(15),
    parser character varying(50),
    xslt character varying(50),
    outputtype character varying(50),
    modulestatus character varying(10),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".emesgtypeid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".equipmentstatus (
    equipmentstatuscode character varying(5) NOT NULL,
    equipmentstatusname character varying(50) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".errorcatalogdetalid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE "foliodb".errorcatalogid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".event (
    eventid double precision NOT NULL,
    conveyinstanceid double precision,
    eventcategorycode character varying(5),
    eventtypecode character varying(20) NOT NULL,
    transactionstatustypecode character varying(5),
    appointmentreasoncode character varying(20),
    eventdatetime timestamp(0) without time zone,
    eventdatetimezone character varying(5),
    eventdatetimezulu timestamp(0) without time zone,
    eventaddressid double precision,
    domainobjectcode character varying(5),
    shipmentid double precision,
    legid double precision,
    legcontainerid double precision,
    containerid double precision,
    orderid double precision,
    packageid double precision,
    containertypecode character varying(20),
    containerinitial character varying(20),
    containernumber character varying(30),
    containeridentifier character varying(50),
    containercheckdigit character(1),
    equipmenttypecode character varying(5),
    equipmenttypecode_noval character varying(20),
    equipmentstatuscode character varying(5),
    equipmentdescription character varying(4000),
    sealnumber character varying(20),
    sealnumber2 character varying(20),
    sealnumber3 character varying(20),
    bayposition character varying(100),
    hazmatflag character(1),
    isrefrigerated character(1),
    temperature numeric(15,2),
    temperatureuom character varying(5),
    netweight numeric(15,2),
    netweightuom character varying(5),
    netweightuom_est numeric(15,2),
    netweightuom_estuom character varying(5),
    grossweight numeric(15,2),
    grossweightuom character varying(5),
    grossweight_est numeric(15,2),
    grossweight_estuom character varying(5),
    tareweight numeric(15,2),
    tareweightuom character varying(5),
    tareweight_est numeric(15,2),
    tareweight_estuom character varying(5),
    netvolume numeric(15,2),
    netvolumeuom character varying(5),
    netvolume_est numeric(15,2),
    netvolume_estuom character varying(5),
    grossvolume numeric(15,2),
    grossvolumeuom character varying(5),
    grossvolume_est numeric(15,2),
    grossvolume_estuom character varying(5),
    usablevolume numeric(15,2),
    usablevolumeuom character varying(5),
    usablevolume_est numeric(15,2),
    usablevolume_estuom character varying(5),
    length numeric(15,2),
    lengthuom character varying(5),
    length_est numeric(15,2),
    length_estuom character varying(5),
    height numeric(15,2),
    heightuom character varying(5),
    height_est numeric(15,2),
    height_estuom character varying(5),
    width numeric(15,2),
    widthuom character varying(5),
    width_est numeric(15,2),
    width_estuom character varying(5),
    edisender character varying(50),
    edicontrolnumber character varying(20),
    editransactionsetcode character varying(20),
    vesselvehicleid double precision,
    vesselvehiclecode character varying(100),
    vesselvehiclecodequalifier character varying(100),
    vesselvehiclerolecode character varying(5),
    vesselvehicleroutecode character varying(5),
    vesselvehiclescac character varying(10),
    vesselvehiclename character varying(100),
    vesselvehicleflag character varying(5),
    vesselvehicletype character varying(100),
    vesselvehicledescription character varying(100),
    transportmodetypecode character(2),
    signalcodecallsign character varying(100),
    flightorvoyagenumber character varying(20),
    sailingordeparturedate timestamp(0) without time zone,
    routenumber character varying(20),
    routedirection character varying(100),
    nextvesselvehicleid double precision,
    nextvesselvehiclecode character varying(100),
    nextvesselvehiclecodequalifier character varying(100),
    nextvesselvehiclerolecode character varying(5),
    nextvesselvehicleroutecode character varying(5),
    nextvesselvehiclescac character varying(5),
    nextvesselvehiclename character varying(100),
    nextvesselvehicleflag character varying(5),
    nextvesselvehicletype character varying(100),
    nextvesselvehicledescription character varying(100),
    nexttransportmodetypecode character(2),
    nextsignalcodecallsign character varying(100),
    nextflightorvoyagenumber character varying(20),
    nextsailingordeparturedate timestamp(0) without time zone,
    nextroutedirection character varying(100),
    nextroutenumber character varying(20),
    devicetype character varying(50),
    value1 character varying(50),
    value2 character varying(50),
    value3 character varying(50),
    value4 character varying(50),
    value5 character varying(50),
    processingstatuscode character varying(5),
    remarks character varying(4000),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".eventcategory (
    eventcategorycode character varying(5) NOT NULL,
    eventcategoryname character varying(50),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".eventdocument (
    eventdocumentid double precision NOT NULL,
    eventid double precision,
    eventdocumentpath character varying(1024),
    eventdocumentdescription character varying(200),
    documenttypecode character varying(10),
    eventdocumentdatatext text,
    eventdocumentdatabinary bytea,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".eventdocumentid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE "foliodb".eventid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".eventreference (
    eventreferenceid double precision NOT NULL,
    eventid double precision,
    eventreferencetypecode character varying(5) NOT NULL,
    eventreferencevalue character varying(100) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".eventreferenceid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".eventreferencetype (
    eventreferencetypecode character varying(5) NOT NULL,
    eventreferencetypename character varying(100),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".eventroutedetailsid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".eventstop (
    eventstopid double precision NOT NULL,
    eventid double precision,
    addressid double precision,
    stopfunctioncode character varying(5),
    etd timestamp(0) without time zone,
    etdttimezone character varying(5),
    etdzulu timestamp(0) without time zone,
    atd timestamp(0) without time zone,
    atdtimezone character varying(5),
    atdzulu timestamp(0) without time zone,
    eta timestamp(0) without time zone,
    etatimezone character varying(5),
    etazulu timestamp(0) without time zone,
    ata timestamp(0) without time zone,
    atatimezone character varying(5),
    atazulu timestamp(0) without time zone,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".eventstopid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".eventtype (
    eventtypecode character varying(20) NOT NULL,
    eventtypename character varying(50),
    eventcategorycode character varying(5),
    isshowninui double precision NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    arrivaldeparture character(1),
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".exportinformationtype (
    exportinformationtypecode character varying(5) NOT NULL,
    exportinformationtypename character varying(100),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".fdt_module (
    modulecode character varying(10) NOT NULL,
    modulename character varying(20),
    productcode character varying(10) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT now() NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".fdt_product (
    productcode character varying(10) NOT NULL,
    productname character varying(15),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT now() NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".financialaccounting (
    financialaccountingid double precision NOT NULL,
    invoicechargeid double precision,
    shipmentchargetypecode character varying(5),
    financialinformation character varying(50),
    breakdownstructure character varying(50),
    breakdownstructureorgid double precision,
    percentage numeric(15,4),
    rate numeric(15,4),
    amount numeric(15,4),
    currencycode character varying(5),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".financialaccountingid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".freightpaymenttype (
    freightpaymenttypecode character varying(5) NOT NULL,
    freightpaymenttypename character varying(50) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".geolocation (
    geolocationid double precision NOT NULL,
    countrycode character(2) NOT NULL,
    countyname character varying(30),
    countyfips character varying(30),
    stateprovince character varying(30),
    stateprovincecode character varying(4),
    statefips character varying(30),
    city character varying(32),
    zippostcode character varying(20),
    zip3 character(3),
    zipcoderangestart character varying(20),
    zipcoderangeend character varying(20),
    msa character varying(30),
    metroarea character varying(30),
    timezonename character varying(30),
    timezonecode character varying(30),
    timezonegmt numeric(10,2),
    daylightsavingstime character(1),
    latitude numeric(10,5),
    longitude numeric(10,5),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".geolocationid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".geotype (
    geotypecode character varying(20) NOT NULL,
    geotypename character varying(50),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".hazmatmaterialtype (
    hazmatmaterialtypecode character varying(5) NOT NULL,
    hazmatmaterialtypename character varying(50),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".hazmattypeid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".holiday (
    holidaycode character varying(5) NOT NULL,
    countrycode character(2),
    holidayname character varying(50) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".holidayinstance (
    holidayinstanceid double precision NOT NULL,
    holidaycode character varying(5),
    holidaydate timestamp(0) without time zone,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".holidayoperatinghours (
    holidayoperatinghoursid character(10) NOT NULL,
    observedholidayid double precision,
    businessactivitiescode character varying(5) NOT NULL,
    beginhour smallint,
    beginminute smallint,
    endhour smallint,
    endminute smallint,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".inbondtype (
    inbondtypecode character varying(5) NOT NULL,
    inbondtypename character varying(50) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".incotermstype (
    incotermstypecode character varying(5) NOT NULL,
    incotermstypename character varying(50) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".inspectionorcheck (
    inspectionorcheckid double precision NOT NULL,
    inspectionorchecktypecode character varying(5),
    eventid double precision,
    inspectionorcheckdate timestamp(0) without time zone,
    inspectionorcheckvalue character varying(100),
    inspectionorcheckstatus character varying(10),
    inspectionorcheckqualifier character varying(50),
    inspectionremarks character varying(4000),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".inspectionorcheckid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".inspectionorchecktype (
    inspectionorchecktypecode character varying(5) NOT NULL,
    inspectionorchecktypename character varying(50),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".intelliagentalerthistoryid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE "foliodb".intelliagentalertid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE "foliodb".intelliagentcontrolagentid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE "foliodb".intelliagentdbactionid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE "foliodb".intelliagentjavaactionid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE "foliodb".intelliagentruleid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE "foliodb".intelliagentruleparamid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".invoice (
    invoiceid double precision NOT NULL,
    exchangerateid double precision,
    baseinvoiceid double precision,
    transactionstatustypecode character varying(5),
    objecttypecode character varying(10),
    invoicestatuscode character varying(5),
    invoicereference character varying(50),
    scac character varying(50),
    tariffservicecode character varying(5),
    modecode character(2),
    methodofpaymentcode character varying(5),
    paymenttermstypecode character varying(5),
    paymenttermsnetdays double precision,
    incotermstypecode character varying(5),
    shipmenttermscode character varying(10),
    invoicedate timestamp(0) without time zone,
    netamountdue numeric(15,4),
    netamountcurrencycode character varying(5),
    totalweight numeric(15,2),
    totalweightuom character varying(5),
    totalweightqualifier character varying(5),
    settlementoption character varying(5),
    correctionidentifier character varying(50),
    exchangerate numeric(15,4),
    billingcurrencycode character varying(5),
    paymentcurrencycode character varying(5),
    laststatusupdateuserid character varying(8),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".invoicecharge (
    invoicechargeid double precision NOT NULL,
    invoicelineitemid double precision,
    invoicechargetypecode character varying(5),
    invoicechargestatuscode character varying(15),
    invoicechargedescription character varying(100),
    freightrate character varying(50),
    ratecostqualifier character varying(50),
    ratecostid double precision,
    quantity numeric(10,2),
    chargeamount numeric(15,4),
    chargecurrencycode character varying(5),
    chargelineitem character varying(50),
    declaredvalue numeric(15,4),
    declaredvaluecurrencycode character varying(5),
    specialchargecode character varying(50),
    tariffapplicationcode character varying(50),
    percent character varying(50),
    freightclasscode character varying(50),
    approvedamount double precision,
    processeddate timestamp(0) without time zone,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".invoicechargeid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".invoicechargetype (
    invoicechargetypecode character varying(5) NOT NULL,
    invoicechargetypename character varying(100) NOT NULL,
    shipmentchargetypecode character varying(5),
    carrierorgid double precision,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".invoicedetail (
    invoicedetailid double precision NOT NULL,
    invoiceid double precision,
    originalinvoicedetailid double precision,
    shipmentid double precision,
    legid double precision,
    orderid double precision,
    orderreleaseid double precision,
    originaddressid double precision,
    destinationaddressid double precision,
    invoicestatuscode character varying(5),
    transportmodecode character(2),
    shipmenttermscode character varying(10),
    methodofpaymentcode character varying(5),
    netamountdue numeric(15,4),
    netamountduecurrencycode character varying(5),
    totalweight numeric(15,4),
    totalweightuom character varying(5),
    totalweightqualifier character varying(5),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".invoicedetailid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE "foliodb".invoiceid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".invoicelineitem (
    invoicelineitemid double precision NOT NULL,
    invoicedetailid double precision,
    shipmentid double precision,
    legid double precision,
    orderid double precision,
    orderreleaseid double precision,
    packageid double precision,
    tariffid double precision,
    invoicelineitemnumber double precision NOT NULL,
    invoicelineitemdescription character varying(100),
    commodityclassid double precision,
    commoditycodevalue character varying(50),
    commoditycodequalifier character varying(50),
    quantity numeric(15,4),
    packagecode character varying(50),
    grossweight numeric(15,4),
    grossweightuom character varying(5),
    grossweightqualifier character varying(5),
    grossvolume numeric(15,4),
    grossvolumeuom character varying(5),
    grossvolumequalifier character varying(5),
    totalchargeableweight numeric(15,4),
    totalchargeableweightuom character varying(5),
    totalchargeableweightqualifier character varying(5),
    marksandnumbers character varying(4000),
    marksandnumbersqualifier character varying(50),
    tariffagencycode character varying(50),
    tariffservicelevel character varying(50),
    tariffnumber character varying(50),
    methodofpayment character varying(50),
    billasratedquantity character varying(50),
    billasratedqualifier character varying(50),
    bolsource character varying(50),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".invoicelineitemid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".invoicereference (
    invoicereferenceid double precision NOT NULL,
    invoiceid double precision,
    invoicedetailid double precision,
    invoicelineitemid double precision,
    invoicechargeid double precision,
    shipmentreferencetypecode character varying(5),
    invoicereferencevalue character varying(500) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".invoicereferenceid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".invoicestatus (
    invoicestatuscode character varying(5) NOT NULL,
    invoicestatusname character varying(50) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".involvedparty (
    involvedpartyid double precision NOT NULL,
    involvedpartytypecode character varying(5) NOT NULL,
    involvedpartyname character varying(50),
    domainobjectcode character varying(5),
    domainobjectid double precision,
    shipmentid double precision,
    legid double precision,
    orderid double precision,
    purchaseorderid double precision,
    eventid double precision,
    invoiceid double precision,
    invoicedetailid double precision,
    orgid double precision,
    preferredcommunicationmethod character varying(5),
    contactname character varying(50),
    compliancecheckrequired character varying(5),
    addressline1 character varying(100),
    addressline2 character varying(100),
    city character varying(100),
    stateprovince character varying(32),
    stateprovincecode character varying(5),
    scparea character varying(32),
    zippostcode character varying(20),
    countrycode character(2),
    countryname character varying(100),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(50) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".involvedpartyid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".involvedpartyreference (
    involvedpartyreferenceid double precision NOT NULL,
    involvedpartyid double precision,
    involvedpartyreferencetypecode character varying(5),
    involvedpartyreferencevalue character varying(50) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".involvedpartyreferenceid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".involvedpartyreferencetype (
    involvedpartyreferencetypecode character varying(5) NOT NULL,
    involvedpartyreferencetypename character varying(50) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".involvedpartytype (
    involvedpartytypecode character varying(5) NOT NULL,
    involvedpartytypename character varying(50) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".item (
    itemid double precision NOT NULL,
    currencycode character varying(5),
    orgid double precision,
    sellpacktypecode character varying(5),
    description character varying(3000),
    masteritemid double precision,
    isshownincatalog character(1),
    ismaster character(1),
    manufacturer character varying(50),
    sellpackquantity double precision,
    sellpacklength numeric(15,2),
    sellpacklengthuom character varying(5),
    sellpackwidth numeric(15,2),
    sellpackwidthuom character varying(5),
    sellpackheight numeric(15,2),
    sellpackheightuom character varying(5),
    sellpackweight numeric(15,2),
    sellpackweightuom character varying(5),
    sellpackvolume numeric(15,2),
    sellpackvolumeuom character varying(5),
    sellpackunitcost numeric(15,2),
    hazmatflag character(1) DEFAULT 'N'::bpchar,
    overpackfactorpercentage numeric(15,2),
    targetlanguage character varying(50),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".itemclassification (
    itemclassificationid double precision NOT NULL,
    itemid double precision NOT NULL,
    itemclassificationtypecode character varying(5) NOT NULL,
    value character varying(100) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".itemclassificationid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".itemclassificationtype (
    itemclassificationtypecode character varying(5) NOT NULL,
    itemclassificationtypename character varying(50) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".itemcommodity (
    itemcommodityid double precision NOT NULL,
    itemid double precision NOT NULL,
    itemcommoditytype character varying(20),
    itemcommodityclass character varying(100) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".itemcommodityid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".itemcountryoforigin (
    itemcountryoforiginid double precision NOT NULL,
    countrycode character(2) NOT NULL,
    itemid double precision NOT NULL,
    percentage numeric(5,2) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".itemcountryoforiginid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".itemequivalency (
    itemequivalencyid double precision NOT NULL,
    orgid double precision NOT NULL,
    itemequivalencyname character varying(50) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".itemhazmattype (
    hazmattypeid double precision NOT NULL,
    domainobjectcode character varying(5),
    domainobjectid double precision,
    itemid double precision,
    shipmentid double precision,
    legid double precision,
    legcontainerid double precision,
    eventid double precision,
    packageid double precision,
    hazmatmaterialtypecode character varying(5),
    identifier character varying(50),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".itemhts (
    itemhtsid double precision NOT NULL,
    domainobjectid double precision,
    domainobjectcode character varying(5),
    itemid double precision,
    countrycode character(2),
    effectivedate timestamp(0) without time zone,
    isineffect double precision,
    identifier character varying(50),
    destinationcountrycode character(2),
    itlclassificationcode character varying(5),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".itemhtsid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE "foliodb".itemid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".itemitemequivalency (
    itemid double precision NOT NULL,
    itemequivalencyid double precision NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8),
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".itlclassification (
    itlclassificationcode character varying(5) NOT NULL,
    itlclassificationname character varying(65),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".lane (
    laneid double precision NOT NULL,
    origingeolocationid double precision,
    originregionid double precision,
    originaddressid double precision,
    destinationgeolocationid double precision,
    destinationregionid double precision,
    destinationaddressid double precision,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".laneid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".leg (
    legid double precision NOT NULL,
    destinationaddressid double precision NOT NULL,
    originaddressid double precision NOT NULL,
    legtype character varying(5),
    ismaster character(1) DEFAULT 'N'::bpchar NOT NULL,
    fulfilllegid double precision,
    modecode character(2) NOT NULL,
    dockreceiptid double precision,
    pickupid double precision,
    shipmentid double precision,
    buyrateid double precision,
    sellrateid double precision,
    planninglegid double precision,
    isplan double precision,
    legnumber double precision NOT NULL,
    precarriage character varying(20),
    totalchargableweight numeric(15,2),
    totalchargableweightuom character varying(5),
    negotiatedbuyrate numeric(15,2),
    negotiatedsellrate numeric(15,2),
    negbuycurrencycode character varying(5),
    negbuyrateorgid double precision,
    containerized character(1),
    negsellcurrencycode character varying(5),
    transactionstatustypecode character varying(5),
    servicetypecode character varying(5),
    servicelevelcode character varying(5),
    methodofpaymentcode character varying(5),
    incotermstypecode character varying(5),
    paymenttermstypecode character varying(5),
    carrier double precision,
    cutoffdate timestamp(0) without time zone,
    carriagetype character varying(10),
    transactionstatus character varying(10),
    legstatuscode character varying(5),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL,
    CONSTRAINT ckc_ismaster_leg CHECK ((ismaster = ANY (ARRAY['Y'::bpchar, 'N'::bpchar])))
);

CREATE TABLE "foliodb".legcharge (
    legchargeid double precision NOT NULL,
    shipmentchargetypecode character varying(5) NOT NULL,
    legid double precision NOT NULL,
    freightpaymenttypecode character varying(5),
    paymentterms character varying(100),
    tariffdescription character varying(100),
    quantity numeric(15,2),
    promotioncode character varying(100),
    sellrate double precision,
    sellratetype character varying(100),
    sellrateid double precision,
    sellamount numeric(15,2),
    sellcurrencycode character varying(5),
    buyrate numeric(15,2),
    buyratetype character varying(100),
    buyrateid double precision,
    buyamount numeric(15,2),
    buycurrencycode character varying(5),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".legchargeid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".legcontainer (
    legcontainerid double precision NOT NULL,
    legid double precision,
    containeridentifier character varying(50) NOT NULL,
    containerinitial character varying(20),
    containernumber character varying(30),
    containercheckdigit character(1),
    equipmenttypecode character varying(5),
    containerid double precision,
    servicetypecode character varying(5),
    containertypecode character varying(20),
    scac character varying(20),
    sealnumber character varying(20),
    sealnumber2 character varying(20),
    sealnumber3 character varying(20),
    hazmatflag character(1),
    hazmatcode character varying(20),
    hazmatclass character varying(20),
    hazmatflashpoint numeric(15,2),
    hazmatcontact character varying(100),
    hazmatpage character varying(20),
    hazmatqualifier character varying(20),
    hazmatdescription character varying(4000),
    netweight numeric(15,2),
    netweightuom character varying(5),
    netweight_est numeric(15,2),
    netweightestuom character varying(5),
    tareweight numeric(15,2),
    tareweightuom character varying(5),
    tareweight_est numeric(15,2),
    tareweight_estuom character varying(5),
    grossweight numeric(15,2),
    grossweightuom character varying(5),
    grossweight_est numeric(15,2),
    grossweight_estuom character varying(5),
    isrefrigerated character(1),
    netvolume numeric(15,2),
    netvolumeuom character varying(5),
    netvolume_est numeric(15,2),
    netvolume_estuom character varying(5),
    grossvolume numeric(15,2),
    grossvolumeuom character varying(5),
    grossvolume_est numeric(15,2),
    grossvolume_estuom character varying(5),
    usablevolume numeric(15,2),
    usablevolumeuom character varying(5),
    usablevolume_est numeric(15,2),
    usablevolume_estuom character varying(5),
    length numeric(15,2),
    lengthuom character varying(5),
    length_est numeric(15,2),
    length_estuom character varying(5),
    height numeric(15,2),
    heightuom character varying(5),
    height_est numeric(15,2),
    height_estuom character varying(5),
    width numeric(15,2),
    widthuom character varying(5),
    width_est numeric(15,2),
    width_estuom character varying(5),
    bayposition character varying(20),
    equipmentstatus character varying(10),
    equipmentowner character varying(100),
    laststatusupdateuserid character varying(8),
    laststatusupdatetimestamp timestamp(0) without time zone,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL,
    shipmentid double precision
);

CREATE SEQUENCE "foliodb".legcontainerid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE "foliodb".legid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".legreference (
    legreferenceid double precision NOT NULL,
    shipmentreferencetypecode character varying(5) NOT NULL,
    legid double precision,
    legreferencevalue character varying(50) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".legreferenceid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".legroutedetails (
    legroutedetailsid double precision NOT NULL,
    legid double precision,
    conveyinstanceid double precision,
    eventid double precision,
    legstopid double precision,
    vesselrolecode character varying(5),
    vesselvehicleid double precision,
    vesselcode character varying(30),
    vesselcodequalifier character varying(10),
    carriercode character varying(10),
    vesselname character varying(50),
    vesselflag character varying(20),
    flightorvoyagenumber character varying(20),
    routenumber character varying(20),
    signalcodecallsign character varying(100),
    sailingordeparturedate timestamp(0) without time zone,
    modecode character(2),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".legroutedetailsid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".legstatushistory (
    legid double precision NOT NULL,
    statustimestamp timestamp(0) without time zone NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50)
);

CREATE TABLE "foliodb".legstop (
    stopid double precision NOT NULL,
    addressid double precision NOT NULL,
    legid double precision,
    routingtemplatelegid double precision,
    stopfunctioncode character varying(5),
    sequence double precision,
    etd timestamp(0) without time zone,
    etdtimezone character varying(5),
    etdzulu timestamp(0) without time zone,
    atd timestamp(0) without time zone,
    atdtimezone character varying(5),
    atdzulu timestamp(0) without time zone,
    eta timestamp(0) without time zone,
    etatimezone character varying(5),
    etazulu timestamp(0) without time zone,
    ata timestamp(0) without time zone,
    atatimezone character varying(5),
    atazulu timestamp(0) without time zone,
    vesselcode character varying(10),
    vesselcodequalifier character varying(10),
    vesselname character varying(50),
    flightorvoyagenumber character varying(20),
    routenumber character varying(20),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".legstophistory (
    legstophistoryid double precision NOT NULL,
    stopid double precision NOT NULL,
    legid double precision NOT NULL,
    addressid double precision NOT NULL,
    stopfunctioncode character varying(5),
    sequence double precision,
    etd timestamp(0) without time zone,
    etdtimezone character varying(5),
    etdzulu timestamp(0) without time zone,
    atd timestamp(0) without time zone,
    atdtimezone character varying(5),
    atdzulu timestamp(0) without time zone,
    eta timestamp(0) without time zone,
    etatimezone character varying(5),
    etazulu timestamp(0) without time zone,
    ata timestamp(0) without time zone,
    atatimezone character varying(5),
    atazulu timestamp(0) without time zone,
    vesselcode character varying(10),
    vesselcodequalifier character varying(10),
    vesselname character varying(50),
    flightorvoyagenumber character varying(20),
    routenumber character varying(20),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".legstophistoryid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".marksnumberstype (
    marksnumberstypecode character varying(5) NOT NULL,
    marksnumberstypename character varying(50),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".methodofpayment (
    methodofpaymentcode character varying(5) NOT NULL,
    methodofpaymentname character varying(100) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".notificationid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE "foliodb".notificationstatuschangeid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE "foliodb".notificationtemplateemailid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".observedholiday (
    observedholidayid double precision NOT NULL,
    operatingscheduleid double precision NOT NULL,
    holidayinstanceid double precision,
    observedholidayname character varying(50),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".operatinghours (
    operatinghoursid double precision NOT NULL,
    businessactivitiescode character varying(5) NOT NULL,
    operatingscheduleid double precision NOT NULL,
    dayofweek smallint,
    beginhour smallint,
    beginminute smallint,
    endhour smallint,
    endminute smallint,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".operatingschedule (
    operatingscheduleid double precision NOT NULL,
    operatingschedulename character varying(50) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".orderid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".orderinstruction (
    orderinstructionid double precision NOT NULL,
    orderid double precision,
    shipmentinstructiontypecode character varying(5) NOT NULL,
    orderinstructiontext character varying(4000),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".orderinstructionid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".orderitem (
    orderitemid double precision NOT NULL,
    itemid double precision NOT NULL,
    orderid double precision,
    quantity numeric(15,2),
    linenumber double precision,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".orderitemid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".orderreference (
    orderreferenceid double precision NOT NULL,
    orderid double precision,
    shipmentreferencetypecode character varying(5) NOT NULL,
    orderreferencevalue character varying(50) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".orderreferenceid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".orderrelease (
    orderreleaseid double precision NOT NULL,
    shipmentid double precision,
    orderid double precision,
    shippingtermscode character varying(10) NOT NULL,
    methodofpaymentcode character varying(5) NOT NULL,
    currencycode character varying(5) NOT NULL,
    modecode character(2),
    originaddressid double precision NOT NULL,
    destinationaddressid double precision NOT NULL,
    preferredcarrierscac character varying(5),
    earliestshipdate timestamp(0) without time zone,
    latestshipdate timestamp(0) without time zone,
    earliestarrivedate timestamp(0) without time zone,
    laststatusupdateuserid character varying(8),
    laststatusupdatetimestamp timestamp(0) without time zone,
    latestarrivedate timestamp(0) without time zone,
    releasedate timestamp(0) without time zone,
    carrier double precision,
    transactionstatustypecode character varying(5),
    orderstatuscode character varying(5),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".orderreleaseid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".orderreleaseinstruction (
    orderreleaseinstructionid double precision NOT NULL,
    orderreleaseid double precision,
    shipmentinstructiontypecode character varying(5),
    orderreleaseinstructiontext character varying(4000),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".orderreleaseinstructionid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".orderreleaseitem (
    orderreleaseitemid double precision NOT NULL,
    itemid double precision NOT NULL,
    orderreleaseid double precision,
    linenumber double precision,
    quantity numeric(15,2) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".orderreleaseitemid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".orderreleasereference (
    orderreleasereferenceid double precision NOT NULL,
    shipmentreferencetypecode character varying(5) NOT NULL,
    orderreleaseid double precision,
    orderreleasereferencevalue character varying(50) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".orderreleasereferenceid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".orders (
    orderid double precision NOT NULL,
    originaddressid double precision,
    destinationaddressid double precision,
    modecode character(2),
    methodofpaymentcode character varying(5),
    currencycode character varying(5),
    ordertypecode character varying(5),
    earliestshipdate timestamp(0) without time zone,
    earliestshipdatetimezone character varying(5),
    earliestshipdatezulu timestamp(0) without time zone,
    latestshipdate timestamp(0) without time zone,
    latestshipdatetimezone character varying(5),
    latestshipdatezulu timestamp(0) without time zone,
    earliestarrivedate timestamp(0) without time zone,
    earliestarrivedatetimezone character varying(5),
    earliestarrivedatezulu timestamp(0) without time zone,
    latestarrivedate timestamp(0) without time zone,
    latestarrivedatetimezone character varying(5),
    latestarrivedatezulu timestamp(0) without time zone,
    contactname character varying(50),
    contactphonenumber character varying(40),
    preferredcarrierorgid double precision,
    preferredcarrier character varying(50),
    orderdate timestamp(0) without time zone,
    transactionstatustypecode character varying(5),
    orderstatuscode character varying(5),
    incotermstypecode character varying(5),
    laststatusupdateuserid character varying(8),
    laststatusupdatetimestamp timestamp(0) without time zone,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".orderstatus (
    orderstatuscode character varying(5) NOT NULL,
    orderstatusname character varying(50),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".ordertemplate (
    templateownertypecode character(1) NOT NULL,
    templateownerid double precision NOT NULL,
    ordertemplateid double precision NOT NULL,
    shippingtermscode character varying(10),
    originaddressid double precision,
    destinationaddressid double precision,
    ordertemplatename character varying(50) NOT NULL,
    ordertypecode character varying(10),
    standingorderflag character(1) NOT NULL,
    orderdescription character varying(3000),
    orderinstructions character varying(3000),
    contactname character varying(50),
    contactphonenumber character varying(40),
    laststatusupdateuserid character varying(8),
    laststatusupdatetimestamp timestamp(0) without time zone,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".ordertype (
    ordertypecode character varying(5) NOT NULL,
    ordertypename character varying(50) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".orghierarchy (
    orgid double precision NOT NULL,
    countrycode character(2),
    parentorgid double precision,
    orgrolecode character varying(5),
    contactsalutationcode character varying(5),
    orghierarchytypecode character varying(5) NOT NULL,
    orgname character varying(100) NOT NULL,
    contactfirstname character varying(100),
    contactlastname character varying(100),
    contacttitle character varying(100),
    capacity double precision,
    availablecapacity double precision,
    department character varying(100),
    dfltorgcode character varying(100),
    transactionlevelflag character(1),
    dunsnumber character(9),
    scaccode character(4),
    einnumber character varying(20),
    bondnumber character varying(50),
    paperlessmibparticipant character(1),
    workflowflag character(1),
    isdomainparent double precision,
    laststatusupdateuserid character varying(8),
    laststatusupdatetimestamp timestamp(0) without time zone,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL,
    accounttype character varying(5),
    balance double precision,
    creditlimit double precision,
    preferredcommunicationmethod character varying(5),
    employmentdate timestamp(0) without time zone,
    birthdate timestamp(0) without time zone
);

CREATE TABLE "foliodb".orghierarchytype (
    orghierarchytypecode character varying(5) NOT NULL,
    orghierarchytypename character varying(50),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".orgid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".orgorgassoc (
    orgorgassocid double precision,
    srcorgid double precision,
    destorgid double precision,
    relationshiptypecode character varying(5),
    issymmetric character varying(1),
    begindate timestamp(0) without time zone,
    enddate timestamp(0) without time zone,
    comments character varying(500),
    status character varying(10) DEFAULT 'ACTIVE'::character varying,
    createuserid character varying(8),
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50),
    likelihood double precision
);

CREATE SEQUENCE "foliodb".orgorgassocid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".orgreference (
    orgreferenceid double precision NOT NULL,
    orgreferencetypecode character varying(5) NOT NULL,
    orgreferencevalue character varying(100) NOT NULL,
    orgid double precision NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".orgreferenceid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".orgreferencetype (
    orgreferencetypecode character varying(5) NOT NULL,
    orgreferencetypename character varying(50) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".orgrole (
    orgrolecode character varying(5) NOT NULL,
    orgrolename character varying(50) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8),
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    lastupdateuser character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".othermeasuretype (
    othermeasuretypecode character varying(5) NOT NULL,
    othermeasuretypename character varying(50) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".otherweightsandmeasures (
    otherweightsandmeasuresid double precision NOT NULL,
    domainobjectcode character varying(5),
    domainobjectid double precision,
    shipmentid double precision,
    legid double precision,
    legcontainerid double precision,
    eventid double precision,
    invoiceid double precision,
    invoicedetailid double precision,
    invoicelineitemid double precision,
    measurevalue numeric(20,4),
    measurevalueuom character varying(5),
    measurevaluetypecode character varying(5),
    measurevaluequalifier character varying(5),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".otherweightsandmeasuresid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".package (
    packageid double precision NOT NULL,
    shipmentid double precision,
    parentpackageid double precision,
    packagetypecode character varying(5),
    commodityclassid double precision,
    quantity double precision NOT NULL,
    length numeric(15,2),
    lengthuom character varying(5),
    width numeric(15,2),
    widthuom character varying(5),
    height numeric(15,2),
    heightuom character varying(5),
    weight numeric(15,6),
    weightuom character varying(5),
    chargeableweight numeric(15,6),
    chargeableweightuom character varying(5),
    volume numeric(15,6),
    volumeuom character varying(5),
    netvolume numeric(15,2),
    netvolumeuom character varying(5),
    netweight numeric(15,2),
    netweightuom character varying(5),
    insuredvalue numeric(15,2),
    insuredvaluecurrencycode character varying(5),
    inbondvalue numeric(15,2),
    inbondvaluecurrencycode character varying(5),
    carriagevalue numeric(15,2),
    carriagevaluecurrencycode character varying(5),
    customsvalue numeric(15,2),
    customsvaluecurrencycode character varying(5),
    goodsvalue numeric(15,2),
    goodsvaluecurrencycode character varying(5),
    laststatusupdateuserid character varying(8),
    laststatusupdatetimestamp timestamp(0) without time zone,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".packageid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".packagelineitem (
    packagelineitemid double precision NOT NULL,
    packageid double precision,
    itemid double precision NOT NULL,
    orderid double precision,
    orderitemid double precision,
    quantity double precision NOT NULL,
    laststatusupdateuserid character varying(8),
    laststatusupdatetimestamp timestamp(0) without time zone,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".packagelineitemid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".packagemarksnumbers (
    packagemarksnumbersid double precision NOT NULL,
    packageid double precision,
    marksnumberstypecode character varying(5) NOT NULL,
    packagemarksnumberstext character varying(4000),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".packagemarksnumbersid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".packagereference (
    packagereferenceid double precision NOT NULL,
    packageid double precision,
    packagereferencetypecode character varying(5) NOT NULL,
    packagereferencevalue character varying(50) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".packagereferenceid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".packagereferencetype (
    packagereferencetypecode character varying(5) NOT NULL,
    packagereferencetypename character varying(65),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".packagetransit (
    packagetransitid double precision NOT NULL,
    packageid double precision,
    legid double precision,
    legcontainerid double precision,
    quantity double precision NOT NULL,
    vanning character varying(50),
    laststatusupdateuserid character varying(8),
    laststatusupdatetimestamp timestamp(0) without time zone,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".packagetransitid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".packagetype (
    packagetypecode character varying(5) NOT NULL,
    packagetypename character varying(50) NOT NULL,
    length numeric(15,2),
    lengthuom character varying(5),
    width numeric(15,2),
    widthuom character varying(5),
    height numeric(15,2),
    heightuom character varying(5),
    tareweight double precision,
    tareweightuom character varying(5),
    grossweight double precision,
    grossweightuom character varying(5),
    volume numeric(15,2),
    volumeuom character varying(5),
    usablevolume double precision,
    usablevolumeuom character varying(5),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".parcelshipmentpackage (
    packageid double precision NOT NULL,
    trackingnumber character varying(50) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuser character varying(8),
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuser character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".payment (
    paymentid double precision NOT NULL,
    amountcurrencycode character varying(50),
    shipmentid double precision NOT NULL,
    amount double precision,
    confirmationcode character varying(50),
    paymentgateway character varying(50),
    notes character varying(500),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".paymentid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".paymenttermstype (
    paymenttermstypecode character varying(5) NOT NULL,
    paymenttermstypename character varying(50) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".pickup (
    pickupid double precision NOT NULL,
    readydate timestamp(0) without time zone,
    cutoffdate timestamp(0) without time zone,
    contactname character varying(50),
    contactphonenumber character varying(40),
    laststatusupdateuserid character varying(8),
    laststatusupdatetimestamp timestamp(0) without time zone,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".positionaldata (
    positionaldataid double precision NOT NULL,
    eventid double precision,
    sequence double precision,
    datetime timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    datetimezone character varying(5),
    datatimezulu timestamp(0) without time zone,
    lat_dd double precision,
    lon_dd double precision,
    latlonrawtype character varying(20),
    lat_raw character varying(50),
    lon_raw character varying(50),
    altitude double precision,
    altitudeuom character varying(5),
    heading_degrees double precision,
    heading_cardinal character varying(20),
    headinguom character varying(10),
    speed double precision,
    speeduom character varying(10),
    speedmps double precision,
    dataprovider character varying(50),
    dataprivoderorgid double precision,
    deviceidentifier character varying(50),
    deviceversion character varying(50),
    gisstatuscode character varying(50),
    renderercode character varying(20),
    renderfillsymbol character varying(20),
    nativeformatcode character varying(20),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".positionaldataid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".preadvicesourcetype (
    sourcetypecode character varying(5) NOT NULL,
    sourcetypename character varying(50) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".rate (
    rateid double precision NOT NULL,
    tariffid double precision NOT NULL,
    laneid double precision,
    ratezoneid double precision,
    minimumcost numeric(15,2),
    maximumcost numeric(15,2),
    fixedcost numeric(15,2),
    currencycode character varying(5),
    costdeterminantid double precision,
    costdeterminantuom character varying(5),
    commodityclassid double precision,
    commodityclassgroupid double precision,
    containertypecode character varying(20),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".ratecalculationtype (
    ratecalculationtypecode character varying(5) NOT NULL,
    ratecalculationtypename character varying(50) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".ratecost (
    ratecostid double precision NOT NULL,
    rateid double precision NOT NULL,
    ratecosttypecode character varying(5) NOT NULL,
    ratecost numeric(15,4),
    linearconstant numeric(15,2),
    lowrange numeric(15,2),
    highrange numeric(15,2),
    rangeuom character varying(5),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".ratecostid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".ratecosttype (
    ratecosttypecode character varying(5) NOT NULL,
    ratecosttypename character varying(50),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".rategroup (
    rategroupid double precision NOT NULL,
    rategroupname character varying(50),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".rategroupmembership (
    rategroupid double precision NOT NULL,
    laneid double precision NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".rateid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".ratezone (
    ratezoneid double precision NOT NULL,
    ratezonename character varying(50),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".ratezonelane (
    ratezoneid double precision NOT NULL,
    laneid double precision NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".recurrenceid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".refcode (
    tablename character varying(50) NOT NULL,
    columnname character varying(50) NOT NULL,
    code character varying(50) NOT NULL,
    description character varying(50) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".region (
    regionid double precision NOT NULL,
    regionname character varying(50),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".regionmembership (
    geolocationid double precision NOT NULL,
    regionid double precision NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".relationshiptype (
    relationshiptypecode character varying(5),
    relationshiptypename character varying(50),
    status character varying(10) DEFAULT 'ACTIVE'::character varying,
    createuserid character varying(8),
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50)
);

CREATE TABLE "foliodb".roleroleassoc (
    roleroleassocid double precision NOT NULL,
    srcrolecode character varying(5) NOT NULL,
    destrolecode character varying(5) NOT NULL,
    relationshiptypecode character varying(5) NOT NULL,
    issymmetric character varying(1),
    begindate timestamp(0) without time zone,
    enddate timestamp(0) without time zone,
    likelihood double precision,
    comments character varying(500),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) DEFAULT 'SYSTEM'::character varying NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone,
    domainname character varying(50) DEFAULT 'PUBLIC'::character varying NOT NULL
);

CREATE SEQUENCE "foliodb".roleroleassocid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".routingtemplate (
    routingtemplateid double precision NOT NULL,
    modecode character(2),
    addressid double precision,
    regionid double precision,
    geolocationid double precision,
    zipcoderangeid double precision,
    containertypegroupid double precision,
    routingtemplatename character varying(50) NOT NULL,
    isopen character varying(1),
    destgeolocationid double precision,
    destaddressid double precision,
    destregionid double precision,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".routingtemplateid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".routingtemplateleg (
    routingtemplatelegid double precision NOT NULL,
    routingtemplateid double precision NOT NULL,
    modecode character(2),
    geolocationid double precision,
    regionid double precision,
    addressid double precision,
    orgrolecode character varying(5),
    uomcode character varying(10),
    zipcoderangeid double precision,
    orgid double precision,
    containertypecode character varying(20),
    legnumber smallint NOT NULL,
    proximitydistance smallint,
    isproximitytoorigin character(2),
    isopen character varying(1),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".routingtemplatelegid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".routingtemplatelegsserviceleve (
    servicelevelcode character varying(5) NOT NULL,
    routingtemplatelegid double precision NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".securitydevice (
    securitydeviceid double precision NOT NULL,
    securitydevicetypeid double precision NOT NULL,
    conveyanceinstanceid double precision,
    serialnumber character varying(100),
    effectivedate timestamp(0) without time zone,
    expirationdate timestamp(0) without time zone,
    eventid double precision,
    securitydevicestatuscode character varying(5),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone,
    domainname character varying(50) NOT NULL,
    securitydeviceregistryid double precision,
    conveyinstanceid double precision,
    legcontainerid double precision
);

CREATE SEQUENCE "foliodb".securitydeviceid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".securitydeviceregistry (
    securitydeviceregistryid double precision NOT NULL,
    securitydevicetypeid double precision NOT NULL,
    serialnumber character varying(100),
    effectivedate timestamp(0) without time zone,
    expirationdate timestamp(0) without time zone,
    status character varying(8) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".securitydeviceregistryid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".securitydevicetype (
    securitydevicetypeid double precision NOT NULL,
    securitydevicetypename character varying(100) NOT NULL,
    devicemanufacturer character varying(100) NOT NULL,
    devicemodel character varying(100) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".securitydevicetypeid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".securitydevicevalue (
    securitydevicevalueid double precision NOT NULL,
    securitydeviceid double precision,
    conveyinstanceid double precision,
    legcontainerid double precision,
    eventid double precision,
    devicevalue character varying(100),
    devicevaluetype character varying(5),
    valuequalifier character varying(100),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".securitydevicevalueid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".securitydevicevaluetype (
    securitydevicevaluetypecode character varying(5) NOT NULL,
    securitydevicetypeid double precision NOT NULL,
    securitydevicevaluetypename character varying(100) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".sellpacktype (
    sellpacktypecode character varying(5) NOT NULL,
    sellpacktypename character varying(50) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".service (
    serviceid double precision NOT NULL,
    orgid double precision NOT NULL,
    transittimetypecode double precision NOT NULL,
    servicename character varying(50),
    guaranteeddelivery character(2),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".servicelevel (
    servicelevelcode character varying(5) NOT NULL,
    servicelevelname character varying(50),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".serviceservicelevel (
    servicelevelcode character varying(5) NOT NULL,
    serviceid double precision NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".servicetimesid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".servicetype (
    servicetypecode character varying(5) NOT NULL,
    servicetypename character varying(50) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".shipment (
    shipmentid double precision NOT NULL,
    destinationaddressid double precision NOT NULL,
    originaddressid double precision NOT NULL,
    splitshipmentid double precision,
    controlshipmentid double precision,
    shippingtermscode character varying(10),
    bolstatustypecode character varying(5),
    modecode character(2),
    shipmentmode character varying(10),
    fulfillslegid double precision,
    shipperorgid double precision,
    methodofpaymentcode character varying(5),
    incotermstypecode character varying(5),
    paymenttermstypecode character varying(5),
    isquote double precision,
    loadtype character varying(10),
    insuredvalue numeric(15,2),
    insuredcurrencycode character varying(5),
    inbondvalue numeric(15,2),
    inbondvaluecurrencycode character varying(5),
    carriagevalue numeric(15,2),
    carriagecurrencycode character varying(5),
    customsvalue numeric(15,2),
    customscurrencycode character varying(5),
    goodsvalue numeric(15,2),
    goodscurrencycode character varying(5),
    earliestshipdate timestamp(0) without time zone,
    earliestshipdatetimezone character varying(5),
    earliestshipdatezulu timestamp(0) without time zone,
    latestshipdate timestamp(0) without time zone,
    latestshipdatetimezone character varying(5),
    latestshipdatezulu timestamp(0) without time zone,
    earliestarrivedate timestamp(0) without time zone,
    earliestarrivedatetimezone character varying(5),
    earliestarrivedatezulu timestamp(0) without time zone,
    latestarrivedate timestamp(0) without time zone,
    latestarrivedatetimezone character varying(5),
    latestarrivedatezulu timestamp(0) without time zone,
    bookingcontactname character varying(50),
    bookingcontactphonenumber character varying(40),
    itemlisttypecode character varying(10),
    totalweight numeric(15,2),
    totalweightuom character varying(5),
    totalchargableweight numeric(15,2),
    totalchargableweightuom character varying(5),
    grossweight numeric(15,2),
    grossweightuom character varying(5),
    grossvolume numeric(15,2),
    grossvolumeuom character varying(5),
    manifestquantity double precision,
    manifestunittypecode character varying(5),
    containercount double precision,
    routingtemplateid double precision,
    exportflag character(1),
    exportinformationtype character varying(5),
    paperlessmibparticipant character(1),
    masterinbondindicator character(1),
    inbondtypecode character varying(5),
    firms character varying(50),
    exportinformationcode character varying(5),
    servicetypecode character varying(5),
    servicelevelcode character varying(5),
    shipmentdescription character varying(3000),
    objecttype character varying(10),
    transactionstatustypecode character varying(5),
    commodityclassid double precision,
    shipmentstatuscode character varying(5),
    securitystatus character varying(5),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".shipmentcharge (
    shipmentchargeid double precision NOT NULL,
    shipmentchargetypecode character varying(5) NOT NULL,
    shipmentid double precision,
    legid double precision,
    packageid double precision,
    freightpaymenttypecode character varying(5),
    chargename character varying(50),
    paymentterms character varying(100),
    tariffdescription character varying(100),
    quantity numeric(15,2),
    promotioncode character varying(100),
    sellrate numeric(15,2),
    sellratetype character varying(100),
    sellrateid double precision,
    sellamount numeric(15,2),
    sellcurrencycode character varying(5),
    buyrate numeric(15,2),
    buyratetype character varying(100),
    buyrateid double precision,
    buyamount numeric(15,2),
    buycurrencycode character varying(5),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".shipmentchargeid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".shipmentchargetype (
    shipmentchargetypecode character varying(5) NOT NULL,
    shipmentchargetypename character varying(50),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".shipmentconsolidation (
    shipmentconsolidationid double precision NOT NULL,
    mastershipmentid double precision,
    houseshipmentid double precision,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".shipmentconsolidationid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".shipmentcontainerbooking (
    shipmentcontainerbookingid double precision NOT NULL,
    containertypeid double precision,
    equipmenttypecode character varying(5),
    shipmentid double precision NOT NULL,
    equipmentstatuscode character varying(5),
    containernumber character varying(20),
    containerinitial character varying(20),
    containercheckdigit character(1),
    laststatusupdateuserid character varying(8),
    laststatusupdatetimestamp timestamp(0) without time zone,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".shipmentid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".shipmentinstruction (
    shipmentinstructionid double precision NOT NULL,
    shipmentid double precision,
    legid double precision,
    legcontainerid double precision,
    packageid double precision,
    eventid double precision,
    invoiceid double precision,
    invoicedetailid double precision,
    invoicelineitemid double precision,
    shipmentinstructiontypecode character varying(5) NOT NULL,
    shipmentinstructiontext character varying(4000),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".shipmentinstructionid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".shipmentinstructiontype (
    shipmentinstructiontypecode character varying(5) NOT NULL,
    shipmentinstructiontypename character varying(50) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".shipmentreference (
    shipmentreferenceid double precision NOT NULL,
    shipmentid double precision,
    shipmentreferencetypecode character varying(5) NOT NULL,
    shipmentreferencevalue character varying(50) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".shipmentreferenceid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".shipmentreferencetype (
    shipmentreferencetypecode character varying(5) NOT NULL,
    shipmentreferencetypename character varying(65),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".shipmentstatus (
    shipmentstatuscode character varying(5) NOT NULL,
    shipmentstatusname character varying(50),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".shipmentstatushistory (
    shipmentstatushistoryid double precision NOT NULL,
    shipmentid double precision NOT NULL,
    fromstatus character varying(5),
    tostatus character varying(5),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".shipmentstatushistoryid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".shipmentterms (
    shipmenttermscode character varying(10) NOT NULL,
    shipmenttermsname character varying(50) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".stopfunction (
    stopfunctioncode character varying(5) NOT NULL,
    stopfunctionname character varying(50),
    sequenceassignedvalue double precision,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".stopid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".tariff (
    tariffid double precision NOT NULL,
    basetariffid double precision,
    carrierorgid double precision,
    servicelevelcode character varying(5),
    currencycode character varying(5) NOT NULL,
    modecode character(2) NOT NULL,
    commodityclassgroupid double precision,
    containertypegroupid double precision,
    ratecalculationtypecode character varying(5),
    cur_currencycode character varying(5),
    operatingscheduleid double precision,
    tariffname character varying(50) NOT NULL,
    tariffdescription character varying(3000),
    begindate timestamp(0) without time zone,
    enddate timestamp(0) without time zone,
    dimfactor numeric(15,2),
    coefficient numeric(5,2),
    minimumcost numeric(15,2),
    maximumcost numeric(15,2),
    fixedcost numeric(15,2),
    minimumweight numeric(15,2),
    minimumvolume numeric(15,2),
    commitment numeric(15,2),
    commitmentuom character varying(10),
    minimumweightuom character varying(10),
    minimumvolumeuom character varying(10),
    lengthuom character varying(10),
    weightuom character varying(10),
    distanceuom character varying(10),
    volumeuom character varying(10),
    isbuyrate character(1),
    issellrate character(1),
    isallowshadowweight character(1),
    maximumweight numeric(15,2),
    maximumvolume numeric(15,2),
    maximumwidth numeric(15,2),
    maximumgirth numeric(15,2),
    maximumweightuom character varying(10),
    maximumvolumeuom character varying(10),
    maximumwidthuom character varying(10),
    maximumgirthuom character varying(10),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".tariffid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".templatefield (
    templatefieldid double precision NOT NULL,
    documenttemplateid double precision,
    htmltype character varying(20),
    dbtype character varying(10),
    parentid double precision,
    displayname character varying(100) NOT NULL,
    source character varying(100),
    fieldtype character varying(1),
    description character varying(500),
    displayorder double precision,
    htmlfieldname character varying(50),
    validationstring character varying(1000)
);

CREATE SEQUENCE "foliodb".templatefieldid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".templateownertype (
    templateownertypecode character varying(5) NOT NULL,
    templateownertypename character varying(50) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".timezone (
    timezonecode character varying(5) NOT NULL,
    timezonename character varying(50),
    hoursdifferencezulu double precision,
    minutesdifferencezulu double precision,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8),
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuser character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".transactionstatustype (
    transactionstatustypecode character varying(5) NOT NULL,
    transactionstatustypename character varying(50) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".transitservicedistance (
    laneid double precision,
    capacity double precision,
    transittime double precision,
    transittimeuom character varying(5),
    cutofftime double precision,
    cutofftimeuom character varying(5),
    waittime double precision,
    waittimeuom character varying(5),
    distance double precision,
    distanceuom character varying(5),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL,
    transitservicedistanceid double precision NOT NULL,
    tariffid double precision
);

CREATE SEQUENCE "foliodb".transitservicedistanceid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".transittimetype (
    transittimetypecode double precision NOT NULL,
    transittimetypename character varying(50) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".transportmode (
    transportmodecode character(2) NOT NULL,
    transportmodename character varying(100) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".unitcategory (
    unitcategorycode character varying(10) NOT NULL,
    unitcategoryname character varying(50) NOT NULL,
    unitcodesize double precision,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".unitconversion (
    uomcode character varying(10) NOT NULL,
    touomcode character varying(10) NOT NULL,
    multiplyby double precision NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".unitofmeasure (
    uomcode character varying(10) NOT NULL,
    unitcategorycode character varying(10) NOT NULL,
    unitsystemcode character varying(10),
    uomname character varying(50) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".unitsystem (
    unitsystemcode character varying(10) NOT NULL,
    unitsystemname character varying(50) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".vesselrole (
    vesselrolecode character varying(5) NOT NULL,
    vesselrolename character varying(50) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8),
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".vesselvehicle (
    vesselvehicleid double precision NOT NULL,
    officialname character varying(100),
    officialnumber character varying(100),
    licensenumber character varying(100),
    signalcodecallsign character varying(100),
    vesselvehiclecode character varying(10),
    vesselvehiclecodequalifier character varying(10),
    vesselvehicledescription character varying(4000),
    vesselvehiclerolecode character varying(5),
    vesselvehicleflag character(2),
    vesselvehicletype character varying(100),
    tonnage double precision,
    owner character varying(100),
    ownerorgid double precision,
    masterdriver character varying(100),
    numberofcrew double precision,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8),
    createtimestamp timestamp(0) without time zone,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone,
    domainname character varying(50)
);

CREATE SEQUENCE "foliodb".vesselvehicleid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".vesselvehiclereference (
    vesselvehiclereferenceid double precision NOT NULL,
    vesselvehiclecode character varying(5),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8),
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50)
);

CREATE SEQUENCE "foliodb".vesselvehiclereferenceid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE "foliodb".vesselvehicletype (
    vesselvehicletypecode character varying(5) NOT NULL,
    vesselvehicletypename character varying(100) NOT NULL,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE TABLE "foliodb".zipcoderange (
    zipcoderangeid double precision NOT NULL,
    countrycode character(2) NOT NULL,
    ziprangestart integer,
    ziprangeend integer,
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    createuserid character varying(8) NOT NULL,
    createtimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lastupdateuserid character varying(8),
    lastupdatetimestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    domainname character varying(50) NOT NULL
);

CREATE SEQUENCE "foliodb".zipcoderangeid
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE ONLY "foliodb".accessorial
    ADD CONSTRAINT pk_accessorial PRIMARY KEY (accessorialid);

ALTER TABLE ONLY "foliodb".accessorialcost
    ADD CONSTRAINT pk_accessorialcost PRIMARY KEY (accessorialcostid);

ALTER TABLE ONLY "foliodb".accessorialeffectrangetype
    ADD CONSTRAINT pk_accessorialeffectrangetype PRIMARY KEY (accessorialeffectrangetypecode);

ALTER TABLE ONLY "foliodb".accessoriallocation
    ADD CONSTRAINT pk_accessoriallocation PRIMARY KEY (accessoriallocationid);

ALTER TABLE ONLY "foliodb".accessorialtype
    ADD CONSTRAINT pk_accessorialtype PRIMARY KEY (accessorialtypecode);

ALTER TABLE ONLY "foliodb".address
    ADD CONSTRAINT pk_address PRIMARY KEY (addressid);

ALTER TABLE ONLY "foliodb".addresstype
    ADD CONSTRAINT pk_addresstype PRIMARY KEY (addresstypecode);

ALTER TABLE ONLY "foliodb".appointment
    ADD CONSTRAINT pk_appointment PRIMARY KEY (apptid);

ALTER TABLE ONLY "foliodb".appointmentreason
    ADD CONSTRAINT pk_appointmentreason PRIMARY KEY (appointmentreasoncode);

ALTER TABLE ONLY "foliodb".appointmentslot
    ADD CONSTRAINT pk_appointmentslotid PRIMARY KEY (appointmentslotid);

ALTER TABLE ONLY "foliodb".apptstatustype
    ADD CONSTRAINT pk_apptstatustype PRIMARY KEY (apptstatuscode);

ALTER TABLE ONLY "foliodb".bolstatustype
    ADD CONSTRAINT pk_bolstatustype PRIMARY KEY (bolstatustypecode);

ALTER TABLE ONLY "foliodb".businessactivities
    ADD CONSTRAINT pk_businessactivities PRIMARY KEY (businessactivitiescode);

ALTER TABLE ONLY "foliodb".carriercontainertype
    ADD CONSTRAINT pk_carriercontainertype PRIMARY KEY (carriercontainertypecode);

ALTER TABLE ONLY "foliodb".commodityclass
    ADD CONSTRAINT pk_commodityclass PRIMARY KEY (commodityclassid);

ALTER TABLE ONLY "foliodb".commodityclassgroup
    ADD CONSTRAINT pk_commodityclassgroup PRIMARY KEY (commodityclassgroupid);

ALTER TABLE ONLY "foliodb".commodityclassgroupmembership
    ADD CONSTRAINT pk_commodityclassgroupmembersh PRIMARY KEY (commodityclassgroupid, commodityclassid);

ALTER TABLE ONLY "foliodb".commodityclasstype
    ADD CONSTRAINT pk_commodityclasstype PRIMARY KEY (commodityclasstypecode);

ALTER TABLE ONLY "foliodb".communicationmethod
    ADD CONSTRAINT pk_communicationmethod PRIMARY KEY (communicationmethodid);

ALTER TABLE ONLY "foliodb".communicationmethodtype
    ADD CONSTRAINT pk_communicationmethodtype PRIMARY KEY (communicationmethodtypecode);

ALTER TABLE ONLY "foliodb".contactsalutation
    ADD CONSTRAINT pk_contactsalutation PRIMARY KEY (contactsalutationcode);

ALTER TABLE ONLY "foliodb".container
    ADD CONSTRAINT pk_container PRIMARY KEY (containerid);

ALTER TABLE ONLY "foliodb".containergroupmembership
    ADD CONSTRAINT pk_containergroupmembership PRIMARY KEY (containergroupmembershipid);

ALTER TABLE ONLY "foliodb".containerownermembership
    ADD CONSTRAINT pk_containerownermembership PRIMARY KEY (containerid, containerinitial, containernumber, orgid);

ALTER TABLE ONLY "foliodb".containerstatus
    ADD CONSTRAINT pk_containerstatus PRIMARY KEY (containerstatuscode);

ALTER TABLE ONLY "foliodb".containerterminalactivity
    ADD CONSTRAINT pk_containerterminalactivity PRIMARY KEY (containerterminalactivityid);

ALTER TABLE ONLY "foliodb".containerterminalactivityitem
    ADD CONSTRAINT pk_containerterminalitem PRIMARY KEY (containerterminalitemid);

ALTER TABLE ONLY "foliodb".containertype
    ADD CONSTRAINT pk_containertype PRIMARY KEY (containertypecode);

ALTER TABLE ONLY "foliodb".containertypegroup
    ADD CONSTRAINT pk_containertypegroup PRIMARY KEY (containertypegroupid);

ALTER TABLE ONLY "foliodb".containertypemode
    ADD CONSTRAINT pk_containertypemode PRIMARY KEY (containertypemodeid);

ALTER TABLE ONLY "foliodb".conveyagencytype
    ADD CONSTRAINT pk_conveyagencytype PRIMARY KEY (conveyagencytypecode);

ALTER TABLE ONLY "foliodb".conveyance
    ADD CONSTRAINT pk_conveyance PRIMARY KEY (conveyanceid);

ALTER TABLE ONLY "foliodb".conveyancecategory
    ADD CONSTRAINT pk_conveyancecategory PRIMARY KEY (conveyancecategorycode);

ALTER TABLE ONLY "foliodb".conveyancecolortype
    ADD CONSTRAINT pk_conveyancecolortype PRIMARY KEY (conveyancecolortypecode);

ALTER TABLE ONLY "foliodb".conveyancemaketype
    ADD CONSTRAINT pk_conveyancemaketype PRIMARY KEY (conveyancemaketypecode);

ALTER TABLE ONLY "foliodb".conveyancemodeltype
    ADD CONSTRAINT pk_conveyancemodeltype PRIMARY KEY (conveyancemodeltypecode);

ALTER TABLE ONLY "foliodb".conveyancestatus
    ADD CONSTRAINT pk_conveyancestatus PRIMARY KEY (conveystatuscode);

ALTER TABLE ONLY "foliodb".conveyancetype
    ADD CONSTRAINT pk_conveyancetype PRIMARY KEY (conveyancetypecode);

ALTER TABLE ONLY "foliodb".conveyinstance
    ADD CONSTRAINT pk_conveyinstance PRIMARY KEY (conveyinstanceid);

ALTER TABLE ONLY "foliodb".conveyinstanceorgassoc
    ADD CONSTRAINT pk_conveyinstanceorgassoc PRIMARY KEY (conveyinstanceorgassocid);

ALTER TABLE ONLY "foliodb".conveyreference
    ADD CONSTRAINT pk_conveyreference PRIMARY KEY (conveyreferenceid);

ALTER TABLE ONLY "foliodb".conveyreferencetype
    ADD CONSTRAINT pk_conveyreferencetype PRIMARY KEY (conveyreferencetypecode);

ALTER TABLE ONLY "foliodb".country
    ADD CONSTRAINT pk_country PRIMARY KEY (countrycode);

ALTER TABLE ONLY "foliodb".currencyvalue
    ADD CONSTRAINT pk_currencyvalue PRIMARY KEY (currencyvalueid);

ALTER TABLE ONLY "foliodb".dataresolutionlog
    ADD CONSTRAINT pk_dataresolutionlog PRIMARY KEY (dataresolutionlogid);

ALTER TABLE ONLY "foliodb".dataresolutiontype
    ADD CONSTRAINT pk_dataresolutiontype PRIMARY KEY (resolvetypecode);

ALTER TABLE ONLY "foliodb".dataresolutionvalue
    ADD CONSTRAINT pk_dataresolutionvalue PRIMARY KEY (dataresolutionvalueid);

ALTER TABLE ONLY "foliodb".datetimestampreference
    ADD CONSTRAINT pk_datetimestampreference PRIMARY KEY (datetimestampreferenceid);

ALTER TABLE ONLY "foliodb".datetimestampreferencetype
    ADD CONSTRAINT pk_datetimestampreferencetype PRIMARY KEY (datetimestampreferencetypecode);

ALTER TABLE ONLY "foliodb".deliverytimegroup
    ADD CONSTRAINT pk_deliverytimegroup PRIMARY KEY (deliverytimegroupid);

ALTER TABLE ONLY "foliodb".deliverytimegroupmembership
    ADD CONSTRAINT pk_deliverytimegroupmembership PRIMARY KEY (laneid, deliverytimegroupid);

ALTER TABLE ONLY "foliodb".determinant
    ADD CONSTRAINT pk_determinant PRIMARY KEY (determinantid);

ALTER TABLE ONLY "foliodb".dockreceipt
    ADD CONSTRAINT pk_dockreceipt PRIMARY KEY (dockreceiptid);

ALTER TABLE ONLY "foliodb".docsubmission
    ADD CONSTRAINT pk_docsubmission PRIMARY KEY (docsubmissionid);

ALTER TABLE ONLY "foliodb".docsubmissionstatus
    ADD CONSTRAINT pk_docsubmissionstatus PRIMARY KEY (docsubmissionstatuscode);

ALTER TABLE ONLY "foliodb".docsubmissionstatushistory
    ADD CONSTRAINT pk_docsubmissionstatushistory PRIMARY KEY (docsubmissionstatushistoryid);

ALTER TABLE ONLY "foliodb".document
    ADD CONSTRAINT pk_document PRIMARY KEY (documentid);

ALTER TABLE ONLY "foliodb".documentdata
    ADD CONSTRAINT pk_documentdata PRIMARY KEY (documentid);

ALTER TABLE ONLY "foliodb".documentdomainobjectmembership
    ADD CONSTRAINT pk_documentdomainobjectmembers PRIMARY KEY (domainobjectcode, domainobjectid, documentid);

ALTER TABLE ONLY "foliodb".documentfield
    ADD CONSTRAINT pk_documentfield PRIMARY KEY (documentfieldid);

ALTER TABLE ONLY "foliodb".documentformattype
    ADD CONSTRAINT pk_documentformattype PRIMARY KEY (documentformattypecode);

ALTER TABLE ONLY "foliodb".documentstatus
    ADD CONSTRAINT pk_documentstatus PRIMARY KEY (documentstatuscode);

ALTER TABLE ONLY "foliodb".documentstatushistory
    ADD CONSTRAINT pk_documentstatushistory PRIMARY KEY (documentstatushistoryid);

ALTER TABLE ONLY "foliodb".documenttemplate
    ADD CONSTRAINT pk_documenttemplate PRIMARY KEY (documenttemplateid);

ALTER TABLE ONLY "foliodb".documenttype
    ADD CONSTRAINT pk_documenttype PRIMARY KEY (documenttypecode);

ALTER TABLE ONLY "foliodb".domainobject
    ADD CONSTRAINT pk_domainobject PRIMARY KEY (domainobjectcode);

ALTER TABLE ONLY "foliodb".dvecost
    ADD CONSTRAINT pk_dvecost PRIMARY KEY (dvecostid);

ALTER TABLE ONLY "foliodb".dvetype
    ADD CONSTRAINT pk_dvetype PRIMARY KEY (dvetypecode);

ALTER TABLE ONLY "foliodb".edi_iso_equipmenttype
    ADD CONSTRAINT pk_edi_iso_equipmenttype PRIMARY KEY (equipmenttypecode);

ALTER TABLE ONLY "foliodb".edi_iso_packagetype
    ADD CONSTRAINT pk_edi_iso_packagetype PRIMARY KEY (packagetypecode);

ALTER TABLE ONLY "foliodb".edimessagelog
    ADD CONSTRAINT pk_edimessagelog PRIMARY KEY (edimessagelogid);

ALTER TABLE ONLY "foliodb".editransactionset
    ADD CONSTRAINT pk_editransactionset PRIMARY KEY (editransactionsetcode);

ALTER TABLE ONLY "foliodb".emesgtype
    ADD CONSTRAINT pk_emesgtype PRIMARY KEY (emesgtypeid);

ALTER TABLE ONLY "foliodb".equipmentstatus
    ADD CONSTRAINT pk_equipmentstatus PRIMARY KEY (equipmentstatuscode);

ALTER TABLE ONLY "foliodb".edi_iso_equipmenttypegroup
    ADD CONSTRAINT pk_equipmenttypegroup PRIMARY KEY (equipmenttypegroupcode);

ALTER TABLE ONLY "foliodb".event
    ADD CONSTRAINT pk_event PRIMARY KEY (eventid);

ALTER TABLE ONLY "foliodb".eventcategory
    ADD CONSTRAINT pk_eventcategory PRIMARY KEY (eventcategorycode);

ALTER TABLE ONLY "foliodb".eventdocument
    ADD CONSTRAINT pk_eventdocument PRIMARY KEY (eventdocumentid);

ALTER TABLE ONLY "foliodb".eventreference
    ADD CONSTRAINT pk_eventreference PRIMARY KEY (eventreferenceid);

ALTER TABLE ONLY "foliodb".eventreferencetype
    ADD CONSTRAINT pk_eventreferencetype PRIMARY KEY (eventreferencetypecode);

ALTER TABLE ONLY "foliodb".eventstop
    ADD CONSTRAINT pk_eventstop PRIMARY KEY (eventstopid);

ALTER TABLE ONLY "foliodb".eventtype
    ADD CONSTRAINT pk_eventtype PRIMARY KEY (eventtypecode);

ALTER TABLE ONLY "foliodb".exportinformationtype
    ADD CONSTRAINT pk_exportinformationtype PRIMARY KEY (exportinformationtypecode);

ALTER TABLE ONLY "foliodb".financialaccounting
    ADD CONSTRAINT pk_financialaccounting PRIMARY KEY (financialaccountingid);

ALTER TABLE ONLY "foliodb".freightpaymenttype
    ADD CONSTRAINT pk_freightpaymenttype PRIMARY KEY (freightpaymenttypecode);

ALTER TABLE ONLY "foliodb".geolocation
    ADD CONSTRAINT pk_geolocation PRIMARY KEY (geolocationid);

ALTER TABLE ONLY "foliodb".geotype
    ADD CONSTRAINT pk_geotype PRIMARY KEY (geotypecode);

ALTER TABLE ONLY "foliodb".hazmatmaterialtype
    ADD CONSTRAINT pk_hazmaterial PRIMARY KEY (hazmatmaterialtypecode);

ALTER TABLE ONLY "foliodb".holiday
    ADD CONSTRAINT pk_holiday PRIMARY KEY (holidaycode);

ALTER TABLE ONLY "foliodb".holidayinstance
    ADD CONSTRAINT pk_holidayinstance PRIMARY KEY (holidayinstanceid);

ALTER TABLE ONLY "foliodb".holidayoperatinghours
    ADD CONSTRAINT pk_holidayoperatinghours PRIMARY KEY (holidayoperatinghoursid);

ALTER TABLE ONLY "foliodb".inbondtype
    ADD CONSTRAINT pk_inbondtype PRIMARY KEY (inbondtypecode);

ALTER TABLE ONLY "foliodb".incotermstype
    ADD CONSTRAINT pk_incotermstype PRIMARY KEY (incotermstypecode);

ALTER TABLE ONLY "foliodb".inspectionorcheck
    ADD CONSTRAINT pk_inspectionorcheck PRIMARY KEY (inspectionorcheckid);

ALTER TABLE ONLY "foliodb".inspectionorchecktype
    ADD CONSTRAINT pk_inspectionorchecktype PRIMARY KEY (inspectionorchecktypecode);

ALTER TABLE ONLY "foliodb".invoice
    ADD CONSTRAINT pk_invoice PRIMARY KEY (invoiceid);

ALTER TABLE ONLY "foliodb".invoicecharge
    ADD CONSTRAINT pk_invoicecharge PRIMARY KEY (invoicechargeid);

ALTER TABLE ONLY "foliodb".invoicechargetype
    ADD CONSTRAINT pk_invoicechargetype PRIMARY KEY (invoicechargetypecode);

ALTER TABLE ONLY "foliodb".invoicedetail
    ADD CONSTRAINT pk_invoicedetail PRIMARY KEY (invoicedetailid);

ALTER TABLE ONLY "foliodb".invoicelineitem
    ADD CONSTRAINT pk_invoicelineitem PRIMARY KEY (invoicelineitemid);

ALTER TABLE ONLY "foliodb".invoicereference
    ADD CONSTRAINT pk_invoicereference PRIMARY KEY (invoicereferenceid);

ALTER TABLE ONLY "foliodb".invoicestatus
    ADD CONSTRAINT pk_invoicestatus PRIMARY KEY (invoicestatuscode);

ALTER TABLE ONLY "foliodb".involvedparty
    ADD CONSTRAINT pk_involvedparty PRIMARY KEY (involvedpartyid);

ALTER TABLE ONLY "foliodb".involvedpartyreference
    ADD CONSTRAINT pk_involvedpartyreference PRIMARY KEY (involvedpartyreferenceid);

ALTER TABLE ONLY "foliodb".involvedpartyreferencetype
    ADD CONSTRAINT pk_involvedpartyreferencetype PRIMARY KEY (involvedpartyreferencetypecode);

ALTER TABLE ONLY "foliodb".involvedpartytype
    ADD CONSTRAINT pk_involvedpartytype PRIMARY KEY (involvedpartytypecode);

ALTER TABLE ONLY "foliodb".item
    ADD CONSTRAINT pk_item PRIMARY KEY (itemid);

ALTER TABLE ONLY "foliodb".itemclassification
    ADD CONSTRAINT pk_itemclassification PRIMARY KEY (itemclassificationid);

ALTER TABLE ONLY "foliodb".itemclassificationtype
    ADD CONSTRAINT pk_itemclassificationtype PRIMARY KEY (itemclassificationtypecode);

ALTER TABLE ONLY "foliodb".itemcommodity
    ADD CONSTRAINT pk_itemcommodity PRIMARY KEY (itemcommodityid);

ALTER TABLE ONLY "foliodb".itemcountryoforigin
    ADD CONSTRAINT pk_itemcountryoforigin PRIMARY KEY (itemcountryoforiginid);

ALTER TABLE ONLY "foliodb".itemequivalency
    ADD CONSTRAINT pk_itemequivalency PRIMARY KEY (itemequivalencyid);

ALTER TABLE ONLY "foliodb".itemhazmattype
    ADD CONSTRAINT pk_itemhazmattype PRIMARY KEY (hazmattypeid);

ALTER TABLE ONLY "foliodb".itemhts
    ADD CONSTRAINT pk_itemhts PRIMARY KEY (itemhtsid);

ALTER TABLE ONLY "foliodb".itemitemequivalency
    ADD CONSTRAINT pk_itemitemequivalency PRIMARY KEY (itemid, itemequivalencyid);

ALTER TABLE ONLY "foliodb".itlclassification
    ADD CONSTRAINT pk_itlclassification PRIMARY KEY (itlclassificationcode);

ALTER TABLE ONLY "foliodb".lane
    ADD CONSTRAINT pk_lane PRIMARY KEY (laneid);

ALTER TABLE ONLY "foliodb".leg
    ADD CONSTRAINT pk_leg PRIMARY KEY (legid);

ALTER TABLE ONLY "foliodb".legcharge
    ADD CONSTRAINT pk_legcharge PRIMARY KEY (legchargeid);

ALTER TABLE ONLY "foliodb".legcontainer
    ADD CONSTRAINT pk_legcontainer PRIMARY KEY (legcontainerid);

ALTER TABLE ONLY "foliodb".legreference
    ADD CONSTRAINT pk_legreference PRIMARY KEY (legreferenceid);

ALTER TABLE ONLY "foliodb".legroutedetails
    ADD CONSTRAINT pk_legroutedetails PRIMARY KEY (legroutedetailsid);

ALTER TABLE ONLY "foliodb".legstatushistory
    ADD CONSTRAINT pk_legstatushistory PRIMARY KEY (legid, statustimestamp);

ALTER TABLE ONLY "foliodb".legstop
    ADD CONSTRAINT pk_legstop PRIMARY KEY (stopid);

ALTER TABLE ONLY "foliodb".legstophistory
    ADD CONSTRAINT pk_legstophistory PRIMARY KEY (legstophistoryid);

ALTER TABLE ONLY "foliodb".marksnumberstype
    ADD CONSTRAINT pk_marksnumberstype PRIMARY KEY (marksnumberstypecode);

ALTER TABLE ONLY "foliodb".methodofpayment
    ADD CONSTRAINT pk_methodofpayment PRIMARY KEY (methodofpaymentcode);

ALTER TABLE ONLY "foliodb".fdt_module
    ADD CONSTRAINT pk_module PRIMARY KEY (modulecode);

ALTER TABLE ONLY "foliodb".observedholiday
    ADD CONSTRAINT pk_observedholiday PRIMARY KEY (observedholidayid);

ALTER TABLE ONLY "foliodb".operatinghours
    ADD CONSTRAINT pk_operatinghours PRIMARY KEY (operatinghoursid);

ALTER TABLE ONLY "foliodb".operatingschedule
    ADD CONSTRAINT pk_operatingschedule PRIMARY KEY (operatingscheduleid);

ALTER TABLE ONLY "foliodb".orders
    ADD CONSTRAINT pk_order PRIMARY KEY (orderid);

ALTER TABLE ONLY "foliodb".orderinstruction
    ADD CONSTRAINT pk_orderinstruction PRIMARY KEY (orderinstructionid);

ALTER TABLE ONLY "foliodb".orderitem
    ADD CONSTRAINT pk_orderitem PRIMARY KEY (orderitemid);

ALTER TABLE ONLY "foliodb".orderreference
    ADD CONSTRAINT pk_orderreference PRIMARY KEY (orderreferenceid);

ALTER TABLE ONLY "foliodb".orderrelease
    ADD CONSTRAINT pk_orderrelease PRIMARY KEY (orderreleaseid);

ALTER TABLE ONLY "foliodb".orderreleaseinstruction
    ADD CONSTRAINT pk_orderreleaseinstruction PRIMARY KEY (orderreleaseinstructionid);

ALTER TABLE ONLY "foliodb".orderreleaseitem
    ADD CONSTRAINT pk_orderreleaseitem PRIMARY KEY (orderreleaseitemid);

ALTER TABLE ONLY "foliodb".orderreleasereference
    ADD CONSTRAINT pk_orderreleasereference PRIMARY KEY (orderreleasereferenceid);

ALTER TABLE ONLY "foliodb".orderstatus
    ADD CONSTRAINT pk_orderstatus PRIMARY KEY (orderstatuscode);

ALTER TABLE ONLY "foliodb".ordertemplate
    ADD CONSTRAINT pk_ordertemplate PRIMARY KEY (templateownertypecode, templateownerid, ordertemplateid);

ALTER TABLE ONLY "foliodb".ordertype
    ADD CONSTRAINT pk_ordertype PRIMARY KEY (ordertypecode);

ALTER TABLE ONLY "foliodb".orghierarchy
    ADD CONSTRAINT pk_orghierarchy PRIMARY KEY (orgid);

ALTER TABLE ONLY "foliodb".orghierarchytype
    ADD CONSTRAINT pk_orghierarchytype PRIMARY KEY (orghierarchytypecode);

ALTER TABLE ONLY "foliodb".orgreference
    ADD CONSTRAINT pk_orgreference PRIMARY KEY (orgreferenceid);

ALTER TABLE ONLY "foliodb".orgreferencetype
    ADD CONSTRAINT pk_orgreferencetype PRIMARY KEY (orgreferencetypecode);

ALTER TABLE ONLY "foliodb".orgrole
    ADD CONSTRAINT pk_orgrole PRIMARY KEY (orgrolecode);

ALTER TABLE ONLY "foliodb".othermeasuretype
    ADD CONSTRAINT pk_othermeasuretype PRIMARY KEY (othermeasuretypecode);

ALTER TABLE ONLY "foliodb".otherweightsandmeasures
    ADD CONSTRAINT pk_otherweightsandmeasures PRIMARY KEY (otherweightsandmeasuresid);

ALTER TABLE ONLY "foliodb".package
    ADD CONSTRAINT pk_package PRIMARY KEY (packageid);

ALTER TABLE ONLY "foliodb".packagelineitem
    ADD CONSTRAINT pk_packagelineitem PRIMARY KEY (packagelineitemid);

ALTER TABLE ONLY "foliodb".packagemarksnumbers
    ADD CONSTRAINT pk_packagemarksnumbers PRIMARY KEY (packagemarksnumbersid);

ALTER TABLE ONLY "foliodb".packagereference
    ADD CONSTRAINT pk_packagereference PRIMARY KEY (packagereferenceid);

ALTER TABLE ONLY "foliodb".packagereferencetype
    ADD CONSTRAINT pk_packagereferencetype PRIMARY KEY (packagereferencetypecode);

ALTER TABLE ONLY "foliodb".packagetransit
    ADD CONSTRAINT pk_packagetransit PRIMARY KEY (packagetransitid);

ALTER TABLE ONLY "foliodb".packagetype
    ADD CONSTRAINT pk_packagetype PRIMARY KEY (packagetypecode);

ALTER TABLE ONLY "foliodb".parcelshipmentpackage
    ADD CONSTRAINT pk_parcelshipmentpackage PRIMARY KEY (packageid);

ALTER TABLE ONLY "foliodb".payment
    ADD CONSTRAINT pk_payment PRIMARY KEY (paymentid);

ALTER TABLE ONLY "foliodb".paymenttermstype
    ADD CONSTRAINT pk_paymenttermstype PRIMARY KEY (paymenttermstypecode);

ALTER TABLE ONLY "foliodb".pickup
    ADD CONSTRAINT pk_pickup PRIMARY KEY (pickupid);

ALTER TABLE ONLY "foliodb".positionaldata
    ADD CONSTRAINT pk_positionaldata PRIMARY KEY (positionaldataid);

ALTER TABLE ONLY "foliodb".preadvicesourcetype
    ADD CONSTRAINT pk_preadvicesourcetype PRIMARY KEY (sourcetypecode);

ALTER TABLE ONLY "foliodb".fdt_product
    ADD CONSTRAINT pk_product PRIMARY KEY (productcode);

ALTER TABLE ONLY "foliodb".rate
    ADD CONSTRAINT pk_rate PRIMARY KEY (rateid);

ALTER TABLE ONLY "foliodb".ratecalculationtype
    ADD CONSTRAINT pk_ratecalculationtype PRIMARY KEY (ratecalculationtypecode);

ALTER TABLE ONLY "foliodb".ratecost
    ADD CONSTRAINT pk_ratecost PRIMARY KEY (ratecostid);

ALTER TABLE ONLY "foliodb".ratecosttype
    ADD CONSTRAINT pk_ratecosttype PRIMARY KEY (ratecosttypecode);

ALTER TABLE ONLY "foliodb".rategroup
    ADD CONSTRAINT pk_rategroup PRIMARY KEY (rategroupid);

ALTER TABLE ONLY "foliodb".rategroupmembership
    ADD CONSTRAINT pk_rategroupmembership PRIMARY KEY (rategroupid, laneid);

ALTER TABLE ONLY "foliodb".ratezone
    ADD CONSTRAINT pk_ratezone PRIMARY KEY (ratezoneid);

ALTER TABLE ONLY "foliodb".ratezonelane
    ADD CONSTRAINT pk_ratezonelane PRIMARY KEY (ratezoneid, laneid);

ALTER TABLE ONLY "foliodb".refcode
    ADD CONSTRAINT pk_refcode PRIMARY KEY (tablename, columnname, code);

ALTER TABLE ONLY "foliodb".region
    ADD CONSTRAINT pk_region PRIMARY KEY (regionid);

ALTER TABLE ONLY "foliodb".regionmembership
    ADD CONSTRAINT pk_regionmembership PRIMARY KEY (geolocationid, regionid);

ALTER TABLE ONLY "foliodb".roleroleassoc
    ADD CONSTRAINT pk_roleroleassoc PRIMARY KEY (roleroleassocid);

ALTER TABLE ONLY "foliodb".routingtemplate
    ADD CONSTRAINT pk_routingtemplate PRIMARY KEY (routingtemplateid);

ALTER TABLE ONLY "foliodb".routingtemplateleg
    ADD CONSTRAINT pk_routingtemplateleg PRIMARY KEY (routingtemplatelegid);

ALTER TABLE ONLY "foliodb".routingtemplatelegsserviceleve
    ADD CONSTRAINT pk_routingtemplatelegsservicel PRIMARY KEY (servicelevelcode, routingtemplatelegid);

ALTER TABLE ONLY "foliodb".securitydevice
    ADD CONSTRAINT pk_securitydevice PRIMARY KEY (securitydeviceid);

ALTER TABLE ONLY "foliodb".securitydeviceregistry
    ADD CONSTRAINT pk_securitydeviceregistry PRIMARY KEY (securitydeviceregistryid);

ALTER TABLE ONLY "foliodb".securitydevicetype
    ADD CONSTRAINT pk_securitydevicetype PRIMARY KEY (securitydevicetypeid);

ALTER TABLE ONLY "foliodb".securitydevicevalue
    ADD CONSTRAINT pk_securitydevicevalue PRIMARY KEY (securitydevicevalueid);

ALTER TABLE ONLY "foliodb".securitydevicevaluetype
    ADD CONSTRAINT pk_securitydevicevaluetype PRIMARY KEY (securitydevicevaluetypecode, securitydevicetypeid);

ALTER TABLE ONLY "foliodb".sellpacktype
    ADD CONSTRAINT pk_sellpacktype PRIMARY KEY (sellpacktypecode);

ALTER TABLE ONLY "foliodb".service
    ADD CONSTRAINT pk_service PRIMARY KEY (serviceid);

ALTER TABLE ONLY "foliodb".servicelevel
    ADD CONSTRAINT pk_servicelevel PRIMARY KEY (servicelevelcode);

ALTER TABLE ONLY "foliodb".serviceservicelevel
    ADD CONSTRAINT pk_serviceservicelevel PRIMARY KEY (servicelevelcode, serviceid);

ALTER TABLE ONLY "foliodb".servicetype
    ADD CONSTRAINT pk_servicetype PRIMARY KEY (servicetypecode);

ALTER TABLE ONLY "foliodb".shipment
    ADD CONSTRAINT pk_shipment PRIMARY KEY (shipmentid);

ALTER TABLE ONLY "foliodb".shipmentcharge
    ADD CONSTRAINT pk_shipmentcharge PRIMARY KEY (shipmentchargeid);

ALTER TABLE ONLY "foliodb".shipmentchargetype
    ADD CONSTRAINT pk_shipmentchargetype PRIMARY KEY (shipmentchargetypecode);

ALTER TABLE ONLY "foliodb".shipmentconsolidation
    ADD CONSTRAINT pk_shipmentconsolidation PRIMARY KEY (shipmentconsolidationid);

ALTER TABLE ONLY "foliodb".shipmentcontainerbooking
    ADD CONSTRAINT pk_shipmentcontainerbooking PRIMARY KEY (shipmentcontainerbookingid);

ALTER TABLE ONLY "foliodb".shipmentinstruction
    ADD CONSTRAINT pk_shipmentinstruction PRIMARY KEY (shipmentinstructionid);

ALTER TABLE ONLY "foliodb".shipmentinstructiontype
    ADD CONSTRAINT pk_shipmentinstructiontype PRIMARY KEY (shipmentinstructiontypecode);

ALTER TABLE ONLY "foliodb".shipmentreference
    ADD CONSTRAINT pk_shipmentreference PRIMARY KEY (shipmentreferenceid);

ALTER TABLE ONLY "foliodb".shipmentreferencetype
    ADD CONSTRAINT pk_shipmentreferencetype PRIMARY KEY (shipmentreferencetypecode);

ALTER TABLE ONLY "foliodb".shipmentstatus
    ADD CONSTRAINT pk_shipmentstatus PRIMARY KEY (shipmentstatuscode);

ALTER TABLE ONLY "foliodb".shipmentstatushistory
    ADD CONSTRAINT pk_shipmentstatushistory PRIMARY KEY (shipmentstatushistoryid);

ALTER TABLE ONLY "foliodb".shipmentterms
    ADD CONSTRAINT pk_shipmentterms PRIMARY KEY (shipmenttermscode);

ALTER TABLE ONLY "foliodb".stopfunction
    ADD CONSTRAINT pk_stopfunction PRIMARY KEY (stopfunctioncode);

ALTER TABLE ONLY "foliodb".tariff
    ADD CONSTRAINT pk_tariff PRIMARY KEY (tariffid);

ALTER TABLE ONLY "foliodb".templateownertype
    ADD CONSTRAINT pk_templateownertype PRIMARY KEY (templateownertypecode);

ALTER TABLE ONLY "foliodb".timezone
    ADD CONSTRAINT pk_timezone PRIMARY KEY (timezonecode);

ALTER TABLE ONLY "foliodb".transactionstatustype
    ADD CONSTRAINT pk_transactionstatustype PRIMARY KEY (transactionstatustypecode);

ALTER TABLE ONLY "foliodb".transitservicedistance
    ADD CONSTRAINT pk_transitservicedistance PRIMARY KEY (transitservicedistanceid);

ALTER TABLE ONLY "foliodb".transittimetype
    ADD CONSTRAINT pk_transittimetype PRIMARY KEY (transittimetypecode);

ALTER TABLE ONLY "foliodb".transportmode
    ADD CONSTRAINT pk_transportmode PRIMARY KEY (transportmodecode);

ALTER TABLE ONLY "foliodb".unitcategory
    ADD CONSTRAINT pk_unitcategory PRIMARY KEY (unitcategorycode);

ALTER TABLE ONLY "foliodb".unitconversion
    ADD CONSTRAINT pk_unitconversion PRIMARY KEY (uomcode, touomcode);

ALTER TABLE ONLY "foliodb".unitofmeasure
    ADD CONSTRAINT pk_unitofmeasure PRIMARY KEY (uomcode);

ALTER TABLE ONLY "foliodb".unitsystem
    ADD CONSTRAINT pk_unitsystem PRIMARY KEY (unitsystemcode);

ALTER TABLE ONLY "foliodb".vesselrole
    ADD CONSTRAINT pk_vesselrolecode PRIMARY KEY (vesselrolecode);

ALTER TABLE ONLY "foliodb".vesselvehicle
    ADD CONSTRAINT pk_vesselvehicle PRIMARY KEY (vesselvehicleid);

ALTER TABLE ONLY "foliodb".vesselvehiclereference
    ADD CONSTRAINT pk_vesselvehiclereference PRIMARY KEY (vesselvehiclereferenceid);

ALTER TABLE ONLY "foliodb".vesselvehicletype
    ADD CONSTRAINT pk_vesselvehicletype PRIMARY KEY (vesselvehicletypecode);

ALTER TABLE ONLY "foliodb".zipcoderange
    ADD CONSTRAINT pk_zipcoderange PRIMARY KEY (zipcoderangeid);

ALTER TABLE ONLY "foliodb".templatefield
    ADD CONSTRAINT templatefield_pk PRIMARY KEY (templatefieldid);

ALTER TABLE ONLY "foliodb".orgorgassoc
    ADD CONSTRAINT uq_orgorgassoc_srcdestrelation UNIQUE (srcorgid, destorgid, relationshiptypecode);

CREATE INDEX accessorial_accessorial_idx ON "foliodb".accessorial USING btree (accessorialtypecode);

CREATE INDEX accessorial_currency_idx ON "foliodb".accessorial USING btree (currencycode);

CREATE INDEX accessorial_determ_ap_idx ON "foliodb".accessorial USING btree (applicabilitydeterminantid);

CREATE INDEX accessorial_determ_ct_idx ON "foliodb".accessorial USING btree (costdeterminantid);

CREATE INDEX accessorial_rate_idx ON "foliodb".accessorial USING btree (rateid);

CREATE INDEX accessorial_tariff_idx ON "foliodb".accessorial USING btree (tariffid);

CREATE INDEX accessorialalloc_access_idx ON "foliodb".accessoriallocation USING btree (accessorialid);

CREATE INDEX accessorialalloc_address_idx ON "foliodb".accessoriallocation USING btree (addressid);

CREATE INDEX accessorialalloc_geoloc_idx ON "foliodb".accessoriallocation USING btree (geolocationid);

CREATE INDEX accessorialalloc_orgid_idx ON "foliodb".accessoriallocation USING btree (orgid);

CREATE INDEX accessorialalloc_region_idx ON "foliodb".accessoriallocation USING btree (regionid);

CREATE INDEX accessorialalloc_stopfun_idx ON "foliodb".accessoriallocation USING btree (stopfunctioncode);

CREATE INDEX accessorialcost_access_idx ON "foliodb".accessorialcost USING btree (accessorialid);

CREATE INDEX address_country_idx ON "foliodb".address USING btree (countrycode);

CREATE INDEX address_orgid_idx ON "foliodb".address USING btree (orgid);

CREATE INDEX commmethod_commmethodtype_idx ON "foliodb".communicationmethod USING btree (communicationmethodtypecode);

CREATE INDEX commmethod_involvedpartyid_idx ON "foliodb".communicationmethod USING btree (involvedpartyid);

CREATE INDEX commmethod_orghierarchy_idx ON "foliodb".communicationmethod USING btree (orgid);

CREATE INDEX commodityclass_pk_idx ON "foliodb".commodityclass USING btree (commodityclasstypecode);

CREATE INDEX commodityclassgroup_pk_idx ON "foliodb".commodityclassgroup USING btree (commodityclasstypecode);

CREATE INDEX container_orgid_idx ON "foliodb".container USING btree (orgid);

CREATE INDEX conveyance_conveyancetype_idx ON "foliodb".conveyance USING btree (conveyancetypecode);

CREATE INDEX conveyancetype_category_idx ON "foliodb".conveyancetype USING btree (conveyancecategorycode);

CREATE INDEX conveyinstance_conveyagncy_idx ON "foliodb".conveyinstance USING btree (conveyagencytypecode);

CREATE INDEX conveyinstance_conveyance_idx ON "foliodb".conveyinstance USING btree (conveyanceid);

CREATE INDEX conveyinstance_country_idx ON "foliodb".conveyinstance USING btree (registeredcountrycode);

CREATE INDEX conveyinstanceorg_cvyinst_idx ON "foliodb".conveyinstanceorgassoc USING btree (conveyinstanceid);

CREATE INDEX conveyinstanceorg_iptype_idx ON "foliodb".conveyinstanceorgassoc USING btree (involvedpartytypecode);

CREATE INDEX conveyinstanceorg_org_idx ON "foliodb".conveyinstanceorgassoc USING btree (orgid);

CREATE INDEX conveyreference_conveyance_idx ON "foliodb".conveyreference USING btree (conveyanceid);

CREATE INDEX conveyreference_conveyinst_idx ON "foliodb".conveyreference USING btree (conveyinstanceid);

CREATE INDEX conveyreference_crtype_idx ON "foliodb".conveyreference USING btree (conveyreferencetypecode);

CREATE INDEX datetimeref_domainobject_idx ON "foliodb".datetimestampreference USING btree (domainobjectcode);

CREATE INDEX datetimeref_dtsreftype_idx ON "foliodb".datetimestampreference USING btree (datetimestampreferencetypecode);

CREATE INDEX datetimeref_event_idx ON "foliodb".datetimestampreference USING btree (eventid);

CREATE INDEX datetimeref_invoice_idx ON "foliodb".datetimestampreference USING btree (invoiceid);

CREATE INDEX datetimeref_invoicedetail_idx ON "foliodb".datetimestampreference USING btree (invoicedetailid);

CREATE INDEX datetimeref_leg_idx ON "foliodb".datetimestampreference USING btree (legid);

CREATE INDEX datetimeref_legcontainer_idx ON "foliodb".datetimestampreference USING btree (legcontainerid);

CREATE INDEX datetimeref_legroutedet_idx ON "foliodb".datetimestampreference USING btree (legroutedetailsid);

CREATE INDEX datetimeref_order_idx ON "foliodb".datetimestampreference USING btree (orderid);

CREATE INDEX datetimeref_orderrelease_idx ON "foliodb".datetimestampreference USING btree (orderreleaseid);

CREATE INDEX datetimeref_package_idx ON "foliodb".datetimestampreference USING btree (packageid);

CREATE INDEX datetimeref_shipment_idx ON "foliodb".datetimestampreference USING btree (shipmentid);

CREATE INDEX datetimetref_invoiceli_idx ON "foliodb".datetimestampreference USING btree (invoicelineitemid);

CREATE INDEX docstatushist_docid_idx ON "foliodb".documentstatushistory USING btree (documentid);

CREATE INDEX docstatushist_frmdocstatus_idx ON "foliodb".documentstatushistory USING btree (fromdocumentstatuscode);

CREATE INDEX docstatushist_todocstatus_idx ON "foliodb".documentstatushistory USING btree (todocumentstatuscode);

CREATE INDEX docsub_docid_idx ON "foliodb".docsubmission USING btree (documentid);

CREATE INDEX docsub_docstatus_idx ON "foliodb".docsubmission USING btree (docsubmissionstatuscode);

CREATE INDEX docsub_statusfrom_idx ON "foliodb".docsubmissionstatushistory USING btree (fromsubmissionstatuscode);

CREATE INDEX docsub_statusto_idx ON "foliodb".docsubmissionstatushistory USING btree (tosubmissionstatuscode);

CREATE INDEX docsubhist_docsubid_idx ON "foliodb".docsubmissionstatushistory USING btree (docsubmissionid);

CREATE INDEX doctemplate_docformattype_idx ON "foliodb".documenttemplate USING btree (documentformattypecode);

CREATE INDEX doctemplate_doctype_idx ON "foliodb".documenttemplate USING btree (documenttypecode);

CREATE INDEX document_docstatuscode_idx ON "foliodb".document USING btree (documentstatuscode);

CREATE INDEX document_template_idx ON "foliodb".document USING btree (documenttemplatenumber);

CREATE INDEX dvecost_dvetype_idx ON "foliodb".dvecost USING btree (dvetypecode);

CREATE INDEX dvecost_orderrelitm_pk_idx ON "foliodb".dvecost USING btree (orderreleaseitemid);

CREATE INDEX edi_equtype_modecode_idx ON "foliodb".edi_iso_equipmenttype USING btree (modecode);

CREATE INDEX edimessagelog_createuserid ON "foliodb".edimessagelog USING btree (createuserid);

CREATE INDEX edimessagelog_domainname ON "foliodb".edimessagelog USING btree (domainname);

CREATE INDEX edimessagelog_msgstatus ON "foliodb".edimessagelog USING btree (msgstatus);

CREATE INDEX edimessagelog_msgtype ON "foliodb".edimessagelog USING btree (msgtype);

CREATE INDEX event_address_idx ON "foliodb".event USING btree (eventaddressid);

CREATE INDEX event_container_idx ON "foliodb".event USING btree (containerid);

CREATE INDEX event_containertype_idx ON "foliodb".event USING btree (containertypecode);

CREATE INDEX event_conveyinstance_idx ON "foliodb".event USING btree (conveyinstanceid);

CREATE INDEX event_domainobj_idx ON "foliodb".event USING btree (domainobjectcode);

CREATE INDEX event_eqipstatus_idx ON "foliodb".event USING btree (equipmentstatuscode);

CREATE INDEX event_eventcategory_idx ON "foliodb".event USING btree (eventcategorycode);

CREATE INDEX event_eventtype_idx ON "foliodb".event USING btree (eventtypecode);

CREATE INDEX event_legcontainer_idx ON "foliodb".event USING btree (legcontainerid);

CREATE INDEX event_legid_idx ON "foliodb".event USING btree (legid);

CREATE INDEX event_modecode_next_idx ON "foliodb".event USING btree (nexttransportmodetypecode);

CREATE INDEX event_orderid_idx ON "foliodb".event USING btree (orderid);

CREATE INDEX event_packageid_idx ON "foliodb".event USING btree (packageid);

CREATE INDEX event_shipmentid_idx ON "foliodb".event USING btree (shipmentid);

CREATE INDEX event_transmode_idx ON "foliodb".event USING btree (transportmodetypecode);

CREATE INDEX event_transstatus_idx ON "foliodb".event USING btree (transactionstatustypecode);

CREATE INDEX event_vesselrole_idx ON "foliodb".event USING btree (vesselvehiclerolecode);

CREATE INDEX event_vesselvehicle_id ON "foliodb".event USING btree (vesselvehicleid);

CREATE INDEX event_vesselvehicle_next_idx ON "foliodb".event USING btree (nextvesselvehicleid);

CREATE INDEX eventdocument_event_idx ON "foliodb".eventdocument USING btree (eventid);

CREATE INDEX eventreference_event_idx ON "foliodb".eventreference USING btree (eventid);

CREATE INDEX eventreference_type_idx ON "foliodb".eventreference USING btree (eventreferencetypecode);

CREATE INDEX eventstop_address_idx ON "foliodb".eventstop USING btree (addressid);

CREATE INDEX eventstop_eventid_idx ON "foliodb".eventstop USING btree (eventid);

CREATE INDEX eventstop_stopfunction_idx ON "foliodb".eventstop USING btree (stopfunctioncode);

CREATE INDEX financialacct_currency_idx ON "foliodb".financialaccounting USING btree (currencycode);

CREATE INDEX financialacct_invoicechrg_idx ON "foliodb".financialaccounting USING btree (invoicechargeid);

CREATE INDEX financialacct_orghierarchy_idx ON "foliodb".financialaccounting USING btree (breakdownstructureorgid);

CREATE INDEX financialacct_shpcrgtype_idx ON "foliodb".financialaccounting USING btree (shipmentchargetypecode);

CREATE INDEX geolocation_country_idx ON "foliodb".geolocation USING btree (countrycode);

CREATE INDEX holiday_country_idx ON "foliodb".holiday USING btree (countrycode);

CREATE INDEX holidayinstance_code_idx ON "foliodb".holidayinstance USING btree (holidaycode);

CREATE INDEX inspectionorcheck_event_idx ON "foliodb".inspectionorcheck USING btree (eventid);

CREATE INDEX inspectionorcheck_type_idx ON "foliodb".inspectionorcheck USING btree (inspectionorchecktypecode);

CREATE INDEX invoice_baseinvoice_idx ON "foliodb".invoice USING btree (baseinvoiceid);

CREATE INDEX invoice_billingcurrency_idx ON "foliodb".invoice USING btree (billingcurrencycode);

CREATE INDEX invoice_incoterms_idx ON "foliodb".invoice USING btree (incotermstypecode);

CREATE INDEX invoice_invoicestatus_idx ON "foliodb".invoice USING btree (invoicestatuscode);

CREATE INDEX invoice_methodpayment_idx ON "foliodb".invoice USING btree (methodofpaymentcode);

CREATE INDEX invoice_modecode_idx ON "foliodb".invoice USING btree (modecode);

CREATE INDEX invoice_netcurrency_idx ON "foliodb".invoice USING btree (netamountcurrencycode);

CREATE INDEX invoice_paymentcurrency_idx ON "foliodb".invoice USING btree (paymentcurrencycode);

CREATE INDEX invoice_paymentermstype_idx ON "foliodb".invoice USING btree (paymenttermstypecode);

CREATE INDEX invoice_shipmentterms_idx ON "foliodb".invoice USING btree (shipmenttermscode);

CREATE INDEX invoice_transstatustype_idx ON "foliodb".invoice USING btree (transactionstatustypecode);

CREATE INDEX invoicecharge_currency_chg_idx ON "foliodb".invoicecharge USING btree (chargecurrencycode);

CREATE INDEX invoicecharge_currency_dec_idx ON "foliodb".invoicecharge USING btree (declaredvaluecurrencycode);

CREATE INDEX invoicecharge_invoiceli_idx ON "foliodb".invoicecharge USING btree (invoicelineitemid);

CREATE INDEX invoicecharge_ratecost_idx ON "foliodb".invoicecharge USING btree (ratecostid);

CREATE INDEX invoicechargetype_org_idx ON "foliodb".invoicechargetype USING btree (carrierorgid);

CREATE INDEX invoicecrgtype_shipcrgtype_idx ON "foliodb".invoicechargetype USING btree (shipmentchargetypecode);

CREATE INDEX invoicedetail_currency_net_idx ON "foliodb".invoicedetail USING btree (netamountduecurrencycode);

CREATE INDEX invoicedetail_destaddress_idx ON "foliodb".invoicedetail USING btree (destinationaddressid);

CREATE INDEX invoicedetail_invoice_idx ON "foliodb".invoicedetail USING btree (invoiceid);

CREATE INDEX invoicedetail_invoicestats_idx ON "foliodb".invoicedetail USING btree (invoicestatuscode);

CREATE INDEX invoicedetail_leg_idx ON "foliodb".invoicedetail USING btree (legid);

CREATE INDEX invoicedetail_methodpaymnt_idx ON "foliodb".invoicedetail USING btree (methodofpaymentcode);

CREATE INDEX invoicedetail_order_idx ON "foliodb".invoicedetail USING btree (orderid);

CREATE INDEX invoicedetail_originaddr_idx ON "foliodb".invoicedetail USING btree (originaddressid);

CREATE INDEX invoicedetail_shipment_idx ON "foliodb".invoicedetail USING btree (shipmentid);

CREATE INDEX invoicedetail_shipmentterm_idx ON "foliodb".invoicedetail USING btree (shipmenttermscode);

CREATE INDEX invoicedetail_transportmd_idx ON "foliodb".invoicedetail USING btree (transportmodecode);

CREATE INDEX invoiceli_commodityclass_idx ON "foliodb".invoicelineitem USING btree (commodityclassid);

CREATE INDEX invoiceli_leg_idx ON "foliodb".invoicelineitem USING btree (legid);

CREATE INDEX invoiceli_order_idx ON "foliodb".invoicelineitem USING btree (orderid);

CREATE INDEX invoiceli_orderrelease_idx ON "foliodb".invoicelineitem USING btree (orderreleaseid);

CREATE INDEX invoiceli_package_idx ON "foliodb".invoicelineitem USING btree (packageid);

CREATE INDEX invoiceli_shipment_idx ON "foliodb".invoicelineitem USING btree (shipmentid);

CREATE INDEX invoiceli_tariff_idx ON "foliodb".invoicelineitem USING btree (tariffid);

CREATE INDEX invoiceref_invoicecharge_idx ON "foliodb".invoicereference USING btree (invoicechargeid);

CREATE INDEX invoiceref_invoicedetail_idx ON "foliodb".invoicereference USING btree (invoicedetailid);

CREATE INDEX invoiceref_invoiceli_idx ON "foliodb".invoicereference USING btree (invoicelineitemid);

CREATE INDEX invoicereference_invoice_idx ON "foliodb".invoicereference USING btree (invoiceid);

CREATE INDEX invoicereference_shipref_idx ON "foliodb".invoicereference USING btree (shipmentreferencetypecode);

CREATE INDEX involvedpartyref_ipreftype_idx ON "foliodb".involvedpartyreference USING btree (involvedpartyreferencetypecode);

CREATE INDEX ip_countrycode_idx ON "foliodb".involvedparty USING btree (countrycode);

CREATE INDEX ip_domaonobj_idx ON "foliodb".involvedparty USING btree (domainobjectcode);

CREATE INDEX ip_eventid_idx ON "foliodb".involvedparty USING btree (eventid);

CREATE INDEX ip_invoicedetail_idx ON "foliodb".involvedparty USING btree (invoicedetailid);

CREATE INDEX ip_invoiceid_idx ON "foliodb".involvedparty USING btree (invoiceid);

CREATE INDEX ip_iptypecode_idx ON "foliodb".involvedparty USING btree (involvedpartytypecode);

CREATE INDEX ip_legid_idx ON "foliodb".involvedparty USING btree (legid);

CREATE INDEX ip_orderid_idx ON "foliodb".involvedparty USING btree (orderid);

CREATE INDEX ip_orgid_idx ON "foliodb".involvedparty USING btree (orgid);

CREATE INDEX ip_prefcommmode_idx ON "foliodb".involvedparty USING btree (preferredcommunicationmethod);

CREATE INDEX ip_shipmentid_idx ON "foliodb".involvedparty USING btree (shipmentid);

CREATE INDEX item_orgid_idx ON "foliodb".item USING btree (orgid);

CREATE INDEX itemclassification_class_idx ON "foliodb".itemclassification USING btree (itemclassificationtypecode);

CREATE INDEX itemclassification_item_idx ON "foliodb".itemclassification USING btree (itemid);

CREATE INDEX itemcountryoforigin_countr_idx ON "foliodb".itemcountryoforigin USING btree (countrycode);

CREATE INDEX itemcountryoforigin_item_idx ON "foliodb".itemcountryoforigin USING btree (itemid);

CREATE INDEX itemequivalency_org_idx ON "foliodb".itemequivalency USING btree (orgid);

CREATE INDEX itemhazmat_domainobject_idx ON "foliodb".itemhazmattype USING btree (domainobjectcode);

CREATE INDEX itemhazmat_event_idx ON "foliodb".itemhazmattype USING btree (eventid);

CREATE INDEX itemhazmat_item_idx ON "foliodb".itemhazmattype USING btree (itemid);

CREATE INDEX itemhazmat_itemhazmattype_idx ON "foliodb".itemhazmattype USING btree (hazmatmaterialtypecode);

CREATE INDEX itemhazmat_leg_idx ON "foliodb".itemhazmattype USING btree (legid);

CREATE INDEX itemhazmat_legcontainer_idx ON "foliodb".itemhazmattype USING btree (legcontainerid);

CREATE INDEX itemhazmat_package_idx ON "foliodb".itemhazmattype USING btree (packageid);

CREATE INDEX itemhazmat_shipment_idx ON "foliodb".itemhazmattype USING btree (shipmentid);

CREATE INDEX itemhts_country_idx ON "foliodb".itemhts USING btree (countrycode);

CREATE INDEX itemhts_domainobject_idx ON "foliodb".itemhts USING btree (domainobjectcode);

CREATE INDEX itemhts_item_idx ON "foliodb".itemhts USING btree (itemid);

CREATE INDEX itemhts_itemclasscode_idx ON "foliodb".itemhts USING btree (itlclassificationcode);

CREATE INDEX lane_destaddress_idx ON "foliodb".lane USING btree (destinationaddressid);

CREATE INDEX lane_destgeolocation_idx ON "foliodb".lane USING btree (destinationgeolocationid);

CREATE INDEX lane_destregion_idx ON "foliodb".lane USING btree (destinationregionid);

CREATE INDEX lane_origaddress_idx ON "foliodb".lane USING btree (originaddressid);

CREATE INDEX lane_origgeolocation_idx ON "foliodb".lane USING btree (origingeolocationid);

CREATE INDEX lane_origregion_idx ON "foliodb".lane USING btree (originregionid);

CREATE INDEX leg_destaddressid_idx ON "foliodb".leg USING btree (destinationaddressid);

CREATE INDEX leg_incotermstype_idx ON "foliodb".leg USING btree (incotermstypecode);

CREATE INDEX leg_methodofpayment_idx ON "foliodb".leg USING btree (methodofpaymentcode);

CREATE INDEX leg_modecode_idx ON "foliodb".leg USING btree (modecode);

CREATE INDEX leg_originaddressid_idx ON "foliodb".leg USING btree (originaddressid);

CREATE INDEX leg_paymentterms_idx ON "foliodb".leg USING btree (paymenttermstypecode);

CREATE INDEX leg_servicetype_idx ON "foliodb".leg USING btree (servicetypecode);

CREATE INDEX leg_shipmentid_idx ON "foliodb".leg USING btree (shipmentid);

CREATE INDEX leg_shipmentstatus_idx ON "foliodb".leg USING btree (legstatuscode);

CREATE INDEX leg_transactionstatus_idx ON "foliodb".leg USING btree (transactionstatustypecode);

CREATE INDEX legcharge_frghtpaymtterms_idx ON "foliodb".legcharge USING btree (freightpaymenttypecode);

CREATE INDEX legcharge_leg_idx ON "foliodb".legcharge USING btree (legid);

CREATE INDEX legcontainer_containerid_idx ON "foliodb".legcontainer USING btree (containerid);

CREATE INDEX legcontainer_leg_idx ON "foliodb".legcontainer USING btree (legid);

CREATE INDEX legcontainer_servicetype_idx ON "foliodb".legcontainer USING btree (servicetypecode);

CREATE INDEX legcontainer_typeid_idx ON "foliodb".legcontainer USING btree (containertypecode);

CREATE INDEX legreference_leg_idx ON "foliodb".legreference USING btree (legid);

CREATE INDEX legreference_shiptype_idx ON "foliodb".legreference USING btree (shipmentreferencetypecode);

CREATE INDEX legreference_typevalue_idx ON "foliodb".legreference USING btree (shipmentreferencetypecode, legreferencevalue);

CREATE INDEX legroutedet_modecode_idx ON "foliodb".legroutedetails USING btree (modecode);

CREATE INDEX legroutedet_vesselvehcle_idx ON "foliodb".legroutedetails USING btree (vesselvehicleid);

CREATE INDEX legroutedetails_legid_idx ON "foliodb".legroutedetails USING btree (legid);

CREATE INDEX legroutedetails_vesselrole_idx ON "foliodb".legroutedetails USING btree (vesselrolecode);

CREATE INDEX legrtdtl_conveyinstance_idx ON "foliodb".legroutedetails USING btree (conveyinstanceid);

CREATE INDEX legstop_address_idx ON "foliodb".legstop USING btree (addressid);

CREATE INDEX legstop_leg_idx ON "foliodb".legstop USING btree (legid);

CREATE INDEX legstophistory_address_idx ON "foliodb".legstophistory USING btree (addressid);

CREATE INDEX legstophistory_leg_idx ON "foliodb".legstophistory USING btree (legid);

CREATE INDEX orderinstr_shipinstypecode_idx ON "foliodb".orderinstruction USING btree (shipmentinstructiontypecode);

CREATE INDEX orderinstruction_orderid_iex ON "foliodb".orderinstruction USING btree (orderid);

CREATE INDEX orderitem_itemid_idx ON "foliodb".orderitem USING btree (itemid);

CREATE INDEX orderitem_orderid_idx ON "foliodb".orderitem USING btree (orderid);

CREATE INDEX orderreference_orderid_idx ON "foliodb".orderreference USING btree (orderid);

CREATE INDEX orderreference_shipref_idx ON "foliodb".orderreference USING btree (shipmentreferencetypecode);

CREATE INDEX orderrelease_carrier_idx ON "foliodb".orderrelease USING btree (carrier);

CREATE INDEX orderrelease_transstatus_idx ON "foliodb".orderrelease USING btree (transactionstatustypecode);

CREATE INDEX orderreleaseitem_item_idx ON "foliodb".orderreleaseitem USING btree (itemid);

CREATE INDEX orderrelitem_ordrelref_rel_idx ON "foliodb".orderreleasereference USING btree (orderreleaseid);

CREATE INDEX orderrelitem_shipref_idx ON "foliodb".orderreleasereference USING btree (shipmentreferencetypecode);

CREATE INDEX orders_incotermscodde_idx ON "foliodb".orders USING btree (incotermstypecode);

CREATE INDEX orders_methodofpayment_idx ON "foliodb".orders USING btree (methodofpaymentcode);

CREATE INDEX orders_modecode_idx ON "foliodb".orders USING btree (modecode);

CREATE INDEX orders_ordertype_idx ON "foliodb".orders USING btree (ordertypecode);

CREATE INDEX orders_orginaddressid_idx ON "foliodb".orders USING btree (destinationaddressid);

CREATE INDEX orders_transstatuscode_idx ON "foliodb".orders USING btree (transactionstatustypecode);

CREATE INDEX ordertempalte_destaddrid_idx ON "foliodb".ordertemplate USING btree (destinationaddressid);

CREATE INDEX ordertemplate_originaddrid_idx ON "foliodb".ordertemplate USING btree (originaddressid);

CREATE INDEX ordertemplate_shipterms_idx ON "foliodb".ordertemplate USING btree (shippingtermscode);

CREATE INDEX orghierarchy_countrycode_idx ON "foliodb".orghierarchy USING btree (countrycode);

CREATE INDEX orghierarchy_orgrole_idx ON "foliodb".orghierarchy USING btree (orgrolecode);

CREATE INDEX orghierarchy_parentorgid_idx ON "foliodb".orghierarchy USING btree (parentorgid);

CREATE INDEX orgorgassoc_destorgid_idx ON "foliodb".orgorgassoc USING btree (destorgid);

CREATE INDEX orgorgassoc_rshiptype_idx ON "foliodb".orgorgassoc USING btree (relationshiptypecode);

CREATE INDEX orgorgassoc_srcorgid_idx ON "foliodb".orgorgassoc USING btree (srcorgid);

CREATE INDEX orgreference_orgid_idx ON "foliodb".orgreference USING btree (orgid);

CREATE UNIQUE INDEX orgreference_type_value_idx ON "foliodb".orgreference USING btree (orgreferencetypecode, orgreferencevalue);

CREATE INDEX otherweights_domainobject_idx ON "foliodb".otherweightsandmeasures USING btree (domainobjectcode);

CREATE INDEX otherweights_event_idx ON "foliodb".otherweightsandmeasures USING btree (eventid);

CREATE INDEX otherweights_invoice_idx ON "foliodb".otherweightsandmeasures USING btree (invoiceid);

CREATE INDEX otherweights_invoicedetail_idx ON "foliodb".otherweightsandmeasures USING btree (invoicedetailid);

CREATE INDEX otherweights_invoiceli_idx ON "foliodb".otherweightsandmeasures USING btree (invoicelineitemid);

CREATE INDEX otherweights_leg_idx ON "foliodb".otherweightsandmeasures USING btree (legid);

CREATE INDEX otherweights_legcontainier_idx ON "foliodb".otherweightsandmeasures USING btree (legcontainerid);

CREATE INDEX otherweights_measuretype_idx ON "foliodb".otherweightsandmeasures USING btree (measurevaluetypecode);

CREATE INDEX otherweights_shipment_idx ON "foliodb".otherweightsandmeasures USING btree (shipmentid);

CREATE INDEX package_packagetype_idx ON "foliodb".package USING btree (packagetypecode);

CREATE INDEX package_shipmentid_idx ON "foliodb".package USING btree (shipmentid);

CREATE INDEX packagelineitem_item_idx ON "foliodb".packagelineitem USING btree (itemid);

CREATE INDEX packagelineitem_order_idx ON "foliodb".packagelineitem USING btree (orderid);

CREATE INDEX packagelineitem_orderitm_idx ON "foliodb".packagelineitem USING btree (orderitemid);

CREATE INDEX packagelineitem_package_idx ON "foliodb".packagelineitem USING btree (packageid);

CREATE INDEX packagereference_package_idx ON "foliodb".packagereference USING btree (packageid);

CREATE INDEX packagetransit_package_idx ON "foliodb".packagetransit USING btree (packageid);

CREATE UNIQUE INDEX pk_orgorgassoc ON "foliodb".orgorgassoc USING btree (orgorgassocid);

CREATE INDEX positionaldata_event_idx ON "foliodb".positionaldata USING btree (eventid);

CREATE INDEX rate_commodityclass_idx ON "foliodb".rate USING btree (commodityclassid);

CREATE INDEX rate_commodityclassgrp_idx ON "foliodb".rate USING btree (commodityclassgroupid);

CREATE INDEX rate_containertype_idx ON "foliodb".rate USING btree (containertypecode);

CREATE INDEX rate_determinant_cost_idx ON "foliodb".rate USING btree (costdeterminantid);

CREATE INDEX rate_lane_idx ON "foliodb".rate USING btree (laneid);

CREATE INDEX rate_ratezone_idx ON "foliodb".rate USING btree (ratezoneid);

CREATE INDEX ratecost_rate_idx ON "foliodb".ratecost USING btree (rateid);

CREATE INDEX ratecost_ratecosttype_idx ON "foliodb".ratecost USING btree (ratecosttypecode);

CREATE INDEX ratecostgroup_lane_idx ON "foliodb".rategroupmembership USING btree (laneid);

CREATE INDEX ratecostgrp_ratecostgrp_idx ON "foliodb".rategroupmembership USING btree (rategroupid);

CREATE INDEX ratezone_ratezone_idx ON "foliodb".ratezonelane USING btree (ratezoneid);

CREATE INDEX ratezonelane_lane_idx ON "foliodb".ratezonelane USING btree (laneid);

CREATE INDEX referencecode_idx ON "foliodb".dataresolutionvalue USING btree (referencecode);

CREATE INDEX referencevalue_idx ON "foliodb".dataresolutionvalue USING btree (referencevalue);

CREATE INDEX regionmbr_geolocation_idx ON "foliodb".regionmembership USING btree (geolocationid);

CREATE INDEX regionmbr_region_idx ON "foliodb".regionmembership USING btree (regionid);

CREATE INDEX resolveid_idx ON "foliodb".dataresolutionvalue USING btree (resolveid);

CREATE INDEX routingtemplatelegsl_sl_idx ON "foliodb".routingtemplatelegsserviceleve USING btree (servicelevelcode);

CREATE INDEX routingtmpl_address_idx ON "foliodb".routingtemplate USING btree (addressid);

CREATE INDEX routingtmpl_containertype_idx ON "foliodb".routingtemplate USING btree (containertypegroupid);

CREATE INDEX routingtmpl_geolocation_idx ON "foliodb".routingtemplate USING btree (geolocationid);

CREATE INDEX routingtmpl_modecode_idx ON "foliodb".routingtemplate USING btree (modecode);

CREATE INDEX routingtmpl_region_dest_idx ON "foliodb".routingtemplate USING btree (destregionid);

CREATE INDEX routingtmpl_region_idx ON "foliodb".routingtemplate USING btree (regionid);

CREATE INDEX routingtmpl_zipcodereg_idx ON "foliodb".routingtemplate USING btree (zipcoderangeid);

CREATE INDEX routingtmpleg_address_idx ON "foliodb".routingtemplateleg USING btree (addressid);

CREATE INDEX routingtmpleg_container_idx ON "foliodb".routingtemplateleg USING btree (containertypecode);

CREATE INDEX routingtmpleg_geoloc_idx ON "foliodb".routingtemplateleg USING btree (geolocationid);

CREATE INDEX routingtmpleg_leg_idx ON "foliodb".routingtemplateleg USING btree (routingtemplateid);

CREATE INDEX routingtmpleg_modecode_idx ON "foliodb".routingtemplateleg USING btree (modecode);

CREATE INDEX routingtmpleg_org_idx ON "foliodb".routingtemplateleg USING btree (orgid);

CREATE INDEX routingtmpleg_orgrole_idx ON "foliodb".routingtemplateleg USING btree (orgrolecode);

CREATE INDEX routingtmpleg_proxoum_idx ON "foliodb".routingtemplateleg USING btree (uomcode);

CREATE INDEX routingtmpleg_region_idx ON "foliodb".routingtemplateleg USING btree (regionid);

CREATE INDEX routingtmpleg_zipcode_idx ON "foliodb".routingtemplateleg USING btree (zipcoderangeid);

CREATE INDEX securitydevice_devicetye_idx ON "foliodb".securitydevice USING btree (securitydevicetypeid);

CREATE INDEX securitydeviceval_event_idx ON "foliodb".securitydevicevalue USING btree (eventid);

CREATE INDEX securitydeviceval_legcont_idx ON "foliodb".securitydevicevalue USING btree (legcontainerid);

CREATE INDEX securitydeviceval_secdev_idx ON "foliodb".securitydevicevalue USING btree (securitydeviceid);

CREATE INDEX securitydevicevalue_cvinst_idx ON "foliodb".securitydevicevalue USING btree (conveyinstanceid);

CREATE INDEX securitydevicevaluetype_id_idx ON "foliodb".securitydevicevaluetype USING btree (securitydevicetypeid);

CREATE INDEX service_orgid_idx ON "foliodb".service USING btree (orgid);

CREATE INDEX service_transittimes_idx ON "foliodb".service USING btree (transittimetypecode);

CREATE INDEX shipcontbook_equipstatus_idx ON "foliodb".shipmentcontainerbooking USING btree (equipmentstatuscode);

CREATE INDEX shipcontbook_equiptype_idx ON "foliodb".shipmentcontainerbooking USING btree (equipmenttypecode);

CREATE INDEX shipcontbook_shipment_idx ON "foliodb".shipmentcontainerbooking USING btree (shipmentid);

CREATE INDEX shipment_bolstatus_idx ON "foliodb".shipment USING btree (bolstatustypecode);

CREATE INDEX shipment_commodityclass_idx ON "foliodb".shipment USING btree (commodityclassid);

CREATE INDEX shipment_currency_car_idx ON "foliodb".shipment USING btree (carriagecurrencycode);

CREATE INDEX shipment_currency_cus_idx ON "foliodb".shipment USING btree (customscurrencycode);

CREATE INDEX shipment_currency_good_idx ON "foliodb".shipment USING btree (goodscurrencycode);

CREATE INDEX shipment_currency_inbond_idx ON "foliodb".shipment USING btree (inbondvaluecurrencycode);

CREATE INDEX shipment_currency_insured_idx ON "foliodb".shipment USING btree (insuredcurrencycode);

CREATE INDEX shipment_incoterms_idx ON "foliodb".shipment USING btree (incotermstypecode);

CREATE INDEX shipment_manifestuntis_idx ON "foliodb".shipment USING btree (manifestunittypecode);

CREATE INDEX shipment_objecttype_idx ON "foliodb".shipment USING btree (objecttype);

CREATE INDEX shipment_servicelevel_idx ON "foliodb".shipment USING btree (servicelevelcode);

CREATE INDEX shipment_servicetype_idx ON "foliodb".shipment USING btree (servicetypecode);

CREATE INDEX shipment_status_idx ON "foliodb".shipment USING btree (shipmentstatuscode);

CREATE INDEX shipment_transstatustype_idx ON "foliodb".shipment USING btree (transactionstatustypecode);

CREATE INDEX shipmentcharge_curr_buy_idx ON "foliodb".shipmentcharge USING btree (buycurrencycode);

CREATE INDEX shipmentcharge_curr_sell_idx ON "foliodb".shipmentcharge USING btree (sellcurrencycode);

CREATE INDEX shipmentcharge_frtpaymntrm_idx ON "foliodb".shipmentcharge USING btree (freightpaymenttypecode);

CREATE INDEX shipmentcharge_leg_idx ON "foliodb".shipmentcharge USING btree (legid);

CREATE INDEX shipmentcharge_package_idx ON "foliodb".shipmentcharge USING btree (packageid);

CREATE INDEX shipmentcharge_shipcharge_idx ON "foliodb".shipmentcharge USING btree (shipmentchargetypecode);

CREATE INDEX shipmentcharge_shipment_idx ON "foliodb".shipmentcharge USING btree (shipmentid);

CREATE INDEX shipmentconsol_houseshpid_idx ON "foliodb".shipmentconsolidation USING btree (houseshipmentid);

CREATE INDEX shipmentconsol_mstrshipid_idx ON "foliodb".shipmentconsolidation USING btree (mastershipmentid);

CREATE INDEX shipmentinstr_event_idx ON "foliodb".shipmentinstruction USING btree (eventid);

CREATE INDEX shipmentinstr_invcedetail_idx ON "foliodb".shipmentinstruction USING btree (invoicedetailid);

CREATE INDEX shipmentinstr_invoice_idx ON "foliodb".shipmentinstruction USING btree (invoiceid);

CREATE INDEX shipmentinstr_invoiceli_idx ON "foliodb".shipmentinstruction USING btree (invoicelineitemid);

CREATE INDEX shipmentinstr_leg_idx ON "foliodb".shipmentinstruction USING btree (legid);

CREATE INDEX shipmentinstr_legcontaine_idx ON "foliodb".shipmentinstruction USING btree (legcontainerid);

CREATE INDEX shipmentinstr_package_idx ON "foliodb".shipmentinstruction USING btree (packageid);

CREATE INDEX shipmentinstr_shipment_idx ON "foliodb".shipmentinstruction USING btree (shipmentid);

CREATE INDEX shipmentinstr_typecode_idx ON "foliodb".shipmentinstruction USING btree (shipmentinstructiontypecode);

CREATE INDEX shipmentreference_shipment_idx ON "foliodb".shipmentreference USING btree (shipmentid);

CREATE INDEX shipmentreference_type_idx ON "foliodb".shipmentreference USING btree (shipmentreferencetypecode);

CREATE INDEX shipmentreference_value_idx ON "foliodb".shipmentreference USING btree (shipmentreferencevalue);

CREATE INDEX tariff_basetariffid_idx ON "foliodb".tariff USING btree (basetariffid);

CREATE INDEX tariff_commodity_idx ON "foliodb".tariff USING btree (commodityclassgroupid);

CREATE INDEX tariff_containertypegrp_idx ON "foliodb".tariff USING btree (containertypegroupid);

CREATE INDEX tariff_currency2_idx ON "foliodb".tariff USING btree (currencycode);

CREATE INDEX tariff_currency_idx ON "foliodb".tariff USING btree (cur_currencycode);

CREATE INDEX tariff_modecode_idx ON "foliodb".tariff USING btree (modecode);

CREATE INDEX tariff_orgid_idx ON "foliodb".tariff USING btree (carrierorgid);

CREATE INDEX tariff_ratecalc_idx ON "foliodb".tariff USING btree (ratecalculationtypecode);

CREATE INDEX tariff_servicelevel_idx ON "foliodb".tariff USING btree (servicelevelcode);

CREATE INDEX unitofmeasure_categorycode_idx ON "foliodb".unitofmeasure USING btree (unitcategorycode);

CREATE UNIQUE INDEX uq_containeridentifier_idx ON "foliodb".container USING btree (containeridentifier);

CREATE UNIQUE INDEX uq_vesselvehicle_vessel ON "foliodb".vesselvehicle USING btree (officialname, vesselvehiclecode, vesselvehiclecodequalifier);

CREATE INDEX zipcoderange_country_idx ON "foliodb".zipcoderange USING btree (countrycode);

ALTER TABLE ONLY "foliodb".accessorial
    ADD CONSTRAINT fk_accessorial_accessorial FOREIGN KEY (accessorialtypecode) REFERENCES "foliodb".accessorialtype(accessorialtypecode);

ALTER TABLE ONLY "foliodb".accessoriallocation
    ADD CONSTRAINT fk_accessorial_address FOREIGN KEY (addressid) REFERENCES "foliodb".address(addressid);

ALTER TABLE ONLY "foliodb".accessorial
    ADD CONSTRAINT fk_accessorial_determinant_ap FOREIGN KEY (applicabilitydeterminantid) REFERENCES "foliodb".determinant(determinantid);

ALTER TABLE ONLY "foliodb".accessorial
    ADD CONSTRAINT fk_accessorial_determinant_ct FOREIGN KEY (costdeterminantid) REFERENCES "foliodb".determinant(determinantid);

ALTER TABLE ONLY "foliodb".accessorial
    ADD CONSTRAINT fk_accessorial_rate FOREIGN KEY (rateid) REFERENCES "foliodb".rate(rateid);

ALTER TABLE ONLY "foliodb".accessorial
    ADD CONSTRAINT fk_accessorial_tariff FOREIGN KEY (tariffid) REFERENCES "foliodb".tariff(tariffid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".accessoriallocation
    ADD CONSTRAINT fk_accessorialalloc_accessor FOREIGN KEY (accessorialid) REFERENCES "foliodb".accessorial(accessorialid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".accessorialcost
    ADD CONSTRAINT fk_accessorialcost_accssrl FOREIGN KEY (accessorialid) REFERENCES "foliodb".accessorial(accessorialid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".accessoriallocation
    ADD CONSTRAINT fk_accessorialloc_geolocation FOREIGN KEY (geolocationid) REFERENCES "foliodb".geolocation(geolocationid);

ALTER TABLE ONLY "foliodb".accessoriallocation
    ADD CONSTRAINT fk_accessorialloc_orghierarch FOREIGN KEY (orgid) REFERENCES "foliodb".orghierarchy(orgid);

ALTER TABLE ONLY "foliodb".accessoriallocation
    ADD CONSTRAINT fk_accessorialloc_region FOREIGN KEY (regionid) REFERENCES "foliodb".region(regionid);

ALTER TABLE ONLY "foliodb".accessoriallocation
    ADD CONSTRAINT fk_accessorialloc_stopfunction FOREIGN KEY (stopfunctioncode) REFERENCES "foliodb".stopfunction(stopfunctioncode);

ALTER TABLE ONLY "foliodb".address
    ADD CONSTRAINT fk_address_addressty_addresst FOREIGN KEY (addresstypecode) REFERENCES "foliodb".addresstype(addresstypecode);

ALTER TABLE ONLY "foliodb".address
    ADD CONSTRAINT fk_address_country FOREIGN KEY (countrycode) REFERENCES "foliodb".country(countrycode);

ALTER TABLE ONLY "foliodb".invoicedetail
    ADD CONSTRAINT fk_address_invoicedetail_dest FOREIGN KEY (destinationaddressid) REFERENCES "foliodb".address(addressid);

ALTER TABLE ONLY "foliodb".invoicedetail
    ADD CONSTRAINT fk_address_invoicedetail_orgn FOREIGN KEY (originaddressid) REFERENCES "foliodb".address(addressid);

ALTER TABLE ONLY "foliodb".address
    ADD CONSTRAINT fk_address_orghierarchy FOREIGN KEY (orgid) REFERENCES "foliodb".orghierarchy(orgid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".address
    ADD CONSTRAINT fk_address_timezone FOREIGN KEY (timezoneid) REFERENCES "foliodb".timezone(timezonecode);

ALTER TABLE ONLY "foliodb".appointment
    ADD CONSTRAINT fk_apptment_appointmentslotid FOREIGN KEY (appointmentslotid) REFERENCES "foliodb".appointmentslot(appointmentslotid);

ALTER TABLE ONLY "foliodb".carriercontainertype
    ADD CONSTRAINT fk_carriercntrtype_cntrtype FOREIGN KEY (containertypecode) REFERENCES "foliodb".containertype(containertypecode);

ALTER TABLE ONLY "foliodb".carriercontainertype
    ADD CONSTRAINT fk_carriercontainertype_org FOREIGN KEY (carrierorgid) REFERENCES "foliodb".orghierarchy(orgid);

ALTER TABLE ONLY "foliodb".containergroupmembership
    ADD CONSTRAINT fk_cntrgrpmbrship_cntrtype FOREIGN KEY (containertypecode) REFERENCES "foliodb".containertype(containertypecode);

ALTER TABLE ONLY "foliodb".containertypemode
    ADD CONSTRAINT fk_cntrtypemode_cntrtype FOREIGN KEY (containertypecode) REFERENCES "foliodb".containertype(containertypecode);

ALTER TABLE ONLY "foliodb".communicationmethod
    ADD CONSTRAINT fk_commmethtype_commmeth FOREIGN KEY (communicationmethodtypecode) REFERENCES "foliodb".communicationmethodtype(communicationmethodtypecode);

ALTER TABLE ONLY "foliodb".commodityclassgroupmembership
    ADD CONSTRAINT fk_commodity_classgroup FOREIGN KEY (commodityclassgroupid) REFERENCES "foliodb".commodityclassgroup(commodityclassgroupid);

ALTER TABLE ONLY "foliodb".commodityclass
    ADD CONSTRAINT fk_commodity_commdtyclasstype FOREIGN KEY (commodityclasstypecode) REFERENCES "foliodb".commodityclasstype(commodityclasstypecode);

ALTER TABLE ONLY "foliodb".commodityclassgroup
    ADD CONSTRAINT fk_commodityclassgroup_commdty FOREIGN KEY (commodityclasstypecode) REFERENCES "foliodb".commodityclasstype(commodityclasstypecode);

ALTER TABLE ONLY "foliodb".communicationmethod
    ADD CONSTRAINT fk_communication_orghierarchy FOREIGN KEY (orgid) REFERENCES "foliodb".orghierarchy(orgid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".communicationmethod
    ADD CONSTRAINT fk_communicationmethod_invpty FOREIGN KEY (involvedpartyid) REFERENCES "foliodb".involvedparty(involvedpartyid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".container
    ADD CONSTRAINT fk_container_orghierarchy FOREIGN KEY (orgid) REFERENCES "foliodb".orghierarchy(orgid);

ALTER TABLE ONLY "foliodb".containerterminalactivity
    ADD CONSTRAINT fk_containeractivity_id FOREIGN KEY (apptreasoncode) REFERENCES "foliodb".appointmentreason(appointmentreasoncode);

ALTER TABLE ONLY "foliodb".containergroupmembership
    ADD CONSTRAINT fk_containergrpmbr_cntrtypegrp FOREIGN KEY (containertypegroupid) REFERENCES "foliodb".containertypegroup(containertypegroupid);

ALTER TABLE ONLY "foliodb".containerterminalactivityitem
    ADD CONSTRAINT fk_containerterminal_id FOREIGN KEY (containerterminalactivityid) REFERENCES "foliodb".containerterminalactivity(containerterminalactivityid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".containertypemode
    ADD CONSTRAINT fk_containertypemode_tranmode FOREIGN KEY (modecode) REFERENCES "foliodb".transportmode(transportmodecode);

ALTER TABLE ONLY "foliodb".containerownermembership
    ADD CONSTRAINT fk_contownermem_container FOREIGN KEY (containerid) REFERENCES "foliodb".container(containerid);

ALTER TABLE ONLY "foliodb".containerownermembership
    ADD CONSTRAINT fk_contownermember_org FOREIGN KEY (orgid) REFERENCES "foliodb".orghierarchy(orgid);

ALTER TABLE ONLY "foliodb".conveyreference
    ADD CONSTRAINT fk_convereferencetype_convref FOREIGN KEY (conveyreferencetypecode) REFERENCES "foliodb".conveyreferencetype(conveyreferencetypecode);

ALTER TABLE ONLY "foliodb".conveyance
    ADD CONSTRAINT fk_conveyance_conveyancetype FOREIGN KEY (conveyancetypecode) REFERENCES "foliodb".conveyancetype(conveyancetypecode);

ALTER TABLE ONLY "foliodb".conveyinstance
    ADD CONSTRAINT fk_conveyance_conveyinstance FOREIGN KEY (conveyanceid) REFERENCES "foliodb".conveyance(conveyanceid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".conveyreference
    ADD CONSTRAINT fk_conveyance_conveyreference FOREIGN KEY (conveyanceid) REFERENCES "foliodb".conveyance(conveyanceid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".conveyance
    ADD CONSTRAINT fk_conveyancemaketype_convey FOREIGN KEY (conveyancemaketypecode) REFERENCES "foliodb".conveyancemaketype(conveyancemaketypecode);

ALTER TABLE ONLY "foliodb".conveyancemodeltype
    ADD CONSTRAINT fk_conveyancemodel_make FOREIGN KEY (conveyancemaketypecode) REFERENCES "foliodb".conveyancemaketype(conveyancemaketypecode);

ALTER TABLE ONLY "foliodb".conveyancetype
    ADD CONSTRAINT fk_conveyancetype_category FOREIGN KEY (conveyancecategorycode) REFERENCES "foliodb".conveyancecategory(conveyancecategorycode) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".conveyancemaketype
    ADD CONSTRAINT fk_conveyancymake_type FOREIGN KEY (conveyancetypecode) REFERENCES "foliodb".conveyancetype(conveyancetypecode);

ALTER TABLE ONLY "foliodb".conveyinstance
    ADD CONSTRAINT fk_conveyinstance_conveyagency FOREIGN KEY (conveyagencytypecode) REFERENCES "foliodb".conveyagencytype(conveyagencytypecode);

ALTER TABLE ONLY "foliodb".conveyinstanceorgassoc
    ADD CONSTRAINT fk_conveyinstance_conveyorg FOREIGN KEY (conveyinstanceid) REFERENCES "foliodb".conveyinstance(conveyinstanceid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".conveyreference
    ADD CONSTRAINT fk_conveyinstance_conveyref FOREIGN KEY (conveyinstanceid) REFERENCES "foliodb".conveyinstance(conveyinstanceid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".conveyinstance
    ADD CONSTRAINT fk_conveyinstance_country FOREIGN KEY (registeredcountrycode) REFERENCES "foliodb".country(countrycode);

ALTER TABLE ONLY "foliodb".conveyinstanceorgassoc
    ADD CONSTRAINT fk_conveyinstanceorg_iptype FOREIGN KEY (involvedpartytypecode) REFERENCES "foliodb".involvedpartytype(involvedpartytypecode);

ALTER TABLE ONLY "foliodb".conveyinstanceorgassoc
    ADD CONSTRAINT fk_conveyinstanceorg_org FOREIGN KEY (orgid) REFERENCES "foliodb".orghierarchy(orgid);

ALTER TABLE ONLY "foliodb".conveyinstance
    ADD CONSTRAINT fk_conveyinstcolorpri_convey FOREIGN KEY (colorprimary) REFERENCES "foliodb".conveyancecolortype(conveyancecolortypecode);

ALTER TABLE ONLY "foliodb".conveyinstance
    ADD CONSTRAINT fk_conveyinstcolorsec_convey FOREIGN KEY (colorsecondary) REFERENCES "foliodb".conveyancecolortype(conveyancecolortypecode);

ALTER TABLE ONLY "foliodb".securitydevicevalue
    ADD CONSTRAINT fk_convinstance_securitydevval FOREIGN KEY (conveyinstanceid) REFERENCES "foliodb".conveyinstance(conveyinstanceid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".dataresolutionlog
    ADD CONSTRAINT fk_dataresolutionvalueid FOREIGN KEY (dataresolutionvalueid) REFERENCES "foliodb".dataresolutionvalue(dataresolutionvalueid);

ALTER TABLE ONLY "foliodb".datetimestampreference
    ADD CONSTRAINT fk_datetimeref_domainobject FOREIGN KEY (domainobjectcode) REFERENCES "foliodb".domainobject(domainobjectcode);

ALTER TABLE ONLY "foliodb".datetimestampreference
    ADD CONSTRAINT fk_datetimeref_dtsreftype FOREIGN KEY (datetimestampreferencetypecode) REFERENCES "foliodb".datetimestampreferencetype(datetimestampreferencetypecode);

ALTER TABLE ONLY "foliodb".datetimestampreference
    ADD CONSTRAINT fk_datetimeref_event FOREIGN KEY (eventid) REFERENCES "foliodb".event(eventid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".datetimestampreference
    ADD CONSTRAINT fk_datetimeref_invoice FOREIGN KEY (invoiceid) REFERENCES "foliodb".invoice(invoiceid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".datetimestampreference
    ADD CONSTRAINT fk_datetimeref_leg FOREIGN KEY (legid) REFERENCES "foliodb".leg(legid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".datetimestampreference
    ADD CONSTRAINT fk_datetimeref_legcontainer FOREIGN KEY (legcontainerid) REFERENCES "foliodb".legcontainer(legcontainerid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".datetimestampreference
    ADD CONSTRAINT fk_datetimeref_legroutedetails FOREIGN KEY (legroutedetailsid) REFERENCES "foliodb".legroutedetails(legroutedetailsid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".datetimestampreference
    ADD CONSTRAINT fk_datetimeref_order FOREIGN KEY (orderid) REFERENCES "foliodb".orders(orderid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".datetimestampreference
    ADD CONSTRAINT fk_datetimeref_orderrelease FOREIGN KEY (orderreleaseid) REFERENCES "foliodb".orderrelease(orderreleaseid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".datetimestampreference
    ADD CONSTRAINT fk_datetimeref_package FOREIGN KEY (packageid) REFERENCES "foliodb".package(packageid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".datetimestampreference
    ADD CONSTRAINT fk_datetimeref_shipment FOREIGN KEY (shipmentid) REFERENCES "foliodb".shipment(shipmentid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".deliverytimegroupmembership
    ADD CONSTRAINT fk_deliverymbrship_deliverygrp FOREIGN KEY (deliverytimegroupid) REFERENCES "foliodb".deliverytimegroup(deliverytimegroupid);

ALTER TABLE ONLY "foliodb".deliverytimegroupmembership
    ADD CONSTRAINT fk_deliverymbrshp_lane FOREIGN KEY (laneid) REFERENCES "foliodb".lane(laneid);

ALTER TABLE ONLY "foliodb".documentdomainobjectmembership
    ADD CONSTRAINT fk_docdomainobj_domainobect FOREIGN KEY (domainobjectcode) REFERENCES "foliodb".domainobject(domainobjectcode);

ALTER TABLE ONLY "foliodb".docsubmissionstatushistory
    ADD CONSTRAINT fk_docsub_docsubhistory FOREIGN KEY (docsubmissionid) REFERENCES "foliodb".docsubmission(docsubmissionid);

ALTER TABLE ONLY "foliodb".docsubmission
    ADD CONSTRAINT fk_docsub_docsubstatus FOREIGN KEY (docsubmissionstatuscode) REFERENCES "foliodb".docsubmissionstatus(docsubmissionstatuscode);

ALTER TABLE ONLY "foliodb".document
    ADD CONSTRAINT fk_doctemp_document FOREIGN KEY (documenttemplatenumber) REFERENCES "foliodb".documenttemplate(documenttemplateid);

ALTER TABLE ONLY "foliodb".documentstatushistory
    ADD CONSTRAINT fk_document_docstatushistory FOREIGN KEY (documentid) REFERENCES "foliodb".document(documentid);

ALTER TABLE ONLY "foliodb".docsubmission
    ADD CONSTRAINT fk_document_docsubmission FOREIGN KEY (documentid) REFERENCES "foliodb".document(documentid);

ALTER TABLE ONLY "foliodb".documentdata
    ADD CONSTRAINT fk_document_documentdata FOREIGN KEY (documentid) REFERENCES "foliodb".document(documentid);

ALTER TABLE ONLY "foliodb".document
    ADD CONSTRAINT fk_document_documentstatus FOREIGN KEY (documentstatuscode) REFERENCES "foliodb".documentstatus(documentstatuscode);

ALTER TABLE ONLY "foliodb".documentdomainobjectmembership
    ADD CONSTRAINT fk_document_domainobjectmbr FOREIGN KEY (documentid) REFERENCES "foliodb".document(documentid);

ALTER TABLE ONLY "foliodb".documenttemplate
    ADD CONSTRAINT fk_documentformat_doctemplate FOREIGN KEY (documentformattypecode) REFERENCES "foliodb".documentformattype(documentformattypecode);

ALTER TABLE ONLY "foliodb".documenttemplate
    ADD CONSTRAINT fk_documenttemplatetype FOREIGN KEY (documenttypecode) REFERENCES "foliodb".documenttype(documenttypecode);

ALTER TABLE ONLY "foliodb".itemhazmattype
    ADD CONSTRAINT fk_domainojbect_itemhazmattype FOREIGN KEY (domainobjectcode) REFERENCES "foliodb".domainobject(domainobjectcode);

ALTER TABLE ONLY "foliodb".dataresolutionvalue
    ADD CONSTRAINT fk_drvalue_dataresolutiontype FOREIGN KEY (resolvetypecode) REFERENCES "foliodb".dataresolutiontype(resolvetypecode);

ALTER TABLE ONLY "foliodb".dvecost
    ADD CONSTRAINT fk_dvecost_dvetype FOREIGN KEY (dvetypecode) REFERENCES "foliodb".dvetype(dvetypecode);

ALTER TABLE ONLY "foliodb".dvecost
    ADD CONSTRAINT fk_dvecost_orderreleaseitem FOREIGN KEY (orderreleaseitemid) REFERENCES "foliodb".orderreleaseitem(orderreleaseitemid);

ALTER TABLE ONLY "foliodb".edi_iso_packagetype
    ADD CONSTRAINT fk_edi_iso_pkgtype_packagetype FOREIGN KEY (packagetypecode) REFERENCES "foliodb".packagetype(packagetypecode);

ALTER TABLE ONLY "foliodb".edi_iso_equipmenttype
    ADD CONSTRAINT fk_ediiso_transportmode FOREIGN KEY (modecode) REFERENCES "foliodb".transportmode(transportmodecode);

ALTER TABLE ONLY "foliodb".edi_iso_equipmenttype
    ADD CONSTRAINT fk_equipmenttype_equtypegrp FOREIGN KEY (equipmenttypegroupcode) REFERENCES "foliodb".edi_iso_equipmenttypegroup(equipmenttypegroupcode);

ALTER TABLE ONLY "foliodb".event
    ADD CONSTRAINT fk_event_address FOREIGN KEY (eventaddressid) REFERENCES "foliodb".address(addressid);

ALTER TABLE ONLY "foliodb".event
    ADD CONSTRAINT fk_event_appointmentreason FOREIGN KEY (appointmentreasoncode) REFERENCES "foliodb".appointmentreason(appointmentreasoncode);

ALTER TABLE ONLY "foliodb".event
    ADD CONSTRAINT fk_event_container FOREIGN KEY (containerid) REFERENCES "foliodb".container(containerid);

ALTER TABLE ONLY "foliodb".event
    ADD CONSTRAINT fk_event_containertype FOREIGN KEY (containertypecode) REFERENCES "foliodb".containertype(containertypecode);

ALTER TABLE ONLY "foliodb".event
    ADD CONSTRAINT fk_event_conveyinstance FOREIGN KEY (conveyinstanceid) REFERENCES "foliodb".conveyinstance(conveyinstanceid);

ALTER TABLE ONLY "foliodb".event
    ADD CONSTRAINT fk_event_domainobject FOREIGN KEY (domainobjectcode) REFERENCES "foliodb".domainobject(domainobjectcode);

ALTER TABLE ONLY "foliodb".event
    ADD CONSTRAINT fk_event_equpmenttstatus FOREIGN KEY (equipmentstatuscode) REFERENCES "foliodb".equipmentstatus(equipmentstatuscode);

ALTER TABLE ONLY "foliodb".event
    ADD CONSTRAINT fk_event_eventcategory FOREIGN KEY (eventcategorycode) REFERENCES "foliodb".eventcategory(eventcategorycode);

ALTER TABLE ONLY "foliodb".eventdocument
    ADD CONSTRAINT fk_event_eventdocument FOREIGN KEY (eventid) REFERENCES "foliodb".event(eventid) ON DELETE SET NULL;

ALTER TABLE ONLY "foliodb".eventreference
    ADD CONSTRAINT fk_event_eventreferenc FOREIGN KEY (eventid) REFERENCES "foliodb".event(eventid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".eventstop
    ADD CONSTRAINT fk_event_eventstop FOREIGN KEY (eventid) REFERENCES "foliodb".event(eventid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".event
    ADD CONSTRAINT fk_event_eventtype FOREIGN KEY (eventtypecode) REFERENCES "foliodb".eventtype(eventtypecode);

ALTER TABLE ONLY "foliodb".event
    ADD CONSTRAINT fk_event_leg FOREIGN KEY (legid) REFERENCES "foliodb".leg(legid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".event
    ADD CONSTRAINT fk_event_legcontainer FOREIGN KEY (legcontainerid) REFERENCES "foliodb".legcontainer(legcontainerid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".event
    ADD CONSTRAINT fk_event_orders FOREIGN KEY (orderid) REFERENCES "foliodb".orders(orderid);

ALTER TABLE ONLY "foliodb".event
    ADD CONSTRAINT fk_event_package FOREIGN KEY (packageid) REFERENCES "foliodb".package(packageid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".positionaldata
    ADD CONSTRAINT fk_event_positionaldata FOREIGN KEY (eventid) REFERENCES "foliodb".event(eventid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".event
    ADD CONSTRAINT fk_event_shipment FOREIGN KEY (shipmentid) REFERENCES "foliodb".shipment(shipmentid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".shipmentinstruction
    ADD CONSTRAINT fk_event_shipmentinstruction FOREIGN KEY (eventid) REFERENCES "foliodb".event(eventid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".event
    ADD CONSTRAINT fk_event_transactionstatustype FOREIGN KEY (transactionstatustypecode) REFERENCES "foliodb".transactionstatustype(transactionstatustypecode);

ALTER TABLE ONLY "foliodb".event
    ADD CONSTRAINT fk_event_transportmode FOREIGN KEY (transportmodetypecode) REFERENCES "foliodb".transportmode(transportmodecode);

ALTER TABLE ONLY "foliodb".event
    ADD CONSTRAINT fk_event_transportmode_next FOREIGN KEY (nexttransportmodetypecode) REFERENCES "foliodb".transportmode(transportmodecode);

ALTER TABLE ONLY "foliodb".event
    ADD CONSTRAINT fk_event_vesselrole FOREIGN KEY (vesselvehiclerolecode) REFERENCES "foliodb".vesselrole(vesselrolecode);

ALTER TABLE ONLY "foliodb".event
    ADD CONSTRAINT fk_event_vesselrole_next FOREIGN KEY (nextvesselvehiclerolecode) REFERENCES "foliodb".vesselrole(vesselrolecode);

ALTER TABLE ONLY "foliodb".event
    ADD CONSTRAINT fk_event_vesselvehicle FOREIGN KEY (vesselvehicleid) REFERENCES "foliodb".vesselvehicle(vesselvehicleid);

ALTER TABLE ONLY "foliodb".event
    ADD CONSTRAINT fk_event_vesselvehicle_nxt FOREIGN KEY (nextvesselvehicleid) REFERENCES "foliodb".vesselvehicle(vesselvehicleid);

ALTER TABLE ONLY "foliodb".eventreference
    ADD CONSTRAINT fk_eventreference_eventreftype FOREIGN KEY (eventreferencetypecode) REFERENCES "foliodb".eventreferencetype(eventreferencetypecode);

ALTER TABLE ONLY "foliodb".eventstop
    ADD CONSTRAINT fk_eventstop_address FOREIGN KEY (addressid) REFERENCES "foliodb".address(addressid);

ALTER TABLE ONLY "foliodb".eventtype
    ADD CONSTRAINT fk_eventtype_eventcategory FOREIGN KEY (eventcategorycode) REFERENCES "foliodb".eventcategory(eventcategorycode);

ALTER TABLE ONLY "foliodb".financialaccounting
    ADD CONSTRAINT fk_financialacct_invoicecharge FOREIGN KEY (invoicechargeid) REFERENCES "foliodb".invoicecharge(invoicechargeid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".financialaccounting
    ADD CONSTRAINT fk_financialacct_orghierarchy FOREIGN KEY (breakdownstructureorgid) REFERENCES "foliodb".orghierarchy(orgid);

ALTER TABLE ONLY "foliodb".financialaccounting
    ADD CONSTRAINT fk_financialacct_shipchrgtype FOREIGN KEY (shipmentchargetypecode) REFERENCES "foliodb".shipmentchargetype(shipmentchargetypecode);

ALTER TABLE ONLY "foliodb".documentstatushistory
    ADD CONSTRAINT fk_fromdocumentstatushistory FOREIGN KEY (fromdocumentstatuscode) REFERENCES "foliodb".documentstatus(documentstatuscode);

ALTER TABLE ONLY "foliodb".docsubmissionstatushistory
    ADD CONSTRAINT fk_fromdocusubmissionhstry FOREIGN KEY (fromsubmissionstatuscode) REFERENCES "foliodb".docsubmissionstatus(docsubmissionstatuscode);

ALTER TABLE ONLY "foliodb".geolocation
    ADD CONSTRAINT fk_geolocation_country FOREIGN KEY (countrycode) REFERENCES "foliodb".country(countrycode);

ALTER TABLE ONLY "foliodb".holiday
    ADD CONSTRAINT fk_holiday_countryho_country FOREIGN KEY (countrycode) REFERENCES "foliodb".country(countrycode);

ALTER TABLE ONLY "foliodb".holidayoperatinghours
    ADD CONSTRAINT fk_holidayhours_business FOREIGN KEY (businessactivitiescode) REFERENCES "foliodb".businessactivities(businessactivitiescode);

ALTER TABLE ONLY "foliodb".holidayinstance
    ADD CONSTRAINT fk_holidayinstance_holiday FOREIGN KEY (holidaycode) REFERENCES "foliodb".holiday(holidaycode);

ALTER TABLE ONLY "foliodb".holidayoperatinghours
    ADD CONSTRAINT fk_holidayo_relations_observed FOREIGN KEY (observedholidayid) REFERENCES "foliodb".observedholiday(observedholidayid);

ALTER TABLE ONLY "foliodb".invoice
    ADD CONSTRAINT fk_incotermstype_invoice FOREIGN KEY (incotermstypecode) REFERENCES "foliodb".incotermstype(incotermstypecode);

ALTER TABLE ONLY "foliodb".inspectionorcheck
    ADD CONSTRAINT fk_inspctnchk_inspctnchktyp FOREIGN KEY (inspectionorchecktypecode) REFERENCES "foliodb".inspectionorchecktype(inspectionorchecktypecode);

ALTER TABLE ONLY "foliodb".inspectionorcheck
    ADD CONSTRAINT fk_inspectionchk_event FOREIGN KEY (eventid) REFERENCES "foliodb".event(eventid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".invoice
    ADD CONSTRAINT fk_invoice_invoice_base FOREIGN KEY (baseinvoiceid) REFERENCES "foliodb".invoice(invoiceid);

ALTER TABLE ONLY "foliodb".invoice
    ADD CONSTRAINT fk_invoice_invoicestatus FOREIGN KEY (invoicestatuscode) REFERENCES "foliodb".invoicestatus(invoicestatuscode);

ALTER TABLE ONLY "foliodb".otherweightsandmeasures
    ADD CONSTRAINT fk_invoice_otherweights FOREIGN KEY (invoiceid) REFERENCES "foliodb".invoice(invoiceid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".shipmentinstruction
    ADD CONSTRAINT fk_invoice_shipmentinstr FOREIGN KEY (invoiceid) REFERENCES "foliodb".invoice(invoiceid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".invoice
    ADD CONSTRAINT fk_invoice_shipmentterms FOREIGN KEY (shipmenttermscode) REFERENCES "foliodb".shipmentterms(shipmenttermscode);

ALTER TABLE ONLY "foliodb".invoice
    ADD CONSTRAINT fk_invoice_transactionstat FOREIGN KEY (transactionstatustypecode) REFERENCES "foliodb".transactionstatustype(transactionstatustypecode);

ALTER TABLE ONLY "foliodb".invoice
    ADD CONSTRAINT fk_invoice_trasportmode FOREIGN KEY (modecode) REFERENCES "foliodb".transportmode(transportmodecode);

ALTER TABLE ONLY "foliodb".invoicecharge
    ADD CONSTRAINT fk_invoicecharge_invoiceline FOREIGN KEY (invoicelineitemid) REFERENCES "foliodb".invoicelineitem(invoicelineitemid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".invoicecharge
    ADD CONSTRAINT fk_invoicecharge_ratecost FOREIGN KEY (ratecostid) REFERENCES "foliodb".ratecost(ratecostid);

ALTER TABLE ONLY "foliodb".invoicedetail
    ADD CONSTRAINT fk_invoiced_fk_invoic_invoiced FOREIGN KEY (originalinvoicedetailid) REFERENCES "foliodb".invoicedetail(invoicedetailid);

ALTER TABLE ONLY "foliodb".datetimestampreference
    ADD CONSTRAINT fk_invoicedetail_datetimestamp FOREIGN KEY (invoicedetailid) REFERENCES "foliodb".invoicedetail(invoicedetailid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".invoicedetail
    ADD CONSTRAINT fk_invoicedetail_invoice FOREIGN KEY (invoiceid) REFERENCES "foliodb".invoice(invoiceid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".invoicelineitem
    ADD CONSTRAINT fk_invoicedetail_invoiceli FOREIGN KEY (invoicedetailid) REFERENCES "foliodb".invoicedetail(invoicedetailid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".invoicedetail
    ADD CONSTRAINT fk_invoicedetail_invoicestatus FOREIGN KEY (invoicestatuscode) REFERENCES "foliodb".invoicestatus(invoicestatuscode);

ALTER TABLE ONLY "foliodb".involvedparty
    ADD CONSTRAINT fk_invoicedetail_involvedparty FOREIGN KEY (invoicedetailid) REFERENCES "foliodb".invoicedetail(invoicedetailid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".otherweightsandmeasures
    ADD CONSTRAINT fk_invoicedetail_otherweights FOREIGN KEY (invoicedetailid) REFERENCES "foliodb".invoicedetail(invoicedetailid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".invoicelineitem
    ADD CONSTRAINT fk_invoiceli_commodityclass FOREIGN KEY (commodityclassid) REFERENCES "foliodb".commodityclass(commodityclassid);

ALTER TABLE ONLY "foliodb".datetimestampreference
    ADD CONSTRAINT fk_invoiceli_datetimestampref FOREIGN KEY (invoicelineitemid) REFERENCES "foliodb".invoicelineitem(invoicelineitemid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".invoicelineitem
    ADD CONSTRAINT fk_invoiceli_orderrelease FOREIGN KEY (orderreleaseid) REFERENCES "foliodb".orderrelease(orderreleaseid);

ALTER TABLE ONLY "foliodb".otherweightsandmeasures
    ADD CONSTRAINT fk_invoiceli_otherweights FOREIGN KEY (invoicelineitemid) REFERENCES "foliodb".invoicelineitem(invoicelineitemid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".invoicereference
    ADD CONSTRAINT fk_invoiceref_invoicecharge FOREIGN KEY (invoicechargeid) REFERENCES "foliodb".invoicecharge(invoicechargeid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".invoicereference
    ADD CONSTRAINT fk_invoiceref_invoicedetail FOREIGN KEY (invoicedetailid) REFERENCES "foliodb".invoicedetail(invoicedetailid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".invoicereference
    ADD CONSTRAINT fk_invoiceref_invoicelineitem FOREIGN KEY (invoicelineitemid) REFERENCES "foliodb".invoicelineitem(invoicelineitemid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".invoicereference
    ADD CONSTRAINT fk_invoiceref_shipreftype FOREIGN KEY (shipmentreferencetypecode) REFERENCES "foliodb".shipmentreferencetype(shipmentreferencetypecode);

ALTER TABLE ONLY "foliodb".invoicereference
    ADD CONSTRAINT fk_invoicereference_invoice FOREIGN KEY (invoiceid) REFERENCES "foliodb".invoice(invoiceid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".involvedparty
    ADD CONSTRAINT fk_involvedparty_countrycode FOREIGN KEY (countrycode) REFERENCES "foliodb".country(countrycode);

ALTER TABLE ONLY "foliodb".involvedparty
    ADD CONSTRAINT fk_involvedparty_domainobject FOREIGN KEY (domainobjectcode) REFERENCES "foliodb".domainobject(domainobjectcode);

ALTER TABLE ONLY "foliodb".involvedparty
    ADD CONSTRAINT fk_involvedparty_event FOREIGN KEY (eventid) REFERENCES "foliodb".event(eventid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".involvedparty
    ADD CONSTRAINT fk_involvedparty_invoice FOREIGN KEY (invoiceid) REFERENCES "foliodb".invoice(invoiceid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".involvedparty
    ADD CONSTRAINT fk_involvedparty_iptype FOREIGN KEY (involvedpartytypecode) REFERENCES "foliodb".involvedpartytype(involvedpartytypecode);

ALTER TABLE ONLY "foliodb".involvedparty
    ADD CONSTRAINT fk_involvedparty_leg FOREIGN KEY (legid) REFERENCES "foliodb".leg(legid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".involvedparty
    ADD CONSTRAINT fk_involvedparty_orders FOREIGN KEY (orderid) REFERENCES "foliodb".orders(orderid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".involvedparty
    ADD CONSTRAINT fk_involvedparty_prefcomcode FOREIGN KEY (preferredcommunicationmethod) REFERENCES "foliodb".communicationmethodtype(communicationmethodtypecode);

ALTER TABLE ONLY "foliodb".involvedparty
    ADD CONSTRAINT fk_involvedparty_shipment FOREIGN KEY (shipmentid) REFERENCES "foliodb".shipment(shipmentid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".involvedpartyreference
    ADD CONSTRAINT fk_involvedpartyref_ipreftype FOREIGN KEY (involvedpartyreferencetypecode) REFERENCES "foliodb".involvedpartyreferencetype(involvedpartyreferencetypecode);

ALTER TABLE ONLY "foliodb".involvedpartyreference
    ADD CONSTRAINT fk_invptyref_invpty FOREIGN KEY (involvedpartyid) REFERENCES "foliodb".involvedparty(involvedpartyid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".item
    ADD CONSTRAINT fk_item_orghierarchy FOREIGN KEY (orgid) REFERENCES "foliodb".orghierarchy(orgid);

ALTER TABLE ONLY "foliodb".item
    ADD CONSTRAINT fk_item_sellpacktype FOREIGN KEY (sellpacktypecode) REFERENCES "foliodb".sellpacktype(sellpacktypecode);

ALTER TABLE ONLY "foliodb".itemclassification
    ADD CONSTRAINT fk_itemclasss_itemclasstype FOREIGN KEY (itemclassificationtypecode) REFERENCES "foliodb".itemclassificationtype(itemclassificationtypecode);

ALTER TABLE ONLY "foliodb".itemclassification
    ADD CONSTRAINT fk_itemclasssification_item FOREIGN KEY (itemid) REFERENCES "foliodb".item(itemid);

ALTER TABLE ONLY "foliodb".itemcountryoforigin
    ADD CONSTRAINT fk_itemcountryoforigin_item FOREIGN KEY (itemid) REFERENCES "foliodb".item(itemid);

ALTER TABLE ONLY "foliodb".itemcountryoforigin
    ADD CONSTRAINT fk_itemcountryorigin_country FOREIGN KEY (countrycode) REFERENCES "foliodb".country(countrycode);

ALTER TABLE ONLY "foliodb".itemequivalency
    ADD CONSTRAINT fk_itemequivalency_orghier FOREIGN KEY (orgid) REFERENCES "foliodb".orghierarchy(orgid);

ALTER TABLE ONLY "foliodb".itemhazmattype
    ADD CONSTRAINT fk_itemhaz_hazmattype FOREIGN KEY (hazmatmaterialtypecode) REFERENCES "foliodb".hazmatmaterialtype(hazmatmaterialtypecode);

ALTER TABLE ONLY "foliodb".itemhazmattype
    ADD CONSTRAINT fk_itemhazmat_item FOREIGN KEY (itemid) REFERENCES "foliodb".item(itemid);

ALTER TABLE ONLY "foliodb".itemhazmattype
    ADD CONSTRAINT fk_itemhazmat_leg FOREIGN KEY (legid) REFERENCES "foliodb".leg(legid);

ALTER TABLE ONLY "foliodb".itemhazmattype
    ADD CONSTRAINT fk_itemhazmat_legcontainer FOREIGN KEY (legcontainerid) REFERENCES "foliodb".legcontainer(legcontainerid);

ALTER TABLE ONLY "foliodb".itemhazmattype
    ADD CONSTRAINT fk_itemhazmat_package FOREIGN KEY (packageid) REFERENCES "foliodb".package(packageid);

ALTER TABLE ONLY "foliodb".itemhazmattype
    ADD CONSTRAINT fk_itemhazmat_shipment FOREIGN KEY (shipmentid) REFERENCES "foliodb".shipment(shipmentid);

ALTER TABLE ONLY "foliodb".itemhazmattype
    ADD CONSTRAINT fk_itemhazmattype_event FOREIGN KEY (eventid) REFERENCES "foliodb".event(eventid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".itemhts
    ADD CONSTRAINT fk_itemhts_country FOREIGN KEY (countrycode) REFERENCES "foliodb".country(countrycode);

ALTER TABLE ONLY "foliodb".itemhts
    ADD CONSTRAINT fk_itemhts_domainobject FOREIGN KEY (domainobjectcode) REFERENCES "foliodb".domainobject(domainobjectcode);

ALTER TABLE ONLY "foliodb".itemhts
    ADD CONSTRAINT fk_itemhts_itemitemh_item FOREIGN KEY (itemid) REFERENCES "foliodb".item(itemid);

ALTER TABLE ONLY "foliodb".itemitemequivalency
    ADD CONSTRAINT fk_itemitem_itemiteme_itemequi FOREIGN KEY (itemequivalencyid) REFERENCES "foliodb".itemequivalency(itemequivalencyid);

ALTER TABLE ONLY "foliodb".itemitemequivalency
    ADD CONSTRAINT fk_itemitemequivalency_item FOREIGN KEY (itemid) REFERENCES "foliodb".item(itemid);

ALTER TABLE ONLY "foliodb".itemhts
    ADD CONSTRAINT fk_itlclassificationcode FOREIGN KEY (itlclassificationcode) REFERENCES "foliodb".itlclassification(itlclassificationcode);

ALTER TABLE ONLY "foliodb".lane
    ADD CONSTRAINT fk_lane_lanedesti_address FOREIGN KEY (destinationaddressid) REFERENCES "foliodb".address(addressid);

ALTER TABLE ONLY "foliodb".lane
    ADD CONSTRAINT fk_lane_lanedesti_geolocat FOREIGN KEY (destinationgeolocationid) REFERENCES "foliodb".geolocation(geolocationid);

ALTER TABLE ONLY "foliodb".lane
    ADD CONSTRAINT fk_lane_lanedesti_region FOREIGN KEY (destinationregionid) REFERENCES "foliodb".region(regionid);

ALTER TABLE ONLY "foliodb".lane
    ADD CONSTRAINT fk_lane_laneorigi_address FOREIGN KEY (originaddressid) REFERENCES "foliodb".address(addressid);

ALTER TABLE ONLY "foliodb".lane
    ADD CONSTRAINT fk_lane_laneorigi_geolocat FOREIGN KEY (origingeolocationid) REFERENCES "foliodb".geolocation(geolocationid);

ALTER TABLE ONLY "foliodb".lane
    ADD CONSTRAINT fk_lane_laneorigi_region FOREIGN KEY (originregionid) REFERENCES "foliodb".region(regionid);

ALTER TABLE ONLY "foliodb".leg
    ADD CONSTRAINT fk_leg_address_destination FOREIGN KEY (destinationaddressid) REFERENCES "foliodb".address(addressid);

ALTER TABLE ONLY "foliodb".leg
    ADD CONSTRAINT fk_leg_address_origin FOREIGN KEY (originaddressid) REFERENCES "foliodb".address(addressid);

ALTER TABLE ONLY "foliodb".leg
    ADD CONSTRAINT fk_leg_dockrecepit FOREIGN KEY (dockreceiptid) REFERENCES "foliodb".dockreceipt(dockreceiptid);

ALTER TABLE ONLY "foliodb".invoicedetail
    ADD CONSTRAINT fk_leg_invoicedetail FOREIGN KEY (legid) REFERENCES "foliodb".leg(legid);

ALTER TABLE ONLY "foliodb".invoicelineitem
    ADD CONSTRAINT fk_leg_invoiceli FOREIGN KEY (legid) REFERENCES "foliodb".leg(legid);

ALTER TABLE ONLY "foliodb".leg
    ADD CONSTRAINT fk_leg_leg_planningleg FOREIGN KEY (planninglegid) REFERENCES "foliodb".leg(legid);

ALTER TABLE ONLY "foliodb".leg
    ADD CONSTRAINT fk_leg_methodofpayment FOREIGN KEY (methodofpaymentcode) REFERENCES "foliodb".methodofpayment(methodofpaymentcode);

ALTER TABLE ONLY "foliodb".leg
    ADD CONSTRAINT fk_leg_orghierachy_negbuyorgid FOREIGN KEY (negbuyrateorgid) REFERENCES "foliodb".orghierarchy(orgid);

ALTER TABLE ONLY "foliodb".otherweightsandmeasures
    ADD CONSTRAINT fk_leg_otherweight FOREIGN KEY (legid) REFERENCES "foliodb".leg(legid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".leg
    ADD CONSTRAINT fk_leg_paymenttermstype FOREIGN KEY (paymenttermstypecode) REFERENCES "foliodb".paymenttermstype(paymenttermstypecode);

ALTER TABLE ONLY "foliodb".leg
    ADD CONSTRAINT fk_leg_pickupleg_pickup FOREIGN KEY (pickupid) REFERENCES "foliodb".pickup(pickupid);

ALTER TABLE ONLY "foliodb".leg
    ADD CONSTRAINT fk_leg_servicelevel FOREIGN KEY (servicelevelcode) REFERENCES "foliodb".servicelevel(servicelevelcode);

ALTER TABLE ONLY "foliodb".leg
    ADD CONSTRAINT fk_leg_servicetype FOREIGN KEY (servicetypecode) REFERENCES "foliodb".servicetype(servicetypecode);

ALTER TABLE ONLY "foliodb".leg
    ADD CONSTRAINT fk_leg_shipment FOREIGN KEY (shipmentid) REFERENCES "foliodb".shipment(shipmentid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".leg
    ADD CONSTRAINT fk_leg_shipmentstatus FOREIGN KEY (legstatuscode) REFERENCES "foliodb".shipmentstatus(shipmentstatuscode);

ALTER TABLE ONLY "foliodb".leg
    ADD CONSTRAINT fk_leg_transactionstatus FOREIGN KEY (transactionstatustypecode) REFERENCES "foliodb".transactionstatustype(transactionstatustypecode);

ALTER TABLE ONLY "foliodb".leg
    ADD CONSTRAINT fk_leg_transportmode FOREIGN KEY (modecode) REFERENCES "foliodb".transportmode(transportmodecode);

ALTER TABLE ONLY "foliodb".legcharge
    ADD CONSTRAINT fk_legcharge_frightpayment FOREIGN KEY (freightpaymenttypecode) REFERENCES "foliodb".freightpaymenttype(freightpaymenttypecode);

ALTER TABLE ONLY "foliodb".legcharge
    ADD CONSTRAINT fk_legcharge_leg FOREIGN KEY (legid) REFERENCES "foliodb".leg(legid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".legcontainer
    ADD CONSTRAINT fk_legcont_cont FOREIGN KEY (containerid) REFERENCES "foliodb".container(containerid);

ALTER TABLE ONLY "foliodb".legcontainer
    ADD CONSTRAINT fk_legcont_containertype FOREIGN KEY (containertypecode) REFERENCES "foliodb".containertype(containertypecode);

ALTER TABLE ONLY "foliodb".legcontainer
    ADD CONSTRAINT fk_legcontainer_leg FOREIGN KEY (legid) REFERENCES "foliodb".leg(legid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".otherweightsandmeasures
    ADD CONSTRAINT fk_legcontainer_otherweight FOREIGN KEY (legcontainerid) REFERENCES "foliodb".legcontainer(legcontainerid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".legcontainer
    ADD CONSTRAINT fk_legcontainer_servicetype FOREIGN KEY (servicetypecode) REFERENCES "foliodb".servicetype(servicetypecode);

ALTER TABLE ONLY "foliodb".leg
    ADD CONSTRAINT fk_legincoterms FOREIGN KEY (incotermstypecode) REFERENCES "foliodb".incotermstype(incotermstypecode);

ALTER TABLE ONLY "foliodb".legreference
    ADD CONSTRAINT fk_legrefer_shipmentreftype FOREIGN KEY (shipmentreferencetypecode) REFERENCES "foliodb".shipmentreferencetype(shipmentreferencetypecode);

ALTER TABLE ONLY "foliodb".legreference
    ADD CONSTRAINT fk_legreference_leg FOREIGN KEY (legid) REFERENCES "foliodb".leg(legid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".legroutedetails
    ADD CONSTRAINT fk_legroute_vesselrole FOREIGN KEY (vesselrolecode) REFERENCES "foliodb".vesselrole(vesselrolecode);

ALTER TABLE ONLY "foliodb".legroutedetails
    ADD CONSTRAINT fk_legroute_vesselvehicle FOREIGN KEY (vesselvehicleid) REFERENCES "foliodb".vesselvehicle(vesselvehicleid);

ALTER TABLE ONLY "foliodb".legroutedetails
    ADD CONSTRAINT fk_legroutedetails_event FOREIGN KEY (eventid) REFERENCES "foliodb".event(eventid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".legroutedetails
    ADD CONSTRAINT fk_legroutedetails_leg FOREIGN KEY (legid) REFERENCES "foliodb".leg(legid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".legroutedetails
    ADD CONSTRAINT fk_legroutedetails_legstop FOREIGN KEY (legstopid) REFERENCES "foliodb".legstop(stopid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".legroutedetails
    ADD CONSTRAINT fk_legroutedetails_modecode FOREIGN KEY (modecode) REFERENCES "foliodb".transportmode(transportmodecode);

ALTER TABLE ONLY "foliodb".legroutedetails
    ADD CONSTRAINT fk_legroutedtl_conveyinstance FOREIGN KEY (conveyinstanceid) REFERENCES "foliodb".conveyinstance(conveyinstanceid);

ALTER TABLE ONLY "foliodb".legstatushistory
    ADD CONSTRAINT fk_legstatushistory_leg FOREIGN KEY (legid) REFERENCES "foliodb".leg(legid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".legstop
    ADD CONSTRAINT fk_legstop_address FOREIGN KEY (addressid) REFERENCES "foliodb".address(addressid);

ALTER TABLE ONLY "foliodb".legstop
    ADD CONSTRAINT fk_legstop_leg FOREIGN KEY (legid) REFERENCES "foliodb".leg(legid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".legstop
    ADD CONSTRAINT fk_legstop_rtlegid FOREIGN KEY (routingtemplatelegid) REFERENCES "foliodb".routingtemplateleg(routingtemplatelegid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".invoice
    ADD CONSTRAINT fk_methodofpayment_invoice FOREIGN KEY (methodofpaymentcode) REFERENCES "foliodb".methodofpayment(methodofpaymentcode);

ALTER TABLE ONLY "foliodb".invoicedetail
    ADD CONSTRAINT fk_methodpayment_invoicedetail FOREIGN KEY (methodofpaymentcode) REFERENCES "foliodb".methodofpayment(methodofpaymentcode);

ALTER TABLE ONLY "foliodb".fdt_module
    ADD CONSTRAINT fk_module_productcode FOREIGN KEY (productcode) REFERENCES "foliodb".fdt_product(productcode) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".observedholiday
    ADD CONSTRAINT fk_observed_relations_holidayi FOREIGN KEY (holidayinstanceid) REFERENCES "foliodb".holidayinstance(holidayinstanceid);

ALTER TABLE ONLY "foliodb".observedholiday
    ADD CONSTRAINT fk_observed_relations_operatin FOREIGN KEY (operatingscheduleid) REFERENCES "foliodb".operatingschedule(operatingscheduleid);

ALTER TABLE ONLY "foliodb".operatinghours
    ADD CONSTRAINT fk_operatin_relations_business FOREIGN KEY (businessactivitiescode) REFERENCES "foliodb".businessactivities(businessactivitiescode);

ALTER TABLE ONLY "foliodb".operatinghours
    ADD CONSTRAINT fk_operatin_relations_operatin FOREIGN KEY (operatingscheduleid) REFERENCES "foliodb".operatingschedule(operatingscheduleid);

ALTER TABLE ONLY "foliodb".invoicedetail
    ADD CONSTRAINT fk_order_invoicedetail FOREIGN KEY (orderid) REFERENCES "foliodb".orders(orderid);

ALTER TABLE ONLY "foliodb".invoicelineitem
    ADD CONSTRAINT fk_order_invoiceli FOREIGN KEY (orderid) REFERENCES "foliodb".orders(orderid);

ALTER TABLE ONLY "foliodb".orderinstruction
    ADD CONSTRAINT fk_orderinstr_orders FOREIGN KEY (orderid) REFERENCES "foliodb".orders(orderid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".orderinstruction
    ADD CONSTRAINT fk_orderinstr_shipinstrtype FOREIGN KEY (shipmentinstructiontypecode) REFERENCES "foliodb".shipmentinstructiontype(shipmentinstructiontypecode);

ALTER TABLE ONLY "foliodb".orderitem
    ADD CONSTRAINT fk_orderitem_item FOREIGN KEY (itemid) REFERENCES "foliodb".item(itemid);

ALTER TABLE ONLY "foliodb".orderitem
    ADD CONSTRAINT fk_orderitem_order FOREIGN KEY (orderid) REFERENCES "foliodb".orders(orderid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".orderreference
    ADD CONSTRAINT fk_orderref_orders FOREIGN KEY (orderid) REFERENCES "foliodb".orders(orderid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".orderreference
    ADD CONSTRAINT fk_orderref_shipreftype FOREIGN KEY (shipmentreferencetypecode) REFERENCES "foliodb".shipmentreferencetype(shipmentreferencetypecode);

ALTER TABLE ONLY "foliodb".orderrelease
    ADD CONSTRAINT fk_orderrel_transationstatus FOREIGN KEY (transactionstatustypecode) REFERENCES "foliodb".transactionstatustype(transactionstatustypecode);

ALTER TABLE ONLY "foliodb".invoicedetail
    ADD CONSTRAINT fk_orderrelease_invoicedetail FOREIGN KEY (orderreleaseid) REFERENCES "foliodb".orderreference(orderreferenceid);

ALTER TABLE ONLY "foliodb".orderrelease
    ADD CONSTRAINT fk_orderrelease_orderstatus FOREIGN KEY (orderstatuscode) REFERENCES "foliodb".orderstatus(orderstatuscode);

ALTER TABLE ONLY "foliodb".orderrelease
    ADD CONSTRAINT fk_orderrelease_orghier FOREIGN KEY (carrier) REFERENCES "foliodb".orghierarchy(orgid);

ALTER TABLE ONLY "foliodb".orderreleaseitem
    ADD CONSTRAINT fk_orderreleaseitem_item FOREIGN KEY (itemid) REFERENCES "foliodb".item(itemid);

ALTER TABLE ONLY "foliodb".orderreleasereference
    ADD CONSTRAINT fk_orderrelref_orderrel FOREIGN KEY (orderreleaseid) REFERENCES "foliodb".orderrelease(orderreleaseid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".orderreleasereference
    ADD CONSTRAINT fk_orderrelref_shipreftype FOREIGN KEY (shipmentreferencetypecode) REFERENCES "foliodb".shipmentreferencetype(shipmentreferencetypecode);

ALTER TABLE ONLY "foliodb".orders
    ADD CONSTRAINT fk_orders_destiaddress FOREIGN KEY (destinationaddressid) REFERENCES "foliodb".address(addressid);

ALTER TABLE ONLY "foliodb".orders
    ADD CONSTRAINT fk_orders_incotermstype FOREIGN KEY (incotermstypecode) REFERENCES "foliodb".incotermstype(incotermstypecode);

ALTER TABLE ONLY "foliodb".orders
    ADD CONSTRAINT fk_orders_methodofpayment FOREIGN KEY (methodofpaymentcode) REFERENCES "foliodb".methodofpayment(methodofpaymentcode);

ALTER TABLE ONLY "foliodb".orders
    ADD CONSTRAINT fk_orders_orderstatus FOREIGN KEY (orderstatuscode) REFERENCES "foliodb".orderstatus(orderstatuscode);

ALTER TABLE ONLY "foliodb".orders
    ADD CONSTRAINT fk_orders_ordertype FOREIGN KEY (ordertypecode) REFERENCES "foliodb".ordertype(ordertypecode);

ALTER TABLE ONLY "foliodb".orders
    ADD CONSTRAINT fk_orders_originaddress FOREIGN KEY (originaddressid) REFERENCES "foliodb".address(addressid);

ALTER TABLE ONLY "foliodb".orders
    ADD CONSTRAINT fk_orders_preferredorgid FOREIGN KEY (preferredcarrierorgid) REFERENCES "foliodb".orghierarchy(orgid);

ALTER TABLE ONLY "foliodb".orders
    ADD CONSTRAINT fk_orders_transactionstatus FOREIGN KEY (transactionstatustypecode) REFERENCES "foliodb".transactionstatustype(transactionstatustypecode);

ALTER TABLE ONLY "foliodb".orders
    ADD CONSTRAINT fk_orders_transportmode FOREIGN KEY (modecode) REFERENCES "foliodb".transportmode(transportmodecode);

ALTER TABLE ONLY "foliodb".ordertemplate
    ADD CONSTRAINT fk_ordertem_destinati_address FOREIGN KEY (destinationaddressid) REFERENCES "foliodb".address(addressid);

ALTER TABLE ONLY "foliodb".ordertemplate
    ADD CONSTRAINT fk_ordertem_originloc_address FOREIGN KEY (originaddressid) REFERENCES "foliodb".address(addressid);

ALTER TABLE ONLY "foliodb".ordertemplate
    ADD CONSTRAINT fk_ordertem_shipmentt_shipment FOREIGN KEY (shippingtermscode) REFERENCES "foliodb".shipmentterms(shipmenttermscode);

ALTER TABLE ONLY "foliodb".invoicechargetype
    ADD CONSTRAINT fk_org_invoicechargetype FOREIGN KEY (carrierorgid) REFERENCES "foliodb".orghierarchy(orgid);

ALTER TABLE ONLY "foliodb".orghierarchy
    ADD CONSTRAINT fk_orghiera_orgincorp_country FOREIGN KEY (countrycode) REFERENCES "foliodb".country(countrycode);

ALTER TABLE ONLY "foliodb".orghierarchy
    ADD CONSTRAINT fk_orghiera_orgrolety_orgrole FOREIGN KEY (orgrolecode) REFERENCES "foliodb".orgrole(orgrolecode);

ALTER TABLE ONLY "foliodb".orghierarchy
    ADD CONSTRAINT fk_orghierarchy_contacts FOREIGN KEY (contactsalutationcode) REFERENCES "foliodb".contactsalutation(contactsalutationcode);

ALTER TABLE ONLY "foliodb".orghierarchy
    ADD CONSTRAINT fk_orghierarchy_orghierarchy FOREIGN KEY (parentorgid) REFERENCES "foliodb".orghierarchy(orgid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".orghierarchy
    ADD CONSTRAINT fk_orghierarchy_orghtype FOREIGN KEY (orghierarchytypecode) REFERENCES "foliodb".orghierarchytype(orghierarchytypecode);

ALTER TABLE ONLY "foliodb".positionaldata
    ADD CONSTRAINT fk_orgierarchy_positionaldata FOREIGN KEY (dataprivoderorgid) REFERENCES "foliodb".orghierarchy(orgid);

ALTER TABLE ONLY "foliodb".orgorgassoc
    ADD CONSTRAINT fk_orgorgassoc_destorg FOREIGN KEY (destorgid) REFERENCES "foliodb".orghierarchy(orgid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".orgorgassoc
    ADD CONSTRAINT fk_orgorgassoc_srcorg FOREIGN KEY (srcorgid) REFERENCES "foliodb".orghierarchy(orgid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".orgreference
    ADD CONSTRAINT fk_orgreference_orghierarchy FOREIGN KEY (orgid) REFERENCES "foliodb".orghierarchy(orgid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".orgreference
    ADD CONSTRAINT fk_orgreference_orgreftype FOREIGN KEY (orgreferencetypecode) REFERENCES "foliodb".orgreferencetype(orgreferencetypecode);

ALTER TABLE ONLY "foliodb".otherweightsandmeasures
    ADD CONSTRAINT fk_otherweighs_domainobject FOREIGN KEY (domainobjectcode) REFERENCES "foliodb".domainobject(domainobjectcode);

ALTER TABLE ONLY "foliodb".otherweightsandmeasures
    ADD CONSTRAINT fk_otherweights_event FOREIGN KEY (eventid) REFERENCES "foliodb".event(eventid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".otherweightsandmeasures
    ADD CONSTRAINT fk_otherweights_measuretype FOREIGN KEY (measurevaluetypecode) REFERENCES "foliodb".othermeasuretype(othermeasuretypecode);

ALTER TABLE ONLY "foliodb".package
    ADD CONSTRAINT fk_package_commodityclass FOREIGN KEY (commodityclassid) REFERENCES "foliodb".commodityclass(commodityclassid);

ALTER TABLE ONLY "foliodb".invoicelineitem
    ADD CONSTRAINT fk_package_invoiceli FOREIGN KEY (packageid) REFERENCES "foliodb".package(packageid);

ALTER TABLE ONLY "foliodb".package
    ADD CONSTRAINT fk_package_package_parentid FOREIGN KEY (parentpackageid) REFERENCES "foliodb".package(packageid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".package
    ADD CONSTRAINT fk_package_packagetype FOREIGN KEY (packagetypecode) REFERENCES "foliodb".packagetype(packagetypecode);

ALTER TABLE ONLY "foliodb".package
    ADD CONSTRAINT fk_package_shipment FOREIGN KEY (shipmentid) REFERENCES "foliodb".shipment(shipmentid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".packagelineitem
    ADD CONSTRAINT fk_packagelineitem_item FOREIGN KEY (itemid) REFERENCES "foliodb".item(itemid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".packagelineitem
    ADD CONSTRAINT fk_packagelineitem_order FOREIGN KEY (orderid) REFERENCES "foliodb".orders(orderid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".packagelineitem
    ADD CONSTRAINT fk_packagelineitem_orderitem FOREIGN KEY (orderitemid) REFERENCES "foliodb".orderitem(orderitemid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".packagelineitem
    ADD CONSTRAINT fk_packagelineitem_package FOREIGN KEY (packageid) REFERENCES "foliodb".package(packageid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".packagemarksnumbers
    ADD CONSTRAINT fk_packagemarks_package FOREIGN KEY (packageid) REFERENCES "foliodb".package(packageid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".packagereference
    ADD CONSTRAINT fk_packagereference_package FOREIGN KEY (packageid) REFERENCES "foliodb".package(packageid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".packagetransit
    ADD CONSTRAINT fk_packagetransit_legcontainer FOREIGN KEY (legcontainerid) REFERENCES "foliodb".legcontainer(legcontainerid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".packagetransit
    ADD CONSTRAINT fk_packagetransit_package FOREIGN KEY (packageid) REFERENCES "foliodb".package(packageid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".invoice
    ADD CONSTRAINT fk_paymenttermstype_invoice FOREIGN KEY (paymenttermstypecode) REFERENCES "foliodb".paymenttermstype(paymenttermstypecode);

ALTER TABLE ONLY "foliodb".rate
    ADD CONSTRAINT fk_rate_commodityclass FOREIGN KEY (commodityclassid) REFERENCES "foliodb".commodityclass(commodityclassid);

ALTER TABLE ONLY "foliodb".rate
    ADD CONSTRAINT fk_rate_commodityclassgroup FOREIGN KEY (commodityclassgroupid) REFERENCES "foliodb".commodityclassgroup(commodityclassgroupid);

ALTER TABLE ONLY "foliodb".rate
    ADD CONSTRAINT fk_rate_container_containe FOREIGN KEY (containertypecode) REFERENCES "foliodb".containertype(containertypecode);

ALTER TABLE ONLY "foliodb".rate
    ADD CONSTRAINT fk_rate_determinant_cost FOREIGN KEY (costdeterminantid) REFERENCES "foliodb".determinant(determinantid);

ALTER TABLE ONLY "foliodb".rate
    ADD CONSTRAINT fk_rate_lane FOREIGN KEY (laneid) REFERENCES "foliodb".lane(laneid);

ALTER TABLE ONLY "foliodb".rate
    ADD CONSTRAINT fk_rate_ratezone FOREIGN KEY (ratezoneid) REFERENCES "foliodb".ratezone(ratezoneid);

ALTER TABLE ONLY "foliodb".rate
    ADD CONSTRAINT fk_rate_tariff FOREIGN KEY (tariffid) REFERENCES "foliodb".tariff(tariffid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".ratecost
    ADD CONSTRAINT fk_ratecost_rate FOREIGN KEY (rateid) REFERENCES "foliodb".rate(rateid);

ALTER TABLE ONLY "foliodb".ratecost
    ADD CONSTRAINT fk_ratecost_ratecosttype FOREIGN KEY (ratecosttypecode) REFERENCES "foliodb".ratecosttype(ratecosttypecode);

ALTER TABLE ONLY "foliodb".rategroupmembership
    ADD CONSTRAINT fk_rategroupmbr_lane FOREIGN KEY (laneid) REFERENCES "foliodb".lane(laneid);

ALTER TABLE ONLY "foliodb".rategroupmembership
    ADD CONSTRAINT fk_rategroupmbr_rategroup FOREIGN KEY (rategroupid) REFERENCES "foliodb".rategroup(rategroupid);

ALTER TABLE ONLY "foliodb".ratezonelane
    ADD CONSTRAINT fk_ratezone_lane FOREIGN KEY (laneid) REFERENCES "foliodb".lane(laneid);

ALTER TABLE ONLY "foliodb".ratezonelane
    ADD CONSTRAINT fk_ratezonelane_ratezone FOREIGN KEY (ratezoneid) REFERENCES "foliodb".ratezone(ratezoneid);

ALTER TABLE ONLY "foliodb".regionmembership
    ADD CONSTRAINT fk_regionme_regiongeo_geolocat FOREIGN KEY (geolocationid) REFERENCES "foliodb".geolocation(geolocationid);

ALTER TABLE ONLY "foliodb".regionmembership
    ADD CONSTRAINT fk_regionme_regionmem_region FOREIGN KEY (regionid) REFERENCES "foliodb".region(regionid);

ALTER TABLE ONLY "foliodb".routingtemplatelegsserviceleve
    ADD CONSTRAINT fk_routingt_relations_routingt FOREIGN KEY (routingtemplatelegid) REFERENCES "foliodb".routingtemplateleg(routingtemplatelegid);

ALTER TABLE ONLY "foliodb".routingtemplatelegsserviceleve
    ADD CONSTRAINT fk_routingt_relations_servicel FOREIGN KEY (servicelevelcode) REFERENCES "foliodb".servicelevel(servicelevelcode);

ALTER TABLE ONLY "foliodb".routingtemplate
    ADD CONSTRAINT fk_routingt_routingpl_address FOREIGN KEY (addressid) REFERENCES "foliodb".address(addressid);

ALTER TABLE ONLY "foliodb".routingtemplate
    ADD CONSTRAINT fk_routingt_routingpl_containe FOREIGN KEY (containertypegroupid) REFERENCES "foliodb".containertypegroup(containertypegroupid);

ALTER TABLE ONLY "foliodb".routingtemplate
    ADD CONSTRAINT fk_routingt_routingpl_geolocat FOREIGN KEY (geolocationid) REFERENCES "foliodb".geolocation(geolocationid);

ALTER TABLE ONLY "foliodb".routingtemplate
    ADD CONSTRAINT fk_routingt_routingpl_region FOREIGN KEY (regionid) REFERENCES "foliodb".region(regionid);

ALTER TABLE ONLY "foliodb".routingtemplate
    ADD CONSTRAINT fk_routingt_routingpl_transpor FOREIGN KEY (modecode) REFERENCES "foliodb".transportmode(transportmodecode);

ALTER TABLE ONLY "foliodb".routingtemplate
    ADD CONSTRAINT fk_routingt_routingpl_zipcoder FOREIGN KEY (zipcoderangeid) REFERENCES "foliodb".zipcoderange(zipcoderangeid);

ALTER TABLE ONLY "foliodb".routingtemplate
    ADD CONSTRAINT fk_routingtemplte_region_dest FOREIGN KEY (destregionid) REFERENCES "foliodb".region(regionid);

ALTER TABLE ONLY "foliodb".routingtemplateleg
    ADD CONSTRAINT fk_routingtl_geolocat FOREIGN KEY (geolocationid) REFERENCES "foliodb".geolocation(geolocationid);

ALTER TABLE ONLY "foliodb".routingtemplateleg
    ADD CONSTRAINT fk_routingtl_orghiero_orghiera FOREIGN KEY (orgid) REFERENCES "foliodb".orghierarchy(orgid);

ALTER TABLE ONLY "foliodb".routingtemplateleg
    ADD CONSTRAINT fk_routingtl_proxmity_orgrole FOREIGN KEY (orgrolecode) REFERENCES "foliodb".orgrole(orgrolecode);

ALTER TABLE ONLY "foliodb".routingtemplateleg
    ADD CONSTRAINT fk_routingtl_proxmity_unitofme FOREIGN KEY (uomcode) REFERENCES "foliodb".unitofmeasure(uomcode);

ALTER TABLE ONLY "foliodb".routingtemplateleg
    ADD CONSTRAINT fk_routingtl_routingpl_address FOREIGN KEY (addressid) REFERENCES "foliodb".address(addressid);

ALTER TABLE ONLY "foliodb".routingtemplateleg
    ADD CONSTRAINT fk_routingtl_routingpl_region FOREIGN KEY (regionid) REFERENCES "foliodb".region(regionid);

ALTER TABLE ONLY "foliodb".routingtemplateleg
    ADD CONSTRAINT fk_routingtl_routingpl_zipcodr FOREIGN KEY (zipcoderangeid) REFERENCES "foliodb".zipcoderange(zipcoderangeid);

ALTER TABLE ONLY "foliodb".routingtemplateleg
    ADD CONSTRAINT fk_routingtl_routngpl_containe FOREIGN KEY (containertypecode) REFERENCES "foliodb".containertype(containertypecode);

ALTER TABLE ONLY "foliodb".routingtemplateleg
    ADD CONSTRAINT fk_routingtl_routngpl_transpor FOREIGN KEY (modecode) REFERENCES "foliodb".transportmode(transportmodecode);

ALTER TABLE ONLY "foliodb".routingtemplateleg
    ADD CONSTRAINT fk_routingtpl_routingtpl_leg FOREIGN KEY (routingtemplateid) REFERENCES "foliodb".routingtemplate(routingtemplateid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".securitydevice
    ADD CONSTRAINT fk_securitydevice_convey FOREIGN KEY (conveyinstanceid) REFERENCES "foliodb".conveyinstance(conveyinstanceid);

ALTER TABLE ONLY "foliodb".securitydevice
    ADD CONSTRAINT fk_securitydevice_devicetype FOREIGN KEY (securitydevicetypeid) REFERENCES "foliodb".securitydevicetype(securitydevicetypeid);

ALTER TABLE ONLY "foliodb".securitydevice
    ADD CONSTRAINT fk_securitydevice_event FOREIGN KEY (eventid) REFERENCES "foliodb".event(eventid);

ALTER TABLE ONLY "foliodb".securitydevice
    ADD CONSTRAINT fk_securitydeviceregistry FOREIGN KEY (securitydeviceregistryid) REFERENCES "foliodb".securitydeviceregistry(securitydeviceregistryid);

ALTER TABLE ONLY "foliodb".securitydevicevalue
    ADD CONSTRAINT fk_securitydeviceval_scrtydvc FOREIGN KEY (securitydeviceid) REFERENCES "foliodb".securitydevice(securitydeviceid);

ALTER TABLE ONLY "foliodb".securitydevicevalue
    ADD CONSTRAINT fk_securitydevicevalue_event FOREIGN KEY (eventid) REFERENCES "foliodb".event(eventid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".securitydevicevalue
    ADD CONSTRAINT fk_securitydevicevalue_legcon FOREIGN KEY (legcontainerid) REFERENCES "foliodb".legcontainer(legcontainerid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".securitydevicevaluetype
    ADD CONSTRAINT fk_securitydevvaluetype_sdtype FOREIGN KEY (securitydevicetypeid) REFERENCES "foliodb".securitydevicetype(securitydevicetypeid);

ALTER TABLE ONLY "foliodb".service
    ADD CONSTRAINT fk_service_orgservic_orghiera FOREIGN KEY (orgid) REFERENCES "foliodb".orghierarchy(orgid);

ALTER TABLE ONLY "foliodb".service
    ADD CONSTRAINT fk_service_transitti_transitt FOREIGN KEY (transittimetypecode) REFERENCES "foliodb".transittimetype(transittimetypecode);

ALTER TABLE ONLY "foliodb".serviceservicelevel
    ADD CONSTRAINT fk_services_relations_service FOREIGN KEY (serviceid) REFERENCES "foliodb".service(serviceid);

ALTER TABLE ONLY "foliodb".serviceservicelevel
    ADD CONSTRAINT fk_services_servicele_servicel FOREIGN KEY (servicelevelcode) REFERENCES "foliodb".servicelevel(servicelevelcode);

ALTER TABLE ONLY "foliodb".invoicechargetype
    ADD CONSTRAINT fk_shipchargetype_invchargetyp FOREIGN KEY (shipmentchargetypecode) REFERENCES "foliodb".shipmentchargetype(shipmentchargetypecode);

ALTER TABLE ONLY "foliodb".shipmentcharge
    ADD CONSTRAINT fk_shipchargetype_shipcharge FOREIGN KEY (shipmentchargetypecode) REFERENCES "foliodb".shipmentchargetype(shipmentchargetypecode);

ALTER TABLE ONLY "foliodb".payment
    ADD CONSTRAINT fk_shipment FOREIGN KEY (shipmentid) REFERENCES "foliodb".shipment(shipmentid);

ALTER TABLE ONLY "foliodb".shipment
    ADD CONSTRAINT fk_shipment_bolstatustype FOREIGN KEY (bolstatustypecode) REFERENCES "foliodb".bolstatustype(bolstatustypecode);

ALTER TABLE ONLY "foliodb".shipment
    ADD CONSTRAINT fk_shipment_commodityclass FOREIGN KEY (commodityclassid) REFERENCES "foliodb".commodityclass(commodityclassid);

ALTER TABLE ONLY "foliodb".shipmentcontainerbooking
    ADD CONSTRAINT fk_shipment_ediequipm_edi_iso2 FOREIGN KEY (equipmenttypecode) REFERENCES "foliodb".edi_iso_equipmenttype(equipmenttypecode);

ALTER TABLE ONLY "foliodb".shipment
    ADD CONSTRAINT fk_shipment_incotermstype FOREIGN KEY (incotermstypecode) REFERENCES "foliodb".incotermstype(incotermstypecode);

ALTER TABLE ONLY "foliodb".invoicedetail
    ADD CONSTRAINT fk_shipment_invoicedetail FOREIGN KEY (shipmentid) REFERENCES "foliodb".shipment(shipmentid);

ALTER TABLE ONLY "foliodb".invoicelineitem
    ADD CONSTRAINT fk_shipment_invoiceli FOREIGN KEY (shipmentid) REFERENCES "foliodb".shipment(shipmentid);

ALTER TABLE ONLY "foliodb".otherweightsandmeasures
    ADD CONSTRAINT fk_shipment_otherweight FOREIGN KEY (shipmentid) REFERENCES "foliodb".shipment(shipmentid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".shipment
    ADD CONSTRAINT fk_shipment_packagetype FOREIGN KEY (manifestunittypecode) REFERENCES "foliodb".packagetype(packagetypecode);

ALTER TABLE ONLY "foliodb".shipmentcontainerbooking
    ADD CONSTRAINT fk_shipment_relations_equipmen FOREIGN KEY (equipmentstatuscode) REFERENCES "foliodb".equipmentstatus(equipmentstatuscode);

ALTER TABLE ONLY "foliodb".shipment
    ADD CONSTRAINT fk_shipment_servicelevel FOREIGN KEY (servicelevelcode) REFERENCES "foliodb".servicelevel(servicelevelcode);

ALTER TABLE ONLY "foliodb".shipment
    ADD CONSTRAINT fk_shipment_servicetype FOREIGN KEY (servicetypecode) REFERENCES "foliodb".servicetype(servicetypecode);

ALTER TABLE ONLY "foliodb".shipment
    ADD CONSTRAINT fk_shipment_shipment_control FOREIGN KEY (controlshipmentid) REFERENCES "foliodb".shipment(shipmentid);

ALTER TABLE ONLY "foliodb".shipmentconsolidation
    ADD CONSTRAINT fk_shipment_shipmentconsol FOREIGN KEY (houseshipmentid) REFERENCES "foliodb".shipment(shipmentid);

ALTER TABLE ONLY "foliodb".shipmentinstruction
    ADD CONSTRAINT fk_shipment_shipmenti_shipment FOREIGN KEY (shipmentinstructiontypecode) REFERENCES "foliodb".shipmentinstructiontype(shipmentinstructiontypecode);

ALTER TABLE ONLY "foliodb".shipmentreference
    ADD CONSTRAINT fk_shipment_shipmentr_shipment FOREIGN KEY (shipmentreferencetypecode) REFERENCES "foliodb".shipmentreferencetype(shipmentreferencetypecode);

ALTER TABLE ONLY "foliodb".shipment
    ADD CONSTRAINT fk_shipment_shipmentstatus FOREIGN KEY (shipmentstatuscode) REFERENCES "foliodb".shipmentstatus(shipmentstatuscode);

ALTER TABLE ONLY "foliodb".eventstop
    ADD CONSTRAINT fk_shipment_stopfunct_stopfun2 FOREIGN KEY (stopfunctioncode) REFERENCES "foliodb".stopfunction(stopfunctioncode);

ALTER TABLE ONLY "foliodb".shipment
    ADD CONSTRAINT fk_shipment_transactionstatus FOREIGN KEY (transactionstatustypecode) REFERENCES "foliodb".transactionstatustype(transactionstatustypecode);

ALTER TABLE ONLY "foliodb".shipmentcharge
    ADD CONSTRAINT fk_shipmentcharge_leg FOREIGN KEY (legid) REFERENCES "foliodb".leg(legid);

ALTER TABLE ONLY "foliodb".shipmentcharge
    ADD CONSTRAINT fk_shipmentcharge_package FOREIGN KEY (packageid) REFERENCES "foliodb".package(packageid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".shipmentcharge
    ADD CONSTRAINT fk_shipmentcharge_paymenttype FOREIGN KEY (freightpaymenttypecode) REFERENCES "foliodb".freightpaymenttype(freightpaymenttypecode);

ALTER TABLE ONLY "foliodb".shipmentcharge
    ADD CONSTRAINT fk_shipmentcharge_shipment FOREIGN KEY (shipmentid) REFERENCES "foliodb".shipment(shipmentid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".shipmentconsolidation
    ADD CONSTRAINT fk_shipmentconsol_shipment FOREIGN KEY (mastershipmentid) REFERENCES "foliodb".shipment(shipmentid);

ALTER TABLE ONLY "foliodb".shipmentcontainerbooking
    ADD CONSTRAINT fk_shipmentcontbook_shipment FOREIGN KEY (shipmentid) REFERENCES "foliodb".shipment(shipmentid);

ALTER TABLE ONLY "foliodb".shipmentinstruction
    ADD CONSTRAINT fk_shipmentins_legcontainer FOREIGN KEY (legcontainerid) REFERENCES "foliodb".legcontainer(legcontainerid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".shipmentinstruction
    ADD CONSTRAINT fk_shipmentinst_package FOREIGN KEY (packageid) REFERENCES "foliodb".package(packageid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".shipmentinstruction
    ADD CONSTRAINT fk_shipmentinstr_invoicedetail FOREIGN KEY (invoicedetailid) REFERENCES "foliodb".invoicedetail(invoicedetailid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".shipmentinstruction
    ADD CONSTRAINT fk_shipmentinstr_invoiceli FOREIGN KEY (invoicelineitemid) REFERENCES "foliodb".invoicelineitem(invoicelineitemid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".shipmentinstruction
    ADD CONSTRAINT fk_shipmentinstr_leg FOREIGN KEY (legid) REFERENCES "foliodb".leg(legid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".shipmentinstruction
    ADD CONSTRAINT fk_shipmentinstr_shipment FOREIGN KEY (shipmentid) REFERENCES "foliodb".shipment(shipmentid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".shipmentreference
    ADD CONSTRAINT fk_shipmentreference_shipment FOREIGN KEY (shipmentid) REFERENCES "foliodb".shipment(shipmentid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".invoicedetail
    ADD CONSTRAINT fk_shipmentterms_invoicedetail FOREIGN KEY (shipmenttermscode) REFERENCES "foliodb".shipmentterms(shipmenttermscode);

ALTER TABLE ONLY "foliodb".shipmentstatushistory
    ADD CONSTRAINT fk_shipstatushistory_shipment FOREIGN KEY (shipmentid) REFERENCES "foliodb".shipment(shipmentid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".invoicelineitem
    ADD CONSTRAINT fk_tafiff_invoiceli FOREIGN KEY (tariffid) REFERENCES "foliodb".tariff(tariffid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".tariff
    ADD CONSTRAINT fk_tariff_commodityclassgrp FOREIGN KEY (commodityclassgroupid) REFERENCES "foliodb".commodityclassgroup(commodityclassgroupid);

ALTER TABLE ONLY "foliodb".tariff
    ADD CONSTRAINT fk_tariff_containertypegrp FOREIGN KEY (containertypegroupid) REFERENCES "foliodb".containertypegroup(containertypegroupid);

ALTER TABLE ONLY "foliodb".tariff
    ADD CONSTRAINT fk_tariff_operatingschd FOREIGN KEY (operatingscheduleid) REFERENCES "foliodb".operatingschedule(operatingscheduleid);

ALTER TABLE ONLY "foliodb".tariff
    ADD CONSTRAINT fk_tariff_orghierarchy FOREIGN KEY (carrierorgid) REFERENCES "foliodb".orghierarchy(orgid);

ALTER TABLE ONLY "foliodb".tariff
    ADD CONSTRAINT fk_tariff_ratecalcutype FOREIGN KEY (ratecalculationtypecode) REFERENCES "foliodb".ratecalculationtype(ratecalculationtypecode);

ALTER TABLE ONLY "foliodb".tariff
    ADD CONSTRAINT fk_tariff_servicel FOREIGN KEY (servicelevelcode) REFERENCES "foliodb".servicelevel(servicelevelcode);

ALTER TABLE ONLY "foliodb".tariff
    ADD CONSTRAINT fk_tariff_tariff_basetariffid FOREIGN KEY (basetariffid) REFERENCES "foliodb".tariff(tariffid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".tariff
    ADD CONSTRAINT fk_tariff_transport_transpor FOREIGN KEY (modecode) REFERENCES "foliodb".transportmode(transportmodecode);

ALTER TABLE ONLY "foliodb".templatefield
    ADD CONSTRAINT fk_template FOREIGN KEY (documenttemplateid) REFERENCES "foliodb".documenttemplate(documenttemplateid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".documentstatushistory
    ADD CONSTRAINT fk_todocumentstatushistory FOREIGN KEY (todocumentstatuscode) REFERENCES "foliodb".documentstatus(documentstatuscode);

ALTER TABLE ONLY "foliodb".docsubmissionstatushistory
    ADD CONSTRAINT fk_todocusubmissionhstry FOREIGN KEY (tosubmissionstatuscode) REFERENCES "foliodb".docsubmissionstatus(docsubmissionstatuscode);

ALTER TABLE ONLY "foliodb".transitservicedistance
    ADD CONSTRAINT fk_transitsd_lane FOREIGN KEY (laneid) REFERENCES "foliodb".lane(laneid) ON DELETE CASCADE;

ALTER TABLE ONLY "foliodb".invoicedetail
    ADD CONSTRAINT fk_transportmode_invoicedetl FOREIGN KEY (transportmodecode) REFERENCES "foliodb".transportmode(transportmodecode);

ALTER TABLE ONLY "foliodb".unitconversion
    ADD CONSTRAINT fk_unitconv_fromunitu_unitofme FOREIGN KEY (uomcode) REFERENCES "foliodb".unitofmeasure(uomcode);

ALTER TABLE ONLY "foliodb".unitconversion
    ADD CONSTRAINT fk_unitconv_tounituni_unitofme FOREIGN KEY (touomcode) REFERENCES "foliodb".unitofmeasure(uomcode);

ALTER TABLE ONLY "foliodb".unitofmeasure
    ADD CONSTRAINT fk_unitofme_unitcateg_unitcate FOREIGN KEY (unitcategorycode) REFERENCES "foliodb".unitcategory(unitcategorycode);

ALTER TABLE ONLY "foliodb".zipcoderange
    ADD CONSTRAINT fk_zipcoderange_country FOREIGN KEY (countrycode) REFERENCES "foliodb".country(countrycode) ON DELETE CASCADE;
