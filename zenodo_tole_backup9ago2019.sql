--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: access_actionsroles; Type: TABLE; Schema: public; Owner: zenodo
--

CREATE TABLE public.access_actionsroles (
    id integer NOT NULL,
    action character varying(80),
    exclude boolean DEFAULT false NOT NULL,
    argument character varying(255),
    role_id integer NOT NULL
);


ALTER TABLE public.access_actionsroles OWNER TO zenodo;

--
-- Name: access_actionsroles_id_seq; Type: SEQUENCE; Schema: public; Owner: zenodo
--

CREATE SEQUENCE public.access_actionsroles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.access_actionsroles_id_seq OWNER TO zenodo;

--
-- Name: access_actionsroles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zenodo
--

ALTER SEQUENCE public.access_actionsroles_id_seq OWNED BY public.access_actionsroles.id;


--
-- Name: access_actionssystemroles; Type: TABLE; Schema: public; Owner: zenodo
--

CREATE TABLE public.access_actionssystemroles (
    id integer NOT NULL,
    action character varying(80),
    exclude boolean DEFAULT false NOT NULL,
    argument character varying(255),
    role_name character varying(40) NOT NULL
);


ALTER TABLE public.access_actionssystemroles OWNER TO zenodo;

--
-- Name: access_actionssystemroles_id_seq; Type: SEQUENCE; Schema: public; Owner: zenodo
--

CREATE SEQUENCE public.access_actionssystemroles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.access_actionssystemroles_id_seq OWNER TO zenodo;

--
-- Name: access_actionssystemroles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zenodo
--

ALTER SEQUENCE public.access_actionssystemroles_id_seq OWNED BY public.access_actionssystemroles.id;


--
-- Name: access_actionsusers; Type: TABLE; Schema: public; Owner: zenodo
--

CREATE TABLE public.access_actionsusers (
    id integer NOT NULL,
    action character varying(80),
    exclude boolean DEFAULT false NOT NULL,
    argument character varying(255),
    user_id integer NOT NULL
);


ALTER TABLE public.access_actionsusers OWNER TO zenodo;

--
-- Name: access_actionsusers_id_seq; Type: SEQUENCE; Schema: public; Owner: zenodo
--

CREATE SEQUENCE public.access_actionsusers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.access_actionsusers_id_seq OWNER TO zenodo;

--
-- Name: access_actionsusers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zenodo
--

ALTER SEQUENCE public.access_actionsusers_id_seq OWNED BY public.access_actionsusers.id;


--
-- Name: accessrequests_link; Type: TABLE; Schema: public; Owner: zenodo
--

CREATE TABLE public.accessrequests_link (
    id integer NOT NULL,
    token bytea NOT NULL,
    owner_user_id integer NOT NULL,
    created timestamp without time zone NOT NULL,
    expires_at timestamp without time zone,
    revoked_at timestamp without time zone,
    title character varying(255) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.accessrequests_link OWNER TO zenodo;

--
-- Name: accessrequests_link_id_seq; Type: SEQUENCE; Schema: public; Owner: zenodo
--

CREATE SEQUENCE public.accessrequests_link_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accessrequests_link_id_seq OWNER TO zenodo;

--
-- Name: accessrequests_link_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zenodo
--

ALTER SEQUENCE public.accessrequests_link_id_seq OWNED BY public.accessrequests_link.id;


--
-- Name: accessrequests_request; Type: TABLE; Schema: public; Owner: zenodo
--

CREATE TABLE public.accessrequests_request (
    id integer NOT NULL,
    status character(1) NOT NULL,
    receiver_user_id integer NOT NULL,
    sender_user_id integer,
    sender_full_name character varying(255) NOT NULL,
    sender_email character varying(255) NOT NULL,
    recid integer NOT NULL,
    created timestamp without time zone NOT NULL,
    modified timestamp without time zone NOT NULL,
    justification text NOT NULL,
    message text NOT NULL,
    link_id integer
);


ALTER TABLE public.accessrequests_request OWNER TO zenodo;

--
-- Name: accessrequests_request_id_seq; Type: SEQUENCE; Schema: public; Owner: zenodo
--

CREATE SEQUENCE public.accessrequests_request_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accessrequests_request_id_seq OWNER TO zenodo;

--
-- Name: accessrequests_request_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zenodo
--

ALTER SEQUENCE public.accessrequests_request_id_seq OWNED BY public.accessrequests_request.id;


--
-- Name: accounts_role; Type: TABLE; Schema: public; Owner: zenodo
--

CREATE TABLE public.accounts_role (
    id integer NOT NULL,
    name character varying(80),
    description character varying(255)
);


ALTER TABLE public.accounts_role OWNER TO zenodo;

--
-- Name: accounts_role_id_seq; Type: SEQUENCE; Schema: public; Owner: zenodo
--

CREATE SEQUENCE public.accounts_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_role_id_seq OWNER TO zenodo;

--
-- Name: accounts_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zenodo
--

ALTER SEQUENCE public.accounts_role_id_seq OWNED BY public.accounts_role.id;


--
-- Name: accounts_user; Type: TABLE; Schema: public; Owner: zenodo
--

CREATE TABLE public.accounts_user (
    id integer NOT NULL,
    email character varying(255),
    password character varying(255),
    active boolean,
    confirmed_at timestamp without time zone,
    last_login_at timestamp without time zone,
    current_login_at timestamp without time zone,
    last_login_ip character varying(50),
    current_login_ip character varying(50),
    login_count integer
);


ALTER TABLE public.accounts_user OWNER TO zenodo;

--
-- Name: accounts_user_id_seq; Type: SEQUENCE; Schema: public; Owner: zenodo
--

CREATE SEQUENCE public.accounts_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_user_id_seq OWNER TO zenodo;

--
-- Name: accounts_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zenodo
--

ALTER SEQUENCE public.accounts_user_id_seq OWNED BY public.accounts_user.id;


--
-- Name: accounts_user_session_activity; Type: TABLE; Schema: public; Owner: zenodo
--

CREATE TABLE public.accounts_user_session_activity (
    created timestamp without time zone NOT NULL,
    updated timestamp without time zone NOT NULL,
    sid_s character varying(255) NOT NULL,
    user_id integer,
    ip character varying(80),
    country character varying(3),
    browser character varying(80),
    browser_version character varying(30),
    os character varying(80),
    device character varying(80)
);


ALTER TABLE public.accounts_user_session_activity OWNER TO zenodo;

--
-- Name: accounts_userrole; Type: TABLE; Schema: public; Owner: zenodo
--

CREATE TABLE public.accounts_userrole (
    user_id integer,
    role_id integer
);


ALTER TABLE public.accounts_userrole OWNER TO zenodo;

--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: zenodo
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO zenodo;

--
-- Name: communities_community; Type: TABLE; Schema: public; Owner: zenodo
--

CREATE TABLE public.communities_community (
    created timestamp without time zone NOT NULL,
    updated timestamp without time zone NOT NULL,
    id character varying(100) NOT NULL,
    id_user integer NOT NULL,
    title character varying(255) NOT NULL,
    description text NOT NULL,
    page text NOT NULL,
    curation_policy text NOT NULL,
    last_record_accepted timestamp without time zone NOT NULL,
    logo_ext character varying(4),
    ranking integer NOT NULL,
    fixed_points integer NOT NULL,
    deleted_at timestamp without time zone
);


ALTER TABLE public.communities_community OWNER TO zenodo;

--
-- Name: communities_community_record; Type: TABLE; Schema: public; Owner: zenodo
--

CREATE TABLE public.communities_community_record (
    created timestamp without time zone NOT NULL,
    updated timestamp without time zone NOT NULL,
    id_community character varying(100) NOT NULL,
    id_record uuid NOT NULL,
    id_user integer,
    expires_at timestamp without time zone
);


ALTER TABLE public.communities_community_record OWNER TO zenodo;

--
-- Name: communities_featured_community; Type: TABLE; Schema: public; Owner: zenodo
--

CREATE TABLE public.communities_featured_community (
    created timestamp without time zone NOT NULL,
    updated timestamp without time zone NOT NULL,
    id integer NOT NULL,
    id_community character varying(100) NOT NULL,
    start_date timestamp without time zone NOT NULL
);


ALTER TABLE public.communities_featured_community OWNER TO zenodo;

--
-- Name: communities_featured_community_id_seq; Type: SEQUENCE; Schema: public; Owner: zenodo
--

CREATE SEQUENCE public.communities_featured_community_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.communities_featured_community_id_seq OWNER TO zenodo;

--
-- Name: communities_featured_community_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zenodo
--

ALTER SEQUENCE public.communities_featured_community_id_seq OWNED BY public.communities_featured_community.id;


--
-- Name: files_bucket; Type: TABLE; Schema: public; Owner: zenodo
--

CREATE TABLE public.files_bucket (
    created timestamp without time zone NOT NULL,
    updated timestamp without time zone NOT NULL,
    id uuid NOT NULL,
    default_location integer NOT NULL,
    default_storage_class character varying(1) NOT NULL,
    size bigint NOT NULL,
    quota_size bigint,
    max_file_size bigint,
    locked boolean NOT NULL,
    deleted boolean NOT NULL
);


ALTER TABLE public.files_bucket OWNER TO zenodo;

--
-- Name: files_buckettags; Type: TABLE; Schema: public; Owner: zenodo
--

CREATE TABLE public.files_buckettags (
    bucket_id uuid NOT NULL,
    key character varying(255) NOT NULL,
    value text NOT NULL
);


ALTER TABLE public.files_buckettags OWNER TO zenodo;

--
-- Name: files_files; Type: TABLE; Schema: public; Owner: zenodo
--

CREATE TABLE public.files_files (
    created timestamp without time zone NOT NULL,
    updated timestamp without time zone NOT NULL,
    id uuid NOT NULL,
    uri text,
    storage_class character varying(1),
    size bigint,
    checksum character varying(255),
    readable boolean NOT NULL,
    writable boolean NOT NULL,
    last_check_at timestamp without time zone,
    last_check boolean
);


ALTER TABLE public.files_files OWNER TO zenodo;

--
-- Name: files_location; Type: TABLE; Schema: public; Owner: zenodo
--

CREATE TABLE public.files_location (
    created timestamp without time zone NOT NULL,
    updated timestamp without time zone NOT NULL,
    id integer NOT NULL,
    name character varying(20) NOT NULL,
    uri character varying(255) NOT NULL,
    "default" boolean NOT NULL
);


ALTER TABLE public.files_location OWNER TO zenodo;

--
-- Name: files_location_id_seq; Type: SEQUENCE; Schema: public; Owner: zenodo
--

CREATE SEQUENCE public.files_location_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.files_location_id_seq OWNER TO zenodo;

--
-- Name: files_location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zenodo
--

ALTER SEQUENCE public.files_location_id_seq OWNED BY public.files_location.id;


--
-- Name: files_multipartobject; Type: TABLE; Schema: public; Owner: zenodo
--

CREATE TABLE public.files_multipartobject (
    created timestamp without time zone NOT NULL,
    updated timestamp without time zone NOT NULL,
    upload_id uuid NOT NULL,
    bucket_id uuid,
    key text,
    file_id uuid NOT NULL,
    chunk_size integer,
    size bigint,
    completed boolean NOT NULL
);


ALTER TABLE public.files_multipartobject OWNER TO zenodo;

--
-- Name: files_multipartobject_part; Type: TABLE; Schema: public; Owner: zenodo
--

CREATE TABLE public.files_multipartobject_part (
    created timestamp without time zone NOT NULL,
    updated timestamp without time zone NOT NULL,
    upload_id uuid NOT NULL,
    part_number integer NOT NULL,
    checksum character varying(255)
);


ALTER TABLE public.files_multipartobject_part OWNER TO zenodo;

--
-- Name: files_object; Type: TABLE; Schema: public; Owner: zenodo
--

CREATE TABLE public.files_object (
    created timestamp without time zone NOT NULL,
    updated timestamp without time zone NOT NULL,
    bucket_id uuid NOT NULL,
    key text NOT NULL,
    version_id uuid NOT NULL,
    file_id uuid,
    _mimetype character varying(255),
    is_head boolean NOT NULL
);


ALTER TABLE public.files_object OWNER TO zenodo;

--
-- Name: github_releases; Type: TABLE; Schema: public; Owner: zenodo
--

CREATE TABLE public.github_releases (
    created timestamp without time zone NOT NULL,
    updated timestamp without time zone NOT NULL,
    id uuid NOT NULL,
    release_id integer,
    tag character varying(255),
    errors json,
    repository_id uuid,
    event_id uuid,
    record_id uuid,
    status character(1) NOT NULL
);


ALTER TABLE public.github_releases OWNER TO zenodo;

--
-- Name: github_repositories; Type: TABLE; Schema: public; Owner: zenodo
--

CREATE TABLE public.github_repositories (
    created timestamp without time zone NOT NULL,
    updated timestamp without time zone NOT NULL,
    id uuid NOT NULL,
    github_id integer,
    name character varying(255) NOT NULL,
    user_id integer,
    ping timestamp without time zone,
    hook integer
);


ALTER TABLE public.github_repositories OWNER TO zenodo;

--
-- Name: oaiserver_set; Type: TABLE; Schema: public; Owner: zenodo
--

CREATE TABLE public.oaiserver_set (
    created timestamp without time zone NOT NULL,
    updated timestamp without time zone NOT NULL,
    id integer NOT NULL,
    spec character varying(255) NOT NULL,
    name character varying(255),
    description text,
    search_pattern text
);


ALTER TABLE public.oaiserver_set OWNER TO zenodo;

--
-- Name: oaiserver_set_id_seq; Type: SEQUENCE; Schema: public; Owner: zenodo
--

CREATE SEQUENCE public.oaiserver_set_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oaiserver_set_id_seq OWNER TO zenodo;

--
-- Name: oaiserver_set_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zenodo
--

ALTER SEQUENCE public.oaiserver_set_id_seq OWNED BY public.oaiserver_set.id;


--
-- Name: oauth2server_client; Type: TABLE; Schema: public; Owner: zenodo
--

CREATE TABLE public.oauth2server_client (
    name character varying(40),
    description text,
    website text,
    user_id integer,
    client_id character varying(255) NOT NULL,
    client_secret character varying(255) NOT NULL,
    is_confidential boolean,
    is_internal boolean,
    _redirect_uris text,
    _default_scopes text
);


ALTER TABLE public.oauth2server_client OWNER TO zenodo;

--
-- Name: oauth2server_token; Type: TABLE; Schema: public; Owner: zenodo
--

CREATE TABLE public.oauth2server_token (
    id integer NOT NULL,
    client_id character varying(255) NOT NULL,
    user_id integer,
    token_type character varying(255),
    access_token bytea,
    refresh_token bytea,
    expires timestamp without time zone,
    _scopes text,
    is_personal boolean,
    is_internal boolean
);


ALTER TABLE public.oauth2server_token OWNER TO zenodo;

--
-- Name: oauth2server_token_id_seq; Type: SEQUENCE; Schema: public; Owner: zenodo
--

CREATE SEQUENCE public.oauth2server_token_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2server_token_id_seq OWNER TO zenodo;

--
-- Name: oauth2server_token_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zenodo
--

ALTER SEQUENCE public.oauth2server_token_id_seq OWNED BY public.oauth2server_token.id;


--
-- Name: oauthclient_remoteaccount; Type: TABLE; Schema: public; Owner: zenodo
--

CREATE TABLE public.oauthclient_remoteaccount (
    created timestamp without time zone NOT NULL,
    updated timestamp without time zone NOT NULL,
    id integer NOT NULL,
    user_id integer NOT NULL,
    client_id character varying(255) NOT NULL,
    extra_data json NOT NULL
);


ALTER TABLE public.oauthclient_remoteaccount OWNER TO zenodo;

--
-- Name: oauthclient_remoteaccount_id_seq; Type: SEQUENCE; Schema: public; Owner: zenodo
--

CREATE SEQUENCE public.oauthclient_remoteaccount_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauthclient_remoteaccount_id_seq OWNER TO zenodo;

--
-- Name: oauthclient_remoteaccount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zenodo
--

ALTER SEQUENCE public.oauthclient_remoteaccount_id_seq OWNED BY public.oauthclient_remoteaccount.id;


--
-- Name: oauthclient_remotetoken; Type: TABLE; Schema: public; Owner: zenodo
--

CREATE TABLE public.oauthclient_remotetoken (
    created timestamp without time zone NOT NULL,
    updated timestamp without time zone NOT NULL,
    id_remote_account integer NOT NULL,
    token_type character varying(40) NOT NULL,
    access_token bytea NOT NULL,
    secret text NOT NULL
);


ALTER TABLE public.oauthclient_remotetoken OWNER TO zenodo;

--
-- Name: oauthclient_useridentity; Type: TABLE; Schema: public; Owner: zenodo
--

CREATE TABLE public.oauthclient_useridentity (
    created timestamp without time zone NOT NULL,
    updated timestamp without time zone NOT NULL,
    id character varying(255) NOT NULL,
    method character varying(255) NOT NULL,
    id_user integer NOT NULL
);


ALTER TABLE public.oauthclient_useridentity OWNER TO zenodo;

--
-- Name: pidrelations_pidrelation; Type: TABLE; Schema: public; Owner: zenodo
--

CREATE TABLE public.pidrelations_pidrelation (
    created timestamp without time zone NOT NULL,
    updated timestamp without time zone NOT NULL,
    parent_id integer NOT NULL,
    child_id integer NOT NULL,
    relation_type smallint NOT NULL,
    index integer
);


ALTER TABLE public.pidrelations_pidrelation OWNER TO zenodo;

--
-- Name: pidstore_pid; Type: TABLE; Schema: public; Owner: zenodo
--

CREATE TABLE public.pidstore_pid (
    created timestamp without time zone NOT NULL,
    updated timestamp without time zone NOT NULL,
    id integer NOT NULL,
    pid_type character varying(6) NOT NULL,
    pid_value character varying(255) NOT NULL,
    pid_provider character varying(8),
    status character(1) NOT NULL,
    object_type character varying(3),
    object_uuid uuid
);


ALTER TABLE public.pidstore_pid OWNER TO zenodo;

--
-- Name: pidstore_pid_id_seq; Type: SEQUENCE; Schema: public; Owner: zenodo
--

CREATE SEQUENCE public.pidstore_pid_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pidstore_pid_id_seq OWNER TO zenodo;

--
-- Name: pidstore_pid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zenodo
--

ALTER SEQUENCE public.pidstore_pid_id_seq OWNED BY public.pidstore_pid.id;


--
-- Name: pidstore_recid; Type: TABLE; Schema: public; Owner: zenodo
--

CREATE TABLE public.pidstore_recid (
    recid bigint NOT NULL
);


ALTER TABLE public.pidstore_recid OWNER TO zenodo;

--
-- Name: pidstore_recid_recid_seq; Type: SEQUENCE; Schema: public; Owner: zenodo
--

CREATE SEQUENCE public.pidstore_recid_recid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pidstore_recid_recid_seq OWNER TO zenodo;

--
-- Name: pidstore_recid_recid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zenodo
--

ALTER SEQUENCE public.pidstore_recid_recid_seq OWNED BY public.pidstore_recid.recid;


--
-- Name: pidstore_redirect; Type: TABLE; Schema: public; Owner: zenodo
--

CREATE TABLE public.pidstore_redirect (
    created timestamp without time zone NOT NULL,
    updated timestamp without time zone NOT NULL,
    id uuid NOT NULL,
    pid_id integer NOT NULL
);


ALTER TABLE public.pidstore_redirect OWNER TO zenodo;

--
-- Name: records_buckets; Type: TABLE; Schema: public; Owner: zenodo
--

CREATE TABLE public.records_buckets (
    record_id uuid NOT NULL,
    bucket_id uuid NOT NULL
);


ALTER TABLE public.records_buckets OWNER TO zenodo;

--
-- Name: records_metadata; Type: TABLE; Schema: public; Owner: zenodo
--

CREATE TABLE public.records_metadata (
    created timestamp without time zone NOT NULL,
    updated timestamp without time zone NOT NULL,
    id uuid NOT NULL,
    json jsonb,
    version_id integer NOT NULL
);


ALTER TABLE public.records_metadata OWNER TO zenodo;

--
-- Name: records_metadata_version; Type: TABLE; Schema: public; Owner: zenodo
--

CREATE TABLE public.records_metadata_version (
    created timestamp without time zone,
    updated timestamp without time zone,
    id uuid NOT NULL,
    json jsonb,
    version_id integer,
    transaction_id bigint NOT NULL,
    end_transaction_id bigint,
    operation_type smallint NOT NULL
);


ALTER TABLE public.records_metadata_version OWNER TO zenodo;

--
-- Name: sipstore_recordsip; Type: TABLE; Schema: public; Owner: zenodo
--

CREATE TABLE public.sipstore_recordsip (
    created timestamp without time zone NOT NULL,
    updated timestamp without time zone NOT NULL,
    sip_id uuid NOT NULL,
    pid_id integer NOT NULL
);


ALTER TABLE public.sipstore_recordsip OWNER TO zenodo;

--
-- Name: sipstore_sip; Type: TABLE; Schema: public; Owner: zenodo
--

CREATE TABLE public.sipstore_sip (
    created timestamp without time zone NOT NULL,
    updated timestamp without time zone NOT NULL,
    id uuid NOT NULL,
    user_id integer,
    agent json NOT NULL,
    archivable boolean NOT NULL,
    archived boolean NOT NULL
);


ALTER TABLE public.sipstore_sip OWNER TO zenodo;

--
-- Name: sipstore_sipfile; Type: TABLE; Schema: public; Owner: zenodo
--

CREATE TABLE public.sipstore_sipfile (
    created timestamp without time zone NOT NULL,
    updated timestamp without time zone NOT NULL,
    sip_id uuid NOT NULL,
    filepath text NOT NULL,
    file_id uuid NOT NULL
);


ALTER TABLE public.sipstore_sipfile OWNER TO zenodo;

--
-- Name: sipstore_sipmetadata; Type: TABLE; Schema: public; Owner: zenodo
--

CREATE TABLE public.sipstore_sipmetadata (
    created timestamp without time zone NOT NULL,
    updated timestamp without time zone NOT NULL,
    sip_id uuid NOT NULL,
    type_id integer NOT NULL,
    content text NOT NULL
);


ALTER TABLE public.sipstore_sipmetadata OWNER TO zenodo;

--
-- Name: sipstore_sipmetadatatype; Type: TABLE; Schema: public; Owner: zenodo
--

CREATE TABLE public.sipstore_sipmetadatatype (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    format character varying(255) NOT NULL,
    schema character varying(1024)
);


ALTER TABLE public.sipstore_sipmetadatatype OWNER TO zenodo;

--
-- Name: sipstore_sipmetadatatype_id_seq; Type: SEQUENCE; Schema: public; Owner: zenodo
--

CREATE SEQUENCE public.sipstore_sipmetadatatype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sipstore_sipmetadatatype_id_seq OWNER TO zenodo;

--
-- Name: sipstore_sipmetadatatype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zenodo
--

ALTER SEQUENCE public.sipstore_sipmetadatatype_id_seq OWNED BY public.sipstore_sipmetadatatype.id;


--
-- Name: transaction; Type: TABLE; Schema: public; Owner: zenodo
--

CREATE TABLE public.transaction (
    issued_at timestamp without time zone,
    id bigint NOT NULL,
    remote_addr character varying(50),
    user_id integer
);


ALTER TABLE public.transaction OWNER TO zenodo;

--
-- Name: transaction_id_seq; Type: SEQUENCE; Schema: public; Owner: zenodo
--

CREATE SEQUENCE public.transaction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transaction_id_seq OWNER TO zenodo;

--
-- Name: userprofiles_userprofile; Type: TABLE; Schema: public; Owner: zenodo
--

CREATE TABLE public.userprofiles_userprofile (
    user_id integer NOT NULL,
    username character varying(255),
    displayname character varying(255),
    full_name character varying(255) NOT NULL
);


ALTER TABLE public.userprofiles_userprofile OWNER TO zenodo;

--
-- Name: webhooks_events; Type: TABLE; Schema: public; Owner: zenodo
--

CREATE TABLE public.webhooks_events (
    created timestamp without time zone NOT NULL,
    updated timestamp without time zone NOT NULL,
    id uuid NOT NULL,
    receiver_id character varying(255) NOT NULL,
    user_id integer,
    payload json,
    payload_headers json,
    response json,
    response_headers json,
    response_code integer
);


ALTER TABLE public.webhooks_events OWNER TO zenodo;

--
-- Name: access_actionsroles id; Type: DEFAULT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.access_actionsroles ALTER COLUMN id SET DEFAULT nextval('public.access_actionsroles_id_seq'::regclass);


--
-- Name: access_actionssystemroles id; Type: DEFAULT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.access_actionssystemroles ALTER COLUMN id SET DEFAULT nextval('public.access_actionssystemroles_id_seq'::regclass);


--
-- Name: access_actionsusers id; Type: DEFAULT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.access_actionsusers ALTER COLUMN id SET DEFAULT nextval('public.access_actionsusers_id_seq'::regclass);


--
-- Name: accessrequests_link id; Type: DEFAULT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.accessrequests_link ALTER COLUMN id SET DEFAULT nextval('public.accessrequests_link_id_seq'::regclass);


--
-- Name: accessrequests_request id; Type: DEFAULT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.accessrequests_request ALTER COLUMN id SET DEFAULT nextval('public.accessrequests_request_id_seq'::regclass);


--
-- Name: accounts_role id; Type: DEFAULT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.accounts_role ALTER COLUMN id SET DEFAULT nextval('public.accounts_role_id_seq'::regclass);


--
-- Name: accounts_user id; Type: DEFAULT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.accounts_user ALTER COLUMN id SET DEFAULT nextval('public.accounts_user_id_seq'::regclass);


--
-- Name: communities_featured_community id; Type: DEFAULT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.communities_featured_community ALTER COLUMN id SET DEFAULT nextval('public.communities_featured_community_id_seq'::regclass);


--
-- Name: files_location id; Type: DEFAULT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.files_location ALTER COLUMN id SET DEFAULT nextval('public.files_location_id_seq'::regclass);


--
-- Name: oaiserver_set id; Type: DEFAULT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.oaiserver_set ALTER COLUMN id SET DEFAULT nextval('public.oaiserver_set_id_seq'::regclass);


--
-- Name: oauth2server_token id; Type: DEFAULT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.oauth2server_token ALTER COLUMN id SET DEFAULT nextval('public.oauth2server_token_id_seq'::regclass);


--
-- Name: oauthclient_remoteaccount id; Type: DEFAULT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.oauthclient_remoteaccount ALTER COLUMN id SET DEFAULT nextval('public.oauthclient_remoteaccount_id_seq'::regclass);


--
-- Name: pidstore_pid id; Type: DEFAULT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.pidstore_pid ALTER COLUMN id SET DEFAULT nextval('public.pidstore_pid_id_seq'::regclass);


--
-- Name: pidstore_recid recid; Type: DEFAULT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.pidstore_recid ALTER COLUMN recid SET DEFAULT nextval('public.pidstore_recid_recid_seq'::regclass);


--
-- Name: sipstore_sipmetadatatype id; Type: DEFAULT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.sipstore_sipmetadatatype ALTER COLUMN id SET DEFAULT nextval('public.sipstore_sipmetadatatype_id_seq'::regclass);


--
-- Data for Name: access_actionsroles; Type: TABLE DATA; Schema: public; Owner: zenodo
--

COPY public.access_actionsroles (id, action, exclude, argument, role_id) FROM stdin;
\.


--
-- Data for Name: access_actionssystemroles; Type: TABLE DATA; Schema: public; Owner: zenodo
--

COPY public.access_actionssystemroles (id, action, exclude, argument, role_name) FROM stdin;
\.


--
-- Data for Name: access_actionsusers; Type: TABLE DATA; Schema: public; Owner: zenodo
--

COPY public.access_actionsusers (id, action, exclude, argument, user_id) FROM stdin;
1	admin-access	f	\N	1
2	deposit-admin-access	f	\N	1
3	admin-access	f	\N	2
4	deposit-admin-access	f	\N	2
\.


--
-- Data for Name: accessrequests_link; Type: TABLE DATA; Schema: public; Owner: zenodo
--

COPY public.accessrequests_link (id, token, owner_user_id, created, expires_at, revoked_at, title, description) FROM stdin;
\.


--
-- Data for Name: accessrequests_request; Type: TABLE DATA; Schema: public; Owner: zenodo
--

COPY public.accessrequests_request (id, status, receiver_user_id, sender_user_id, sender_full_name, sender_email, recid, created, modified, justification, message, link_id) FROM stdin;
\.


--
-- Data for Name: accounts_role; Type: TABLE DATA; Schema: public; Owner: zenodo
--

COPY public.accounts_role (id, name, description) FROM stdin;
\.


--
-- Data for Name: accounts_user; Type: TABLE DATA; Schema: public; Owner: zenodo
--

COPY public.accounts_user (id, email, password, active, confirmed_at, last_login_at, current_login_at, last_login_ip, current_login_ip, login_count) FROM stdin;
1	info@zenodo.org	$pbkdf2-sha512$25000$USrlXAvBGIOQ0hpD6H3v3Q$QnMKmbTIanbXPTYV7vbmjPETf7mODb4yU2gaJ6.KYsstACnCWqUcIFGpPWjPzshxlqor1UrFRaxDhKFU0wqPBA	t	\N	\N	\N	\N	\N	\N
2	tole@ciencias.unam.mx	$pbkdf2-sha512$25000$8Z5z7t3bmxPi3Nsbw/gfow$x4Tjeo3gYbwyPAw1mfi7FNu9fWVcB1h1jbVS1ALGnRgjqzAlUkxG4dY3WzVm8ECPY7ta6w/fZgp8GX//72pvwg	t	\N	2019-08-08 19:27:27.838047	2019-08-08 19:27:27.838047	\N	172.18.0.12	1
\.


--
-- Data for Name: accounts_user_session_activity; Type: TABLE DATA; Schema: public; Owner: zenodo
--

COPY public.accounts_user_session_activity (created, updated, sid_s, user_id, ip, country, browser, browser_version, os, device) FROM stdin;
2019-08-08 19:27:27.913159	2019-08-08 19:27:27.913184	1d27c3b619993fd7_5d4c779f	2	172.18.0.12	\N	Firefox	68	Ubuntu	Other
\.


--
-- Data for Name: accounts_userrole; Type: TABLE DATA; Schema: public; Owner: zenodo
--

COPY public.accounts_userrole (user_id, role_id) FROM stdin;
\.


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: zenodo
--

COPY public.alembic_version (version_num) FROM stdin;
c25ef2c50ffa
1c4e509ccacc
07fb52561c5c
1ba76da94103
1d4e361b7586
bff1f190b9bd
4e57407b8e4a
e655021de0de
f741aa746a7d
2d9884d0e3fa
e12419831262
04480be1593e
\.


--
-- Data for Name: communities_community; Type: TABLE DATA; Schema: public; Owner: zenodo
--

COPY public.communities_community (created, updated, id, id_user, title, description, page, curation_policy, last_record_accepted, logo_ext, ranking, fixed_points, deleted_at) FROM stdin;
2019-08-08 19:19:47.531626	2019-08-08 19:19:47.531637	zenodo	1	Zenodo			See https://zenodo.org/policies	2000-01-01 00:00:00	\N	10000	0	\N
2019-08-08 19:19:47.574294	2019-08-08 19:19:47.664551	ecfunded	1	European Commission Funded Research (OpenAIRE)			Uploads must have been fully or partially funded by the European Commission.	2000-01-01 00:00:00	jpg	20000	0	\N
\.


--
-- Data for Name: communities_community_record; Type: TABLE DATA; Schema: public; Owner: zenodo
--

COPY public.communities_community_record (created, updated, id_community, id_record, id_user, expires_at) FROM stdin;
\.


--
-- Data for Name: communities_featured_community; Type: TABLE DATA; Schema: public; Owner: zenodo
--

COPY public.communities_featured_community (created, updated, id, id_community, start_date) FROM stdin;
\.


--
-- Data for Name: files_bucket; Type: TABLE DATA; Schema: public; Owner: zenodo
--

COPY public.files_bucket (created, updated, id, default_location, default_storage_class, size, quota_size, max_file_size, locked, deleted) FROM stdin;
2019-08-08 19:18:35.505842	2019-08-08 19:18:35.505852	00000000-0000-0000-0000-000000000001	1	S	0	\N	\N	f	f
2019-08-08 19:18:35.524915	2019-08-08 19:19:47.665624	00000000-0000-0000-0000-000000000000	1	S	55634	\N	\N	f	f
2019-08-08 19:31:48.373086	2019-08-08 19:35:05.143333	f216ce58-f597-4949-8ccf-ca65d139aaca	1	S	6545485	50000000000	50000000000	t	f
2019-08-08 19:35:05.152604	2019-08-08 19:35:05.169748	03b911fc-dc94-4f15-ac2c-e33eea2f7d35	1	S	6545485	50000000000	\N	t	f
\.


--
-- Data for Name: files_buckettags; Type: TABLE DATA; Schema: public; Owner: zenodo
--

COPY public.files_buckettags (bucket_id, key, value) FROM stdin;
\.


--
-- Data for Name: files_files; Type: TABLE DATA; Schema: public; Owner: zenodo
--

COPY public.files_files (created, updated, id, uri, storage_class, size, checksum, readable, writable, last_check_at, last_check) FROM stdin;
2019-08-08 19:19:47.605404	2019-08-08 19:19:47.663059	2c1f199c-4cba-4832-a079-36a1b910a9b4	/usr/local/var/instance/data/2c/1f/199c-4cba-4832-a079-36a1b910a9b4/data	S	55634	md5:8e789a66f5dcb1e8a8038388b47dae3e	t	f	\N	t
2019-08-08 19:35:00.020724	2019-08-08 19:35:05.166501	58bb136b-d6fb-44a8-8e4e-7ced59e74530	/usr/local/var/instance/data/58/bb/136b-d6fb-44a8-8e4e-7ced59e74530/data	S	6545485	md5:5922d896a8bbc63d35dc24f18e0932a2	t	f	2019-08-08 19:35:05.130797	t
\.


--
-- Data for Name: files_location; Type: TABLE DATA; Schema: public; Owner: zenodo
--

COPY public.files_location (created, updated, id, name, uri, "default") FROM stdin;
2019-08-08 19:18:35.47659	2019-08-08 19:18:35.476596	2	archive	/usr/local/var/instance/archive	f
2019-08-08 19:18:35.473734	2019-08-08 19:18:35.523946	1	default	/usr/local/var/instance/data	t
\.


--
-- Data for Name: files_multipartobject; Type: TABLE DATA; Schema: public; Owner: zenodo
--

COPY public.files_multipartobject (created, updated, upload_id, bucket_id, key, file_id, chunk_size, size, completed) FROM stdin;
\.


--
-- Data for Name: files_multipartobject_part; Type: TABLE DATA; Schema: public; Owner: zenodo
--

COPY public.files_multipartobject_part (created, updated, upload_id, part_number, checksum) FROM stdin;
\.


--
-- Data for Name: files_object; Type: TABLE DATA; Schema: public; Owner: zenodo
--

COPY public.files_object (created, updated, bucket_id, key, version_id, file_id, _mimetype, is_head) FROM stdin;
2019-08-08 19:19:47.592618	2019-08-08 19:19:47.607243	00000000-0000-0000-0000-000000000000	ecfunded/logo.jpg	7a125f60-f26b-419f-a7df-10482c29a9cf	2c1f199c-4cba-4832-a079-36a1b910a9b4	\N	t
2019-08-08 19:35:00.017136	2019-08-08 19:35:00.021858	f216ce58-f597-4949-8ccf-ca65d139aaca	clasificadores_17102018_2.csv	2aca8cb0-41b3-42d6-92c2-5e8297760cc9	58bb136b-d6fb-44a8-8e4e-7ced59e74530	\N	t
2019-08-08 19:35:05.162784	2019-08-08 19:35:05.167325	03b911fc-dc94-4f15-ac2c-e33eea2f7d35	clasificadores_17102018_2.csv	ded55142-bbb4-4498-ae74-3dadd0b6bee9	58bb136b-d6fb-44a8-8e4e-7ced59e74530	\N	t
\.


--
-- Data for Name: github_releases; Type: TABLE DATA; Schema: public; Owner: zenodo
--

COPY public.github_releases (created, updated, id, release_id, tag, errors, repository_id, event_id, record_id, status) FROM stdin;
\.


--
-- Data for Name: github_repositories; Type: TABLE DATA; Schema: public; Owner: zenodo
--

COPY public.github_repositories (created, updated, id, github_id, name, user_id, ping, hook) FROM stdin;
\.


--
-- Data for Name: oaiserver_set; Type: TABLE DATA; Schema: public; Owner: zenodo
--

COPY public.oaiserver_set (created, updated, id, spec, name, description, search_pattern) FROM stdin;
2019-08-08 19:18:35.512701	2019-08-08 19:18:35.512708	1	openaire	OpenAIRE	\N	\N
2019-08-08 19:18:35.514307	2019-08-08 19:18:35.514312	2	openaire_data	OpenAIRE data sets	\N	\N
2019-08-08 19:19:47.548521	2019-08-08 19:19:47.54853	3	user-zenodo	Zenodo		\N
2019-08-08 19:19:47.576197	2019-08-08 19:19:47.576207	4	user-ecfunded	European Commission Funded Research (OpenAIRE)		\N
\.


--
-- Data for Name: oauth2server_client; Type: TABLE DATA; Schema: public; Owner: zenodo
--

COPY public.oauth2server_client (name, description, website, user_id, client_id, client_secret, is_confidential, is_internal, _redirect_uris, _default_scopes) FROM stdin;
\.


--
-- Data for Name: oauth2server_token; Type: TABLE DATA; Schema: public; Owner: zenodo
--

COPY public.oauth2server_token (id, client_id, user_id, token_type, access_token, refresh_token, expires, _scopes, is_personal, is_internal) FROM stdin;
\.


--
-- Data for Name: oauthclient_remoteaccount; Type: TABLE DATA; Schema: public; Owner: zenodo
--

COPY public.oauthclient_remoteaccount (created, updated, id, user_id, client_id, extra_data) FROM stdin;
\.


--
-- Data for Name: oauthclient_remotetoken; Type: TABLE DATA; Schema: public; Owner: zenodo
--

COPY public.oauthclient_remotetoken (created, updated, id_remote_account, token_type, access_token, secret) FROM stdin;
\.


--
-- Data for Name: oauthclient_useridentity; Type: TABLE DATA; Schema: public; Owner: zenodo
--

COPY public.oauthclient_useridentity (created, updated, id, method, id_user) FROM stdin;
\.


--
-- Data for Name: pidrelations_pidrelation; Type: TABLE DATA; Schema: public; Owner: zenodo
--

COPY public.pidrelations_pidrelation (created, updated, parent_id, child_id, relation_type, index) FROM stdin;
2019-08-08 19:31:48.567693	2019-08-08 19:31:48.569687	125	126	0	0
\.


--
-- Data for Name: pidstore_pid; Type: TABLE DATA; Schema: public; Owner: zenodo
--

COPY public.pidstore_pid (created, updated, id, pid_type, pid_value, pid_provider, status, object_type, object_uuid) FROM stdin;
2019-08-08 19:18:47.088072	2019-08-08 19:18:47.088083	1	od_lic	bsd-3-clause	\N	R	rec	8e723a15-f833-4b18-a87d-ef2731f7272e
2019-08-08 19:18:47.102365	2019-08-08 19:18:47.102371	2	od_lic	bsd-2-clause	\N	R	rec	8ff66896-8add-4df0-8955-2aed12ef7b88
2019-08-08 19:18:47.114314	2019-08-08 19:18:47.11432	3	od_lic	afl-3.0	\N	R	rec	2192016c-2e87-4d90-9383-4895737a533a
2019-08-08 19:18:47.12617	2019-08-08 19:18:47.126176	4	od_lic	apl1.0	\N	R	rec	24ce19e6-deea-477e-9ece-18a86ba921ef
2019-08-08 19:18:47.138192	2019-08-08 19:18:47.138198	5	od_lic	agpl-v3	\N	R	rec	15bf2ce0-c0ce-47c5-9c54-b239e8ada285
2019-08-08 19:18:47.151108	2019-08-08 19:18:47.151114	6	od_lic	against-drm	\N	R	rec	0c21f398-2c9e-4d2f-9526-0ae4c00fd84f
2019-08-08 19:18:47.162621	2019-08-08 19:18:47.162627	7	od_lic	apache2.0	\N	R	rec	4df22231-8114-4804-b4bf-222e5cde4a3a
2019-08-08 19:18:47.177391	2019-08-08 19:18:47.1774	8	od_lic	apache	\N	R	rec	1fd0fcae-8931-482a-845f-a2db25dd9a39
2019-08-08 19:18:47.193789	2019-08-08 19:18:47.193795	9	od_lic	apsl-2.0	\N	R	rec	3981ef5f-3314-4a28-8226-a4b619d585a8
2019-08-08 19:18:47.206688	2019-08-08 19:18:47.206694	10	od_lic	artistic-license-2.0	\N	R	rec	00031ef0-4054-42df-bf1a-6d324ef5344a
2019-08-08 19:18:47.220067	2019-08-08 19:18:47.220073	11	od_lic	attribution	\N	R	rec	081f40bd-f27f-4abd-83bc-7e159d202deb
2019-08-08 19:18:47.232265	2019-08-08 19:18:47.232272	12	od_lic	bsd-license	\N	R	rec	35d4e803-c8f7-4c8b-a840-b3f1d9d75858
2019-08-08 19:18:47.246219	2019-08-08 19:18:47.246224	13	od_lic	bsl1.0	\N	R	rec	5cf54bef-ad8e-4ccf-935e-bce0e77dd791
2019-08-08 19:18:47.260358	2019-08-08 19:18:47.260364	14	od_lic	cuaoffice	\N	R	rec	ee597941-9429-46cd-8bdc-9085e46b632b
2019-08-08 19:18:47.273569	2019-08-08 19:18:47.273575	15	od_lic	canada-crown	\N	R	rec	d00f10b4-8255-4787-9ad1-f73e6f10b339
2019-08-08 19:18:47.287682	2019-08-08 19:18:47.287688	16	od_lic	cddl1	\N	R	rec	df3331bb-6f23-4e1e-afcd-c6816debd978
2019-08-08 19:18:47.302446	2019-08-08 19:18:47.302452	17	od_lic	cpal_1.0	\N	R	rec	754e6b99-1b77-4b67-919b-e8e52d89b2fc
2019-08-08 19:18:47.319711	2019-08-08 19:18:47.31972	18	od_lic	ca-tosl1.1	\N	R	rec	9b84c636-1c7e-405b-8caf-c63d3ad429a4
2019-08-08 19:18:47.336181	2019-08-08 19:18:47.336187	19	od_lic	cc-by-sa	\N	R	rec	068585ad-a46a-4981-bfcf-dabbf4ee06d0
2019-08-08 19:18:47.350725	2019-08-08 19:18:47.35073	20	od_lic	cc-by	\N	R	rec	5f8919d2-a403-47f6-a62e-e6ea0812e202
2019-08-08 19:18:47.365406	2019-08-08 19:18:47.365411	21	od_lic	cc-zero	\N	R	rec	c8ff7433-2edd-42f7-a5f5-74183ce4fd85
2019-08-08 19:18:47.378866	2019-08-08 19:18:47.378872	22	od_lic	cc-nc	\N	R	rec	1cf91e66-2edb-4b9f-a8cb-f4412320a3d9
2019-08-08 19:18:47.394317	2019-08-08 19:18:47.394323	23	od_lic	dsl	\N	R	rec	575955ef-d662-4b57-b191-b17eb8fba4eb
2019-08-08 19:18:47.416691	2019-08-08 19:18:47.416697	24	od_lic	eudatagrid	\N	R	rec	064d8335-ec77-48c0-b46e-a3d38f250406
2019-08-08 19:18:47.432944	2019-08-08 19:18:47.43295	25	od_lic	eclipse-1.0	\N	R	rec	b2c8e447-44b8-4fbb-be7a-b7765f8434c4
2019-08-08 19:18:47.448778	2019-08-08 19:18:47.448784	26	od_lic	ecl2	\N	R	rec	46635301-79ac-4d2c-a4b0-e845703d7a2f
2019-08-08 19:18:47.468729	2019-08-08 19:18:47.468734	27	od_lic	ver2_eiffel	\N	R	rec	9f5f660d-9482-44c3-b04c-5c8bb0b86dd6
2019-08-08 19:18:47.48532	2019-08-08 19:18:47.485326	28	od_lic	eiffel	\N	R	rec	b94c3d55-ab8b-48bc-b390-6fbec7e53273
2019-08-08 19:18:47.50226	2019-08-08 19:18:47.502266	29	od_lic	entessa	\N	R	rec	9410e8d4-f695-49d5-8f45-ed06f89444aa
2019-08-08 19:18:47.517987	2019-08-08 19:18:47.517992	30	od_lic	eurofound	\N	R	rec	e1b6b003-dd6d-4b55-8ddf-1aa994c3ee7b
2019-08-08 19:18:47.534734	2019-08-08 19:18:47.53474	31	od_lic	eupl-1.1	\N	R	rec	22ecf583-905f-4e74-9cf6-0fd27ad5b65d
2019-08-08 19:18:47.55217	2019-08-08 19:18:47.552175	32	od_lic	fair	\N	R	rec	a3fafbf2-876a-467b-8bc1-283b419d0b31
2019-08-08 19:18:47.570258	2019-08-08 19:18:47.570264	33	od_lic	frameworx	\N	R	rec	4331e954-61d7-40ad-b745-b57529ef3d2b
2019-08-08 19:18:47.588245	2019-08-08 19:18:47.58825	34	od_lic	fal	\N	R	rec	1341928c-7934-4af9-a12f-60a804626b85
2019-08-08 19:18:47.610501	2019-08-08 19:18:47.610506	35	od_lic	gfdl	\N	R	rec	eebe2dab-e6ed-43c8-b55a-53d93fb7c1a7
2019-08-08 19:18:47.62944	2019-08-08 19:18:47.629446	36	od_lic	gpl-2.0	\N	R	rec	6fdf4dbe-619e-4053-8472-9a28167a8981
2019-08-08 19:18:47.654582	2019-08-08 19:18:47.654588	37	od_lic	gpl-3.0	\N	R	rec	7e2a9138-8a6d-4639-bf52-8d5714224c52
2019-08-08 19:18:47.67369	2019-08-08 19:18:47.673696	38	od_lic	lgpl-2.1	\N	R	rec	2f4cdc24-cbff-4fc8-a90a-8df0bb98e673
2019-08-08 19:18:47.693146	2019-08-08 19:18:47.693151	39	od_lic	lgpl-3.0	\N	R	rec	d4f895b7-cc5d-4c4c-a55e-4a60849fa7cf
2019-08-08 19:18:47.71234	2019-08-08 19:18:47.712346	40	od_lic	ibmpl	\N	R	rec	6314be35-3844-4545-949b-a7a2a94c583f
2019-08-08 19:18:47.732326	2019-08-08 19:18:47.732332	41	od_lic	ipafont	\N	R	rec	32b01fe8-50ad-42cc-84ac-50ded3e8461d
2019-08-08 19:18:47.752298	2019-08-08 19:18:47.752304	42	od_lic	isc-license	\N	R	rec	28b93950-9f71-4343-810e-c5f98eb0dd05
2019-08-08 19:18:47.771605	2019-08-08 19:18:47.771611	43	od_lic	intel-osl	\N	R	rec	89e185ac-e039-4e7c-8814-5747c7ba7584
2019-08-08 19:18:47.790622	2019-08-08 19:18:47.790628	44	od_lic	user-jsim	\N	R	rec	4f4f46ab-b1e8-40d0-8d3b-b3fd02927ef7
2019-08-08 19:18:47.809785	2019-08-08 19:18:47.809791	45	od_lic	jabber-osl	\N	R	rec	f6f366c1-f2a2-40e5-b9a2-7fcebbdd74ae
2019-08-08 19:18:47.828549	2019-08-08 19:18:47.828555	46	od_lic	lucent-plan9	\N	R	rec	ffb4e992-8db7-4c0d-a330-75aeb3f00178
2019-08-08 19:18:47.849602	2019-08-08 19:18:47.849609	47	od_lic	lucent1.02	\N	R	rec	36165f05-caf7-4f72-839e-6b37ad95a8cf
2019-08-08 19:18:47.875973	2019-08-08 19:18:47.875979	48	od_lic	mit-license	\N	R	rec	ce58356d-2a46-4036-a3ae-2bbdd5ddc927
2019-08-08 19:18:47.897369	2019-08-08 19:18:47.897374	49	od_lic	ms-pl	\N	R	rec	1babd111-f539-4c17-95f1-704fe09dc731
2019-08-08 19:18:47.919033	2019-08-08 19:18:47.919039	50	od_lic	ms-rl	\N	R	rec	8f641ff9-a70c-4086-a51e-e004d5b69ef4
2019-08-08 19:18:47.940594	2019-08-08 19:18:47.9406	51	od_lic	miros	\N	R	rec	d0e690ae-0b93-4604-a6bb-b6b38aa686b9
2019-08-08 19:18:47.962079	2019-08-08 19:18:47.962085	52	od_lic	motosoto	\N	R	rec	d79cc77d-217e-47b8-970b-708a9447008b
2019-08-08 19:18:47.984276	2019-08-08 19:18:47.984282	53	od_lic	mozilla	\N	R	rec	0ac73172-81f8-4ddb-b33d-6f49f6604fcc
2019-08-08 19:18:48.010708	2019-08-08 19:18:48.010714	54	od_lic	mozilla1.1	\N	R	rec	01dc67f1-1dc9-4594-a86c-703b38f2558c
2019-08-08 19:18:48.033096	2019-08-08 19:18:48.033102	55	od_lic	multics	\N	R	rec	d316dcb4-eedb-45da-b6b9-a11a92dfe29a
2019-08-08 19:18:48.055542	2019-08-08 19:18:48.055548	56	od_lic	nasa1.3	\N	R	rec	dc1345a7-bf8f-466e-af3e-be8206d48176
2019-08-08 19:18:48.083689	2019-08-08 19:18:48.083695	57	od_lic	ntp-license	\N	R	rec	12abc468-ffbf-456e-8458-761c7c98f9a2
2019-08-08 19:18:48.106755	2019-08-08 19:18:48.106761	58	od_lic	naumen	\N	R	rec	e3704bb5-1afd-4495-9ca2-9d01f2b3193d
2019-08-08 19:18:48.129742	2019-08-08 19:18:48.129748	59	od_lic	nethack	\N	R	rec	9cfcffca-5156-4490-8ded-48e537060674
2019-08-08 19:18:48.152469	2019-08-08 19:18:48.152476	60	od_lic	geo-no-fee-unrestricted	\N	R	rec	9c9f6a3d-5f23-4d33-aa95-9dce3632b0f1
2019-08-08 19:18:48.176813	2019-08-08 19:18:48.176819	61	od_lic	nokia	\N	R	rec	79969061-60bf-4449-9a5e-dc81638e4484
2019-08-08 19:18:48.201097	2019-08-08 19:18:48.201103	62	od_lic	nosl3.0	\N	R	rec	dea9b153-9b5b-43c9-9205-5f09254f7380
2019-08-08 19:18:48.225721	2019-08-08 19:18:48.225727	63	od_lic	oclc2	\N	R	rec	f7f4150e-7cc2-4e79-b17d-140483bd2c23
2019-08-08 19:18:48.254559	2019-08-08 19:18:48.254565	64	od_lic	odc-by	\N	R	rec	80af62c9-a5ff-4464-87ee-4f4efc0bac5b
2019-08-08 19:18:48.27965	2019-08-08 19:18:48.279656	65	od_lic	odc-odbl	\N	R	rec	4dac93cf-ff2f-45ca-bcc6-7c2962c9ec05
2019-08-08 19:18:48.303924	2019-08-08 19:18:48.30393	66	od_lic	odc-pddl	\N	R	rec	d76161bc-0213-4fe4-b8ca-e81230724f17
2019-08-08 19:18:48.328864	2019-08-08 19:18:48.32887	67	od_lic	openfont	\N	R	rec	b83b84b6-0a23-4d2f-a4d7-306b7376aa70
2019-08-08 19:18:48.359226	2019-08-08 19:18:48.359233	68	od_lic	opengroup	\N	R	rec	ce9e1681-460a-41cf-a45d-e5026926dc6d
2019-08-08 19:18:48.384847	2019-08-08 19:18:48.384853	69	od_lic	osl-3.0	\N	R	rec	193a1b7a-70f5-4763-ac87-4821f62635d5
2019-08-08 19:18:48.409898	2019-08-08 19:18:48.409904	70	od_lic	php	\N	R	rec	8f5f926b-3f1d-41db-b9fa-f4c3df440cdf
2019-08-08 19:18:48.435925	2019-08-08 19:18:48.435931	71	od_lic	pythonsoftfoundation	\N	R	rec	dda69c6b-846b-415b-ac3c-59a780120d2d
2019-08-08 19:18:48.463453	2019-08-08 19:18:48.46346	72	od_lic	pythonpl	\N	R	rec	ae8c41df-6be3-4977-b3b1-c2b3bcd30451
2019-08-08 19:18:48.489264	2019-08-08 19:18:48.48927	73	od_lic	qtpl	\N	R	rec	93a62c63-4994-49ab-af49-3ba02ba22afc
2019-08-08 19:18:48.520361	2019-08-08 19:18:48.520367	74	od_lic	real	\N	R	rec	442552fa-07a1-462e-abda-0ce66a49749a
2019-08-08 19:18:48.547659	2019-08-08 19:18:48.547665	75	od_lic	rpl1.5	\N	R	rec	06958c39-c52f-4f8b-a657-8ff2f2eac414
2019-08-08 19:18:48.574447	2019-08-08 19:18:48.574453	76	od_lic	ricohpl	\N	R	rec	52506097-aa72-48b8-a0e8-79e135378671
2019-08-08 19:18:48.601659	2019-08-08 19:18:48.601664	77	od_lic	simpl-2.0	\N	R	rec	291cf8e3-f24a-4d31-bde1-e230016d09c2
2019-08-08 19:18:48.629132	2019-08-08 19:18:48.629138	78	od_lic	sleepycat	\N	R	rec	f7fc7a0f-953a-484e-9f8a-aea7c625700e
2019-08-08 19:18:48.661099	2019-08-08 19:18:48.661105	79	od_lic	sun-issl	\N	R	rec	40fe9899-09dd-428c-a9ed-e48331a891d1
2019-08-08 19:18:48.689168	2019-08-08 19:18:48.689174	80	od_lic	sunpublic	\N	R	rec	5bc59533-9a7b-47d8-b9ee-edc08faec5b9
2019-08-08 19:18:48.717294	2019-08-08 19:18:48.7173	81	od_lic	sybase	\N	R	rec	8f25e148-fbe9-467a-9b22-531fd5e3d414
2019-08-08 19:18:48.74523	2019-08-08 19:18:48.745236	82	od_lic	tcl	\N	R	rec	a2955211-55ee-4133-8cf1-148071d3c8e4
2019-08-08 19:18:48.773536	2019-08-08 19:18:48.773542	83	od_lic	postgresql	\N	R	rec	b9cdf01a-1ede-46ba-9971-770350352dbf
2019-08-08 19:18:48.802168	2019-08-08 19:18:48.802173	84	od_lic	uk-ogl	\N	R	rec	7eafe3b3-ddce-4b82-bc19-522ed80565ef
2019-08-08 19:18:48.831014	2019-08-08 19:18:48.831019	85	od_lic	uoi-ncsa	\N	R	rec	951272d7-a7f6-414a-8c04-7b4043d48730
2019-08-08 19:18:48.860366	2019-08-08 19:18:48.860372	86	od_lic	vovidapl	\N	R	rec	c79eea9d-3df5-45f2-8cc2-6e98f92c18f6
2019-08-08 19:18:48.888817	2019-08-08 19:18:48.888823	87	od_lic	w3c	\N	R	rec	1e436e97-bed3-4c65-ab1f-91185a9b6774
2019-08-08 19:18:48.924116	2019-08-08 19:18:48.924123	88	od_lic	xnet	\N	R	rec	db0c2595-9fcc-4121-88ef-37e731158f49
2019-08-08 19:18:48.954681	2019-08-08 19:18:48.954687	89	od_lic	zpl	\N	R	rec	ab226f64-c890-45a0-a41f-3531f3628f79
2019-08-08 19:18:48.984886	2019-08-08 19:18:48.984892	90	od_lic	wxwindows	\N	R	rec	95492042-3b0c-4df4-ae78-28376304fc64
2019-08-08 19:18:49.015004	2019-08-08 19:18:49.015009	91	od_lic	zlib-license	\N	R	rec	7dbed045-a8c2-4c90-9d26-77f1eb041bb9
2019-08-08 19:18:49.044263	2019-08-08 19:18:49.044268	92	od_lic	cc-by-nd-4.0	\N	R	rec	465ade7d-9392-4d4c-9491-77a261b404e1
2019-08-08 19:18:49.074941	2019-08-08 19:18:49.074947	93	od_lic	cc-by-nc-4.0	\N	R	rec	555396a6-a363-4b4b-b339-14d1440dbff9
2019-08-08 19:18:49.104586	2019-08-08 19:18:49.104592	94	od_lic	cc-by-nc-nd-4.0	\N	R	rec	e3db1ac3-0f40-4dfc-ad2b-6a45b8a2d546
2019-08-08 19:18:49.133947	2019-08-08 19:18:49.133953	95	od_lic	cc-by-nc-sa-4.0	\N	R	rec	3266439e-c3c5-4504-bc50-88a916cb1a82
2019-08-08 19:18:49.164388	2019-08-08 19:18:49.164393	96	od_lic	zenodo-freetoread-1.0	\N	R	rec	db27f919-fbf9-4f1a-bc54-16a01d2b29f9
2019-08-08 19:19:00.72237	2019-08-08 19:19:00.722377	97	frdoi	10.13039/501100000925	\N	R	rec	0f7f994b-2e93-47f4-ab86-a51766bde9f7
2019-08-08 19:19:00.726148	2019-08-08 19:19:00.726154	98	oaf	nhmrc_______::NHMRC	\N	R	rec	0f7f994b-2e93-47f4-ab86-a51766bde9f7
2019-08-08 19:19:00.754798	2019-08-08 19:19:00.754813	99	frdoi	10.13039/501100000780	\N	R	rec	ef77cd90-f012-470c-91e5-1101622a2010
2019-08-08 19:19:00.760397	2019-08-08 19:19:00.760408	100	oaf	ec__________::EC	\N	R	rec	ef77cd90-f012-470c-91e5-1101622a2010
2019-08-08 19:19:00.789252	2019-08-08 19:19:00.789258	101	frdoi	10.13039/501100000923	\N	R	rec	a941a044-5ee0-41a8-a680-b840db087607
2019-08-08 19:19:00.792579	2019-08-08 19:19:00.792585	102	oaf	arc_________::ARC	\N	R	rec	a941a044-5ee0-41a8-a680-b840db087607
2019-08-08 19:19:00.810914	2019-08-08 19:19:00.81092	103	frdoi	10.13039/501100001871	\N	R	rec	ad47aea6-50fc-4f0d-8339-8a93742b76f1
2019-08-08 19:19:00.814112	2019-08-08 19:19:00.814118	104	oaf	fct_________::FCT	\N	R	rec	ad47aea6-50fc-4f0d-8339-8a93742b76f1
2019-08-08 19:19:00.835909	2019-08-08 19:19:00.835915	105	frdoi	10.13039/100004440	\N	R	rec	33c5e471-c52d-431f-aa13-d837f50587c9
2019-08-08 19:19:00.839093	2019-08-08 19:19:00.839098	106	oaf	wt__________::WT	\N	R	rec	33c5e471-c52d-431f-aa13-d837f50587c9
2019-08-08 19:19:00.861117	2019-08-08 19:19:00.861127	107	frdoi	10.13039/100000001	\N	R	rec	a63676ac-c87c-42e2-9cd9-a6c8aff60492
2019-08-08 19:19:00.866384	2019-08-08 19:19:00.866392	108	oaf	nsf_________::NSF	\N	R	rec	a63676ac-c87c-42e2-9cd9-a6c8aff60492
2019-08-08 19:19:00.885901	2019-08-08 19:19:00.885907	109	frdoi	10.13039/501100004564	\N	R	rec	0028a7c6-ec94-489f-a5d1-22b9649f6dbb
2019-08-08 19:19:00.910907	2019-08-08 19:19:00.910913	110	frdoi	10.13039/501100003246	\N	R	rec	f9182d21-0a50-41b4-8438-3d6f67ba393d
2019-08-08 19:19:00.936546	2019-08-08 19:19:00.936552	111	frdoi	10.13039/501100006588	\N	R	rec	002a7e3b-9dd5-46c1-81b2-cd6f26467b70
2019-08-08 19:19:00.961929	2019-08-08 19:19:00.961934	112	frdoi	10.13039/501100003381	\N	R	rec	6266764c-5f37-4cb9-81d0-181610488a1f
2019-08-08 19:19:00.987086	2019-08-08 19:19:00.987092	113	frdoi	10.13039/501100000934	\N	R	rec	e1463402-c8c0-4f80-9243-3347e3ddb239
2019-08-08 19:19:01.01202	2019-08-08 19:19:01.012028	114	frdoi	10.13039/501100003921	\N	R	rec	c002149b-c025-4267-a2e5-6aeb5d364bce
2019-08-08 19:19:01.036757	2019-08-08 19:19:01.036766	115	frdoi	10.13039/501100001711	\N	R	rec	cc710e38-4f64-42f6-b47e-6f7455c2ccc2
2019-08-08 19:19:01.061972	2019-08-08 19:19:01.061978	116	frdoi	10.13039/100000002	\N	R	rec	358d1d90-1418-4370-94f6-87dcfdb5a864
2019-08-08 19:19:01.086251	2019-08-08 19:19:01.086256	117	frdoi	10.13039/501100004488	\N	R	rec	9919bd2e-9d8a-4d9d-bd7b-c3ce4234971f
2019-08-08 19:19:01.111525	2019-08-08 19:19:01.111531	118	frdoi	10.13039/501100001602	\N	R	rec	f62c029d-e84e-4cbb-808e-ce1d65ce410f
2019-08-08 19:19:01.1366	2019-08-08 19:19:01.136606	119	frdoi	10.13039/501100002428	\N	R	rec	87f3622b-7114-4d19-8cb7-e030394623a7
2019-08-08 19:19:01.161599	2019-08-08 19:19:01.161605	120	frdoi	10.13039/100000016	\N	R	rec	e2cdc7aa-6ae5-4962-b74f-1d2f17fdd8d1
2019-08-08 19:19:12.699528	2019-08-08 19:19:12.699543	121	grant	10.13039/501100000780::502084	\N	R	rec	dddefccc-6484-4430-a3ce-1eea94be0ac2
2019-08-08 19:19:12.703176	2019-08-08 19:19:12.703182	122	eurepo	info:eu-repo/grantAgreement/EC/FP6/502084/	\N	R	rec	dddefccc-6484-4430-a3ce-1eea94be0ac2
2019-08-08 19:19:12.737726	2019-08-08 19:19:12.737732	123	grant	10.13039/501100000780::027819	\N	R	rec	f2407b49-8746-442a-9d64-ad227713579b
2019-08-08 19:19:12.741028	2019-08-08 19:19:12.741034	124	eurepo	info:eu-repo/grantAgreement/EC/FP6/027819/	\N	R	rec	f2407b49-8746-442a-9d64-ad227713579b
2019-08-08 19:31:48.367611	2019-08-08 19:31:48.367617	127	depid	2	\N	R	rec	243300b3-e87a-4cdb-94a9-127624bfdb8e
2019-08-08 19:35:05.083508	2019-08-08 19:35:05.083519	128	doi	10.5072/zenodo.2	datacite	K	rec	6053d677-ddcf-4cb9-aa95-c5b13f71f938
2019-08-08 19:35:05.08677	2019-08-08 19:35:05.086776	129	oai	oai:zenodo.org:2	oai	R	rec	6053d677-ddcf-4cb9-aa95-c5b13f71f938
2019-08-08 19:35:05.090935	2019-08-08 19:35:05.09094	130	doi	10.5072/zenodo.1	datacite	K	rec	6053d677-ddcf-4cb9-aa95-c5b13f71f938
2019-08-08 19:31:48.36507	2019-08-08 19:35:05.272382	126	recid	2	\N	R	rec	6053d677-ddcf-4cb9-aa95-c5b13f71f938
2019-08-08 19:31:48.356133	2019-08-08 19:35:05.276751	125	recid	1	\N	M	\N	22e5036f-8b76-4845-9206-5a1c42521cff
\.


--
-- Data for Name: pidstore_recid; Type: TABLE DATA; Schema: public; Owner: zenodo
--

COPY public.pidstore_recid (recid) FROM stdin;
1
2
\.


--
-- Data for Name: pidstore_redirect; Type: TABLE DATA; Schema: public; Owner: zenodo
--

COPY public.pidstore_redirect (created, updated, id, pid_id) FROM stdin;
2019-08-08 19:35:05.273812	2019-08-08 19:35:05.273818	22e5036f-8b76-4845-9206-5a1c42521cff	126
\.


--
-- Data for Name: records_buckets; Type: TABLE DATA; Schema: public; Owner: zenodo
--

COPY public.records_buckets (record_id, bucket_id) FROM stdin;
243300b3-e87a-4cdb-94a9-127624bfdb8e	f216ce58-f597-4949-8ccf-ca65d139aaca
6053d677-ddcf-4cb9-aa95-c5b13f71f938	03b911fc-dc94-4f15-ac2c-e33eea2f7d35
\.


--
-- Data for Name: records_metadata; Type: TABLE DATA; Schema: public; Owner: zenodo
--

COPY public.records_metadata (created, updated, id, json, version_id) FROM stdin;
2019-08-08 19:18:47.062809	2019-08-08 19:18:47.062816	8e723a15-f833-4b18-a87d-ef2731f7272e	{"id": "bsd-3-clause", "url": "http://www.opensource.org/licenses/BSD-3-Clause", "title": "BSD 3-Clause \\"New\\" or \\"Revised\\" License (BSD-3-Clause)", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "not reviewed", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:47.095666	2019-08-08 19:18:47.095672	8ff66896-8add-4df0-8955-2aed12ef7b88	{"id": "bsd-2-clause", "url": "http://www.opensource.org/licenses/BSD-2-Clause", "title": "BSD 2-Clause \\"Simplified\\" or \\"FreeBSD\\" License (BSD-2-Clause)", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "not reviewed", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:47.107458	2019-08-08 19:18:47.107464	2192016c-2e87-4d90-9383-4895737a533a	{"id": "afl-3.0", "url": "http://www.opensource.org/licenses/afl-3.0.php", "title": "Academic Free License 3.0 (AFL 3.0)", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:47.119195	2019-08-08 19:18:47.1192	24ce19e6-deea-477e-9ece-18a86ba921ef	{"id": "apl1.0", "url": "http://www.opensource.org/licenses/apl1.0.php", "title": "Adaptive Public License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:47.131309	2019-08-08 19:18:47.131314	15bf2ce0-c0ce-47c5-9c54-b239e8ada285	{"id": "agpl-v3", "url": "http://www.opensource.org/licenses/agpl-v3.html", "title": "Affero GNU Public License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:47.142848	2019-08-08 19:18:47.142853	0c21f398-2c9e-4d2f-9526-0ae4c00fd84f	{"id": "against-drm", "url": "http://www.opendefinition.org/licenses/against-drm", "title": "Against DRM", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": true, "od_conformance": "approved", "domain_software": false, "osd_conformance": "rejected"}	1
2019-08-08 19:18:47.155541	2019-08-08 19:18:47.155546	4df22231-8114-4804-b4bf-222e5cde4a3a	{"id": "apache2.0", "url": "http://www.opensource.org/licenses/apache2.0.php", "title": "Apache License, 2.0", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:47.168545	2019-08-08 19:18:47.168556	1fd0fcae-8931-482a-845f-a2db25dd9a39	{"id": "apache", "url": "", "title": "Apache Software License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:47.184166	2019-08-08 19:18:47.184175	3981ef5f-3314-4a28-8226-a4b619d585a8	{"id": "apsl-2.0", "url": "http://www.opensource.org/licenses/apsl-2.0.php", "title": "Apple Public Source License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:47.198724	2019-08-08 19:18:47.19873	00031ef0-4054-42df-bf1a-6d324ef5344a	{"id": "artistic-license-2.0", "url": "http://www.opensource.org/licenses/artistic-license-2.0.php", "title": "Artistic license 2.0", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:47.211728	2019-08-08 19:18:47.211734	081f40bd-f27f-4abd-83bc-7e159d202deb	{"id": "attribution", "url": "http://www.opensource.org/licenses/attribution.php", "title": "Attribution Assurance Licenses", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:47.223656	2019-08-08 19:18:47.223662	35d4e803-c8f7-4c8b-a840-b3f1d9d75858	{"id": "bsd-license", "url": "http://www.opensource.org/licenses/bsd-license.php", "title": "BSD licenses (New and Simplified)", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:47.23745	2019-08-08 19:18:47.237456	5cf54bef-ad8e-4ccf-935e-bce0e77dd791	{"id": "bsl1.0", "url": "http://www.opensource.org/licenses/bsl1.0.html", "title": "Boost Software License (BSL1.0)", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:47.25142	2019-08-08 19:18:47.251426	ee597941-9429-46cd-8bdc-9085e46b632b	{"id": "cuaoffice", "url": "http://www.opensource.org/licenses/cuaoffice.php", "title": "CUA Office Public License Version 1.0", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:47.264052	2019-08-08 19:18:47.264058	d00f10b4-8255-4787-9ad1-f73e6f10b339	{"id": "canada-crown", "url": "", "title": "Canadian Crown Copyright", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": false, "osd_conformance": "rejected"}	1
2019-08-08 19:18:47.278397	2019-08-08 19:18:47.278403	df3331bb-6f23-4e1e-afcd-c6816debd978	{"id": "cddl1", "url": "http://www.opensource.org/licenses/cddl1.php", "title": "Common Development and Distribution License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:47.292974	2019-08-08 19:18:47.292979	754e6b99-1b77-4b67-919b-e8e52d89b2fc	{"id": "cpal_1.0", "url": "http://www.opensource.org/licenses/cpal_1.0", "title": "Common Public Attribution License 1.0 (CPAL)", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:47.307424	2019-08-08 19:18:47.30743	9b84c636-1c7e-405b-8caf-c63d3ad429a4	{"id": "ca-tosl1.1", "url": "http://www.opensource.org/licenses/ca-tosl1.1.php", "title": "Computer Associates Trusted Open Source License 1.1", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:47.325708	2019-08-08 19:18:47.325715	068585ad-a46a-4981-bfcf-dabbf4ee06d0	{"id": "cc-by-sa", "url": "http://www.opendefinition.org/licenses/cc-by-sa", "title": "Creative Commons Attribution Share-Alike", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": true, "od_conformance": "approved", "domain_software": false, "osd_conformance": "rejected"}	1
2019-08-08 19:18:47.340931	2019-08-08 19:18:47.340937	5f8919d2-a403-47f6-a62e-e6ea0812e202	{"id": "cc-by", "url": "http://www.opendefinition.org/licenses/cc-by", "title": "Creative Commons Attribution", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": true, "od_conformance": "approved", "domain_software": false, "osd_conformance": "rejected"}	1
2019-08-08 19:18:47.35527	2019-08-08 19:18:47.355276	c8ff7433-2edd-42f7-a5f5-74183ce4fd85	{"id": "cc-zero", "url": "http://www.opendefinition.org/licenses/cc-zero", "title": "Creative Commons CCZero", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": true, "domain_content": true, "od_conformance": "approved", "domain_software": true, "osd_conformance": "rejected"}	1
2019-08-08 19:18:47.368684	2019-08-08 19:18:47.368689	1cf91e66-2edb-4b9f-a8cb-f4412320a3d9	{"id": "cc-nc", "url": "http://creativecommons.org/licenses/by-nc/2.0/", "title": "Creative Commons Non-Commercial (Any)", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": false, "osd_conformance": "rejected"}	1
2019-08-08 19:18:47.383913	2019-08-08 19:18:47.383919	575955ef-d662-4b57-b191-b17eb8fba4eb	{"id": "dsl", "url": "http://www.opendefinition.org/licenses/dsl", "title": "Design Science License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": true, "od_conformance": "approved", "domain_software": false, "osd_conformance": "rejected"}	1
2019-08-08 19:18:47.402317	2019-08-08 19:18:47.402328	064d8335-ec77-48c0-b46e-a3d38f250406	{"id": "eudatagrid", "url": "http://www.opensource.org/licenses/eudatagrid.php", "title": "EU DataGrid Software License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:47.421628	2019-08-08 19:18:47.421634	b2c8e447-44b8-4fbb-be7a-b7765f8434c4	{"id": "eclipse-1.0", "url": "http://www.opensource.org/licenses/eclipse-1.0.php", "title": "Eclipse Public License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:47.43789	2019-08-08 19:18:47.437896	46635301-79ac-4d2c-a4b0-e845703d7a2f	{"id": "ecl2", "url": "http://www.opensource.org/licenses/ecl2.php", "title": "Educational Community License, Version 2.0", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:47.45332	2019-08-08 19:18:47.453326	9f5f660d-9482-44c3-b04c-5c8bb0b86dd6	{"id": "ver2_eiffel", "url": "http://www.opensource.org/licenses/ver2_eiffel.php", "title": "Eiffel Forum License V2.0", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:47.473574	2019-08-08 19:18:47.473579	b94c3d55-ab8b-48bc-b390-6fbec7e53273	{"id": "eiffel", "url": "", "title": "Eiffel Forum License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:47.490508	2019-08-08 19:18:47.490513	9410e8d4-f695-49d5-8f45-ed06f89444aa	{"id": "entessa", "url": "http://www.opensource.org/licenses/entessa.php", "title": "Entessa Public License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:47.505748	2019-08-08 19:18:47.505754	e1b6b003-dd6d-4b55-8ddf-1aa994c3ee7b	{"id": "eurofound", "url": " http://www.eurofound.europa.eu/legal-and-data-protection-notices ", "title": "Eurofound license", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": true, "od_conformance": "rejected", "domain_software": false, "osd_conformance": "rejected"}	1
2019-08-08 19:18:47.522625	2019-08-08 19:18:47.52263	22ecf583-905f-4e74-9cf6-0fd27ad5b65d	{"id": "eupl-1.1", "url": "http://opensource.org/licenses/EUPL-1.1", "title": "European Union Public License, Version 1.1 (EUPL-1.1)", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:47.539482	2019-08-08 19:18:47.539487	a3fafbf2-876a-467b-8bc1-283b419d0b31	{"id": "fair", "url": "http://www.opensource.org/licenses/fair.php", "title": "Fair License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:47.557073	2019-08-08 19:18:47.557079	4331e954-61d7-40ad-b745-b57529ef3d2b	{"id": "frameworx", "url": "http://www.opensource.org/licenses/frameworx.php", "title": "Frameworx License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:47.575121	2019-08-08 19:18:47.575126	1341928c-7934-4af9-a12f-60a804626b85	{"id": "fal", "url": "http://www.opendefinition.org/licenses/fal", "title": "Free Art License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": true, "od_conformance": "approved", "domain_software": false, "osd_conformance": "rejected"}	1
2019-08-08 19:18:47.594714	2019-08-08 19:18:47.594721	eebe2dab-e6ed-43c8-b55a-53d93fb7c1a7	{"id": "gfdl", "url": "http://www.opendefinition.org/licenses/gfdl", "title": "GNU Free Documentation License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": true, "od_conformance": "approved", "domain_software": false, "osd_conformance": "rejected"}	1
2019-08-08 19:18:47.615455	2019-08-08 19:18:47.615461	6fdf4dbe-619e-4053-8472-9a28167a8981	{"id": "gpl-2.0", "url": "http://www.opensource.org/licenses/gpl-2.0.php", "title": "GNU General Public License (GPL)", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:47.63469	2019-08-08 19:18:47.634698	7e2a9138-8a6d-4639-bf52-8d5714224c52	{"id": "gpl-3.0", "url": "http://www.opensource.org/licenses/gpl-3.0.html", "title": "GNU General Public License version 3.0 (GPLv3)", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:47.659687	2019-08-08 19:18:47.659693	2f4cdc24-cbff-4fc8-a90a-8df0bb98e673	{"id": "lgpl-2.1", "url": "http://www.opensource.org/licenses/lgpl-2.1.php", "title": "GNU Library or \\"Lesser\\" General Public License (LGPL)", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:47.67862	2019-08-08 19:18:47.678625	d4f895b7-cc5d-4c4c-a55e-4a60849fa7cf	{"id": "lgpl-3.0", "url": "http://www.opensource.org/licenses/lgpl-3.0.html", "title": "GNU Library or \\"Lesser\\" General Public License version 3.0 (LGPLv3)", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:47.698057	2019-08-08 19:18:47.698063	6314be35-3844-4545-949b-a7a2a94c583f	{"id": "ibmpl", "url": "http://www.opensource.org/licenses/ibmpl.php", "title": "IBM Public License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:47.717342	2019-08-08 19:18:47.717347	32b01fe8-50ad-42cc-84ac-50ded3e8461d	{"id": "ipafont", "url": "http://www.opensource.org/licenses/ipafont.html", "title": "IPA Font License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:47.737068	2019-08-08 19:18:47.737074	28b93950-9f71-4343-810e-c5f98eb0dd05	{"id": "isc-license", "url": "http://www.opensource.org/licenses/isc-license.txt", "title": "ISC License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:47.757037	2019-08-08 19:18:47.757043	89e185ac-e039-4e7c-8814-5747c7ba7584	{"id": "intel-osl", "url": "", "title": "Intel Open Source License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:47.775443	2019-08-08 19:18:47.775448	4f4f46ab-b1e8-40d0-8d3b-b3fd02927ef7	{"id": "user-jsim", "url": "http://www.physiome.org/jsim/download/license.html", "title": "JSIM Software License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "rejected"}	1
2019-08-08 19:18:47.79435	2019-08-08 19:18:47.794356	f6f366c1-f2a2-40e5-b9a2-7fcebbdd74ae	{"id": "jabber-osl", "url": "", "title": "Jabber Open Source License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:47.813329	2019-08-08 19:18:47.813334	ffb4e992-8db7-4c0d-a330-75aeb3f00178	{"id": "lucent-plan9", "url": "", "title": "Lucent Public License (Plan9)", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:47.833413	2019-08-08 19:18:47.833418	36165f05-caf7-4f72-839e-6b37ad95a8cf	{"id": "lucent1.02", "url": "http://www.opensource.org/licenses/lucent1.02.php", "title": "Lucent Public License Version 1.02", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:47.855292	2019-08-08 19:18:47.8553	ce58356d-2a46-4036-a3ae-2bbdd5ddc927	{"id": "mit-license", "url": "http://www.opensource.org/licenses/mit-license.php", "title": "MIT license", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:47.881039	2019-08-08 19:18:47.881044	1babd111-f539-4c17-95f1-704fe09dc731	{"id": "ms-pl", "url": "http://www.opensource.org/licenses/ms-pl.html", "title": "Microsoft Public License (Ms-PL)", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:47.90256	2019-08-08 19:18:47.902566	8f641ff9-a70c-4086-a51e-e004d5b69ef4	{"id": "ms-rl", "url": "http://www.opensource.org/licenses/ms-rl.html", "title": "Microsoft Reciprocal License (Ms-RL)", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:47.924003	2019-08-08 19:18:47.924008	d0e690ae-0b93-4604-a6bb-b6b38aa686b9	{"id": "miros", "url": "http://www.opensource.org/licenses/miros.html", "title": "MirOS Licence", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": true, "od_conformance": "approved", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:47.945452	2019-08-08 19:18:47.945458	d79cc77d-217e-47b8-970b-708a9447008b	{"id": "motosoto", "url": "http://www.opensource.org/licenses/motosoto.php", "title": "Motosoto License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:47.967169	2019-08-08 19:18:47.967175	0ac73172-81f8-4ddb-b33d-6f49f6604fcc	{"id": "mozilla", "url": "", "title": "Mozilla Public License 1.0 (MPL)", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:47.989057	2019-08-08 19:18:47.989062	01dc67f1-1dc9-4594-a86c-703b38f2558c	{"id": "mozilla1.1", "url": "http://www.opensource.org/licenses/mozilla1.1.php", "title": "Mozilla Public License 1.1 (MPL)", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:48.015628	2019-08-08 19:18:48.015634	d316dcb4-eedb-45da-b6b9-a11a92dfe29a	{"id": "multics", "url": "http://www.opensource.org/licenses/multics.txt", "title": "Multics License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:48.038016	2019-08-08 19:18:48.038021	dc1345a7-bf8f-466e-af3e-be8206d48176	{"id": "nasa1.3", "url": "http://www.opensource.org/licenses/nasa1.3.php", "title": "NASA Open Source Agreement 1.3", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:48.060239	2019-08-08 19:18:48.060244	12abc468-ffbf-456e-8458-761c7c98f9a2	{"id": "ntp-license", "url": "http://www.opensource.org/licenses/ntp-license.php", "title": "NTP License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:48.088753	2019-08-08 19:18:48.088759	e3704bb5-1afd-4495-9ca2-9d01f2b3193d	{"id": "naumen", "url": "http://www.opensource.org/licenses/naumen.php", "title": "Naumen Public License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:48.111758	2019-08-08 19:18:48.11177	9cfcffca-5156-4490-8ded-48e537060674	{"id": "nethack", "url": "http://www.opensource.org/licenses/nethack.php", "title": "Nethack General Public License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:48.133304	2019-08-08 19:18:48.13331	9c9f6a3d-5f23-4d33-aa95-9dce3632b0f1	{"id": "geo-no-fee-unrestricted", "url": "http://www4.agr.gc.ca/AAFC-AAC/display-afficher.do?id=1226945498401&lang=eng", "title": "No Fee Unrestricted Use License Agreement For Government Geographic Data (Canada)", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": false, "osd_conformance": "rejected"}	1
2019-08-08 19:18:48.157484	2019-08-08 19:18:48.157489	79969061-60bf-4449-9a5e-dc81638e4484	{"id": "nokia", "url": "http://www.opensource.org/licenses/nokia.php", "title": "Nokia Open Source License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:48.181949	2019-08-08 19:18:48.181955	dea9b153-9b5b-43c9-9205-5f09254f7380	{"id": "nosl3.0", "url": "http://www.opensource.org/licenses/NOSL3.0.html", "title": "Non-Profit Open Software License 3.0 (Non-Profit OSL 3.0)", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:48.206033	2019-08-08 19:18:48.206039	f7f4150e-7cc2-4e79-b17d-140483bd2c23	{"id": "oclc2", "url": "http://www.opensource.org/licenses/oclc2.php", "title": "OCLC Research Public License 2.0", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:48.230775	2019-08-08 19:18:48.230781	80af62c9-a5ff-4464-87ee-4f4efc0bac5b	{"id": "odc-by", "url": "http://www.opendefinition.org/licenses/odc-by", "title": "Open Data Commons Attribution License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": true, "domain_content": false, "od_conformance": "approved", "domain_software": false, "osd_conformance": "rejected"}	1
2019-08-08 19:18:48.25992	2019-08-08 19:18:48.259926	4dac93cf-ff2f-45ca-bcc6-7c2962c9ec05	{"id": "odc-odbl", "url": "http://www.opendefinition.org/licenses/odc-odbl", "title": "Open Data Commons Open Database License (ODbL)", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": true, "domain_content": false, "od_conformance": "approved", "domain_software": false, "osd_conformance": "rejected"}	1
2019-08-08 19:18:48.284268	2019-08-08 19:18:48.284274	d76161bc-0213-4fe4-b8ca-e81230724f17	{"id": "odc-pddl", "url": "http://www.opendefinition.org/licenses/odc-pddl", "title": "Open Data Commons Public Domain Dedication and Licence (PDDL)", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": true, "domain_content": false, "od_conformance": "approved", "domain_software": false, "osd_conformance": "rejected"}	1
2019-08-08 19:18:48.308831	2019-08-08 19:18:48.308837	b83b84b6-0a23-4d2f-a4d7-306b7376aa70	{"id": "openfont", "url": "http://www.opensource.org/licenses/openfont.html", "title": "Open Font License 1.1 (OFL 1.1)", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:48.333961	2019-08-08 19:18:48.333967	ce9e1681-460a-41cf-a45d-e5026926dc6d	{"id": "opengroup", "url": "http://www.opensource.org/licenses/opengroup.php", "title": "Open Group Test Suite License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:48.364237	2019-08-08 19:18:48.364243	193a1b7a-70f5-4763-ac87-4821f62635d5	{"id": "osl-3.0", "url": "http://www.opensource.org/licenses/osl-3.0.php", "title": "Open Software License 3.0 (OSL 3.0)", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:48.389575	2019-08-08 19:18:48.389581	8f5f926b-3f1d-41db-b9fa-f4c3df440cdf	{"id": "php", "url": "http://www.opensource.org/licenses/php.php", "title": "PHP License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:48.414885	2019-08-08 19:18:48.414891	dda69c6b-846b-415b-ac3c-59a780120d2d	{"id": "pythonsoftfoundation", "url": "http://www.opensource.org/licenses/PythonSoftFoundation.php", "title": "Python Software Foundation License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:48.440875	2019-08-08 19:18:48.440881	ae8c41df-6be3-4977-b3b1-c2b3bcd30451	{"id": "pythonpl", "url": "http://www.opensource.org/licenses/pythonpl.php", "title": "Python license", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:48.468287	2019-08-08 19:18:48.468293	93a62c63-4994-49ab-af49-3ba02ba22afc	{"id": "qtpl", "url": "http://www.opensource.org/licenses/qtpl.php", "title": "Qt Public License (QPL)", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:48.494453	2019-08-08 19:18:48.494459	442552fa-07a1-462e-abda-0ce66a49749a	{"id": "real", "url": "http://www.opensource.org/licenses/real.php", "title": "RealNetworks Public Source License V1.0", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:48.52537	2019-08-08 19:18:48.525375	06958c39-c52f-4f8b-a657-8ff2f2eac414	{"id": "rpl1.5", "url": "http://www.opensource.org/licenses/rpl1.5.txt", "title": "Reciprocal Public License 1.5 (RPL1.5)", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:48.552688	2019-08-08 19:18:48.552694	52506097-aa72-48b8-a0e8-79e135378671	{"id": "ricohpl", "url": "http://www.opensource.org/licenses/ricohpl.php", "title": "Ricoh Source Code Public License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:48.579567	2019-08-08 19:18:48.579573	291cf8e3-f24a-4d31-bde1-e230016d09c2	{"id": "simpl-2.0", "url": "http://www.opensource.org/licenses/simpl-2.0.html", "title": "Simple Public License 2.0", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:48.606515	2019-08-08 19:18:48.606521	f7fc7a0f-953a-484e-9f8a-aea7c625700e	{"id": "sleepycat", "url": "http://www.opensource.org/licenses/sleepycat.php", "title": "Sleepycat License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:48.633585	2019-08-08 19:18:48.633591	40fe9899-09dd-428c-a9ed-e48331a891d1	{"id": "sun-issl", "url": "", "title": "Sun Industry Standards Source License (SISSL)", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:48.666447	2019-08-08 19:18:48.666453	5bc59533-9a7b-47d8-b9ee-edc08faec5b9	{"id": "sunpublic", "url": "http://www.opensource.org/licenses/sunpublic.php", "title": "Sun Public License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:48.694267	2019-08-08 19:18:48.694273	8f25e148-fbe9-467a-9b22-531fd5e3d414	{"id": "sybase", "url": "http://www.opensource.org/licenses/sybase.php", "title": "Sybase Open Watcom Public License 1.0", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:48.72196	2019-08-08 19:18:48.721965	a2955211-55ee-4133-8cf1-148071d3c8e4	{"id": "tcl", "url": "http://www.opendefinition.org/licenses/tcl", "title": "Talis Community License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": true, "od_conformance": "approved", "domain_software": false, "osd_conformance": "rejected"}	1
2019-08-08 19:18:48.750565	2019-08-08 19:18:48.750571	b9cdf01a-1ede-46ba-9971-770350352dbf	{"id": "postgresql", "url": "http://www.opensource.org/licenses/postgresql", "title": "The PostgreSQL License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:48.778491	2019-08-08 19:18:48.778496	7eafe3b3-ddce-4b82-bc19-522ed80565ef	{"id": "uk-ogl", "url": "http://reference.data.gov.uk/id/open-government-licence", "title": "UK Open Government Licence (OGL)", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": true, "domain_content": true, "od_conformance": "rejected", "domain_software": false, "osd_conformance": "rejected"}	1
2019-08-08 19:18:48.807167	2019-08-08 19:18:48.807173	951272d7-a7f6-414a-8c04-7b4043d48730	{"id": "uoi-ncsa", "url": "http://www.opensource.org/licenses/UoI-NCSA.php", "title": "University of Illinois/NCSA Open Source License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:48.83635	2019-08-08 19:18:48.836356	c79eea9d-3df5-45f2-8cc2-6e98f92c18f6	{"id": "vovidapl", "url": "http://www.opensource.org/licenses/vovidapl.php", "title": "Vovida Software License v. 1.0", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:48.865049	2019-08-08 19:18:48.865054	1e436e97-bed3-4c65-ab1f-91185a9b6774	{"id": "w3c", "url": "http://www.opensource.org/licenses/W3C.php", "title": "W3C License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:48.893695	2019-08-08 19:18:48.893701	db0c2595-9fcc-4121-88ef-37e731158f49	{"id": "xnet", "url": "http://www.opensource.org/licenses/xnet.php", "title": "X.Net License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:48.929424	2019-08-08 19:18:48.929429	ab226f64-c890-45a0-a41f-3531f3628f79	{"id": "zpl", "url": "http://www.opensource.org/licenses/zpl.php", "title": "Zope Public License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:48.95958	2019-08-08 19:18:48.959586	95492042-3b0c-4df4-ae78-28376304fc64	{"id": "wxwindows", "url": "http://www.opensource.org/licenses/wxwindows.php", "title": "wxWindows Library License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:48.989791	2019-08-08 19:18:48.989796	7dbed045-a8c2-4c90-9d26-77f1eb041bb9	{"id": "zlib-license", "url": "http://www.opensource.org/licenses/zlib-license.php", "title": "zlib/libpng license", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1
2019-08-08 19:18:49.018961	2019-08-08 19:18:49.018966	465ade7d-9392-4d4c-9491-77a261b404e1	{"id": "cc-by-nd-4.0", "url": "https://creativecommons.org/licenses/by-nd/4.0/", "title": "Creative Commons Attribution-NoDerivatives", "family": "Creative Commons", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "Creative Commons", "domain_data": true, "domain_content": true, "od_conformance": "rejected", "domain_software": false, "osd_conformance": "rejected"}	1
2019-08-08 19:18:49.048947	2019-08-08 19:18:49.048953	555396a6-a363-4b4b-b339-14d1440dbff9	{"id": "cc-by-nc-4.0", "url": "https://creativecommons.org/licenses/by-nc/4.0/", "title": "Creative Commons Attribution-NonCommercial", "family": "Creative Commons", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "Creative Commons", "domain_data": true, "domain_content": true, "od_conformance": "rejected", "domain_software": false, "osd_conformance": "rejected"}	1
2019-08-08 19:18:49.07852	2019-08-08 19:18:49.078526	e3db1ac3-0f40-4dfc-ad2b-6a45b8a2d546	{"id": "cc-by-nc-nd-4.0", "url": "https://creativecommons.org/licenses/by-nc-nd/4.0/", "title": "Creative Commons Attribution-NonCommercial-NoDerivatives", "family": "Creative Commons", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "Creative Commons", "domain_data": true, "domain_content": true, "od_conformance": "rejected", "domain_software": false, "osd_conformance": "rejected"}	1
2019-08-08 19:18:49.108429	2019-08-08 19:18:49.108435	3266439e-c3c5-4504-bc50-88a916cb1a82	{"id": "cc-by-nc-sa-4.0", "url": "https://creativecommons.org/licenses/by-nc-sa/4.0/", "title": "Creative Commons Attribution-NonCommercial-ShareAlike", "family": "Creative Commons", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "Creative Commons", "domain_data": true, "domain_content": true, "od_conformance": "rejected", "domain_software": false, "osd_conformance": "rejected"}	1
2019-08-08 19:18:49.137564	2019-08-08 19:18:49.13757	db27f919-fbf9-4f1a-bc54-16a01d2b29f9	{"id": "zenodo-freetoread-1.0", "url": "", "title": "Free for private use; right holder retains other rights, including distribution", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "Zenodo", "domain_data": true, "domain_content": true, "od_conformance": "rejected", "domain_software": false, "osd_conformance": "rejected"}	1
2019-08-08 19:19:00.71021	2019-08-08 19:19:00.710219	0f7f994b-2e93-47f4-ab86-a51766bde9f7	{"doi": "10.13039/501100000925", "name": "National Health and Medical Research Council", "type": "gov", "parent": {"$ref": "http://dx.doi.org/10.13039/501100003921"}, "$schema": "http://zenodo.org/schemas/funders/funder-v1.0.0.json", "country": "AU", "subtype": "federal/national government", "acronyms": ["NHMRC"], "identifiers": {"oaf": "nhmrc_______::NHMRC"}, "remote_created": "2011-07-12T19:54:57.000000", "remote_modified": "2015-01-05T10:12:10.000000"}	1
2019-08-08 19:19:00.745994	2019-08-08 19:19:00.746002	ef77cd90-f012-470c-91e5-1101622a2010	{"doi": "10.13039/501100000780", "name": "European Commission", "type": "gov", "parent": {}, "$schema": "http://zenodo.org/schemas/funders/funder-v1.0.0.json", "country": "BE", "subtype": "federal", "acronyms": ["EC"], "identifiers": {"oaf": "ec__________::EC"}, "remote_created": "2011-06-08T16:00:03.000000", "remote_modified": "2015-10-28T13:27:02.000000"}	1
2019-08-08 19:19:00.781456	2019-08-08 19:19:00.781465	a941a044-5ee0-41a8-a680-b840db087607	{"doi": "10.13039/501100000923", "name": "Australian Research Council", "type": "gov", "parent": {"$ref": "http://dx.doi.org/10.13039/501100000934"}, "$schema": "http://zenodo.org/schemas/funders/funder-v1.0.0.json", "country": "AU", "subtype": "federal/national government", "acronyms": ["ARC"], "identifiers": {"oaf": "arc_________::ARC"}, "remote_created": "2011-07-11T10:52:15.000000", "remote_modified": "2015-06-12T08:24:28.000000"}	1
2019-08-08 19:19:00.804235	2019-08-08 19:19:00.804241	ad47aea6-50fc-4f0d-8339-8a93742b76f1	{"doi": "10.13039/501100001871", "name": "Fundação para a Ciência e a Tecnologia", "type": "gov", "parent": {"$ref": "http://dx.doi.org/10.13039/501100003381"}, "$schema": "http://zenodo.org/schemas/funders/funder-v1.0.0.json", "country": "PT", "subtype": "federal/national government", "acronyms": ["FCT"], "identifiers": {"oaf": "fct_________::FCT"}, "remote_created": "2011-10-11T09:06:59.000000", "remote_modified": "2015-07-08T10:09:16.000000"}	1
2019-08-08 19:19:00.829178	2019-08-08 19:19:00.829185	33c5e471-c52d-431f-aa13-d837f50587c9	{"doi": "10.13039/100004440", "name": "Wellcome Trust", "type": "pri", "parent": {}, "$schema": "http://zenodo.org/schemas/funders/funder-v1.0.0.json", "country": "GB", "subtype": "international", "acronyms": [], "identifiers": {"oaf": "wt__________::WT"}, "remote_created": "2009-07-06T18:53:11.000000", "remote_modified": "2015-06-22T15:39:16.000000"}	1
2019-08-08 19:19:00.853928	2019-08-08 19:19:00.853935	a63676ac-c87c-42e2-9cd9-a6c8aff60492	{"doi": "10.13039/100000001", "name": "National Science Foundation", "type": "gov", "parent": {}, "$schema": "http://zenodo.org/schemas/funders/funder-v1.0.0.json", "country": "US", "subtype": "federal/national government", "acronyms": ["NSF"], "identifiers": {"oaf": "nsf_________::NSF"}, "remote_created": "2009-07-06T18:53:11.000000", "remote_modified": "2015-06-12T09:13:48.000000"}	1
2019-08-08 19:19:00.879039	2019-08-08 19:19:00.879046	0028a7c6-ec94-489f-a5d1-22b9649f6dbb	{"doi": "10.13039/501100004564", "name": "Ministarstvo Prosvete, Nauke i Tehnološkog Razvoja", "type": "gov", "parent": {}, "$schema": "http://zenodo.org/schemas/funders/funder-v1.0.0.json", "country": "RS", "subtype": "federal/national government", "acronyms": [], "identifiers": {"oaf": null}, "remote_created": "2014-06-23T15:49:44.000000", "remote_modified": "2015-02-11T16:18:03.000000"}	1
2019-08-08 19:19:00.903554	2019-08-08 19:19:00.903561	f9182d21-0a50-41b4-8438-3d6f67ba393d	{"doi": "10.13039/501100003246", "name": "Nederlandse Organisatie voor Wetenschappelijk Onderzoek", "type": "gov", "parent": {}, "$schema": "http://zenodo.org/schemas/funders/funder-v1.0.0.json", "country": "NL", "subtype": "federal/national government", "acronyms": ["NWO"], "identifiers": {"oaf": null}, "remote_created": "2014-02-04T09:49:51.000000", "remote_modified": "2015-06-12T08:43:34.000000"}	1
2019-08-08 19:19:00.930105	2019-08-08 19:19:00.930113	002a7e3b-9dd5-46c1-81b2-cd6f26467b70	{"doi": "10.13039/501100006588", "name": "Ministarstvo Znanosti, Obrazovanja i Sporta", "type": "gov", "parent": {}, "$schema": "http://zenodo.org/schemas/funders/funder-v1.0.0.json", "country": "HR", "subtype": "federal/national government", "acronyms": ["MZOS"], "identifiers": {"oaf": null}, "remote_created": "2015-04-06T18:00:51.000000", "remote_modified": "2015-10-28T13:41:07.000000"}	1
2019-08-08 19:19:00.954495	2019-08-08 19:19:00.954503	6266764c-5f37-4cb9-81d0-181610488a1f	{"doi": "10.13039/501100003381", "name": "Ministério da Educação e Ciência", "type": "gov", "parent": {}, "$schema": "http://zenodo.org/schemas/funders/funder-v1.0.0.json", "country": "PT", "subtype": "government non-federal", "acronyms": [], "identifiers": {"oaf": null}, "remote_created": "2014-03-06T18:21:41.000000", "remote_modified": "2015-10-28T13:26:53.000000"}	1
2019-08-08 19:19:00.980369	2019-08-08 19:19:00.980375	e1463402-c8c0-4f80-9243-3347e3ddb239	{"doi": "10.13039/501100000934", "name": "Department of Industry, Innovation, Science, Research and Tertiary Education, Australian Government", "type": "gov", "parent": {}, "$schema": "http://zenodo.org/schemas/funders/funder-v1.0.0.json", "country": "AU", "subtype": "federal", "acronyms": [], "identifiers": {"oaf": null}, "remote_created": "2011-07-11T10:33:24.000000", "remote_modified": "2015-06-12T08:24:24.000000"}	1
2019-08-08 19:19:01.003969	2019-08-08 19:19:01.003977	c002149b-c025-4267-a2e5-6aeb5d364bce	{"doi": "10.13039/501100003921", "name": "Department of Health, Australian Government", "type": "gov", "parent": {}, "$schema": "http://zenodo.org/schemas/funders/funder-v1.0.0.json", "country": "AU", "subtype": "federal/national government", "acronyms": [], "identifiers": {"oaf": null}, "remote_created": "2014-04-24T13:24:55.000000", "remote_modified": "2015-10-28T13:34:53.000000"}	1
2019-08-08 19:19:01.028529	2019-08-08 19:19:01.028537	cc710e38-4f64-42f6-b47e-6f7455c2ccc2	{"doi": "10.13039/501100001711", "name": "Schweizerischer Nationalfonds zur Förderung der Wissenschaftlichen Forschung", "type": "pri", "parent": {}, "$schema": "http://zenodo.org/schemas/funders/funder-v1.0.0.json", "country": "CH", "subtype": "foundation", "acronyms": ["SNF"], "identifiers": {"oaf": null}, "remote_created": "2011-09-23T12:38:54.000000", "remote_modified": "2015-04-08T12:39:48.000000"}	1
2019-08-08 19:19:01.054536	2019-08-08 19:19:01.054544	358d1d90-1418-4370-94f6-87dcfdb5a864	{"doi": "10.13039/100000002", "name": "National Institutes of Health", "type": "gov", "parent": {"$ref": "http://dx.doi.org/10.13039/100000016"}, "$schema": "http://zenodo.org/schemas/funders/funder-v1.0.0.json", "country": "US", "subtype": "federal/national government", "acronyms": ["NIH"], "identifiers": {"oaf": null}, "remote_created": "2009-07-06T18:53:11.000000", "remote_modified": "2015-09-02T11:38:17.000000"}	1
2019-08-08 19:19:01.078698	2019-08-08 19:19:01.078706	9919bd2e-9d8a-4d9d-bd7b-c3ce4234971f	{"doi": "10.13039/501100004488", "name": "Hrvatska Zaklada za Znanost", "type": "gov", "parent": {}, "$schema": "http://zenodo.org/schemas/funders/funder-v1.0.0.json", "country": "HR", "subtype": "government non-federal", "acronyms": ["HRZZ"], "identifiers": {"oaf": null}, "remote_created": "2014-06-03T15:25:29.000000", "remote_modified": null}	1
2019-08-08 19:19:01.104182	2019-08-08 19:19:01.10419	f62c029d-e84e-4cbb-808e-ce1d65ce410f	{"doi": "10.13039/501100001602", "name": "Science Foundation Ireland", "type": "pri", "parent": {}, "$schema": "http://zenodo.org/schemas/funders/funder-v1.0.0.json", "country": "IE", "subtype": "foundation", "acronyms": ["SFI"], "identifiers": {"oaf": null}, "remote_created": "2011-09-02T08:46:06.000000", "remote_modified": "2015-01-05T09:59:07.000000"}	1
2019-08-08 19:19:01.130298	2019-08-08 19:19:01.130307	87f3622b-7114-4d19-8cb7-e030394623a7	{"doi": "10.13039/501100002428", "name": "Austrian Science Fund", "type": "pri", "parent": {}, "$schema": "http://zenodo.org/schemas/funders/funder-v1.0.0.json", "country": "AT", "subtype": "foundation", "acronyms": ["FWF"], "identifiers": {"oaf": null}, "remote_created": "2013-11-23T10:48:52.000000", "remote_modified": "2015-01-05T10:18:22.000000"}	1
2019-08-08 19:19:01.154255	2019-08-08 19:19:01.154263	e2cdc7aa-6ae5-4962-b74f-1d2f17fdd8d1	{"doi": "10.13039/100000016", "name": "U.S. Department of Health and Human Services", "type": "gov", "parent": {}, "$schema": "http://zenodo.org/schemas/funders/funder-v1.0.0.json", "country": "US", "subtype": "federal/national government", "acronyms": ["HHS"], "identifiers": {"oaf": null}, "remote_created": "2009-07-06T18:53:11.000000", "remote_modified": "2015-06-12T09:14:21.000000"}	1
2019-08-08 19:19:12.689674	2019-08-08 19:19:12.689682	dddefccc-6484-4430-a3ce-1eea94be0ac2	{"url": "http://cordis.europa.eu/search/index.cfm?fuseaction=proj.document&PJ_RCN=8373729", "code": "502084", "title": "Improving Public Health Policy in Europe through Modelling and Economic Evaluation of Interventions for the Control of Infectious Diseases", "funder": {"$ref": "https://doi.org/10.13039/501100000780"}, "$schema": "http://zenodo.org/schemas/grants/grant-v1.0.0.json", "acronym": "POLYMOD", "enddate": "2008-08-31", "program": "FP6", "startdate": "2004-09-01", "identifiers": {"eurepo": "info:eu-repo/grantAgreement/EC/FP6/502084/"}, "internal_id": "10.13039/501100000780::502084", "remote_modified": "2016-03-22T19:35:59Z"}	1
2019-08-08 19:19:12.729497	2019-08-08 19:19:12.729505	f2407b49-8746-442a-9d64-ad227713579b	{"url": "http://cordis.europa.eu/project/rcn/81165_en.html", "code": "027819", "title": "Integrating cognition, emotion and autonomy", "funder": {"$ref": "http://dx.doi.org/10.13039/501100000780"}, "$schema": "http://zenodo.org/schemas/grants/grant-v1.0.0.json", "acronym": "ICEA", "enddate": "2009-12-31", "program": "FP6", "startdate": "2006-01-01", "identifiers": {"eurepo": "info:eu-repo/grantAgreement/EC/FP6/027819/"}, "internal_id": "10.13039/501100000780::027819", "remote_modified": "2016-03-22T19:35:59Z"}	1
2019-08-08 19:31:48.383463	2019-08-08 19:59:19.773824	243300b3-e87a-4cdb-94a9-127624bfdb8e	{"doi": "10.5072/zenodo.2", "_oai": {"id": "oai:zenodo.org:2"}, "recid": 2, "title": "Ejemplo dataset csv", "_files": [{"key": "clasificadores_17102018_2.csv", "size": 6545485, "type": "csv", "bucket": "03b911fc-dc94-4f15-ac2c-e33eea2f7d35", "file_id": "58bb136b-d6fb-44a8-8e4e-7ced59e74530", "checksum": "md5:5922d896a8bbc63d35dc24f18e0932a2", "version_id": "ded55142-bbb4-4498-ae74-3dadd0b6bee9"}], "owners": [2], "$schema": "https://zenodo.org/schemas/deposits/records/record-v1.0.0.json", "license": {"$ref": "https://dx.zenodo.org/licenses/cc-by"}, "version": "1", "_buckets": {"record": "03b911fc-dc94-4f15-ac2c-e33eea2f7d35", "deposit": "f216ce58-f597-4949-8ccf-ca65d139aaca"}, "_deposit": {"id": "2", "pid": {"type": "recid", "value": "2", "revision_id": 1}, "owners": [2], "status": "published", "created_by": 2}, "creators": [{"name": "Jorge Toledano", "affiliation": "DGRU-UNAM"}], "keywords": ["dataset", "csv"], "language": "spa", "conceptdoi": "10.5072/zenodo.1", "communities": ["zenodo"], "description": "<p>Ejemplo dataset en formato csv</p>", "access_right": "open", "conceptrecid": "1", "resource_type": {"type": "dataset"}, "publication_date": "2019-08-08"}	6
2019-08-08 19:35:05.180246	2019-08-08 20:08:14.434768	6053d677-ddcf-4cb9-aa95-c5b13f71f938	{"doi": "10.5072/zenodo.2", "_oai": {"id": "oai:zenodo.org:2", "sets": ["user-zenodo"]}, "recid": 2, "title": "Ejemplo dataset csv", "_files": [{"key": "clasificadores_17102018_2.csv", "size": 6545485, "type": "csv", "bucket": "03b911fc-dc94-4f15-ac2c-e33eea2f7d35", "file_id": "58bb136b-d6fb-44a8-8e4e-7ced59e74530", "checksum": "md5:5922d896a8bbc63d35dc24f18e0932a2", "version_id": "ded55142-bbb4-4498-ae74-3dadd0b6bee9"}], "owners": [2], "$schema": "https://zenodo.org/schemas/records/record-v1.0.0.json", "license": {"$ref": "https://dx.zenodo.org/licenses/cc-by"}, "version": "1", "_buckets": {"record": "03b911fc-dc94-4f15-ac2c-e33eea2f7d35", "deposit": "f216ce58-f597-4949-8ccf-ca65d139aaca"}, "_deposit": {"id": "2", "pid": {"type": "recid", "value": "2", "revision_id": 1}, "owners": [2], "status": "published", "created_by": 2}, "creators": [{"name": "Jorge Toledano", "affiliation": "DGRU-UNAM"}], "keywords": ["dataset", "csv"], "language": "spa", "conceptdoi": "10.5072/zenodo.1", "communities": ["zenodo"], "description": "<p>Ejemplo dataset en formato csv</p>", "access_right": "open", "conceptrecid": "1", "resource_type": {"type": "dataset"}, "publication_date": "2019-08-08"}	4
\.


--
-- Data for Name: records_metadata_version; Type: TABLE DATA; Schema: public; Owner: zenodo
--

COPY public.records_metadata_version (created, updated, id, json, version_id, transaction_id, end_transaction_id, operation_type) FROM stdin;
2019-08-08 19:18:47.062809	2019-08-08 19:18:47.062816	8e723a15-f833-4b18-a87d-ef2731f7272e	{"id": "bsd-3-clause", "url": "http://www.opensource.org/licenses/BSD-3-Clause", "title": "BSD 3-Clause \\"New\\" or \\"Revised\\" License (BSD-3-Clause)", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "not reviewed", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:47.095666	2019-08-08 19:18:47.095672	8ff66896-8add-4df0-8955-2aed12ef7b88	{"id": "bsd-2-clause", "url": "http://www.opensource.org/licenses/BSD-2-Clause", "title": "BSD 2-Clause \\"Simplified\\" or \\"FreeBSD\\" License (BSD-2-Clause)", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "not reviewed", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:47.107458	2019-08-08 19:18:47.107464	2192016c-2e87-4d90-9383-4895737a533a	{"id": "afl-3.0", "url": "http://www.opensource.org/licenses/afl-3.0.php", "title": "Academic Free License 3.0 (AFL 3.0)", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:47.119195	2019-08-08 19:18:47.1192	24ce19e6-deea-477e-9ece-18a86ba921ef	{"id": "apl1.0", "url": "http://www.opensource.org/licenses/apl1.0.php", "title": "Adaptive Public License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:47.131309	2019-08-08 19:18:47.131314	15bf2ce0-c0ce-47c5-9c54-b239e8ada285	{"id": "agpl-v3", "url": "http://www.opensource.org/licenses/agpl-v3.html", "title": "Affero GNU Public License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:47.142848	2019-08-08 19:18:47.142853	0c21f398-2c9e-4d2f-9526-0ae4c00fd84f	{"id": "against-drm", "url": "http://www.opendefinition.org/licenses/against-drm", "title": "Against DRM", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": true, "od_conformance": "approved", "domain_software": false, "osd_conformance": "rejected"}	1	1	\N	1
2019-08-08 19:18:47.155541	2019-08-08 19:18:47.155546	4df22231-8114-4804-b4bf-222e5cde4a3a	{"id": "apache2.0", "url": "http://www.opensource.org/licenses/apache2.0.php", "title": "Apache License, 2.0", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:47.168545	2019-08-08 19:18:47.168556	1fd0fcae-8931-482a-845f-a2db25dd9a39	{"id": "apache", "url": "", "title": "Apache Software License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:47.184166	2019-08-08 19:18:47.184175	3981ef5f-3314-4a28-8226-a4b619d585a8	{"id": "apsl-2.0", "url": "http://www.opensource.org/licenses/apsl-2.0.php", "title": "Apple Public Source License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:47.198724	2019-08-08 19:18:47.19873	00031ef0-4054-42df-bf1a-6d324ef5344a	{"id": "artistic-license-2.0", "url": "http://www.opensource.org/licenses/artistic-license-2.0.php", "title": "Artistic license 2.0", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:47.211728	2019-08-08 19:18:47.211734	081f40bd-f27f-4abd-83bc-7e159d202deb	{"id": "attribution", "url": "http://www.opensource.org/licenses/attribution.php", "title": "Attribution Assurance Licenses", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:47.223656	2019-08-08 19:18:47.223662	35d4e803-c8f7-4c8b-a840-b3f1d9d75858	{"id": "bsd-license", "url": "http://www.opensource.org/licenses/bsd-license.php", "title": "BSD licenses (New and Simplified)", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:47.23745	2019-08-08 19:18:47.237456	5cf54bef-ad8e-4ccf-935e-bce0e77dd791	{"id": "bsl1.0", "url": "http://www.opensource.org/licenses/bsl1.0.html", "title": "Boost Software License (BSL1.0)", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:47.25142	2019-08-08 19:18:47.251426	ee597941-9429-46cd-8bdc-9085e46b632b	{"id": "cuaoffice", "url": "http://www.opensource.org/licenses/cuaoffice.php", "title": "CUA Office Public License Version 1.0", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:47.264052	2019-08-08 19:18:47.264058	d00f10b4-8255-4787-9ad1-f73e6f10b339	{"id": "canada-crown", "url": "", "title": "Canadian Crown Copyright", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": false, "osd_conformance": "rejected"}	1	1	\N	1
2019-08-08 19:18:47.278397	2019-08-08 19:18:47.278403	df3331bb-6f23-4e1e-afcd-c6816debd978	{"id": "cddl1", "url": "http://www.opensource.org/licenses/cddl1.php", "title": "Common Development and Distribution License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:47.292974	2019-08-08 19:18:47.292979	754e6b99-1b77-4b67-919b-e8e52d89b2fc	{"id": "cpal_1.0", "url": "http://www.opensource.org/licenses/cpal_1.0", "title": "Common Public Attribution License 1.0 (CPAL)", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:47.307424	2019-08-08 19:18:47.30743	9b84c636-1c7e-405b-8caf-c63d3ad429a4	{"id": "ca-tosl1.1", "url": "http://www.opensource.org/licenses/ca-tosl1.1.php", "title": "Computer Associates Trusted Open Source License 1.1", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:47.325708	2019-08-08 19:18:47.325715	068585ad-a46a-4981-bfcf-dabbf4ee06d0	{"id": "cc-by-sa", "url": "http://www.opendefinition.org/licenses/cc-by-sa", "title": "Creative Commons Attribution Share-Alike", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": true, "od_conformance": "approved", "domain_software": false, "osd_conformance": "rejected"}	1	1	\N	1
2019-08-08 19:18:47.340931	2019-08-08 19:18:47.340937	5f8919d2-a403-47f6-a62e-e6ea0812e202	{"id": "cc-by", "url": "http://www.opendefinition.org/licenses/cc-by", "title": "Creative Commons Attribution", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": true, "od_conformance": "approved", "domain_software": false, "osd_conformance": "rejected"}	1	1	\N	1
2019-08-08 19:18:47.35527	2019-08-08 19:18:47.355276	c8ff7433-2edd-42f7-a5f5-74183ce4fd85	{"id": "cc-zero", "url": "http://www.opendefinition.org/licenses/cc-zero", "title": "Creative Commons CCZero", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": true, "domain_content": true, "od_conformance": "approved", "domain_software": true, "osd_conformance": "rejected"}	1	1	\N	1
2019-08-08 19:18:47.368684	2019-08-08 19:18:47.368689	1cf91e66-2edb-4b9f-a8cb-f4412320a3d9	{"id": "cc-nc", "url": "http://creativecommons.org/licenses/by-nc/2.0/", "title": "Creative Commons Non-Commercial (Any)", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": false, "osd_conformance": "rejected"}	1	1	\N	1
2019-08-08 19:18:47.383913	2019-08-08 19:18:47.383919	575955ef-d662-4b57-b191-b17eb8fba4eb	{"id": "dsl", "url": "http://www.opendefinition.org/licenses/dsl", "title": "Design Science License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": true, "od_conformance": "approved", "domain_software": false, "osd_conformance": "rejected"}	1	1	\N	1
2019-08-08 19:18:47.402317	2019-08-08 19:18:47.402328	064d8335-ec77-48c0-b46e-a3d38f250406	{"id": "eudatagrid", "url": "http://www.opensource.org/licenses/eudatagrid.php", "title": "EU DataGrid Software License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:47.421628	2019-08-08 19:18:47.421634	b2c8e447-44b8-4fbb-be7a-b7765f8434c4	{"id": "eclipse-1.0", "url": "http://www.opensource.org/licenses/eclipse-1.0.php", "title": "Eclipse Public License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:47.43789	2019-08-08 19:18:47.437896	46635301-79ac-4d2c-a4b0-e845703d7a2f	{"id": "ecl2", "url": "http://www.opensource.org/licenses/ecl2.php", "title": "Educational Community License, Version 2.0", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:47.45332	2019-08-08 19:18:47.453326	9f5f660d-9482-44c3-b04c-5c8bb0b86dd6	{"id": "ver2_eiffel", "url": "http://www.opensource.org/licenses/ver2_eiffel.php", "title": "Eiffel Forum License V2.0", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:47.473574	2019-08-08 19:18:47.473579	b94c3d55-ab8b-48bc-b390-6fbec7e53273	{"id": "eiffel", "url": "", "title": "Eiffel Forum License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:47.490508	2019-08-08 19:18:47.490513	9410e8d4-f695-49d5-8f45-ed06f89444aa	{"id": "entessa", "url": "http://www.opensource.org/licenses/entessa.php", "title": "Entessa Public License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:47.505748	2019-08-08 19:18:47.505754	e1b6b003-dd6d-4b55-8ddf-1aa994c3ee7b	{"id": "eurofound", "url": " http://www.eurofound.europa.eu/legal-and-data-protection-notices ", "title": "Eurofound license", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": true, "od_conformance": "rejected", "domain_software": false, "osd_conformance": "rejected"}	1	1	\N	1
2019-08-08 19:18:47.522625	2019-08-08 19:18:47.52263	22ecf583-905f-4e74-9cf6-0fd27ad5b65d	{"id": "eupl-1.1", "url": "http://opensource.org/licenses/EUPL-1.1", "title": "European Union Public License, Version 1.1 (EUPL-1.1)", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:47.539482	2019-08-08 19:18:47.539487	a3fafbf2-876a-467b-8bc1-283b419d0b31	{"id": "fair", "url": "http://www.opensource.org/licenses/fair.php", "title": "Fair License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:47.557073	2019-08-08 19:18:47.557079	4331e954-61d7-40ad-b745-b57529ef3d2b	{"id": "frameworx", "url": "http://www.opensource.org/licenses/frameworx.php", "title": "Frameworx License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:47.575121	2019-08-08 19:18:47.575126	1341928c-7934-4af9-a12f-60a804626b85	{"id": "fal", "url": "http://www.opendefinition.org/licenses/fal", "title": "Free Art License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": true, "od_conformance": "approved", "domain_software": false, "osd_conformance": "rejected"}	1	1	\N	1
2019-08-08 19:18:47.594714	2019-08-08 19:18:47.594721	eebe2dab-e6ed-43c8-b55a-53d93fb7c1a7	{"id": "gfdl", "url": "http://www.opendefinition.org/licenses/gfdl", "title": "GNU Free Documentation License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": true, "od_conformance": "approved", "domain_software": false, "osd_conformance": "rejected"}	1	1	\N	1
2019-08-08 19:18:47.615455	2019-08-08 19:18:47.615461	6fdf4dbe-619e-4053-8472-9a28167a8981	{"id": "gpl-2.0", "url": "http://www.opensource.org/licenses/gpl-2.0.php", "title": "GNU General Public License (GPL)", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:47.63469	2019-08-08 19:18:47.634698	7e2a9138-8a6d-4639-bf52-8d5714224c52	{"id": "gpl-3.0", "url": "http://www.opensource.org/licenses/gpl-3.0.html", "title": "GNU General Public License version 3.0 (GPLv3)", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:47.659687	2019-08-08 19:18:47.659693	2f4cdc24-cbff-4fc8-a90a-8df0bb98e673	{"id": "lgpl-2.1", "url": "http://www.opensource.org/licenses/lgpl-2.1.php", "title": "GNU Library or \\"Lesser\\" General Public License (LGPL)", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:47.67862	2019-08-08 19:18:47.678625	d4f895b7-cc5d-4c4c-a55e-4a60849fa7cf	{"id": "lgpl-3.0", "url": "http://www.opensource.org/licenses/lgpl-3.0.html", "title": "GNU Library or \\"Lesser\\" General Public License version 3.0 (LGPLv3)", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:47.698057	2019-08-08 19:18:47.698063	6314be35-3844-4545-949b-a7a2a94c583f	{"id": "ibmpl", "url": "http://www.opensource.org/licenses/ibmpl.php", "title": "IBM Public License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:47.717342	2019-08-08 19:18:47.717347	32b01fe8-50ad-42cc-84ac-50ded3e8461d	{"id": "ipafont", "url": "http://www.opensource.org/licenses/ipafont.html", "title": "IPA Font License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:47.737068	2019-08-08 19:18:47.737074	28b93950-9f71-4343-810e-c5f98eb0dd05	{"id": "isc-license", "url": "http://www.opensource.org/licenses/isc-license.txt", "title": "ISC License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:47.757037	2019-08-08 19:18:47.757043	89e185ac-e039-4e7c-8814-5747c7ba7584	{"id": "intel-osl", "url": "", "title": "Intel Open Source License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:47.775443	2019-08-08 19:18:47.775448	4f4f46ab-b1e8-40d0-8d3b-b3fd02927ef7	{"id": "user-jsim", "url": "http://www.physiome.org/jsim/download/license.html", "title": "JSIM Software License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "rejected"}	1	1	\N	1
2019-08-08 19:18:47.79435	2019-08-08 19:18:47.794356	f6f366c1-f2a2-40e5-b9a2-7fcebbdd74ae	{"id": "jabber-osl", "url": "", "title": "Jabber Open Source License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:47.813329	2019-08-08 19:18:47.813334	ffb4e992-8db7-4c0d-a330-75aeb3f00178	{"id": "lucent-plan9", "url": "", "title": "Lucent Public License (Plan9)", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:47.833413	2019-08-08 19:18:47.833418	36165f05-caf7-4f72-839e-6b37ad95a8cf	{"id": "lucent1.02", "url": "http://www.opensource.org/licenses/lucent1.02.php", "title": "Lucent Public License Version 1.02", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:47.855292	2019-08-08 19:18:47.8553	ce58356d-2a46-4036-a3ae-2bbdd5ddc927	{"id": "mit-license", "url": "http://www.opensource.org/licenses/mit-license.php", "title": "MIT license", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:47.881039	2019-08-08 19:18:47.881044	1babd111-f539-4c17-95f1-704fe09dc731	{"id": "ms-pl", "url": "http://www.opensource.org/licenses/ms-pl.html", "title": "Microsoft Public License (Ms-PL)", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:47.90256	2019-08-08 19:18:47.902566	8f641ff9-a70c-4086-a51e-e004d5b69ef4	{"id": "ms-rl", "url": "http://www.opensource.org/licenses/ms-rl.html", "title": "Microsoft Reciprocal License (Ms-RL)", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:47.924003	2019-08-08 19:18:47.924008	d0e690ae-0b93-4604-a6bb-b6b38aa686b9	{"id": "miros", "url": "http://www.opensource.org/licenses/miros.html", "title": "MirOS Licence", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": true, "od_conformance": "approved", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:47.945452	2019-08-08 19:18:47.945458	d79cc77d-217e-47b8-970b-708a9447008b	{"id": "motosoto", "url": "http://www.opensource.org/licenses/motosoto.php", "title": "Motosoto License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:47.967169	2019-08-08 19:18:47.967175	0ac73172-81f8-4ddb-b33d-6f49f6604fcc	{"id": "mozilla", "url": "", "title": "Mozilla Public License 1.0 (MPL)", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:47.989057	2019-08-08 19:18:47.989062	01dc67f1-1dc9-4594-a86c-703b38f2558c	{"id": "mozilla1.1", "url": "http://www.opensource.org/licenses/mozilla1.1.php", "title": "Mozilla Public License 1.1 (MPL)", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:48.015628	2019-08-08 19:18:48.015634	d316dcb4-eedb-45da-b6b9-a11a92dfe29a	{"id": "multics", "url": "http://www.opensource.org/licenses/multics.txt", "title": "Multics License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:48.038016	2019-08-08 19:18:48.038021	dc1345a7-bf8f-466e-af3e-be8206d48176	{"id": "nasa1.3", "url": "http://www.opensource.org/licenses/nasa1.3.php", "title": "NASA Open Source Agreement 1.3", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:48.060239	2019-08-08 19:18:48.060244	12abc468-ffbf-456e-8458-761c7c98f9a2	{"id": "ntp-license", "url": "http://www.opensource.org/licenses/ntp-license.php", "title": "NTP License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:48.088753	2019-08-08 19:18:48.088759	e3704bb5-1afd-4495-9ca2-9d01f2b3193d	{"id": "naumen", "url": "http://www.opensource.org/licenses/naumen.php", "title": "Naumen Public License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:48.111758	2019-08-08 19:18:48.11177	9cfcffca-5156-4490-8ded-48e537060674	{"id": "nethack", "url": "http://www.opensource.org/licenses/nethack.php", "title": "Nethack General Public License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:48.133304	2019-08-08 19:18:48.13331	9c9f6a3d-5f23-4d33-aa95-9dce3632b0f1	{"id": "geo-no-fee-unrestricted", "url": "http://www4.agr.gc.ca/AAFC-AAC/display-afficher.do?id=1226945498401&lang=eng", "title": "No Fee Unrestricted Use License Agreement For Government Geographic Data (Canada)", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": false, "osd_conformance": "rejected"}	1	1	\N	1
2019-08-08 19:18:48.157484	2019-08-08 19:18:48.157489	79969061-60bf-4449-9a5e-dc81638e4484	{"id": "nokia", "url": "http://www.opensource.org/licenses/nokia.php", "title": "Nokia Open Source License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:48.181949	2019-08-08 19:18:48.181955	dea9b153-9b5b-43c9-9205-5f09254f7380	{"id": "nosl3.0", "url": "http://www.opensource.org/licenses/NOSL3.0.html", "title": "Non-Profit Open Software License 3.0 (Non-Profit OSL 3.0)", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:48.206033	2019-08-08 19:18:48.206039	f7f4150e-7cc2-4e79-b17d-140483bd2c23	{"id": "oclc2", "url": "http://www.opensource.org/licenses/oclc2.php", "title": "OCLC Research Public License 2.0", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:48.230775	2019-08-08 19:18:48.230781	80af62c9-a5ff-4464-87ee-4f4efc0bac5b	{"id": "odc-by", "url": "http://www.opendefinition.org/licenses/odc-by", "title": "Open Data Commons Attribution License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": true, "domain_content": false, "od_conformance": "approved", "domain_software": false, "osd_conformance": "rejected"}	1	1	\N	1
2019-08-08 19:18:48.25992	2019-08-08 19:18:48.259926	4dac93cf-ff2f-45ca-bcc6-7c2962c9ec05	{"id": "odc-odbl", "url": "http://www.opendefinition.org/licenses/odc-odbl", "title": "Open Data Commons Open Database License (ODbL)", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": true, "domain_content": false, "od_conformance": "approved", "domain_software": false, "osd_conformance": "rejected"}	1	1	\N	1
2019-08-08 19:18:48.284268	2019-08-08 19:18:48.284274	d76161bc-0213-4fe4-b8ca-e81230724f17	{"id": "odc-pddl", "url": "http://www.opendefinition.org/licenses/odc-pddl", "title": "Open Data Commons Public Domain Dedication and Licence (PDDL)", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": true, "domain_content": false, "od_conformance": "approved", "domain_software": false, "osd_conformance": "rejected"}	1	1	\N	1
2019-08-08 19:18:48.308831	2019-08-08 19:18:48.308837	b83b84b6-0a23-4d2f-a4d7-306b7376aa70	{"id": "openfont", "url": "http://www.opensource.org/licenses/openfont.html", "title": "Open Font License 1.1 (OFL 1.1)", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:48.333961	2019-08-08 19:18:48.333967	ce9e1681-460a-41cf-a45d-e5026926dc6d	{"id": "opengroup", "url": "http://www.opensource.org/licenses/opengroup.php", "title": "Open Group Test Suite License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:48.364237	2019-08-08 19:18:48.364243	193a1b7a-70f5-4763-ac87-4821f62635d5	{"id": "osl-3.0", "url": "http://www.opensource.org/licenses/osl-3.0.php", "title": "Open Software License 3.0 (OSL 3.0)", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:48.389575	2019-08-08 19:18:48.389581	8f5f926b-3f1d-41db-b9fa-f4c3df440cdf	{"id": "php", "url": "http://www.opensource.org/licenses/php.php", "title": "PHP License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:48.414885	2019-08-08 19:18:48.414891	dda69c6b-846b-415b-ac3c-59a780120d2d	{"id": "pythonsoftfoundation", "url": "http://www.opensource.org/licenses/PythonSoftFoundation.php", "title": "Python Software Foundation License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:48.440875	2019-08-08 19:18:48.440881	ae8c41df-6be3-4977-b3b1-c2b3bcd30451	{"id": "pythonpl", "url": "http://www.opensource.org/licenses/pythonpl.php", "title": "Python license", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:48.468287	2019-08-08 19:18:48.468293	93a62c63-4994-49ab-af49-3ba02ba22afc	{"id": "qtpl", "url": "http://www.opensource.org/licenses/qtpl.php", "title": "Qt Public License (QPL)", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:48.494453	2019-08-08 19:18:48.494459	442552fa-07a1-462e-abda-0ce66a49749a	{"id": "real", "url": "http://www.opensource.org/licenses/real.php", "title": "RealNetworks Public Source License V1.0", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:48.52537	2019-08-08 19:18:48.525375	06958c39-c52f-4f8b-a657-8ff2f2eac414	{"id": "rpl1.5", "url": "http://www.opensource.org/licenses/rpl1.5.txt", "title": "Reciprocal Public License 1.5 (RPL1.5)", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:48.552688	2019-08-08 19:18:48.552694	52506097-aa72-48b8-a0e8-79e135378671	{"id": "ricohpl", "url": "http://www.opensource.org/licenses/ricohpl.php", "title": "Ricoh Source Code Public License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:48.579567	2019-08-08 19:18:48.579573	291cf8e3-f24a-4d31-bde1-e230016d09c2	{"id": "simpl-2.0", "url": "http://www.opensource.org/licenses/simpl-2.0.html", "title": "Simple Public License 2.0", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:48.606515	2019-08-08 19:18:48.606521	f7fc7a0f-953a-484e-9f8a-aea7c625700e	{"id": "sleepycat", "url": "http://www.opensource.org/licenses/sleepycat.php", "title": "Sleepycat License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:48.633585	2019-08-08 19:18:48.633591	40fe9899-09dd-428c-a9ed-e48331a891d1	{"id": "sun-issl", "url": "", "title": "Sun Industry Standards Source License (SISSL)", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:48.666447	2019-08-08 19:18:48.666453	5bc59533-9a7b-47d8-b9ee-edc08faec5b9	{"id": "sunpublic", "url": "http://www.opensource.org/licenses/sunpublic.php", "title": "Sun Public License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:48.694267	2019-08-08 19:18:48.694273	8f25e148-fbe9-467a-9b22-531fd5e3d414	{"id": "sybase", "url": "http://www.opensource.org/licenses/sybase.php", "title": "Sybase Open Watcom Public License 1.0", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:48.72196	2019-08-08 19:18:48.721965	a2955211-55ee-4133-8cf1-148071d3c8e4	{"id": "tcl", "url": "http://www.opendefinition.org/licenses/tcl", "title": "Talis Community License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": true, "od_conformance": "approved", "domain_software": false, "osd_conformance": "rejected"}	1	1	\N	1
2019-08-08 19:18:48.750565	2019-08-08 19:18:48.750571	b9cdf01a-1ede-46ba-9971-770350352dbf	{"id": "postgresql", "url": "http://www.opensource.org/licenses/postgresql", "title": "The PostgreSQL License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:48.778491	2019-08-08 19:18:48.778496	7eafe3b3-ddce-4b82-bc19-522ed80565ef	{"id": "uk-ogl", "url": "http://reference.data.gov.uk/id/open-government-licence", "title": "UK Open Government Licence (OGL)", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": true, "domain_content": true, "od_conformance": "rejected", "domain_software": false, "osd_conformance": "rejected"}	1	1	\N	1
2019-08-08 19:18:48.807167	2019-08-08 19:18:48.807173	951272d7-a7f6-414a-8c04-7b4043d48730	{"id": "uoi-ncsa", "url": "http://www.opensource.org/licenses/UoI-NCSA.php", "title": "University of Illinois/NCSA Open Source License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:48.83635	2019-08-08 19:18:48.836356	c79eea9d-3df5-45f2-8cc2-6e98f92c18f6	{"id": "vovidapl", "url": "http://www.opensource.org/licenses/vovidapl.php", "title": "Vovida Software License v. 1.0", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:48.865049	2019-08-08 19:18:48.865054	1e436e97-bed3-4c65-ab1f-91185a9b6774	{"id": "w3c", "url": "http://www.opensource.org/licenses/W3C.php", "title": "W3C License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:48.893695	2019-08-08 19:18:48.893701	db0c2595-9fcc-4121-88ef-37e731158f49	{"id": "xnet", "url": "http://www.opensource.org/licenses/xnet.php", "title": "X.Net License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:48.929424	2019-08-08 19:18:48.929429	ab226f64-c890-45a0-a41f-3531f3628f79	{"id": "zpl", "url": "http://www.opensource.org/licenses/zpl.php", "title": "Zope Public License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:48.95958	2019-08-08 19:18:48.959586	95492042-3b0c-4df4-ae78-28376304fc64	{"id": "wxwindows", "url": "http://www.opensource.org/licenses/wxwindows.php", "title": "wxWindows Library License", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:48.989791	2019-08-08 19:18:48.989796	7dbed045-a8c2-4c90-9d26-77f1eb041bb9	{"id": "zlib-license", "url": "http://www.opensource.org/licenses/zlib-license.php", "title": "zlib/libpng license", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "", "domain_data": false, "domain_content": false, "od_conformance": "rejected", "domain_software": true, "osd_conformance": "approved"}	1	1	\N	1
2019-08-08 19:18:49.018961	2019-08-08 19:18:49.018966	465ade7d-9392-4d4c-9491-77a261b404e1	{"id": "cc-by-nd-4.0", "url": "https://creativecommons.org/licenses/by-nd/4.0/", "title": "Creative Commons Attribution-NoDerivatives", "family": "Creative Commons", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "Creative Commons", "domain_data": true, "domain_content": true, "od_conformance": "rejected", "domain_software": false, "osd_conformance": "rejected"}	1	1	\N	1
2019-08-08 19:18:49.048947	2019-08-08 19:18:49.048953	555396a6-a363-4b4b-b339-14d1440dbff9	{"id": "cc-by-nc-4.0", "url": "https://creativecommons.org/licenses/by-nc/4.0/", "title": "Creative Commons Attribution-NonCommercial", "family": "Creative Commons", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "Creative Commons", "domain_data": true, "domain_content": true, "od_conformance": "rejected", "domain_software": false, "osd_conformance": "rejected"}	1	1	\N	1
2019-08-08 19:18:49.07852	2019-08-08 19:18:49.078526	e3db1ac3-0f40-4dfc-ad2b-6a45b8a2d546	{"id": "cc-by-nc-nd-4.0", "url": "https://creativecommons.org/licenses/by-nc-nd/4.0/", "title": "Creative Commons Attribution-NonCommercial-NoDerivatives", "family": "Creative Commons", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "Creative Commons", "domain_data": true, "domain_content": true, "od_conformance": "rejected", "domain_software": false, "osd_conformance": "rejected"}	1	1	\N	1
2019-08-08 19:18:49.108429	2019-08-08 19:18:49.108435	3266439e-c3c5-4504-bc50-88a916cb1a82	{"id": "cc-by-nc-sa-4.0", "url": "https://creativecommons.org/licenses/by-nc-sa/4.0/", "title": "Creative Commons Attribution-NonCommercial-ShareAlike", "family": "Creative Commons", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "Creative Commons", "domain_data": true, "domain_content": true, "od_conformance": "rejected", "domain_software": false, "osd_conformance": "rejected"}	1	1	\N	1
2019-08-08 19:18:49.137564	2019-08-08 19:18:49.13757	db27f919-fbf9-4f1a-bc54-16a01d2b29f9	{"id": "zenodo-freetoread-1.0", "url": "", "title": "Free for private use; right holder retains other rights, including distribution", "family": "", "status": "active", "$schema": "http://zenodo.org/schemas/licenses/license-v1.0.0.json", "maintainer": "Zenodo", "domain_data": true, "domain_content": true, "od_conformance": "rejected", "domain_software": false, "osd_conformance": "rejected"}	1	1	\N	1
2019-08-08 19:19:00.71021	2019-08-08 19:19:00.710219	0f7f994b-2e93-47f4-ab86-a51766bde9f7	{"doi": "10.13039/501100000925", "name": "National Health and Medical Research Council", "type": "gov", "parent": {"$ref": "http://dx.doi.org/10.13039/501100003921"}, "$schema": "http://zenodo.org/schemas/funders/funder-v1.0.0.json", "country": "AU", "subtype": "federal/national government", "acronyms": ["NHMRC"], "identifiers": {"oaf": "nhmrc_______::NHMRC"}, "remote_created": "2011-07-12T19:54:57.000000", "remote_modified": "2015-01-05T10:12:10.000000"}	1	2	\N	1
2019-08-08 19:19:00.745994	2019-08-08 19:19:00.746002	ef77cd90-f012-470c-91e5-1101622a2010	{"doi": "10.13039/501100000780", "name": "European Commission", "type": "gov", "parent": {}, "$schema": "http://zenodo.org/schemas/funders/funder-v1.0.0.json", "country": "BE", "subtype": "federal", "acronyms": ["EC"], "identifiers": {"oaf": "ec__________::EC"}, "remote_created": "2011-06-08T16:00:03.000000", "remote_modified": "2015-10-28T13:27:02.000000"}	1	3	\N	1
2019-08-08 19:19:00.781456	2019-08-08 19:19:00.781465	a941a044-5ee0-41a8-a680-b840db087607	{"doi": "10.13039/501100000923", "name": "Australian Research Council", "type": "gov", "parent": {"$ref": "http://dx.doi.org/10.13039/501100000934"}, "$schema": "http://zenodo.org/schemas/funders/funder-v1.0.0.json", "country": "AU", "subtype": "federal/national government", "acronyms": ["ARC"], "identifiers": {"oaf": "arc_________::ARC"}, "remote_created": "2011-07-11T10:52:15.000000", "remote_modified": "2015-06-12T08:24:28.000000"}	1	4	\N	1
2019-08-08 19:19:00.804235	2019-08-08 19:19:00.804241	ad47aea6-50fc-4f0d-8339-8a93742b76f1	{"doi": "10.13039/501100001871", "name": "Fundação para a Ciência e a Tecnologia", "type": "gov", "parent": {"$ref": "http://dx.doi.org/10.13039/501100003381"}, "$schema": "http://zenodo.org/schemas/funders/funder-v1.0.0.json", "country": "PT", "subtype": "federal/national government", "acronyms": ["FCT"], "identifiers": {"oaf": "fct_________::FCT"}, "remote_created": "2011-10-11T09:06:59.000000", "remote_modified": "2015-07-08T10:09:16.000000"}	1	5	\N	1
2019-08-08 19:19:00.829178	2019-08-08 19:19:00.829185	33c5e471-c52d-431f-aa13-d837f50587c9	{"doi": "10.13039/100004440", "name": "Wellcome Trust", "type": "pri", "parent": {}, "$schema": "http://zenodo.org/schemas/funders/funder-v1.0.0.json", "country": "GB", "subtype": "international", "acronyms": [], "identifiers": {"oaf": "wt__________::WT"}, "remote_created": "2009-07-06T18:53:11.000000", "remote_modified": "2015-06-22T15:39:16.000000"}	1	6	\N	1
2019-08-08 19:19:00.853928	2019-08-08 19:19:00.853935	a63676ac-c87c-42e2-9cd9-a6c8aff60492	{"doi": "10.13039/100000001", "name": "National Science Foundation", "type": "gov", "parent": {}, "$schema": "http://zenodo.org/schemas/funders/funder-v1.0.0.json", "country": "US", "subtype": "federal/national government", "acronyms": ["NSF"], "identifiers": {"oaf": "nsf_________::NSF"}, "remote_created": "2009-07-06T18:53:11.000000", "remote_modified": "2015-06-12T09:13:48.000000"}	1	7	\N	1
2019-08-08 19:19:00.879039	2019-08-08 19:19:00.879046	0028a7c6-ec94-489f-a5d1-22b9649f6dbb	{"doi": "10.13039/501100004564", "name": "Ministarstvo Prosvete, Nauke i Tehnološkog Razvoja", "type": "gov", "parent": {}, "$schema": "http://zenodo.org/schemas/funders/funder-v1.0.0.json", "country": "RS", "subtype": "federal/national government", "acronyms": [], "identifiers": {"oaf": null}, "remote_created": "2014-06-23T15:49:44.000000", "remote_modified": "2015-02-11T16:18:03.000000"}	1	8	\N	1
2019-08-08 19:19:00.903554	2019-08-08 19:19:00.903561	f9182d21-0a50-41b4-8438-3d6f67ba393d	{"doi": "10.13039/501100003246", "name": "Nederlandse Organisatie voor Wetenschappelijk Onderzoek", "type": "gov", "parent": {}, "$schema": "http://zenodo.org/schemas/funders/funder-v1.0.0.json", "country": "NL", "subtype": "federal/national government", "acronyms": ["NWO"], "identifiers": {"oaf": null}, "remote_created": "2014-02-04T09:49:51.000000", "remote_modified": "2015-06-12T08:43:34.000000"}	1	9	\N	1
2019-08-08 19:19:00.930105	2019-08-08 19:19:00.930113	002a7e3b-9dd5-46c1-81b2-cd6f26467b70	{"doi": "10.13039/501100006588", "name": "Ministarstvo Znanosti, Obrazovanja i Sporta", "type": "gov", "parent": {}, "$schema": "http://zenodo.org/schemas/funders/funder-v1.0.0.json", "country": "HR", "subtype": "federal/national government", "acronyms": ["MZOS"], "identifiers": {"oaf": null}, "remote_created": "2015-04-06T18:00:51.000000", "remote_modified": "2015-10-28T13:41:07.000000"}	1	10	\N	1
2019-08-08 19:19:00.954495	2019-08-08 19:19:00.954503	6266764c-5f37-4cb9-81d0-181610488a1f	{"doi": "10.13039/501100003381", "name": "Ministério da Educação e Ciência", "type": "gov", "parent": {}, "$schema": "http://zenodo.org/schemas/funders/funder-v1.0.0.json", "country": "PT", "subtype": "government non-federal", "acronyms": [], "identifiers": {"oaf": null}, "remote_created": "2014-03-06T18:21:41.000000", "remote_modified": "2015-10-28T13:26:53.000000"}	1	11	\N	1
2019-08-08 19:19:00.980369	2019-08-08 19:19:00.980375	e1463402-c8c0-4f80-9243-3347e3ddb239	{"doi": "10.13039/501100000934", "name": "Department of Industry, Innovation, Science, Research and Tertiary Education, Australian Government", "type": "gov", "parent": {}, "$schema": "http://zenodo.org/schemas/funders/funder-v1.0.0.json", "country": "AU", "subtype": "federal", "acronyms": [], "identifiers": {"oaf": null}, "remote_created": "2011-07-11T10:33:24.000000", "remote_modified": "2015-06-12T08:24:24.000000"}	1	12	\N	1
2019-08-08 19:19:01.003969	2019-08-08 19:19:01.003977	c002149b-c025-4267-a2e5-6aeb5d364bce	{"doi": "10.13039/501100003921", "name": "Department of Health, Australian Government", "type": "gov", "parent": {}, "$schema": "http://zenodo.org/schemas/funders/funder-v1.0.0.json", "country": "AU", "subtype": "federal/national government", "acronyms": [], "identifiers": {"oaf": null}, "remote_created": "2014-04-24T13:24:55.000000", "remote_modified": "2015-10-28T13:34:53.000000"}	1	13	\N	1
2019-08-08 19:19:01.028529	2019-08-08 19:19:01.028537	cc710e38-4f64-42f6-b47e-6f7455c2ccc2	{"doi": "10.13039/501100001711", "name": "Schweizerischer Nationalfonds zur Förderung der Wissenschaftlichen Forschung", "type": "pri", "parent": {}, "$schema": "http://zenodo.org/schemas/funders/funder-v1.0.0.json", "country": "CH", "subtype": "foundation", "acronyms": ["SNF"], "identifiers": {"oaf": null}, "remote_created": "2011-09-23T12:38:54.000000", "remote_modified": "2015-04-08T12:39:48.000000"}	1	14	\N	1
2019-08-08 19:19:01.054536	2019-08-08 19:19:01.054544	358d1d90-1418-4370-94f6-87dcfdb5a864	{"doi": "10.13039/100000002", "name": "National Institutes of Health", "type": "gov", "parent": {"$ref": "http://dx.doi.org/10.13039/100000016"}, "$schema": "http://zenodo.org/schemas/funders/funder-v1.0.0.json", "country": "US", "subtype": "federal/national government", "acronyms": ["NIH"], "identifiers": {"oaf": null}, "remote_created": "2009-07-06T18:53:11.000000", "remote_modified": "2015-09-02T11:38:17.000000"}	1	15	\N	1
2019-08-08 19:19:01.078698	2019-08-08 19:19:01.078706	9919bd2e-9d8a-4d9d-bd7b-c3ce4234971f	{"doi": "10.13039/501100004488", "name": "Hrvatska Zaklada za Znanost", "type": "gov", "parent": {}, "$schema": "http://zenodo.org/schemas/funders/funder-v1.0.0.json", "country": "HR", "subtype": "government non-federal", "acronyms": ["HRZZ"], "identifiers": {"oaf": null}, "remote_created": "2014-06-03T15:25:29.000000", "remote_modified": null}	1	16	\N	1
2019-08-08 19:19:01.104182	2019-08-08 19:19:01.10419	f62c029d-e84e-4cbb-808e-ce1d65ce410f	{"doi": "10.13039/501100001602", "name": "Science Foundation Ireland", "type": "pri", "parent": {}, "$schema": "http://zenodo.org/schemas/funders/funder-v1.0.0.json", "country": "IE", "subtype": "foundation", "acronyms": ["SFI"], "identifiers": {"oaf": null}, "remote_created": "2011-09-02T08:46:06.000000", "remote_modified": "2015-01-05T09:59:07.000000"}	1	17	\N	1
2019-08-08 19:19:01.130298	2019-08-08 19:19:01.130307	87f3622b-7114-4d19-8cb7-e030394623a7	{"doi": "10.13039/501100002428", "name": "Austrian Science Fund", "type": "pri", "parent": {}, "$schema": "http://zenodo.org/schemas/funders/funder-v1.0.0.json", "country": "AT", "subtype": "foundation", "acronyms": ["FWF"], "identifiers": {"oaf": null}, "remote_created": "2013-11-23T10:48:52.000000", "remote_modified": "2015-01-05T10:18:22.000000"}	1	18	\N	1
2019-08-08 19:19:01.154255	2019-08-08 19:19:01.154263	e2cdc7aa-6ae5-4962-b74f-1d2f17fdd8d1	{"doi": "10.13039/100000016", "name": "U.S. Department of Health and Human Services", "type": "gov", "parent": {}, "$schema": "http://zenodo.org/schemas/funders/funder-v1.0.0.json", "country": "US", "subtype": "federal/national government", "acronyms": ["HHS"], "identifiers": {"oaf": null}, "remote_created": "2009-07-06T18:53:11.000000", "remote_modified": "2015-06-12T09:14:21.000000"}	1	19	\N	1
2019-08-08 19:19:12.689674	2019-08-08 19:19:12.689682	dddefccc-6484-4430-a3ce-1eea94be0ac2	{"url": "http://cordis.europa.eu/search/index.cfm?fuseaction=proj.document&PJ_RCN=8373729", "code": "502084", "title": "Improving Public Health Policy in Europe through Modelling and Economic Evaluation of Interventions for the Control of Infectious Diseases", "funder": {"$ref": "https://doi.org/10.13039/501100000780"}, "$schema": "http://zenodo.org/schemas/grants/grant-v1.0.0.json", "acronym": "POLYMOD", "enddate": "2008-08-31", "program": "FP6", "startdate": "2004-09-01", "identifiers": {"eurepo": "info:eu-repo/grantAgreement/EC/FP6/502084/"}, "internal_id": "10.13039/501100000780::502084", "remote_modified": "2016-03-22T19:35:59Z"}	1	20	\N	1
2019-08-08 19:19:12.729497	2019-08-08 19:19:12.729505	f2407b49-8746-442a-9d64-ad227713579b	{"url": "http://cordis.europa.eu/project/rcn/81165_en.html", "code": "027819", "title": "Integrating cognition, emotion and autonomy", "funder": {"$ref": "http://dx.doi.org/10.13039/501100000780"}, "$schema": "http://zenodo.org/schemas/grants/grant-v1.0.0.json", "acronym": "ICEA", "enddate": "2009-12-31", "program": "FP6", "startdate": "2006-01-01", "identifiers": {"eurepo": "info:eu-repo/grantAgreement/EC/FP6/027819/"}, "internal_id": "10.13039/501100000780::027819", "remote_modified": "2016-03-22T19:35:59Z"}	1	21	\N	1
2019-08-08 19:31:48.383463	2019-08-08 19:31:48.383479	243300b3-e87a-4cdb-94a9-127624bfdb8e	{"recid": 2, "$schema": "https://zenodo.org/schemas/deposits/records/record-v1.0.0.json", "_buckets": {"deposit": "f216ce58-f597-4949-8ccf-ca65d139aaca"}, "_deposit": {"id": "2", "owners": [2], "status": "draft", "created_by": 2}, "conceptrecid": "1"}	1	22	23	1
2019-08-08 19:31:48.383463	2019-08-08 19:32:56.488801	243300b3-e87a-4cdb-94a9-127624bfdb8e	{"doi": "10.5072/zenodo.2", "recid": 2, "title": "Ejemplo dataset csv", "$schema": "https://zenodo.org/schemas/deposits/records/record-v1.0.0.json", "license": {"$ref": "https://dx.zenodo.org/licenses/cc-by"}, "version": "1", "_buckets": {"deposit": "f216ce58-f597-4949-8ccf-ca65d139aaca"}, "_deposit": {"id": "2", "owners": [2], "status": "draft", "created_by": 2}, "creators": [{"name": "Jorge Toledano", "affiliation": "DGRU-UNAM"}], "keywords": ["dataset", "csv"], "language": "spa", "description": "<p>Ejemplo dataset en formato csv</p>", "access_right": "open", "conceptrecid": "1", "resource_type": {"type": "dataset"}, "publication_date": "2019-08-08"}	2	23	24	1
2019-08-08 19:31:48.383463	2019-08-08 19:34:13.98731	243300b3-e87a-4cdb-94a9-127624bfdb8e	{"doi": "10.5072/zenodo.2", "recid": 2, "title": "Ejemplo dataset csv", "$schema": "https://zenodo.org/schemas/deposits/records/record-v1.0.0.json", "license": {"$ref": "https://dx.zenodo.org/licenses/cc-by"}, "version": "1", "_buckets": {"deposit": "f216ce58-f597-4949-8ccf-ca65d139aaca"}, "_deposit": {"id": "2", "owners": [2], "status": "draft", "created_by": 2}, "creators": [{"name": "Jorge Toledano", "affiliation": "DGRU-UNAM"}], "keywords": ["dataset", "csv"], "language": "spa", "description": "<p>Ejemplo dataset en formato csv</p>", "access_right": "open", "conceptrecid": "1", "resource_type": {"type": "dataset"}, "publication_date": "2019-08-08"}	3	24	25	1
2019-08-08 19:35:05.180246	2019-08-08 19:59:19.765858	6053d677-ddcf-4cb9-aa95-c5b13f71f938	{"doi": "10.5072/zenodo.2", "_oai": {"id": "oai:zenodo.org:2"}, "recid": 2, "title": "Ejemplo dataset csv", "_files": [{"key": "clasificadores_17102018_2.csv", "size": 6545485, "type": "csv", "bucket": "03b911fc-dc94-4f15-ac2c-e33eea2f7d35", "file_id": "58bb136b-d6fb-44a8-8e4e-7ced59e74530", "checksum": "md5:5922d896a8bbc63d35dc24f18e0932a2", "version_id": "ded55142-bbb4-4498-ae74-3dadd0b6bee9"}], "owners": [2], "$schema": "https://zenodo.org/schemas/records/record-v1.0.0.json", "license": {"$ref": "https://dx.zenodo.org/licenses/cc-by"}, "version": "1", "_buckets": {"record": "03b911fc-dc94-4f15-ac2c-e33eea2f7d35", "deposit": "f216ce58-f597-4949-8ccf-ca65d139aaca"}, "_deposit": {"id": "2", "pid": {"type": "recid", "value": "2", "revision_id": 1}, "owners": [2], "status": "published", "created_by": 2}, "creators": [{"name": "Jorge Toledano", "affiliation": "DGRU-UNAM"}], "keywords": ["dataset", "csv"], "language": "spa", "conceptdoi": "10.5072/zenodo.1", "description": "<p>Ejemplo dataset en formato csv</p>", "access_right": "open", "conceptrecid": "1", "resource_type": {"type": "dataset"}, "publication_date": "2019-08-08"}	3	27	28	1
2019-08-08 19:31:48.383463	2019-08-08 19:35:05.297097	243300b3-e87a-4cdb-94a9-127624bfdb8e	{"doi": "10.5072/zenodo.2", "_oai": {"id": "oai:zenodo.org:2"}, "recid": 2, "title": "Ejemplo dataset csv", "owners": [2], "$schema": "https://zenodo.org/schemas/deposits/records/record-v1.0.0.json", "license": {"$ref": "https://dx.zenodo.org/licenses/cc-by"}, "version": "1", "_buckets": {"deposit": "f216ce58-f597-4949-8ccf-ca65d139aaca"}, "_deposit": {"id": "2", "pid": {"type": "recid", "value": "2", "revision_id": 0}, "owners": [2], "status": "published", "created_by": 2}, "creators": [{"name": "Jorge Toledano", "affiliation": "DGRU-UNAM"}], "keywords": ["dataset", "csv"], "language": "spa", "conceptdoi": "10.5072/zenodo.1", "communities": ["zenodo"], "description": "<p>Ejemplo dataset en formato csv</p>", "access_right": "open", "conceptrecid": "1", "resource_type": {"type": "dataset"}, "publication_date": "2019-08-08"}	4	25	26	1
2019-08-08 19:35:05.180246	2019-08-08 19:35:05.256119	6053d677-ddcf-4cb9-aa95-c5b13f71f938	{"doi": "10.5072/zenodo.2", "_oai": {"id": "oai:zenodo.org:2"}, "recid": 2, "title": "Ejemplo dataset csv", "_files": [{"key": "clasificadores_17102018_2.csv", "size": 6545485, "type": "csv", "bucket": "03b911fc-dc94-4f15-ac2c-e33eea2f7d35", "file_id": "58bb136b-d6fb-44a8-8e4e-7ced59e74530", "checksum": "md5:5922d896a8bbc63d35dc24f18e0932a2", "version_id": "ded55142-bbb4-4498-ae74-3dadd0b6bee9"}], "owners": [2], "$schema": "https://zenodo.org/schemas/records/record-v1.0.0.json", "license": {"$ref": "https://dx.zenodo.org/licenses/cc-by"}, "version": "1", "_buckets": {"record": "03b911fc-dc94-4f15-ac2c-e33eea2f7d35", "deposit": "f216ce58-f597-4949-8ccf-ca65d139aaca"}, "_deposit": {"id": "2", "pid": {"type": "recid", "value": "2", "revision_id": 0}, "owners": [2], "status": "published", "created_by": 2}, "creators": [{"name": "Jorge Toledano", "affiliation": "DGRU-UNAM"}], "keywords": ["dataset", "csv"], "language": "spa", "conceptdoi": "10.5072/zenodo.1", "description": "<p>Ejemplo dataset en formato csv</p>", "access_right": "open", "conceptrecid": "1", "resource_type": {"type": "dataset"}, "publication_date": "2019-08-08"}	2	25	27	1
2019-08-08 19:31:48.383463	2019-08-08 19:59:19.773824	243300b3-e87a-4cdb-94a9-127624bfdb8e	{"doi": "10.5072/zenodo.2", "_oai": {"id": "oai:zenodo.org:2"}, "recid": 2, "title": "Ejemplo dataset csv", "_files": [{"key": "clasificadores_17102018_2.csv", "size": 6545485, "type": "csv", "bucket": "03b911fc-dc94-4f15-ac2c-e33eea2f7d35", "file_id": "58bb136b-d6fb-44a8-8e4e-7ced59e74530", "checksum": "md5:5922d896a8bbc63d35dc24f18e0932a2", "version_id": "ded55142-bbb4-4498-ae74-3dadd0b6bee9"}], "owners": [2], "$schema": "https://zenodo.org/schemas/deposits/records/record-v1.0.0.json", "license": {"$ref": "https://dx.zenodo.org/licenses/cc-by"}, "version": "1", "_buckets": {"record": "03b911fc-dc94-4f15-ac2c-e33eea2f7d35", "deposit": "f216ce58-f597-4949-8ccf-ca65d139aaca"}, "_deposit": {"id": "2", "pid": {"type": "recid", "value": "2", "revision_id": 1}, "owners": [2], "status": "published", "created_by": 2}, "creators": [{"name": "Jorge Toledano", "affiliation": "DGRU-UNAM"}], "keywords": ["dataset", "csv"], "language": "spa", "conceptdoi": "10.5072/zenodo.1", "communities": ["zenodo"], "description": "<p>Ejemplo dataset en formato csv</p>", "access_right": "open", "conceptrecid": "1", "resource_type": {"type": "dataset"}, "publication_date": "2019-08-08"}	6	27	\N	1
2019-08-08 19:31:48.383463	2019-08-08 19:58:56.941739	243300b3-e87a-4cdb-94a9-127624bfdb8e	{"doi": "10.5072/zenodo.2", "_oai": {"id": "oai:zenodo.org:2"}, "recid": 2, "title": "Ejemplo dataset csv", "_files": [{"key": "clasificadores_17102018_2.csv", "size": 6545485, "type": "csv", "bucket": "03b911fc-dc94-4f15-ac2c-e33eea2f7d35", "file_id": "58bb136b-d6fb-44a8-8e4e-7ced59e74530", "checksum": "md5:5922d896a8bbc63d35dc24f18e0932a2", "version_id": "ded55142-bbb4-4498-ae74-3dadd0b6bee9"}], "owners": [2], "$schema": "https://zenodo.org/schemas/deposits/records/record-v1.0.0.json", "license": {"$ref": "https://dx.zenodo.org/licenses/cc-by"}, "version": "1", "_buckets": {"record": "03b911fc-dc94-4f15-ac2c-e33eea2f7d35", "deposit": "f216ce58-f597-4949-8ccf-ca65d139aaca"}, "_deposit": {"id": "2", "pid": {"type": "recid", "value": "2", "revision_id": 1}, "owners": [2], "status": "draft", "created_by": 2}, "creators": [{"name": "Jorge Toledano", "affiliation": "DGRU-UNAM"}], "keywords": ["dataset", "csv"], "language": "spa", "conceptdoi": "10.5072/zenodo.1", "communities": ["zenodo"], "description": "<p>Ejemplo dataset en formato csv</p>", "access_right": "open", "conceptrecid": "1", "resource_type": {"type": "dataset"}, "publication_date": "2019-08-08"}	5	26	27	1
2019-08-08 19:35:05.180246	2019-08-08 20:08:14.434768	6053d677-ddcf-4cb9-aa95-c5b13f71f938	{"doi": "10.5072/zenodo.2", "_oai": {"id": "oai:zenodo.org:2", "sets": ["user-zenodo"]}, "recid": 2, "title": "Ejemplo dataset csv", "_files": [{"key": "clasificadores_17102018_2.csv", "size": 6545485, "type": "csv", "bucket": "03b911fc-dc94-4f15-ac2c-e33eea2f7d35", "file_id": "58bb136b-d6fb-44a8-8e4e-7ced59e74530", "checksum": "md5:5922d896a8bbc63d35dc24f18e0932a2", "version_id": "ded55142-bbb4-4498-ae74-3dadd0b6bee9"}], "owners": [2], "$schema": "https://zenodo.org/schemas/records/record-v1.0.0.json", "license": {"$ref": "https://dx.zenodo.org/licenses/cc-by"}, "version": "1", "_buckets": {"record": "03b911fc-dc94-4f15-ac2c-e33eea2f7d35", "deposit": "f216ce58-f597-4949-8ccf-ca65d139aaca"}, "_deposit": {"id": "2", "pid": {"type": "recid", "value": "2", "revision_id": 1}, "owners": [2], "status": "published", "created_by": 2}, "creators": [{"name": "Jorge Toledano", "affiliation": "DGRU-UNAM"}], "keywords": ["dataset", "csv"], "language": "spa", "conceptdoi": "10.5072/zenodo.1", "communities": ["zenodo"], "description": "<p>Ejemplo dataset en formato csv</p>", "access_right": "open", "conceptrecid": "1", "resource_type": {"type": "dataset"}, "publication_date": "2019-08-08"}	4	28	\N	1
\.


--
-- Data for Name: sipstore_recordsip; Type: TABLE DATA; Schema: public; Owner: zenodo
--

COPY public.sipstore_recordsip (created, updated, sip_id, pid_id) FROM stdin;
2019-08-08 19:35:05.499725	2019-08-08 19:35:05.49973	b07e9e19-fe42-4cd7-9618-40b21cfd0870	126
2019-08-08 19:59:19.902884	2019-08-08 19:59:19.90289	979e80c8-c023-45c1-a7a7-64d56ef32baa	126
\.


--
-- Data for Name: sipstore_sip; Type: TABLE DATA; Schema: public; Owner: zenodo
--

COPY public.sipstore_sip (created, updated, id, user_id, agent, archivable, archived) FROM stdin;
2019-08-08 19:35:05.487618	2019-08-08 19:35:05.487625	b07e9e19-fe42-4cd7-9618-40b21cfd0870	2	{"$schema": "https://zenodo.org/schemas/sipstore/agent-webclient-v1.0.0.json", "ip_address": "172.18.0.12", "email": "tole@ciencias.unam.mx"}	t	f
2019-08-08 19:59:19.897793	2019-08-08 19:59:19.897801	979e80c8-c023-45c1-a7a7-64d56ef32baa	2	{"$schema": "https://zenodo.org/schemas/sipstore/agent-webclient-v1.0.0.json", "ip_address": "172.18.0.12", "email": "tole@ciencias.unam.mx"}	t	f
\.


--
-- Data for Name: sipstore_sipfile; Type: TABLE DATA; Schema: public; Owner: zenodo
--

COPY public.sipstore_sipfile (created, updated, sip_id, filepath, file_id) FROM stdin;
2019-08-08 19:35:05.492545	2019-08-08 19:35:05.49255	b07e9e19-fe42-4cd7-9618-40b21cfd0870	clasificadores_17102018_2.csv	58bb136b-d6fb-44a8-8e4e-7ced59e74530
\.


--
-- Data for Name: sipstore_sipmetadata; Type: TABLE DATA; Schema: public; Owner: zenodo
--

COPY public.sipstore_sipmetadata (created, updated, sip_id, type_id, content) FROM stdin;
2019-08-08 19:35:05.496499	2019-08-08 19:35:05.496504	b07e9e19-fe42-4cd7-9618-40b21cfd0870	1	{"license": {"$ref": "https://dx.zenodo.org/licenses/cc-by"}, "owners": [2], "doi": "10.5072/zenodo.2", "_buckets": {"record": "03b911fc-dc94-4f15-ac2c-e33eea2f7d35", "deposit": "f216ce58-f597-4949-8ccf-ca65d139aaca"}, "description": "<p>Ejemplo dataset en formato csv</p>", "language": "spa", "title": "Ejemplo dataset csv", "_oai": {"id": "oai:zenodo.org:2"}, "_files": [{"checksum": "md5:5922d896a8bbc63d35dc24f18e0932a2", "bucket": "03b911fc-dc94-4f15-ac2c-e33eea2f7d35", "version_id": "ded55142-bbb4-4498-ae74-3dadd0b6bee9", "file_id": "58bb136b-d6fb-44a8-8e4e-7ced59e74530", "key": "clasificadores_17102018_2.csv", "type": "csv", "size": 6545485}], "conceptdoi": "10.5072/zenodo.1", "conceptrecid": "1", "version": "1", "recid": 2, "_deposit": {"status": "published", "owners": [2], "pid": {"revision_id": 0, "type": "recid", "value": "2"}, "id": "2", "created_by": 2}, "keywords": ["dataset", "csv"], "publication_date": "2019-08-08", "$schema": "https://zenodo.org/schemas/records/record-v1.0.0.json", "creators": [{"affiliation": "DGRU-UNAM", "name": "Jorge Toledano"}], "access_right": "open", "resource_type": {"type": "dataset"}}
2019-08-08 19:35:05.528	2019-08-08 19:35:05.528006	b07e9e19-fe42-4cd7-9618-40b21cfd0870	3	{"files": [{"file_uuid": "58bb136b-d6fb-44a8-8e4e-7ced59e74530", "sipfilepath": "clasificadores_17102018_2.csv", "filepath": "data/files/58bb136b-d6fb-44a8-8e4e-7ced59e74530-clasificadores_17102018_2.csv", "checksum": "md5:5922d896a8bbc63d35dc24f18e0932a2", "fullpath": "/usr/local/var/instance/archive/2/r/2019-08-08T19:35:05.487618+00:00/data/files/58bb136b-d6fb-44a8-8e4e-7ced59e74530-clasificadores_17102018_2.csv", "size": 6545485, "filename": "58bb136b-d6fb-44a8-8e4e-7ced59e74530-clasificadores_17102018_2.csv"}, {"checksum": "md5:da2f682c724de8b5ef2fb9950f5f8eb9", "metadata_id": 1, "filepath": "data/metadata/record-json.json", "fullpath": "/usr/local/var/instance/archive/2/r/2019-08-08T19:35:05.487618+00:00/data/metadata/record-json.json", "size": 1141}, {"content": "58bb136b-d6fb-44a8-8e4e-7ced59e74530-clasificadores_17102018_2.csv clasificadores_17102018_2.csv", "checksum": "md5:6c4d8cb313fcb7a053219e9ad6528e1f", "fullpath": "/usr/local/var/instance/archive/2/r/2019-08-08T19:35:05.487618+00:00/data/filenames.txt", "filepath": "data/filenames.txt", "size": 96}, {"content": "Source-Organization: European Organization for Nuclear Research\\nOrganization-Address: CERN, CH-1211 Geneva 23, Switzerland\\nBagging-Date: 2019-08-08 19:35:05.521429\\nPayload-Oxum: 6546722.3\\nExternal-Identifier: b07e9e19-fe42-4cd7-9618-40b21cfd0870/SIPBagIt-v1.0.0\\nExternal-Description: BagIt archive of Zenodo record. Description of the payload structure and data interpretation available at https://doi.org/10.5281/zenodo.841781", "checksum": "md5:adf5c800e995b20d4fee3185e2c316b7", "fullpath": "/usr/local/var/instance/archive/2/r/2019-08-08T19:35:05.487618+00:00/bag-info.txt", "filepath": "bag-info.txt", "size": 427}, {"content": "5922d896a8bbc63d35dc24f18e0932a2 data/files/58bb136b-d6fb-44a8-8e4e-7ced59e74530-clasificadores_17102018_2.csv\\nda2f682c724de8b5ef2fb9950f5f8eb9 data/metadata/record-json.json\\n6c4d8cb313fcb7a053219e9ad6528e1f data/filenames.txt", "checksum": "md5:e1a6a1233ef60412d3f06ec9a351c136", "fullpath": "/usr/local/var/instance/archive/2/r/2019-08-08T19:35:05.487618+00:00/manifest-md5.txt", "filepath": "manifest-md5.txt", "size": 226}, {"content": "BagIt-Version: 0.97\\nTag-File-Character-Encoding: UTF-8", "checksum": "md5:e2a83605006c61c8e9056cf9ba2b87ba", "fullpath": "/usr/local/var/instance/archive/2/r/2019-08-08T19:35:05.487618+00:00/bagit.txt", "filepath": "bagit.txt", "size": 54}, {"content": "adf5c800e995b20d4fee3185e2c316b7 bag-info.txt\\ne1a6a1233ef60412d3f06ec9a351c136 manifest-md5.txt\\ne2a83605006c61c8e9056cf9ba2b87ba bagit.txt", "checksum": "md5:0899f75710a8dead852bca1a5daac897", "fullpath": "/usr/local/var/instance/archive/2/r/2019-08-08T19:35:05.487618+00:00/tagmanifest-md5.txt", "filepath": "tagmanifest-md5.txt", "size": 138}], "$schema": "https://zenodo.org/schemas/sipstore/bagit-v1.0.0.json"}
2019-08-08 19:59:19.900916	2019-08-08 19:59:19.900923	979e80c8-c023-45c1-a7a7-64d56ef32baa	1	{"license": {"$ref": "https://dx.zenodo.org/licenses/cc-by"}, "owners": [2], "doi": "10.5072/zenodo.2", "_buckets": {"record": "03b911fc-dc94-4f15-ac2c-e33eea2f7d35", "deposit": "f216ce58-f597-4949-8ccf-ca65d139aaca"}, "description": "<p>Ejemplo dataset en formato csv</p>", "language": "spa", "title": "Ejemplo dataset csv", "_oai": {"id": "oai:zenodo.org:2"}, "_files": [{"checksum": "md5:5922d896a8bbc63d35dc24f18e0932a2", "bucket": "03b911fc-dc94-4f15-ac2c-e33eea2f7d35", "version_id": "ded55142-bbb4-4498-ae74-3dadd0b6bee9", "file_id": "58bb136b-d6fb-44a8-8e4e-7ced59e74530", "key": "clasificadores_17102018_2.csv", "type": "csv", "size": 6545485}], "conceptdoi": "10.5072/zenodo.1", "conceptrecid": "1", "version": "1", "recid": 2, "_deposit": {"status": "published", "owners": [2], "pid": {"revision_id": 1, "type": "recid", "value": "2"}, "id": "2", "created_by": 2}, "keywords": ["dataset", "csv"], "publication_date": "2019-08-08", "$schema": "https://zenodo.org/schemas/records/record-v1.0.0.json", "creators": [{"affiliation": "DGRU-UNAM", "name": "Jorge Toledano"}], "access_right": "open", "resource_type": {"type": "dataset"}}
2019-08-08 19:59:19.914843	2019-08-08 19:59:19.914851	979e80c8-c023-45c1-a7a7-64d56ef32baa	3	{"files": [{"sipfilepath": "clasificadores_17102018_2.csv", "filepath": "data/files/58bb136b-d6fb-44a8-8e4e-7ced59e74530-clasificadores_17102018_2.csv", "checksum": "md5:5922d896a8bbc63d35dc24f18e0932a2", "filename": "58bb136b-d6fb-44a8-8e4e-7ced59e74530-clasificadores_17102018_2.csv", "file_uuid": "58bb136b-d6fb-44a8-8e4e-7ced59e74530", "fetched": true, "fullpath": "/usr/local/var/instance/archive/2/r/2019-08-08T19:35:05.487618+00:00/data/files/58bb136b-d6fb-44a8-8e4e-7ced59e74530-clasificadores_17102018_2.csv", "size": 6545485}, {"checksum": "md5:929b20c39156f70e2fec1fad86531904", "metadata_id": 1, "filepath": "data/metadata/record-json.json", "fullpath": "/usr/local/var/instance/archive/2/r/2019-08-08T19:59:19.897793+00:00/data/metadata/record-json.json", "size": 1141}, {"content": "58bb136b-d6fb-44a8-8e4e-7ced59e74530-clasificadores_17102018_2.csv clasificadores_17102018_2.csv", "checksum": "md5:6c4d8cb313fcb7a053219e9ad6528e1f", "fullpath": "/usr/local/var/instance/archive/2/r/2019-08-08T19:59:19.897793+00:00/data/filenames.txt", "filepath": "data/filenames.txt", "size": 96}, {"content": "/usr/local/var/instance/archive/2/r/2019-08-08T19:35:05.487618+00:00/data/files/58bb136b-d6fb-44a8-8e4e-7ced59e74530-clasificadores_17102018_2.csv 6545485 data/files/58bb136b-d6fb-44a8-8e4e-7ced59e74530-clasificadores_17102018_2.csv", "checksum": "md5:ead56cc614c682d6098d3df9fe5b18bb", "fullpath": "/usr/local/var/instance/archive/2/r/2019-08-08T19:59:19.897793+00:00/fetch.txt", "filepath": "fetch.txt", "size": 232}, {"content": "Source-Organization: European Organization for Nuclear Research\\nOrganization-Address: CERN, CH-1211 Geneva 23, Switzerland\\nBagging-Date: 2019-08-08 19:59:19.909075\\nPayload-Oxum: 6546722.3\\nExternal-Identifier: 979e80c8-c023-45c1-a7a7-64d56ef32baa/SIPBagIt-v1.0.0\\nExternal-Description: BagIt archive of Zenodo record. Description of the payload structure and data interpretation available at https://doi.org/10.5281/zenodo.841781", "checksum": "md5:1d02e85b0efeb3e907ec726b940c8d8f", "fullpath": "/usr/local/var/instance/archive/2/r/2019-08-08T19:59:19.897793+00:00/bag-info.txt", "filepath": "bag-info.txt", "size": 427}, {"content": "5922d896a8bbc63d35dc24f18e0932a2 data/files/58bb136b-d6fb-44a8-8e4e-7ced59e74530-clasificadores_17102018_2.csv\\n929b20c39156f70e2fec1fad86531904 data/metadata/record-json.json\\n6c4d8cb313fcb7a053219e9ad6528e1f data/filenames.txt", "checksum": "md5:89058b9e241b11902fd5b58837db689d", "fullpath": "/usr/local/var/instance/archive/2/r/2019-08-08T19:59:19.897793+00:00/manifest-md5.txt", "filepath": "manifest-md5.txt", "size": 226}, {"content": "BagIt-Version: 0.97\\nTag-File-Character-Encoding: UTF-8", "checksum": "md5:e2a83605006c61c8e9056cf9ba2b87ba", "fullpath": "/usr/local/var/instance/archive/2/r/2019-08-08T19:59:19.897793+00:00/bagit.txt", "filepath": "bagit.txt", "size": 54}, {"content": "ead56cc614c682d6098d3df9fe5b18bb fetch.txt\\n1d02e85b0efeb3e907ec726b940c8d8f bag-info.txt\\n89058b9e241b11902fd5b58837db689d manifest-md5.txt\\ne2a83605006c61c8e9056cf9ba2b87ba bagit.txt", "checksum": "md5:a94fe03f9b154bfce5c241307b73d74d", "fullpath": "/usr/local/var/instance/archive/2/r/2019-08-08T19:59:19.897793+00:00/tagmanifest-md5.txt", "filepath": "tagmanifest-md5.txt", "size": 181}], "$schema": "https://zenodo.org/schemas/sipstore/bagit-v1.0.0.json"}
\.


--
-- Data for Name: sipstore_sipmetadatatype; Type: TABLE DATA; Schema: public; Owner: zenodo
--

COPY public.sipstore_sipmetadatatype (id, title, name, format, schema) FROM stdin;
1	Zenodo Record JSON v1.0.0	json	json	https://zenodo.org/schemas/records/record-v1.0.0.json
2	Zenodo Record MARC21 XML	marcxml	xml	https://www.loc.gov/standards/marcxml/schema/MARC21slim.xsd
3	BagIt Archiver metadata	bagit	json	https://zenodo.org/schemas/sipstore/bagit-v1.0.0.json
\.


--
-- Data for Name: transaction; Type: TABLE DATA; Schema: public; Owner: zenodo
--

COPY public.transaction (issued_at, id, remote_addr, user_id) FROM stdin;
2019-08-08 19:18:47.060568	1	\N	\N
2019-08-08 19:19:00.707249	2	\N	\N
2019-08-08 19:19:00.744064	3	\N	\N
2019-08-08 19:19:00.779681	4	\N	\N
2019-08-08 19:19:00.802857	5	\N	\N
2019-08-08 19:19:00.827661	6	\N	\N
2019-08-08 19:19:00.852477	7	\N	\N
2019-08-08 19:19:00.877576	8	\N	\N
2019-08-08 19:19:00.901992	9	\N	\N
2019-08-08 19:19:00.928475	10	\N	\N
2019-08-08 19:19:00.952887	11	\N	\N
2019-08-08 19:19:00.978803	12	\N	\N
2019-08-08 19:19:01.002468	13	\N	\N
2019-08-08 19:19:01.026828	14	\N	\N
2019-08-08 19:19:01.052899	15	\N	\N
2019-08-08 19:19:01.077138	16	\N	\N
2019-08-08 19:19:01.102602	17	\N	\N
2019-08-08 19:19:01.128618	18	\N	\N
2019-08-08 19:19:01.152698	19	\N	\N
2019-08-08 19:19:12.687324	20	\N	\N
2019-08-08 19:19:12.727719	21	\N	\N
2019-08-08 19:31:48.380951	22	172.18.0.12	2
2019-08-08 19:32:56.486772	23	172.18.0.12	2
2019-08-08 19:34:13.986088	24	172.18.0.12	2
2019-08-08 19:35:05.178898	25	172.18.0.12	2
2019-08-08 19:58:56.939704	26	172.18.0.12	2
2019-08-08 19:59:19.764397	27	172.18.0.12	2
2019-08-08 20:08:14.432893	28	172.18.0.12	2
\.


--
-- Data for Name: userprofiles_userprofile; Type: TABLE DATA; Schema: public; Owner: zenodo
--

COPY public.userprofiles_userprofile (user_id, username, displayname, full_name) FROM stdin;
2	tole	Tole	
\.


--
-- Data for Name: webhooks_events; Type: TABLE DATA; Schema: public; Owner: zenodo
--

COPY public.webhooks_events (created, updated, id, receiver_id, user_id, payload, payload_headers, response, response_headers, response_code) FROM stdin;
\.


--
-- Name: access_actionsroles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zenodo
--

SELECT pg_catalog.setval('public.access_actionsroles_id_seq', 1, false);


--
-- Name: access_actionssystemroles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zenodo
--

SELECT pg_catalog.setval('public.access_actionssystemroles_id_seq', 1, false);


--
-- Name: access_actionsusers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zenodo
--

SELECT pg_catalog.setval('public.access_actionsusers_id_seq', 4, true);


--
-- Name: accessrequests_link_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zenodo
--

SELECT pg_catalog.setval('public.accessrequests_link_id_seq', 1, false);


--
-- Name: accessrequests_request_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zenodo
--

SELECT pg_catalog.setval('public.accessrequests_request_id_seq', 1, false);


--
-- Name: accounts_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zenodo
--

SELECT pg_catalog.setval('public.accounts_role_id_seq', 1, false);


--
-- Name: accounts_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zenodo
--

SELECT pg_catalog.setval('public.accounts_user_id_seq', 2, true);


--
-- Name: communities_featured_community_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zenodo
--

SELECT pg_catalog.setval('public.communities_featured_community_id_seq', 1, false);


--
-- Name: files_location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zenodo
--

SELECT pg_catalog.setval('public.files_location_id_seq', 2, true);


--
-- Name: oaiserver_set_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zenodo
--

SELECT pg_catalog.setval('public.oaiserver_set_id_seq', 4, true);


--
-- Name: oauth2server_token_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zenodo
--

SELECT pg_catalog.setval('public.oauth2server_token_id_seq', 1, false);


--
-- Name: oauthclient_remoteaccount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zenodo
--

SELECT pg_catalog.setval('public.oauthclient_remoteaccount_id_seq', 1, false);


--
-- Name: pidstore_pid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zenodo
--

SELECT pg_catalog.setval('public.pidstore_pid_id_seq', 130, true);


--
-- Name: pidstore_recid_recid_seq; Type: SEQUENCE SET; Schema: public; Owner: zenodo
--

SELECT pg_catalog.setval('public.pidstore_recid_recid_seq', 2, true);


--
-- Name: sipstore_sipmetadatatype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zenodo
--

SELECT pg_catalog.setval('public.sipstore_sipmetadatatype_id_seq', 3, true);


--
-- Name: transaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zenodo
--

SELECT pg_catalog.setval('public.transaction_id_seq', 28, true);


--
-- Name: access_actionsroles access_actionsroles_unique; Type: CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.access_actionsroles
    ADD CONSTRAINT access_actionsroles_unique UNIQUE (action, exclude, argument, role_id);


--
-- Name: access_actionssystemroles access_actionssystemroles_unique; Type: CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.access_actionssystemroles
    ADD CONSTRAINT access_actionssystemroles_unique UNIQUE (action, exclude, argument, role_name);


--
-- Name: access_actionsusers access_actionsusers_unique; Type: CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.access_actionsusers
    ADD CONSTRAINT access_actionsusers_unique UNIQUE (action, exclude, argument, user_id);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: access_actionsroles pk_access_actionsroles; Type: CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.access_actionsroles
    ADD CONSTRAINT pk_access_actionsroles PRIMARY KEY (id);


--
-- Name: access_actionssystemroles pk_access_actionssystemroles; Type: CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.access_actionssystemroles
    ADD CONSTRAINT pk_access_actionssystemroles PRIMARY KEY (id);


--
-- Name: access_actionsusers pk_access_actionsusers; Type: CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.access_actionsusers
    ADD CONSTRAINT pk_access_actionsusers PRIMARY KEY (id);


--
-- Name: accessrequests_link pk_accessrequests_link; Type: CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.accessrequests_link
    ADD CONSTRAINT pk_accessrequests_link PRIMARY KEY (id);


--
-- Name: accessrequests_request pk_accessrequests_request; Type: CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.accessrequests_request
    ADD CONSTRAINT pk_accessrequests_request PRIMARY KEY (id);


--
-- Name: accounts_role pk_accounts_role; Type: CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.accounts_role
    ADD CONSTRAINT pk_accounts_role PRIMARY KEY (id);


--
-- Name: accounts_user pk_accounts_user; Type: CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.accounts_user
    ADD CONSTRAINT pk_accounts_user PRIMARY KEY (id);


--
-- Name: accounts_user_session_activity pk_accounts_user_session_activity; Type: CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.accounts_user_session_activity
    ADD CONSTRAINT pk_accounts_user_session_activity PRIMARY KEY (sid_s);


--
-- Name: communities_community pk_communities_community; Type: CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.communities_community
    ADD CONSTRAINT pk_communities_community PRIMARY KEY (id);


--
-- Name: communities_community_record pk_communities_community_record; Type: CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.communities_community_record
    ADD CONSTRAINT pk_communities_community_record PRIMARY KEY (id_community, id_record);


--
-- Name: communities_featured_community pk_communities_featured_community; Type: CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.communities_featured_community
    ADD CONSTRAINT pk_communities_featured_community PRIMARY KEY (id);


--
-- Name: files_bucket pk_files_bucket; Type: CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.files_bucket
    ADD CONSTRAINT pk_files_bucket PRIMARY KEY (id);


--
-- Name: files_buckettags pk_files_buckettags; Type: CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.files_buckettags
    ADD CONSTRAINT pk_files_buckettags PRIMARY KEY (bucket_id, key);


--
-- Name: files_files pk_files_files; Type: CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.files_files
    ADD CONSTRAINT pk_files_files PRIMARY KEY (id);


--
-- Name: files_location pk_files_location; Type: CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.files_location
    ADD CONSTRAINT pk_files_location PRIMARY KEY (id);


--
-- Name: files_multipartobject pk_files_multipartobject; Type: CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.files_multipartobject
    ADD CONSTRAINT pk_files_multipartobject PRIMARY KEY (upload_id);


--
-- Name: files_multipartobject_part pk_files_multipartobject_part; Type: CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.files_multipartobject_part
    ADD CONSTRAINT pk_files_multipartobject_part PRIMARY KEY (upload_id, part_number);


--
-- Name: files_object pk_files_object; Type: CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.files_object
    ADD CONSTRAINT pk_files_object PRIMARY KEY (bucket_id, key, version_id);


--
-- Name: github_releases pk_github_releases; Type: CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.github_releases
    ADD CONSTRAINT pk_github_releases PRIMARY KEY (id);


--
-- Name: github_repositories pk_github_repositories; Type: CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.github_repositories
    ADD CONSTRAINT pk_github_repositories PRIMARY KEY (id);


--
-- Name: oaiserver_set pk_oaiserver_set; Type: CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.oaiserver_set
    ADD CONSTRAINT pk_oaiserver_set PRIMARY KEY (id);


--
-- Name: oauth2server_client pk_oauth2server_client; Type: CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.oauth2server_client
    ADD CONSTRAINT pk_oauth2server_client PRIMARY KEY (client_id);


--
-- Name: oauth2server_token pk_oauth2server_token; Type: CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.oauth2server_token
    ADD CONSTRAINT pk_oauth2server_token PRIMARY KEY (id);


--
-- Name: oauthclient_remoteaccount pk_oauthclient_remoteaccount; Type: CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.oauthclient_remoteaccount
    ADD CONSTRAINT pk_oauthclient_remoteaccount PRIMARY KEY (id);


--
-- Name: oauthclient_remotetoken pk_oauthclient_remotetoken; Type: CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.oauthclient_remotetoken
    ADD CONSTRAINT pk_oauthclient_remotetoken PRIMARY KEY (id_remote_account, token_type);


--
-- Name: oauthclient_useridentity pk_oauthclient_useridentity; Type: CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.oauthclient_useridentity
    ADD CONSTRAINT pk_oauthclient_useridentity PRIMARY KEY (id, method);


--
-- Name: pidrelations_pidrelation pk_pidrelations_pidrelation; Type: CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.pidrelations_pidrelation
    ADD CONSTRAINT pk_pidrelations_pidrelation PRIMARY KEY (parent_id, child_id);


--
-- Name: pidstore_pid pk_pidstore_pid; Type: CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.pidstore_pid
    ADD CONSTRAINT pk_pidstore_pid PRIMARY KEY (id);


--
-- Name: pidstore_recid pk_pidstore_recid; Type: CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.pidstore_recid
    ADD CONSTRAINT pk_pidstore_recid PRIMARY KEY (recid);


--
-- Name: pidstore_redirect pk_pidstore_redirect; Type: CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.pidstore_redirect
    ADD CONSTRAINT pk_pidstore_redirect PRIMARY KEY (id);


--
-- Name: records_buckets pk_records_buckets; Type: CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.records_buckets
    ADD CONSTRAINT pk_records_buckets PRIMARY KEY (record_id, bucket_id);


--
-- Name: records_metadata pk_records_metadata; Type: CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.records_metadata
    ADD CONSTRAINT pk_records_metadata PRIMARY KEY (id);


--
-- Name: records_metadata_version pk_records_metadata_version; Type: CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.records_metadata_version
    ADD CONSTRAINT pk_records_metadata_version PRIMARY KEY (id, transaction_id);


--
-- Name: sipstore_recordsip pk_sipstore_recordsip; Type: CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.sipstore_recordsip
    ADD CONSTRAINT pk_sipstore_recordsip PRIMARY KEY (sip_id, pid_id);


--
-- Name: sipstore_sip pk_sipstore_sip; Type: CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.sipstore_sip
    ADD CONSTRAINT pk_sipstore_sip PRIMARY KEY (id);


--
-- Name: sipstore_sipfile pk_sipstore_sipfile; Type: CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.sipstore_sipfile
    ADD CONSTRAINT pk_sipstore_sipfile PRIMARY KEY (sip_id, filepath);


--
-- Name: sipstore_sipmetadata pk_sipstore_sipmetadata; Type: CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.sipstore_sipmetadata
    ADD CONSTRAINT pk_sipstore_sipmetadata PRIMARY KEY (sip_id, type_id);


--
-- Name: sipstore_sipmetadatatype pk_sipstore_sipmetadatatype; Type: CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.sipstore_sipmetadatatype
    ADD CONSTRAINT pk_sipstore_sipmetadatatype PRIMARY KEY (id);


--
-- Name: transaction pk_transaction; Type: CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT pk_transaction PRIMARY KEY (id);


--
-- Name: userprofiles_userprofile pk_userprofiles_userprofile; Type: CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.userprofiles_userprofile
    ADD CONSTRAINT pk_userprofiles_userprofile PRIMARY KEY (user_id);


--
-- Name: webhooks_events pk_webhooks_events; Type: CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.webhooks_events
    ADD CONSTRAINT pk_webhooks_events PRIMARY KEY (id);


--
-- Name: files_multipartobject uix_item; Type: CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.files_multipartobject
    ADD CONSTRAINT uix_item UNIQUE (upload_id, bucket_id, key);


--
-- Name: accounts_role uq_accounts_role_name; Type: CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.accounts_role
    ADD CONSTRAINT uq_accounts_role_name UNIQUE (name);


--
-- Name: accounts_user uq_accounts_user_email; Type: CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.accounts_user
    ADD CONSTRAINT uq_accounts_user_email UNIQUE (email);


--
-- Name: files_files uq_files_files_uri; Type: CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.files_files
    ADD CONSTRAINT uq_files_files_uri UNIQUE (uri);


--
-- Name: files_location uq_files_location_name; Type: CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.files_location
    ADD CONSTRAINT uq_files_location_name UNIQUE (name);


--
-- Name: github_releases uq_github_releases_release_id; Type: CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.github_releases
    ADD CONSTRAINT uq_github_releases_release_id UNIQUE (release_id);


--
-- Name: oaiserver_set uq_oaiserver_set_spec; Type: CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.oaiserver_set
    ADD CONSTRAINT uq_oaiserver_set_spec UNIQUE (spec);


--
-- Name: oauthclient_remoteaccount uq_oauthclient_remoteaccount_user_id; Type: CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.oauthclient_remoteaccount
    ADD CONSTRAINT uq_oauthclient_remoteaccount_user_id UNIQUE (user_id, client_id);


--
-- Name: sipstore_sipmetadatatype uq_sipstore_sipmetadatatype_name; Type: CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.sipstore_sipmetadatatype
    ADD CONSTRAINT uq_sipstore_sipmetadatatype_name UNIQUE (name);


--
-- Name: sipstore_sipmetadatatype uq_sipstore_sipmetadatatype_schema; Type: CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.sipstore_sipmetadatatype
    ADD CONSTRAINT uq_sipstore_sipmetadatatype_schema UNIQUE (schema);


--
-- Name: userprofiles_userprofile uq_userprofiles_userprofile_username; Type: CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.userprofiles_userprofile
    ADD CONSTRAINT uq_userprofiles_userprofile_username UNIQUE (username);


--
-- Name: idx_object; Type: INDEX; Schema: public; Owner: zenodo
--

CREATE INDEX idx_object ON public.pidstore_pid USING btree (object_type, object_uuid);


--
-- Name: idx_status; Type: INDEX; Schema: public; Owner: zenodo
--

CREATE INDEX idx_status ON public.pidstore_pid USING btree (status);


--
-- Name: ix_access_actionsroles_action; Type: INDEX; Schema: public; Owner: zenodo
--

CREATE INDEX ix_access_actionsroles_action ON public.access_actionsroles USING btree (action);


--
-- Name: ix_access_actionsroles_argument; Type: INDEX; Schema: public; Owner: zenodo
--

CREATE INDEX ix_access_actionsroles_argument ON public.access_actionsroles USING btree (argument);


--
-- Name: ix_access_actionsroles_role_id; Type: INDEX; Schema: public; Owner: zenodo
--

CREATE INDEX ix_access_actionsroles_role_id ON public.access_actionsroles USING btree (role_id);


--
-- Name: ix_access_actionssystemroles_action; Type: INDEX; Schema: public; Owner: zenodo
--

CREATE INDEX ix_access_actionssystemroles_action ON public.access_actionssystemroles USING btree (action);


--
-- Name: ix_access_actionssystemroles_argument; Type: INDEX; Schema: public; Owner: zenodo
--

CREATE INDEX ix_access_actionssystemroles_argument ON public.access_actionssystemroles USING btree (argument);


--
-- Name: ix_access_actionssystemroles_role_name; Type: INDEX; Schema: public; Owner: zenodo
--

CREATE INDEX ix_access_actionssystemroles_role_name ON public.access_actionssystemroles USING btree (role_name);


--
-- Name: ix_access_actionsusers_action; Type: INDEX; Schema: public; Owner: zenodo
--

CREATE INDEX ix_access_actionsusers_action ON public.access_actionsusers USING btree (action);


--
-- Name: ix_access_actionsusers_argument; Type: INDEX; Schema: public; Owner: zenodo
--

CREATE INDEX ix_access_actionsusers_argument ON public.access_actionsusers USING btree (argument);


--
-- Name: ix_access_actionsusers_user_id; Type: INDEX; Schema: public; Owner: zenodo
--

CREATE INDEX ix_access_actionsusers_user_id ON public.access_actionsusers USING btree (user_id);


--
-- Name: ix_accessrequests_link_created; Type: INDEX; Schema: public; Owner: zenodo
--

CREATE INDEX ix_accessrequests_link_created ON public.accessrequests_link USING btree (created);


--
-- Name: ix_accessrequests_link_revoked_at; Type: INDEX; Schema: public; Owner: zenodo
--

CREATE INDEX ix_accessrequests_link_revoked_at ON public.accessrequests_link USING btree (revoked_at);


--
-- Name: ix_accessrequests_request_created; Type: INDEX; Schema: public; Owner: zenodo
--

CREATE INDEX ix_accessrequests_request_created ON public.accessrequests_request USING btree (created);


--
-- Name: ix_accessrequests_request_recid; Type: INDEX; Schema: public; Owner: zenodo
--

CREATE INDEX ix_accessrequests_request_recid ON public.accessrequests_request USING btree (recid);


--
-- Name: ix_accessrequests_request_status; Type: INDEX; Schema: public; Owner: zenodo
--

CREATE INDEX ix_accessrequests_request_status ON public.accessrequests_request USING btree (status);


--
-- Name: ix_files_object__mimetype; Type: INDEX; Schema: public; Owner: zenodo
--

CREATE INDEX ix_files_object__mimetype ON public.files_object USING btree (_mimetype);


--
-- Name: ix_github_repositories_github_id; Type: INDEX; Schema: public; Owner: zenodo
--

CREATE UNIQUE INDEX ix_github_repositories_github_id ON public.github_repositories USING btree (github_id);


--
-- Name: ix_github_repositories_name; Type: INDEX; Schema: public; Owner: zenodo
--

CREATE UNIQUE INDEX ix_github_repositories_name ON public.github_repositories USING btree (name);


--
-- Name: ix_oaiserver_set_name; Type: INDEX; Schema: public; Owner: zenodo
--

CREATE INDEX ix_oaiserver_set_name ON public.oaiserver_set USING btree (name);


--
-- Name: ix_oauth2server_client_client_secret; Type: INDEX; Schema: public; Owner: zenodo
--

CREATE UNIQUE INDEX ix_oauth2server_client_client_secret ON public.oauth2server_client USING btree (client_secret);


--
-- Name: ix_oauth2server_client_user_id; Type: INDEX; Schema: public; Owner: zenodo
--

CREATE INDEX ix_oauth2server_client_user_id ON public.oauth2server_client USING btree (user_id);


--
-- Name: ix_oauth2server_token_access_token; Type: INDEX; Schema: public; Owner: zenodo
--

CREATE UNIQUE INDEX ix_oauth2server_token_access_token ON public.oauth2server_token USING btree (access_token);


--
-- Name: ix_oauth2server_token_client_id; Type: INDEX; Schema: public; Owner: zenodo
--

CREATE INDEX ix_oauth2server_token_client_id ON public.oauth2server_token USING btree (client_id);


--
-- Name: ix_oauth2server_token_refresh_token; Type: INDEX; Schema: public; Owner: zenodo
--

CREATE UNIQUE INDEX ix_oauth2server_token_refresh_token ON public.oauth2server_token USING btree (refresh_token);


--
-- Name: ix_oauth2server_token_user_id; Type: INDEX; Schema: public; Owner: zenodo
--

CREATE INDEX ix_oauth2server_token_user_id ON public.oauth2server_token USING btree (user_id);


--
-- Name: ix_records_metadata_version_end_transaction_id; Type: INDEX; Schema: public; Owner: zenodo
--

CREATE INDEX ix_records_metadata_version_end_transaction_id ON public.records_metadata_version USING btree (end_transaction_id);


--
-- Name: ix_records_metadata_version_operation_type; Type: INDEX; Schema: public; Owner: zenodo
--

CREATE INDEX ix_records_metadata_version_operation_type ON public.records_metadata_version USING btree (operation_type);


--
-- Name: ix_records_metadata_version_transaction_id; Type: INDEX; Schema: public; Owner: zenodo
--

CREATE INDEX ix_records_metadata_version_transaction_id ON public.records_metadata_version USING btree (transaction_id);


--
-- Name: ix_transaction_user_id; Type: INDEX; Schema: public; Owner: zenodo
--

CREATE INDEX ix_transaction_user_id ON public.transaction USING btree (user_id);


--
-- Name: ix_webhooks_events_receiver_id; Type: INDEX; Schema: public; Owner: zenodo
--

CREATE INDEX ix_webhooks_events_receiver_id ON public.webhooks_events USING btree (receiver_id);


--
-- Name: uidx_type_pid; Type: INDEX; Schema: public; Owner: zenodo
--

CREATE UNIQUE INDEX uidx_type_pid ON public.pidstore_pid USING btree (pid_type, pid_value);


--
-- Name: useridentity_id_user_method; Type: INDEX; Schema: public; Owner: zenodo
--

CREATE UNIQUE INDEX useridentity_id_user_method ON public.oauthclient_useridentity USING btree (id_user, method);


--
-- Name: access_actionsroles fk_access_actionsroles_role_id_accounts_role; Type: FK CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.access_actionsroles
    ADD CONSTRAINT fk_access_actionsroles_role_id_accounts_role FOREIGN KEY (role_id) REFERENCES public.accounts_role(id) ON DELETE CASCADE;


--
-- Name: access_actionsusers fk_access_actionsusers_user_id_accounts_user; Type: FK CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.access_actionsusers
    ADD CONSTRAINT fk_access_actionsusers_user_id_accounts_user FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) ON DELETE CASCADE;


--
-- Name: accessrequests_link fk_accessrequests_link_owner_user_id_accounts_user; Type: FK CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.accessrequests_link
    ADD CONSTRAINT fk_accessrequests_link_owner_user_id_accounts_user FOREIGN KEY (owner_user_id) REFERENCES public.accounts_user(id);


--
-- Name: accessrequests_request fk_accessrequests_request_link_id_accessrequests_link; Type: FK CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.accessrequests_request
    ADD CONSTRAINT fk_accessrequests_request_link_id_accessrequests_link FOREIGN KEY (link_id) REFERENCES public.accessrequests_link(id);


--
-- Name: accessrequests_request fk_accessrequests_request_receiver_user_id_accounts_user; Type: FK CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.accessrequests_request
    ADD CONSTRAINT fk_accessrequests_request_receiver_user_id_accounts_user FOREIGN KEY (receiver_user_id) REFERENCES public.accounts_user(id);


--
-- Name: accessrequests_request fk_accessrequests_request_sender_user_id_accounts_user; Type: FK CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.accessrequests_request
    ADD CONSTRAINT fk_accessrequests_request_sender_user_id_accounts_user FOREIGN KEY (sender_user_id) REFERENCES public.accounts_user(id);


--
-- Name: accounts_user_session_activity fk_accounts_session_activity_user_id; Type: FK CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.accounts_user_session_activity
    ADD CONSTRAINT fk_accounts_session_activity_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id);


--
-- Name: accounts_userrole fk_accounts_userrole_role_id; Type: FK CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.accounts_userrole
    ADD CONSTRAINT fk_accounts_userrole_role_id FOREIGN KEY (role_id) REFERENCES public.accounts_role(id);


--
-- Name: accounts_userrole fk_accounts_userrole_user_id; Type: FK CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.accounts_userrole
    ADD CONSTRAINT fk_accounts_userrole_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id);


--
-- Name: communities_community fk_communities_community_id_user_accounts_user; Type: FK CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.communities_community
    ADD CONSTRAINT fk_communities_community_id_user_accounts_user FOREIGN KEY (id_user) REFERENCES public.accounts_user(id);


--
-- Name: communities_community_record fk_communities_community_record_id_community; Type: FK CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.communities_community_record
    ADD CONSTRAINT fk_communities_community_record_id_community FOREIGN KEY (id_community) REFERENCES public.communities_community(id);


--
-- Name: communities_community_record fk_communities_community_record_id_record_records_metadata; Type: FK CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.communities_community_record
    ADD CONSTRAINT fk_communities_community_record_id_record_records_metadata FOREIGN KEY (id_record) REFERENCES public.records_metadata(id);


--
-- Name: communities_community_record fk_communities_community_record_id_user_accounts_user; Type: FK CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.communities_community_record
    ADD CONSTRAINT fk_communities_community_record_id_user_accounts_user FOREIGN KEY (id_user) REFERENCES public.accounts_user(id);


--
-- Name: communities_featured_community fk_communities_featured_community_id_community; Type: FK CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.communities_featured_community
    ADD CONSTRAINT fk_communities_featured_community_id_community FOREIGN KEY (id_community) REFERENCES public.communities_community(id);


--
-- Name: files_bucket fk_files_bucket_default_location_files_location; Type: FK CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.files_bucket
    ADD CONSTRAINT fk_files_bucket_default_location_files_location FOREIGN KEY (default_location) REFERENCES public.files_location(id) ON DELETE RESTRICT;


--
-- Name: files_buckettags fk_files_buckettags_bucket_id_files_bucket; Type: FK CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.files_buckettags
    ADD CONSTRAINT fk_files_buckettags_bucket_id_files_bucket FOREIGN KEY (bucket_id) REFERENCES public.files_bucket(id) ON DELETE CASCADE;


--
-- Name: files_multipartobject fk_files_multipartobject_bucket_id_files_bucket; Type: FK CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.files_multipartobject
    ADD CONSTRAINT fk_files_multipartobject_bucket_id_files_bucket FOREIGN KEY (bucket_id) REFERENCES public.files_bucket(id) ON DELETE RESTRICT;


--
-- Name: files_multipartobject fk_files_multipartobject_file_id_files_files; Type: FK CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.files_multipartobject
    ADD CONSTRAINT fk_files_multipartobject_file_id_files_files FOREIGN KEY (file_id) REFERENCES public.files_files(id) ON DELETE RESTRICT;


--
-- Name: files_multipartobject_part fk_files_multipartobject_part_upload_id_files_multipartobject; Type: FK CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.files_multipartobject_part
    ADD CONSTRAINT fk_files_multipartobject_part_upload_id_files_multipartobject FOREIGN KEY (upload_id) REFERENCES public.files_multipartobject(upload_id) ON DELETE RESTRICT;


--
-- Name: files_object fk_files_object_bucket_id_files_bucket; Type: FK CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.files_object
    ADD CONSTRAINT fk_files_object_bucket_id_files_bucket FOREIGN KEY (bucket_id) REFERENCES public.files_bucket(id) ON DELETE RESTRICT;


--
-- Name: files_object fk_files_object_file_id_files_files; Type: FK CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.files_object
    ADD CONSTRAINT fk_files_object_file_id_files_files FOREIGN KEY (file_id) REFERENCES public.files_files(id) ON DELETE RESTRICT;


--
-- Name: github_releases fk_github_releases_event_id_webhooks_events; Type: FK CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.github_releases
    ADD CONSTRAINT fk_github_releases_event_id_webhooks_events FOREIGN KEY (event_id) REFERENCES public.webhooks_events(id);


--
-- Name: github_releases fk_github_releases_record_id_records_metadata; Type: FK CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.github_releases
    ADD CONSTRAINT fk_github_releases_record_id_records_metadata FOREIGN KEY (record_id) REFERENCES public.records_metadata(id);


--
-- Name: github_releases fk_github_releases_repository_id_github_repositories; Type: FK CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.github_releases
    ADD CONSTRAINT fk_github_releases_repository_id_github_repositories FOREIGN KEY (repository_id) REFERENCES public.github_repositories(id);


--
-- Name: github_repositories fk_github_repositories_user_id_accounts_user; Type: FK CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.github_repositories
    ADD CONSTRAINT fk_github_repositories_user_id_accounts_user FOREIGN KEY (user_id) REFERENCES public.accounts_user(id);


--
-- Name: oauth2server_client fk_oauth2server_client_user_id_accounts_user; Type: FK CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.oauth2server_client
    ADD CONSTRAINT fk_oauth2server_client_user_id_accounts_user FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) ON DELETE CASCADE;


--
-- Name: oauth2server_token fk_oauth2server_token_client_id_oauth2server_client; Type: FK CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.oauth2server_token
    ADD CONSTRAINT fk_oauth2server_token_client_id_oauth2server_client FOREIGN KEY (client_id) REFERENCES public.oauth2server_client(client_id) ON DELETE CASCADE;


--
-- Name: oauth2server_token fk_oauth2server_token_user_id_accounts_user; Type: FK CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.oauth2server_token
    ADD CONSTRAINT fk_oauth2server_token_user_id_accounts_user FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) ON DELETE CASCADE;


--
-- Name: oauthclient_remotetoken fk_oauthclient_remote_token_remote_account; Type: FK CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.oauthclient_remotetoken
    ADD CONSTRAINT fk_oauthclient_remote_token_remote_account FOREIGN KEY (id_remote_account) REFERENCES public.oauthclient_remoteaccount(id);


--
-- Name: oauthclient_remoteaccount fk_oauthclient_remoteaccount_user_id_accounts_user; Type: FK CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.oauthclient_remoteaccount
    ADD CONSTRAINT fk_oauthclient_remoteaccount_user_id_accounts_user FOREIGN KEY (user_id) REFERENCES public.accounts_user(id);


--
-- Name: oauthclient_useridentity fk_oauthclient_useridentity_id_user_accounts_user; Type: FK CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.oauthclient_useridentity
    ADD CONSTRAINT fk_oauthclient_useridentity_id_user_accounts_user FOREIGN KEY (id_user) REFERENCES public.accounts_user(id);


--
-- Name: pidrelations_pidrelation fk_pidrelations_pidrelation_child_id_pidstore_pid; Type: FK CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.pidrelations_pidrelation
    ADD CONSTRAINT fk_pidrelations_pidrelation_child_id_pidstore_pid FOREIGN KEY (child_id) REFERENCES public.pidstore_pid(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: pidrelations_pidrelation fk_pidrelations_pidrelation_parent_id_pidstore_pid; Type: FK CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.pidrelations_pidrelation
    ADD CONSTRAINT fk_pidrelations_pidrelation_parent_id_pidstore_pid FOREIGN KEY (parent_id) REFERENCES public.pidstore_pid(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: pidstore_redirect fk_pidstore_redirect_pid_id_pidstore_pid; Type: FK CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.pidstore_redirect
    ADD CONSTRAINT fk_pidstore_redirect_pid_id_pidstore_pid FOREIGN KEY (pid_id) REFERENCES public.pidstore_pid(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: records_buckets fk_records_buckets_bucket_id_files_bucket; Type: FK CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.records_buckets
    ADD CONSTRAINT fk_records_buckets_bucket_id_files_bucket FOREIGN KEY (bucket_id) REFERENCES public.files_bucket(id);


--
-- Name: records_buckets fk_records_buckets_record_id_records_metadata; Type: FK CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.records_buckets
    ADD CONSTRAINT fk_records_buckets_record_id_records_metadata FOREIGN KEY (record_id) REFERENCES public.records_metadata(id);


--
-- Name: sipstore_sipmetadata fk_sipmetadata_sip_id; Type: FK CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.sipstore_sipmetadata
    ADD CONSTRAINT fk_sipmetadata_sip_id FOREIGN KEY (sip_id) REFERENCES public.sipstore_sip(id);


--
-- Name: sipstore_sipmetadata fk_sipmetadatatype_type; Type: FK CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.sipstore_sipmetadata
    ADD CONSTRAINT fk_sipmetadatatype_type FOREIGN KEY (type_id) REFERENCES public.sipstore_sipmetadatatype(id);


--
-- Name: sipstore_recordsip fk_sipstore_recordsip_pid_id; Type: FK CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.sipstore_recordsip
    ADD CONSTRAINT fk_sipstore_recordsip_pid_id FOREIGN KEY (pid_id) REFERENCES public.pidstore_pid(id);


--
-- Name: sipstore_recordsip fk_sipstore_recordsip_sip_id; Type: FK CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.sipstore_recordsip
    ADD CONSTRAINT fk_sipstore_recordsip_sip_id FOREIGN KEY (sip_id) REFERENCES public.sipstore_sip(id);


--
-- Name: sipstore_sip fk_sipstore_sip_user_id; Type: FK CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.sipstore_sip
    ADD CONSTRAINT fk_sipstore_sip_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id);


--
-- Name: sipstore_sipfile fk_sipstore_sipfile_file_id; Type: FK CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.sipstore_sipfile
    ADD CONSTRAINT fk_sipstore_sipfile_file_id FOREIGN KEY (file_id) REFERENCES public.files_files(id) ON DELETE RESTRICT;


--
-- Name: sipstore_sipfile fk_sipstore_sipfile_sip_id; Type: FK CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.sipstore_sipfile
    ADD CONSTRAINT fk_sipstore_sipfile_sip_id FOREIGN KEY (sip_id) REFERENCES public.sipstore_sip(id);


--
-- Name: transaction fk_transaction_user_id_accounts_user; Type: FK CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT fk_transaction_user_id_accounts_user FOREIGN KEY (user_id) REFERENCES public.accounts_user(id);


--
-- Name: userprofiles_userprofile fk_userprofiles_userprofile_user_id_accounts_user; Type: FK CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.userprofiles_userprofile
    ADD CONSTRAINT fk_userprofiles_userprofile_user_id_accounts_user FOREIGN KEY (user_id) REFERENCES public.accounts_user(id);


--
-- Name: webhooks_events fk_webhooks_events_user_id_accounts_user; Type: FK CONSTRAINT; Schema: public; Owner: zenodo
--

ALTER TABLE ONLY public.webhooks_events
    ADD CONSTRAINT fk_webhooks_events_user_id_accounts_user FOREIGN KEY (user_id) REFERENCES public.accounts_user(id);


--
-- PostgreSQL database dump complete
--

