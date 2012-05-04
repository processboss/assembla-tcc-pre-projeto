--
-- PostgreSQL database dump
--

-- Dumped from database version 9.1.3
-- Dumped by pg_dump version 9.1.3
-- Started on 2012-04-20 07:26:19 BRT

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 1981 (class 1262 OID 17116)
-- Name: gcredirect; Type: DATABASE; Schema: -; Owner: gcredirect
--

CREATE DATABASE gcredirect WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'pt_BR.UTF-8' LC_CTYPE = 'pt_BR.UTF-8';


ALTER DATABASE gcredirect OWNER TO gcredirect;

\connect gcredirect

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 173 (class 3079 OID 11684)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 1984 (class 0 OID 0)
-- Dependencies: 173
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 161 (class 1259 OID 17117)
-- Dependencies: 1926 6
-- Name: historico_redirecionamento; Type: TABLE; Schema: public; Owner: gcredirect; Tablespace: 
--

CREATE TABLE historico_redirecionamento (
    id integer NOT NULL,
    id_usuario integer NOT NULL,
    id_sitio integer NOT NULL,
    id_redirecionamento integer NOT NULL,
    acao character varying(150) NOT NULL,
    status smallint NOT NULL,
    url_antiga character varying(150) NOT NULL,
    url_nova character varying(150) NOT NULL,
    data timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.historico_redirecionamento OWNER TO gcredirect;

--
-- TOC entry 1985 (class 0 OID 0)
-- Dependencies: 161
-- Name: TABLE historico_redirecionamento; Type: COMMENT; Schema: public; Owner: gcredirect
--

COMMENT ON TABLE historico_redirecionamento IS 'Todas as operações relacionadas a um redirecionamento são arquivadas.';


--
-- TOC entry 1986 (class 0 OID 0)
-- Dependencies: 161
-- Name: COLUMN historico_redirecionamento.id; Type: COMMENT; Schema: public; Owner: gcredirect
--

COMMENT ON COLUMN historico_redirecionamento.id IS 'Chave primária';


--
-- TOC entry 1987 (class 0 OID 0)
-- Dependencies: 161
-- Name: COLUMN historico_redirecionamento.id_usuario; Type: COMMENT; Schema: public; Owner: gcredirect
--

COMMENT ON COLUMN historico_redirecionamento.id_usuario IS 'Chave estrangeira para usuário';


--
-- TOC entry 1988 (class 0 OID 0)
-- Dependencies: 161
-- Name: COLUMN historico_redirecionamento.id_sitio; Type: COMMENT; Schema: public; Owner: gcredirect
--

COMMENT ON COLUMN historico_redirecionamento.id_sitio IS 'Chave estrangeira para o sítio';


--
-- TOC entry 1989 (class 0 OID 0)
-- Dependencies: 161
-- Name: COLUMN historico_redirecionamento.id_redirecionamento; Type: COMMENT; Schema: public; Owner: gcredirect
--

COMMENT ON COLUMN historico_redirecionamento.id_redirecionamento IS 'Mantem o ID do último redirecionamento';


--
-- TOC entry 1990 (class 0 OID 0)
-- Dependencies: 161
-- Name: COLUMN historico_redirecionamento.acao; Type: COMMENT; Schema: public; Owner: gcredirect
--

COMMENT ON COLUMN historico_redirecionamento.acao IS 'Tipo de ação executada (CRIADO, EXCLUIDO)';


--
-- TOC entry 1991 (class 0 OID 0)
-- Dependencies: 161
-- Name: COLUMN historico_redirecionamento.status; Type: COMMENT; Schema: public; Owner: gcredirect
--

COMMENT ON COLUMN historico_redirecionamento.status IS '301 - permanent - Returns a permanent redirect status (301) indicating that the resource has moved permanently.';


--
-- TOC entry 1992 (class 0 OID 0)
-- Dependencies: 161
-- Name: COLUMN historico_redirecionamento.url_antiga; Type: COMMENT; Schema: public; Owner: gcredirect
--

COMMENT ON COLUMN historico_redirecionamento.url_antiga IS 'URL antiga (origem)';


--
-- TOC entry 1993 (class 0 OID 0)
-- Dependencies: 161
-- Name: COLUMN historico_redirecionamento.url_nova; Type: COMMENT; Schema: public; Owner: gcredirect
--

COMMENT ON COLUMN historico_redirecionamento.url_nova IS 'URL nova (destino)';


--
-- TOC entry 1994 (class 0 OID 0)
-- Dependencies: 161
-- Name: COLUMN historico_redirecionamento.data; Type: COMMENT; Schema: public; Owner: gcredirect
--

COMMENT ON COLUMN historico_redirecionamento.data IS 'Data e hora da operação realizada';


--
-- TOC entry 162 (class 1259 OID 17121)
-- Dependencies: 161 6
-- Name: historico_redirecionamento_id_seq; Type: SEQUENCE; Schema: public; Owner: gcredirect
--

CREATE SEQUENCE historico_redirecionamento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.historico_redirecionamento_id_seq OWNER TO gcredirect;

--
-- TOC entry 1995 (class 0 OID 0)
-- Dependencies: 162
-- Name: historico_redirecionamento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gcredirect
--

ALTER SEQUENCE historico_redirecionamento_id_seq OWNED BY historico_redirecionamento.id;


--
-- TOC entry 1996 (class 0 OID 0)
-- Dependencies: 162
-- Name: historico_redirecionamento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gcredirect
--

SELECT pg_catalog.setval('historico_redirecionamento_id_seq', 843, true);


--
-- TOC entry 163 (class 1259 OID 17123)
-- Dependencies: 1928 6
-- Name: redirecionamento; Type: TABLE; Schema: public; Owner: gcredirect; Tablespace: 
--

CREATE TABLE redirecionamento (
    id integer NOT NULL,
    id_sitio integer NOT NULL,
    status smallint DEFAULT 301 NOT NULL,
    url_antiga character varying(150) NOT NULL,
    url_nova character varying(150) NOT NULL
);


ALTER TABLE public.redirecionamento OWNER TO gcredirect;

--
-- TOC entry 1997 (class 0 OID 0)
-- Dependencies: 163
-- Name: TABLE redirecionamento; Type: COMMENT; Schema: public; Owner: gcredirect
--

COMMENT ON TABLE redirecionamento IS 'Redirecionamentos para um sítio web';


--
-- TOC entry 1998 (class 0 OID 0)
-- Dependencies: 163
-- Name: COLUMN redirecionamento.id; Type: COMMENT; Schema: public; Owner: gcredirect
--

COMMENT ON COLUMN redirecionamento.id IS 'Chave primária';


--
-- TOC entry 1999 (class 0 OID 0)
-- Dependencies: 163
-- Name: COLUMN redirecionamento.id_sitio; Type: COMMENT; Schema: public; Owner: gcredirect
--

COMMENT ON COLUMN redirecionamento.id_sitio IS 'Chave estrangeira';


--
-- TOC entry 2000 (class 0 OID 0)
-- Dependencies: 163
-- Name: COLUMN redirecionamento.status; Type: COMMENT; Schema: public; Owner: gcredirect
--

COMMENT ON COLUMN redirecionamento.status IS '301 - permanent Returns a permanent redirect status (301) indicating that the resource has moved permanently.';


--
-- TOC entry 2001 (class 0 OID 0)
-- Dependencies: 163
-- Name: COLUMN redirecionamento.url_antiga; Type: COMMENT; Schema: public; Owner: gcredirect
--

COMMENT ON COLUMN redirecionamento.url_antiga IS 'URL antiga (origem)';


--
-- TOC entry 2002 (class 0 OID 0)
-- Dependencies: 163
-- Name: COLUMN redirecionamento.url_nova; Type: COMMENT; Schema: public; Owner: gcredirect
--

COMMENT ON COLUMN redirecionamento.url_nova IS 'URL nova (destino)';


--
-- TOC entry 164 (class 1259 OID 17127)
-- Dependencies: 163 6
-- Name: redirecionamento_id_seq; Type: SEQUENCE; Schema: public; Owner: gcredirect
--

CREATE SEQUENCE redirecionamento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.redirecionamento_id_seq OWNER TO gcredirect;

--
-- TOC entry 2003 (class 0 OID 0)
-- Dependencies: 164
-- Name: redirecionamento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gcredirect
--

ALTER SEQUENCE redirecionamento_id_seq OWNED BY redirecionamento.id;


--
-- TOC entry 2004 (class 0 OID 0)
-- Dependencies: 164
-- Name: redirecionamento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gcredirect
--

SELECT pg_catalog.setval('redirecionamento_id_seq', 843, true);


--
-- TOC entry 165 (class 1259 OID 17129)
-- Dependencies: 6
-- Name: regra; Type: TABLE; Schema: public; Owner: gcredirect; Tablespace: 
--

CREATE TABLE regra (
    id integer NOT NULL,
    nome character varying(30) NOT NULL
);


ALTER TABLE public.regra OWNER TO gcredirect;

--
-- TOC entry 2005 (class 0 OID 0)
-- Dependencies: 165
-- Name: TABLE regra; Type: COMMENT; Schema: public; Owner: gcredirect
--

COMMENT ON TABLE regra IS 'Lista as regras (`roles`).';


--
-- TOC entry 2006 (class 0 OID 0)
-- Dependencies: 165
-- Name: COLUMN regra.id; Type: COMMENT; Schema: public; Owner: gcredirect
--

COMMENT ON COLUMN regra.id IS 'Chave primária';


--
-- TOC entry 2007 (class 0 OID 0)
-- Dependencies: 165
-- Name: COLUMN regra.nome; Type: COMMENT; Schema: public; Owner: gcredirect
--

COMMENT ON COLUMN regra.nome IS 'Nome da regra';


--
-- TOC entry 166 (class 1259 OID 17132)
-- Dependencies: 165 6
-- Name: regra_id_seq; Type: SEQUENCE; Schema: public; Owner: gcredirect
--

CREATE SEQUENCE regra_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.regra_id_seq OWNER TO gcredirect;

--
-- TOC entry 2008 (class 0 OID 0)
-- Dependencies: 166
-- Name: regra_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gcredirect
--

ALTER SEQUENCE regra_id_seq OWNED BY regra.id;


--
-- TOC entry 2009 (class 0 OID 0)
-- Dependencies: 166
-- Name: regra_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gcredirect
--

SELECT pg_catalog.setval('regra_id_seq', 3, true);


--
-- TOC entry 167 (class 1259 OID 17134)
-- Dependencies: 6
-- Name: regra_usuario; Type: TABLE; Schema: public; Owner: gcredirect; Tablespace: 
--

CREATE TABLE regra_usuario (
    id_regra integer NOT NULL,
    id_usuario integer NOT NULL
);


ALTER TABLE public.regra_usuario OWNER TO gcredirect;

--
-- TOC entry 2010 (class 0 OID 0)
-- Dependencies: 167
-- Name: TABLE regra_usuario; Type: COMMENT; Schema: public; Owner: gcredirect
--

COMMENT ON TABLE regra_usuario IS 'Um usuário pode ter mais de uma regra no sistema.';


--
-- TOC entry 2011 (class 0 OID 0)
-- Dependencies: 167
-- Name: COLUMN regra_usuario.id_regra; Type: COMMENT; Schema: public; Owner: gcredirect
--

COMMENT ON COLUMN regra_usuario.id_regra IS 'Chave estrangeira para regra';


--
-- TOC entry 2012 (class 0 OID 0)
-- Dependencies: 167
-- Name: COLUMN regra_usuario.id_usuario; Type: COMMENT; Schema: public; Owner: gcredirect
--

COMMENT ON COLUMN regra_usuario.id_usuario IS 'Chave estrangeira para usuário';


--
-- TOC entry 168 (class 1259 OID 17137)
-- Dependencies: 6
-- Name: sitio; Type: TABLE; Schema: public; Owner: gcredirect; Tablespace: 
--

CREATE TABLE sitio (
    id integer NOT NULL,
    nome character varying(150) NOT NULL,
    sigla character varying(150) NOT NULL,
    url_sitio character varying(150) NOT NULL,
    caminho_arquivo_redirecionamento character varying(250) NOT NULL,
    arquivo_redirecionamento character varying(150) NOT NULL
);


ALTER TABLE public.sitio OWNER TO gcredirect;

--
-- TOC entry 2013 (class 0 OID 0)
-- Dependencies: 168
-- Name: TABLE sitio; Type: COMMENT; Schema: public; Owner: gcredirect
--

COMMENT ON TABLE sitio IS 'Sítio web';


--
-- TOC entry 2014 (class 0 OID 0)
-- Dependencies: 168
-- Name: COLUMN sitio.id; Type: COMMENT; Schema: public; Owner: gcredirect
--

COMMENT ON COLUMN sitio.id IS 'Chave primária';


--
-- TOC entry 2015 (class 0 OID 0)
-- Dependencies: 168
-- Name: COLUMN sitio.nome; Type: COMMENT; Schema: public; Owner: gcredirect
--

COMMENT ON COLUMN sitio.nome IS 'Nome do sítio';


--
-- TOC entry 2016 (class 0 OID 0)
-- Dependencies: 168
-- Name: COLUMN sitio.sigla; Type: COMMENT; Schema: public; Owner: gcredirect
--

COMMENT ON COLUMN sitio.sigla IS 'Sigla do sítio';


--
-- TOC entry 2017 (class 0 OID 0)
-- Dependencies: 168
-- Name: COLUMN sitio.url_sitio; Type: COMMENT; Schema: public; Owner: gcredirect
--

COMMENT ON COLUMN sitio.url_sitio IS 'URL';


--
-- TOC entry 2018 (class 0 OID 0)
-- Dependencies: 168
-- Name: COLUMN sitio.caminho_arquivo_redirecionamento; Type: COMMENT; Schema: public; Owner: gcredirect
--

COMMENT ON COLUMN sitio.caminho_arquivo_redirecionamento IS 'Caminho para o arquivo de redirecionamentos';


--
-- TOC entry 2019 (class 0 OID 0)
-- Dependencies: 168
-- Name: COLUMN sitio.arquivo_redirecionamento; Type: COMMENT; Schema: public; Owner: gcredirect
--

COMMENT ON COLUMN sitio.arquivo_redirecionamento IS 'Nome do arquivo de redirecionamentos';


--
-- TOC entry 169 (class 1259 OID 17143)
-- Dependencies: 6 168
-- Name: sitio_id_seq; Type: SEQUENCE; Schema: public; Owner: gcredirect
--

CREATE SEQUENCE sitio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sitio_id_seq OWNER TO gcredirect;

--
-- TOC entry 2020 (class 0 OID 0)
-- Dependencies: 169
-- Name: sitio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gcredirect
--

ALTER SEQUENCE sitio_id_seq OWNED BY sitio.id;


--
-- TOC entry 2021 (class 0 OID 0)
-- Dependencies: 169
-- Name: sitio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gcredirect
--

SELECT pg_catalog.setval('sitio_id_seq', 9, true);


--
-- TOC entry 170 (class 1259 OID 17145)
-- Dependencies: 6
-- Name: sitio_usuario; Type: TABLE; Schema: public; Owner: gcredirect; Tablespace: 
--

CREATE TABLE sitio_usuario (
    id_sitio integer NOT NULL,
    id_usuario integer NOT NULL
);


ALTER TABLE public.sitio_usuario OWNER TO gcredirect;

--
-- TOC entry 2022 (class 0 OID 0)
-- Dependencies: 170
-- Name: TABLE sitio_usuario; Type: COMMENT; Schema: public; Owner: gcredirect
--

COMMENT ON TABLE sitio_usuario IS 'Um usuário deve estar associado a um sítio para obter acesso ao sistema.';


--
-- TOC entry 2023 (class 0 OID 0)
-- Dependencies: 170
-- Name: COLUMN sitio_usuario.id_sitio; Type: COMMENT; Schema: public; Owner: gcredirect
--

COMMENT ON COLUMN sitio_usuario.id_sitio IS 'Chave estrangeira para o sítio';


--
-- TOC entry 2024 (class 0 OID 0)
-- Dependencies: 170
-- Name: COLUMN sitio_usuario.id_usuario; Type: COMMENT; Schema: public; Owner: gcredirect
--

COMMENT ON COLUMN sitio_usuario.id_usuario IS 'Chave estrangeira para o usuário';


--
-- TOC entry 171 (class 1259 OID 17148)
-- Dependencies: 1932 6
-- Name: usuario; Type: TABLE; Schema: public; Owner: gcredirect; Tablespace: 
--

CREATE TABLE usuario (
    id integer NOT NULL,
    nome character varying(150) NOT NULL,
    email character varying(150) NOT NULL,
    senha character varying(150) NOT NULL,
    usuario character varying(150) NOT NULL,
    ativo boolean DEFAULT false NOT NULL,
    telefone character varying(150) NOT NULL
);


ALTER TABLE public.usuario OWNER TO gcredirect;

--
-- TOC entry 2025 (class 0 OID 0)
-- Dependencies: 171
-- Name: TABLE usuario; Type: COMMENT; Schema: public; Owner: gcredirect
--

COMMENT ON TABLE usuario IS 'Usuários que podem obter acesso ao sistema. Para acessar o sistema o usuário deve estar ativo e associado a um ou mais sítios.';


--
-- TOC entry 2026 (class 0 OID 0)
-- Dependencies: 171
-- Name: COLUMN usuario.id; Type: COMMENT; Schema: public; Owner: gcredirect
--

COMMENT ON COLUMN usuario.id IS 'Chave primária';


--
-- TOC entry 2027 (class 0 OID 0)
-- Dependencies: 171
-- Name: COLUMN usuario.nome; Type: COMMENT; Schema: public; Owner: gcredirect
--

COMMENT ON COLUMN usuario.nome IS 'Nome completo do usuário';


--
-- TOC entry 2028 (class 0 OID 0)
-- Dependencies: 171
-- Name: COLUMN usuario.email; Type: COMMENT; Schema: public; Owner: gcredirect
--

COMMENT ON COLUMN usuario.email IS 'E-mail do usuário';


--
-- TOC entry 2029 (class 0 OID 0)
-- Dependencies: 171
-- Name: COLUMN usuario.senha; Type: COMMENT; Schema: public; Owner: gcredirect
--

COMMENT ON COLUMN usuario.senha IS 'Senha';


--
-- TOC entry 2030 (class 0 OID 0)
-- Dependencies: 171
-- Name: COLUMN usuario.usuario; Type: COMMENT; Schema: public; Owner: gcredirect
--

COMMENT ON COLUMN usuario.usuario IS 'Nome usado como autenticação no sistema';


--
-- TOC entry 2031 (class 0 OID 0)
-- Dependencies: 171
-- Name: COLUMN usuario.ativo; Type: COMMENT; Schema: public; Owner: gcredirect
--

COMMENT ON COLUMN usuario.ativo IS 'Indica se o usuário está ativo ou não.  Usuários não podem ser excluídos do sistema, apenas desabilitados.';


--
-- TOC entry 2032 (class 0 OID 0)
-- Dependencies: 171
-- Name: COLUMN usuario.telefone; Type: COMMENT; Schema: public; Owner: gcredirect
--

COMMENT ON COLUMN usuario.telefone IS 'Telefone para contato';


--
-- TOC entry 172 (class 1259 OID 17155)
-- Dependencies: 171 6
-- Name: usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: gcredirect
--

CREATE SEQUENCE usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuario_id_seq OWNER TO gcredirect;

--
-- TOC entry 2033 (class 0 OID 0)
-- Dependencies: 172
-- Name: usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gcredirect
--

ALTER SEQUENCE usuario_id_seq OWNED BY usuario.id;


--
-- TOC entry 2034 (class 0 OID 0)
-- Dependencies: 172
-- Name: usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gcredirect
--

SELECT pg_catalog.setval('usuario_id_seq', 45, true);


--
-- TOC entry 1927 (class 2604 OID 17157)
-- Dependencies: 162 161
-- Name: id; Type: DEFAULT; Schema: public; Owner: gcredirect
--

ALTER TABLE ONLY historico_redirecionamento ALTER COLUMN id SET DEFAULT nextval('historico_redirecionamento_id_seq'::regclass);


--
-- TOC entry 1929 (class 2604 OID 17158)
-- Dependencies: 164 163
-- Name: id; Type: DEFAULT; Schema: public; Owner: gcredirect
--

ALTER TABLE ONLY redirecionamento ALTER COLUMN id SET DEFAULT nextval('redirecionamento_id_seq'::regclass);


--
-- TOC entry 1930 (class 2604 OID 17159)
-- Dependencies: 166 165
-- Name: id; Type: DEFAULT; Schema: public; Owner: gcredirect
--

ALTER TABLE ONLY regra ALTER COLUMN id SET DEFAULT nextval('regra_id_seq'::regclass);


--
-- TOC entry 1931 (class 2604 OID 17160)
-- Dependencies: 169 168
-- Name: id; Type: DEFAULT; Schema: public; Owner: gcredirect
--

ALTER TABLE ONLY sitio ALTER COLUMN id SET DEFAULT nextval('sitio_id_seq'::regclass);


--
-- TOC entry 1933 (class 2604 OID 17161)
-- Dependencies: 172 171
-- Name: id; Type: DEFAULT; Schema: public; Owner: gcredirect
--

ALTER TABLE ONLY usuario ALTER COLUMN id SET DEFAULT nextval('usuario_id_seq'::regclass);


--
-- TOC entry 1972 (class 0 OID 17117)
-- Dependencies: 161
-- Data for Name: historico_redirecionamento; Type: TABLE DATA; Schema: public; Owner: gcredirect
--

INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (1, 41, 2, 1, 'CRIAR', 301, '_4ingredientes/Episodios', '_4ingredientes/episodios', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (2, 41, 2, 2, 'CRIAR', 301, '_4ingredientes/Fotos', '_4ingredientes/fotos', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (3, 41, 2, 3, 'CRIAR', 301, '4ingredientes', '_4ingredientes', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (4, 41, 2, 4, 'CRIAR', 301, '_4ingredientes/QuemFaz', '_4ingredientes/quemfaz', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (5, 41, 2, 5, 'CRIAR', 301, '_4ingredientes/Receitas', '_4ingredientes/receitas', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (6, 41, 2, 6, 'CRIAR', 301, '_4ingredientes/Videos', '_4ingredientes/videos', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (7, 41, 2, 7, 'CRIAR', 301, 'acozinhacaseiradeannabel/Episodios', 'acozinhacaseiradeannabel/episodios', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (8, 41, 2, 8, 'CRIAR', 301, 'acozinhacaseiradeannabel/Fotos', 'acozinhacaseiradeannabel/fotos', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (9, 41, 2, 9, 'CRIAR', 301, 'acozinhacaseiradeannabel/QuemFaz', 'acozinhacaseiradeannabel/quemfaz', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (10, 41, 2, 10, 'CRIAR', 301, 'acozinhacaseiradeannabel/Receitas', 'acozinhacaseiradeannabel/receitas', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (11, 41, 2, 11, 'CRIAR', 301, 'acozinhacaseiradeannabel/Videos', 'acozinhacaseiradeannabel/videos', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (12, 41, 2, 12, 'CRIAR', 301, 'afamiliagoode', 'A-Familia-Goode', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (13, 41, 2, 13, 'CRIAR', 301, 'alternativasaude/Episodios', 'alternativasaude/episodios', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (14, 41, 2, 14, 'CRIAR', 301, 'alternativasaude/Fotos', 'alternativasaude/fotos', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (15, 41, 2, 15, 'CRIAR', 301, 'Alternativa--Saude', 'alternativasaude', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (16, 41, 2, 16, 'CRIAR', 301, 'alternativasaude/QuemFaz', 'alternativasaude/quemfaz', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (17, 41, 2, 17, 'CRIAR', 301, 'alternativasaude/Receitas', 'alternativasaude/receitas', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (18, 41, 2, 18, 'CRIAR', 301, 'alternativasaude/Videos', 'alternativasaude/videos', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (19, 41, 2, 19, 'CRIAR', 301, 'annabel', 'acozinhacaseiradeannabel', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (20, 41, 2, 20, 'CRIAR', 301, 'aovivo', 'ao-vivo', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (21, 41, 2, 21, 'CRIAR', 301, 'basealiada/Episodios', 'basealiada/episodios', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (22, 41, 2, 22, 'CRIAR', 301, 'basealiada/Fotos', 'basealiada/fotos', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (23, 41, 2, 23, 'CRIAR', 301, 'basealiada/QuemFaz', 'basealiada/quemfaz', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (24, 41, 2, 24, 'CRIAR', 301, 'basealiada/Receitas', 'basealiada/receitas', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (25, 41, 2, 25, 'CRIAR', 301, 'basealiada/Videos', 'basealiada/videos', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (26, 41, 2, 26, 'CRIAR', 301, 'beleza/index.rss_xml.xml', 'beleza/ultimas.rss_xml.xml', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (27, 41, 2, 27, 'CRIAR', 301, 'bemstar', 'BemStar', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (28, 41, 2, 28, 'CRIAR', 301, 'blogs', 'Blogs', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (29, 41, 2, 29, 'CRIAR', 301, 'boasvindas', 'boas-vindas', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (30, 41, 2, 30, 'CRIAR', 301, 'casabrasileira/Episodios', 'casabrasileira/episodios', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (31, 41, 2, 31, 'CRIAR', 301, 'casabrasileira/Fotos', 'casabrasileira/fotos', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (32, 41, 2, 32, 'CRIAR', 301, 'casabrasileira/QuemFaz', 'casabrasileira/quemfaz', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (33, 41, 2, 33, 'CRIAR', 301, 'casabrasileira/Receitas', 'casabrasileira/receitas', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (34, 41, 2, 34, 'CRIAR', 301, 'casabrasileira/Videos', 'casabrasileira/videos', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (35, 41, 2, 35, 'CRIAR', 301, 'casa-e-decoracao/index.rss_xml.xml', 'casa-e-decoracao/ultimas.rss_xml.xml', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (36, 41, 2, 36, 'CRIAR', 301, 'casa', 'casa-e-decoracao', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (37, 41, 2, 37, 'CRIAR', 301, 'casamentodoprincipe', 'maisdatv/Noticias/GNT-exibe-programacao-especial-sobre-o-casamento-do-principe-William-e-Kate-Middleton.shtml', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (38, 41, 2, 38, 'CRIAR', 301, 'casamentodoprincipe', 'williamekate', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (39, 41, 2, 39, 'CRIAR', 301, 'cea', 'C-A', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (40, 41, 2, 40, 'CRIAR', 301, 'chegadasepartidas/Episodios', 'chegadasepartidas/episodios', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (41, 41, 2, 41, 'CRIAR', 301, 'chegadasepartidas/Fotos', 'chegadasepartidas/fotos', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (42, 41, 2, 42, 'CRIAR', 301, 'chegadasepartidas/QuemFaz', 'chegadasepartidas/quemfaz', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (43, 41, 2, 43, 'CRIAR', 301, 'chegadasepartidas/Receitas', 'chegadasepartidas/receitas', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (44, 41, 2, 44, 'CRIAR', 301, 'chegadasepartidas/Videos', 'chegadasepartidas/videos', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (45, 41, 2, 45, 'CRIAR', 301, 'chuvadearroz', 'chuva-de-arroz/noticias/_-Chuva-de-arroz---conheca-o-novo-programa-do-GNT-sobre-casamento.shtml', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (46, 41, 2, 46, 'CRIAR', 301, 'closetgnt', 'moda/noticias/Closet-GNT--o-novo-aplicativo-de-moda-e-beleza-do-GNT-para-o-seu-iPad.shtml', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (47, 41, 2, 47, 'CRIAR', 301, 'comida', 'comidaorg', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (48, 41, 2, 48, 'CRIAR', 301, 'Comida-Org', 'comidaorg', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (49, 41, 2, 49, 'CRIAR', 301, 'comportamento/index.rss_xml.xml', 'comportamento/ultimas.rss_xml.xml', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (50, 41, 2, 50, 'CRIAR', 301, 'cozinhapratica', 'cozinha-pratica', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (51, 41, 2, 51, 'CRIAR', 301, 'criancas', 'assuntos/criancas.shtml', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (52, 41, 2, 52, 'CRIAR', 301, 'davidletterman', 'lateshow', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (53, 41, 2, 53, 'CRIAR', 301, 'Diario-do-Olivier', 'diariodoolivier', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (54, 41, 2, 54, 'CRIAR', 301, 'doc', 'gntdoc', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (55, 41, 2, 55, 'CRIAR', 301, 'emcasacomjamieoliver', 'Em-Casa-Com-Jamie-Oliver', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (56, 41, 2, 56, 'CRIAR', 301, 'estarbem', 'EstarBem', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (57, 41, 2, 57, 'CRIAR', 301, 'EstarBem/Materias/Afinal--o-que-e-Chiraoscuro--Pitty-.html', 'EstarBem/Materias/Afinal--o-que-e-Chiaroscuro--Pitty-.html', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (58, 41, 2, 58, 'CRIAR', 301, 'EstarBem/Materias', 'EstarBem/Noticias', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (59, 41, 2, 59, 'CRIAR', 301, 'Estilo/Desfiles/', 'moda/desfiles', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (60, 41, 2, 60, 'CRIAR', 301, 'Estilo/DicasDeBeleza/', 'beleza/dicas', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (61, 41, 2, 61, 'CRIAR', 301, 'Estilo/DicasDeModa/', 'moda/dicas', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (62, 41, 2, 62, 'CRIAR', 301, 'Estilo/Ensaios/', 'moda/ensaios', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (63, 41, 2, 63, 'CRIAR', 301, 'estilo', 'Estilo', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (64, 41, 2, 64, 'CRIAR', 301, 'Estilo/Looks/', 'moda/looks', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (65, 41, 2, 65, 'CRIAR', 301, 'Estilo/Materias', 'Estilo/Noticias', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (66, 41, 2, 66, 'CRIAR', 301, 'Estilo/ReviewDeProduto/', 'beleza/produtos', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (67, 41, 2, 67, 'CRIAR', 301, 'Expressao/Materias', 'Expressao/Noticias', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (68, 41, 2, 68, 'CRIAR', 301, 'faixadeareia', 'faixa-de-areia', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (69, 41, 2, 69, 'CRIAR', 301, 'Falando-de-Sexo-com-Sue-Johanson', 'falandodesexocomsuejohanson', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (70, 41, 2, 70, 'CRIAR', 301, 'falandodesexo', 'falandodesexocomsuejohanson', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (71, 41, 2, 71, 'CRIAR', 301, 'Fale-Conosco', 'index.fale_shtml.shtml', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (72, 41, 2, 72, 'CRIAR', 301, 'familiagoode', 'A-Familia-Goode', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (73, 41, 2, 73, 'CRIAR', 301, 'Fashion-Television', 'fashiontelevision', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (74, 41, 2, 74, 'CRIAR', 301, 'fernandayoung', 'irritandofernandayoung', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (75, 41, 2, 75, 'CRIAR', 301, 'foradecasa', 'Fora-de-Casa', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (76, 41, 2, 76, 'CRIAR', 301, 'garvinnaestrada', 'garvin', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (77, 41, 2, 77, 'CRIAR', 301, 'gentelesa', 'Gente-Lesa', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (78, 41, 2, 78, 'CRIAR', 301, 'GNT-Doc', 'gntdoc', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (79, 41, 2, 79, 'CRIAR', 301, 'GNT-Fashion', 'gntfashion', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (80, 41, 2, 80, 'CRIAR', 301, 'gnt', '', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (81, 41, 2, 81, 'CRIAR', 301, 'gourmet', 'Gourmet', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (82, 41, 2, 82, 'CRIAR', 301, 'Gourmet/Materias', 'Gourmet/Noticias', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (83, 41, 2, 83, 'CRIAR', 301, 'Gourmet/Noticias', 'receitas', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (84, 41, 2, 84, 'CRIAR', 301, 'Gourmet/Receitas', 'receitas', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (85, 41, 2, 85, 'CRIAR', 301, 'Gourmet/Videos', 'receitas/videos', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (86, 41, 2, 86, 'CRIAR', 301, 'Happy-Hour', 'happyhour', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (87, 41, 2, 87, 'CRIAR', 301, 'harmonize', 'Harmonize', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (88, 41, 2, 88, 'CRIAR', 301, 'Head-Case', 'headcase', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (89, 41, 2, 89, 'CRIAR', 301, 'Hollyscoop', 'hollyscoop', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (90, 41, 2, 90, 'CRIAR', 301, 'homenspossiveis', 'homens-possiveis', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (91, 41, 2, 91, 'CRIAR', 301, 'ify', 'irritandofernandayoung', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (92, 41, 2, 92, 'CRIAR', 301, 'index.rss_xml.xml', 'ultimas.rss_xml.xml', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (93, 41, 2, 93, 'CRIAR', 301, 'inspire-se', 'Inspire-se.shtml', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (94, 41, 2, 94, 'CRIAR', 301, 'inspirese', 'Inspire-se.shtml', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (95, 41, 2, 95, 'CRIAR', 301, 'Irritando-Fernanda-Young', 'irritandofernandayoung', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (96, 41, 2, 96, 'CRIAR', 301, 'Jamie-Oliver', 'jamieoliver', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (97, 41, 2, 97, 'CRIAR', 301, 'jimmy', 'olaboratoriogastronomicodejimmy', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (98, 41, 2, 98, 'CRIAR', 301, 'kennedy', 'maisdatv/Noticias/Serie-e-doc-ineditos-falam-sobre-a-vida-da-familia-Kennedy.shtml', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (99, 41, 2, 99, 'CRIAR', 301, 'kitchenightmares', 'kitchennightmares', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (100, 41, 2, 100, 'CRIAR', 301, 'Kitchen-Nightmares', 'kitchennightmares', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (329, 41, 1, 329, 'CRIAR', 301, 'jackosbourne', 'Jack-Osbourne', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (101, 41, 2, 101, 'CRIAR', 301, 'laboratoriodejimmy', 'olaboratoriogastronomicodejimmy', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (102, 41, 2, 102, 'CRIAR', 301, 'laboratoriogastronomicodejimmy', 'olaboratoriogastronomicodejimmy', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (103, 41, 2, 103, 'CRIAR', 301, 'Laboratorio-Gastronomico-de-Jimmy', 'olaboratoriogastronomicodejimmy', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (104, 41, 2, 104, 'CRIAR', 301, 'laboratoriogastronomico', 'olaboratoriogastronomicodejimmy', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (105, 41, 2, 105, 'CRIAR', 301, 'Late-Show-with-David-Letterman', 'lateshow', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (106, 41, 2, 106, 'CRIAR', 301, 'letterman', 'lateshow', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (107, 41, 2, 107, 'CRIAR', 301, 'maeemae', 'mae-e-mae', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (108, 41, 2, 108, 'CRIAR', 301, 'maes-e-filhos/index.rss_xml.xml', 'maes-e-filhos/ultimas.rss_xml.xml', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (109, 41, 2, 109, 'CRIAR', 301, 'maes', 'maes-e-filhos', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (110, 41, 2, 110, 'CRIAR', 301, 'Manhattan-Connection', 'manhattanconnection', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (111, 41, 2, 111, 'CRIAR', 301, 'manhattan', 'manhattanconnection', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (112, 41, 2, 112, 'CRIAR', 301, 'marialiagabriela', 'mariliagabrielaentrevista', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (113, 41, 2, 113, 'CRIAR', 301, 'Marilia-Gabriela-Entrevista', 'mariliagabrielaentrevista', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (114, 41, 2, 114, 'CRIAR', 301, 'mariliagabrielaentrevista/Noticias/Brigadeiro-do-William-Bonner--anote-a-receita.shtml', 'Gourmet/Receitas/Brigadeiro-do-William-Bonner--anote-a-receita.shtml', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (115, 41, 2, 115, 'CRIAR', 301, 'Menu-Confianca', 'menuconfianca', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (116, 41, 2, 116, 'CRIAR', 301, 'michaeljackson', 'Expressao/Materias/Programacao-Michael-Jackson---de-20-a-27-de-junho.shtml', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (117, 41, 2, 117, 'CRIAR', 301, 'minhamaquiagem', 'promocoes/index.colaborativo_shtml.shtml', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (118, 41, 2, 118, 'CRIAR', 301, 'moda/index.rss_xml.xml', 'moda/ultimas.rss_xml.xml', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (119, 41, 2, 119, 'CRIAR', 301, 'Mulheres-no-Cinema', 'mulheresnocinema', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (120, 41, 2, 120, 'CRIAR', 301, 'mulher', 'Estilo', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (121, 41, 2, 121, 'CRIAR', 301, 'Mulher', 'Estilo', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (122, 41, 2, 122, 'CRIAR', 301, 'Naked-Fashion', 'nakedfashion', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (123, 41, 2, 123, 'CRIAR', 301, 'newsletter', 'Newsletter', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (124, 41, 2, 124, 'CRIAR', 301, 'Nigella', 'nigella', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (125, 41, 2, 125, 'CRIAR', 301, 'Noivas-fora-de-forma', 'noivasforadeforma', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (126, 41, 2, 126, 'CRIAR', 301, 'novasfamilias', 'novas-familias', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (127, 41, 2, 127, 'CRIAR', 301, 'O-Chef-G--Garvin-na-Estrada', 'garvin', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (128, 41, 2, 128, 'CRIAR', 301, 'oifashionrocks', 'Oi-Fashion-Rocks', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (129, 41, 2, 129, 'CRIAR', 301, 'olivier', 'diariodoolivier', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (130, 41, 2, 130, 'CRIAR', 301, 'oprah', 'theoprahwinfreyshow', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (131, 41, 2, 131, 'CRIAR', 301, 'Os-Normais', 'osnormais', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (132, 41, 2, 132, 'CRIAR', 301, 'pecapiloto', 'Peca-Piloto', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (133, 41, 2, 133, 'CRIAR', 301, 'Plastica-Perfeita', 'plasticaperfeita', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (134, 41, 2, 134, 'CRIAR', 301, 'pretagil', 'vaievem', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (135, 41, 2, 135, 'CRIAR', 301, 'Programacao/index.grade.html', 'Programacao', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (136, 41, 2, 136, 'CRIAR', 301, 'Promocoes', 'promocoes', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (137, 41, 2, 137, 'CRIAR', 301, 'quemaravilha', 'quemarravilha', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (138, 41, 2, 138, 'CRIAR', 301, 'Que-Marravilha-', 'quemarravilha', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (139, 41, 2, 139, 'CRIAR', 301, 'Que-Marravilha', 'quemarravilha', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (140, 41, 2, 140, 'CRIAR', 301, 'Receitas-de-Chuck', 'receitasdechuck', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (141, 41, 2, 141, 'CRIAR', 301, 'Receitas-do-Chuck', 'receitasdechuck', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (142, 41, 2, 142, 'CRIAR', 301, 'receitas/index.rss_xml.xml', 'receitas/ultimas.rss_xml.xml', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (143, 41, 2, 143, 'CRIAR', 301, 'Romance-em-Hollywood', 'romanceemhollywood', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (144, 41, 2, 144, 'CRIAR', 301, 'Saia-Justa', 'saiajusta', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (145, 41, 2, 145, 'CRIAR', 301, 'saude/index.rss_xml.xml', 'saude/ultimas.rss_xml.xml', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (146, 41, 2, 146, 'CRIAR', 301, 'Semana-do-Jo', 'semanadojo', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (147, 41, 2, 147, 'CRIAR', 301, 'semanamesasp2011', 'semana-mesa-sp-2011', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (148, 41, 2, 148, 'CRIAR', 301, 'semfiltro', 'sem-filtro', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (149, 41, 2, 149, 'CRIAR', 301, 'Sexarama', 'sexarama', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (150, 41, 2, 150, 'CRIAR', 301, 'sorriso', 'Compatilhe-um-Sorriso.shtml', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (151, 41, 2, 151, 'CRIAR', 301, 'sorrisos', 'Compatilhe-um-Sorriso.shtml', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (152, 41, 2, 152, 'CRIAR', 301, 'spoons', 'Spoons', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (153, 41, 2, 153, 'CRIAR', 301, 'suejohanson', 'falandodesexocomsuejohanson', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (154, 41, 2, 154, 'CRIAR', 301, 'Superbonita', 'superbonita', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (155, 41, 2, 155, 'CRIAR', 301, 'Supernanny', 'supernanny', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (156, 41, 2, 156, 'CRIAR', 301, 'Tamanho-Unico', 'tamanhounico', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (157, 41, 2, 157, 'CRIAR', 301, 'Ta-na-Epoca', 'tanaepoca', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (158, 41, 2, 158, 'CRIAR', 301, 'The-Oprah-Winfrey-Show', 'theoprahwinfreyshow', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (159, 41, 2, 159, 'CRIAR', 301, 'Vai-e-Vem', 'vaievem', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (160, 41, 2, 160, 'CRIAR', 301, 'vaivem', 'vaievem', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (161, 41, 2, 161, 'CRIAR', 301, 'Viagem-Gastronomica', 'viagemgastronomica', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (162, 41, 2, 162, 'CRIAR', 301, 'Videos', 'videos', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (163, 41, 2, 163, 'CRIAR', 301, 'vivercomfe', 'viver-com-fe', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (164, 41, 2, 164, 'CRIAR', 301, 'Voce-e-o-Que-Voce-Come', 'voceeoquevocecome', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (165, 41, 2, 165, 'CRIAR', 301, 'Weeds', 'weeds', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (166, 41, 2, 166, 'CRIAR', 301, 'widgets', 'no-seu-site', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (167, 41, 1, 167, 'CRIAR', 301, '220v', '_220-Volts', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (168, 41, 1, 168, 'CRIAR', 301, '220voltes', '_220-Volts', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (169, 41, 1, 169, 'CRIAR', 301, '220volts', '_220-Volts', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (170, 41, 1, 170, 'CRIAR', 301, '220VOLTS', '_220-Volts', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (171, 41, 1, 171, 'CRIAR', 301, 'adoravel', 'Adoravel-Psicose', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (172, 41, 1, 172, 'CRIAR', 301, 'adoravelpsicose', 'Adoravel-Psicose', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (173, 41, 1, 173, 'CRIAR', 301, 'aeliminacao', 'A-eliminacao', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (174, 41, 1, 174, 'CRIAR', 301, 'amoraldahistoria', 'Amoral-da-Historia', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (175, 41, 1, 175, 'CRIAR', 301, 'amoral', 'Amoral-da-Historia', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (176, 41, 1, 176, 'CRIAR', 301, 'aovivo', 'Shows-Ao-Vivo', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (177, 41, 1, 177, 'CRIAR', 301, 'aquecimentobbb12', 'Aquecimento-BBB-12', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (178, 41, 1, 178, 'CRIAR', 301, 'aquecimentoBBB', 'Aquecimento-BBB', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (179, 41, 1, 179, 'CRIAR', 301, 'aquecimentobbb', 'Aquecimento-BBB-12', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (180, 41, 1, 180, 'CRIAR', 301, 'aquecimento', 'Aquecimento-BBB-12', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (181, 41, 1, 181, 'CRIAR', 301, 'asassumidas', 'As-Assumidas', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (182, 41, 1, 182, 'CRIAR', 301, 'Asassumidas', 'As-Assumidas', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (183, 41, 1, 183, 'CRIAR', 301, 'asgostosaseosgeeks', 'As-Gostosas-e-os-Geeks', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (184, 41, 1, 184, 'CRIAR', 301, 'asolivias', 'Olivias-na-Tv', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (185, 41, 1, 185, 'CRIAR', 301, 'aspegadoras', 'As-Pegadoras', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (186, 41, 1, 186, 'CRIAR', 301, 'assumidas', 'As-Assumidas', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (187, 41, 1, 187, 'CRIAR', 301, 'assuntoemusica', 'O-Assunto-e-Musica', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (188, 41, 1, 188, 'CRIAR', 301, 'atequefazsentido', 'Ate-que-faz-sentido', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (189, 41, 1, 189, 'CRIAR', 301, 'Atequefazsentido', 'Ate-que-faz-sentido', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (190, 41, 1, 190, 'CRIAR', 301, 'baladaperfeita', 'Em-Busca-da-Balada-Perfeita', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (191, 41, 1, 191, 'CRIAR', 301, 'barataflamejante', 'Barata-Flamejante', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (192, 41, 1, 192, 'CRIAR', 301, 'barata', 'Barata-Flamejante', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (193, 41, 1, 193, 'CRIAR', 301, 'baratasflamejantes', 'Barata-Flamejante', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (194, 41, 1, 194, 'CRIAR', 301, 'bastidores', 'Bastidores', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (195, 41, 1, 195, 'CRIAR', 301, 'batomeparafina', 'Batom-e-Parafina', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (196, 41, 1, 196, 'CRIAR', 301, 'Batomeparafina', 'Batom-e-Parafina', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (197, 41, 1, 197, 'CRIAR', 301, 'Batom-E-Parafina', 'Batom-e-Parafina', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (198, 41, 1, 198, 'CRIAR', 301, 'bbb11', 'Big-Brother-Brasil-11', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (199, 41, 1, 199, 'CRIAR', 301, 'BBB11', 'Big-Brother-Brasil-11', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (200, 41, 1, 200, 'CRIAR', 301, 'bbb12', 'Aquecimento-BBB-12', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (201, 41, 1, 201, 'CRIAR', 301, 'Bbb12', 'Aquecimento-BBB-12', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (202, 41, 1, 202, 'CRIAR', 301, 'BBB12', 'Aquecimento-BBB-12', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (203, 41, 1, 203, 'CRIAR', 301, 'bbb', 'A-eliminacao', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (204, 41, 1, 204, 'CRIAR', 301, 'BBB', 'A-eliminacao', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (205, 41, 1, 205, 'CRIAR', 301, 'beatles', 'Beatles', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (206, 41, 1, 206, 'CRIAR', 301, 'beijomeliga', 'Beijo-me-Liga', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (207, 41, 1, 207, 'CRIAR', 301, 'Beijomeliga', 'Beijo-me-Liga', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (208, 41, 1, 208, 'CRIAR', 301, 'beijo', 'Dia-do-Beijo', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (209, 41, 1, 209, 'CRIAR', 301, 'betalive', 'TIM-Beta-Live', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (210, 41, 1, 210, 'CRIAR', 301, 'beyonce', 'Beyonce', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (211, 41, 1, 211, 'CRIAR', 301, 'bicicletaemelancia', 'Bicicleta-e-Melancia', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (212, 41, 1, 212, 'CRIAR', 301, 'bicicleta', 'Bicicleta-e-Melancia', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (213, 41, 1, 213, 'CRIAR', 301, 'bigbrother11', 'Big-Brother-Brasil-11', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (214, 41, 1, 214, 'CRIAR', 301, 'bigbrother12', 'Aquecimento-BBB-12', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (215, 41, 1, 215, 'CRIAR', 301, 'bigbrotherbrasil11', 'Big-Brother-Brasil-11', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (216, 41, 1, 216, 'CRIAR', 301, 'bigbrotherbrasil12', 'Aquecimento-BBB-12', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (217, 41, 1, 217, 'CRIAR', 301, 'bigbrother', 'Big-Brother-Brasil-11', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (218, 41, 1, 218, 'CRIAR', 301, 'buchas', 'Os-Buchas', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (219, 41, 1, 219, 'CRIAR', 301, 'Buchas', 'Os-Buchas', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (220, 41, 1, 220, 'CRIAR', 301, 'cabare', 'Sexshake-Cabare', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (221, 41, 1, 221, 'CRIAR', 301, 'Cabare', 'Sexshake-Cabare', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (222, 41, 1, 222, 'CRIAR', 301, 'cabeloempe', 'De-Cabelo-em-Pe', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (223, 41, 1, 223, 'CRIAR', 301, 'caetanoegadu', 'Gadu-e-Caetano-Ao-Vivo', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (224, 41, 1, 224, 'CRIAR', 301, 'caetano', 'Gadu-e-Caetano-Ao-Vivo', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (225, 41, 1, 225, 'CRIAR', 301, 'caiaque', 'Kaiak', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (226, 41, 1, 226, 'CRIAR', 301, 'caralimpa', 'De-Cara-Limpa', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (227, 41, 1, 227, 'CRIAR', 301, 'carametade', 'Cara-Metade', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (228, 41, 1, 228, 'CRIAR', 301, 'casabonita2', 'Casa-Bonita-2', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (229, 41, 1, 229, 'CRIAR', 301, 'casabonita3', 'Casa-Bonita-3', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (230, 41, 1, 230, 'CRIAR', 301, 'casabonita4', 'Casa-Bonita-4', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (231, 41, 1, 231, 'CRIAR', 301, 'casabonitadois', 'Casa-Bonita-2', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (232, 41, 1, 232, 'CRIAR', 301, 'casabonita', 'Casa-Bonita-4', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (233, 41, 1, 233, 'CRIAR', 301, 'casosdepolicia', 'Papo-de-Policia', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (234, 41, 1, 234, 'CRIAR', 301, 'chopecom', 'Um-chope-com', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (235, 41, 1, 235, 'CRIAR', 301, 'chope', 'Um-chope-com', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (236, 41, 1, 236, 'CRIAR', 301, 'choppcom', 'Um-chope-com', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (237, 41, 1, 237, 'CRIAR', 301, 'chopp', 'Um-chope-com', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (238, 41, 1, 238, 'CRIAR', 301, 'cibernet', 'Cybernet', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (239, 41, 1, 239, 'CRIAR', 301, 'cidadenua', 'Cidade-Nua', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (240, 41, 1, 240, 'CRIAR', 301, 'cilada.com', 'Cilada-O-Filme', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (241, 41, 1, 241, 'CRIAR', 301, 'ciladacom', 'Cilada-O-Filme', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (242, 41, 1, 242, 'CRIAR', 301, 'ciladafilme', 'Cilada-O-Filme', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (243, 41, 1, 243, 'CRIAR', 301, 'cilada', 'Cilada', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (244, 41, 1, 244, 'CRIAR', 301, 'ciladaofilme', 'Cilada-O-Filme', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (245, 41, 1, 245, 'CRIAR', 301, 'comportamento', 'Comportamento', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (246, 41, 1, 246, 'CRIAR', 301, 'conexoes', 'Conexoes-Urbanas', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (247, 41, 1, 247, 'CRIAR', 301, 'conexoesurbanas', 'Conexoes-Urbanas', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (248, 41, 1, 248, 'CRIAR', 301, 'crametade', 'Cara-Metade', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (249, 41, 1, 249, 'CRIAR', 301, 'culturaurbana', 'Cultura-Urbana', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (250, 41, 1, 250, 'CRIAR', 301, 'cybernet', 'Cybernet', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (251, 41, 1, 251, 'CRIAR', 301, 'decabeloempe', 'De-Cabelo-em-Pe', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (252, 41, 1, 252, 'CRIAR', 301, 'Decabeloempe', 'De-Cabelo-em-Pe', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (253, 41, 1, 253, 'CRIAR', 301, 'decaralimpa', 'De-Cara-Limpa', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (254, 41, 1, 254, 'CRIAR', 301, 'desenrolaai', 'Desenrola-Ai', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (255, 41, 1, 255, 'CRIAR', 301, 'desenrola', 'Desenrola-Ai', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (256, 41, 1, 256, 'CRIAR', 301, 'desprogramado', 'Desprogramado', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (257, 41, 1, 257, 'CRIAR', 301, 'diadoamigo', 'TVZ/Materias/No-Dia-do-Amigo--20-de-julho--Multishow-traz-programacao-especial.shtml', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (258, 41, 1, 258, 'CRIAR', 301, 'diadobeijo', 'Dia-do-Beijo', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (259, 41, 1, 259, 'CRIAR', 301, 'diadorock', 'Dia-do-Rock', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (260, 41, 1, 260, 'CRIAR', 301, 'diadosexo', 'Sexy', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (261, 41, 1, 261, 'CRIAR', 301, 'diadosnamorados', 'Dia-dos-Namorados', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (262, 41, 1, 262, 'CRIAR', 301, 'diario', 'Diario-Quase-Secreto', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (263, 41, 1, 263, 'CRIAR', 301, 'diarioquasesecreto', 'Diario-Quase-Secreto', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (264, 41, 1, 264, 'CRIAR', 301, 'doiselementos', 'Dois-Elementos', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (265, 41, 1, 265, 'CRIAR', 301, 'Doiselementos', 'Dois-Elementos', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (266, 41, 1, 266, 'CRIAR', 301, 'dreamgirls', 'Dream-Girls', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (267, 41, 1, 267, 'CRIAR', 301, 'dvdgaduecaetano', 'Gadu-e-Caetano-Ao-Vivo', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (268, 41, 1, 268, 'CRIAR', 301, 'dvdparalamasaovivo', 'DVD-Paralamas-Ao-Vivo', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (269, 41, 1, 269, 'CRIAR', 301, 'dvdparalamas', 'DVD-Paralamas-Ao-Vivo', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (270, 41, 1, 270, 'CRIAR', 301, 'dvdpaulmccartney', 'Paul-McCartney', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (271, 41, 1, 271, 'CRIAR', 301, 'dvdraimundos', 'DVD-Raimundos-Roda-Viva', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (272, 41, 1, 272, 'CRIAR', 301, 'dvdraimundosrodaviva', 'DVD-Raimundos-Roda-Viva', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (273, 41, 1, 273, 'CRIAR', 301, 'dvdrodavida', 'DVD-Raimundos-Roda-Viva', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (274, 41, 1, 274, 'CRIAR', 301, 'edmorte', 'Ed-Mort', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (275, 41, 1, 275, 'CRIAR', 301, 'edmort', 'Ed-Mort', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (276, 41, 1, 276, 'CRIAR', 301, 'Edmort', 'Ed-Mort', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (277, 41, 1, 277, 'CRIAR', 301, 'ed', 'Ed-Mort', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (278, 41, 1, 278, 'CRIAR', 301, 'Ed', 'Ed-Mort', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (279, 41, 1, 279, 'CRIAR', 301, 'eliminacao', 'A-eliminacao', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (280, 41, 1, 280, 'CRIAR', 301, 'embarcados', 'Embarcados', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (281, 41, 1, 281, 'CRIAR', 301, 'embuscadabalada', 'Em-Busca-da-Balada-Perfeita', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (282, 41, 1, 282, 'CRIAR', 301, 'embuscadabaladaperfeita', 'Em-Busca-da-Balada-Perfeita', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (283, 41, 1, 283, 'CRIAR', 301, 'especiais', 'Especiais', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (284, 41, 1, 284, 'CRIAR', 301, 'exaltaaovivo', 'Exaltasamba-Ao-Vivo', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (285, 41, 1, 285, 'CRIAR', 301, 'exalta', 'Exaltasamba-Ao-Vivo', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (286, 41, 1, 286, 'CRIAR', 301, 'exaltasambaaovivo', 'Exaltasamba-Ao-Vivo', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (287, 41, 1, 287, 'CRIAR', 301, 'exaltasamba', 'Exaltasamba-Ao-Vivo', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (288, 41, 1, 288, 'CRIAR', 301, 'experimente', 'Experimente', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (289, 41, 1, 289, 'CRIAR', 301, 'extremos', 'Extremos', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (290, 41, 1, 290, 'CRIAR', 301, 'f1', 'F1-Rocks', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (291, 41, 1, 291, 'CRIAR', 301, 'f1rock', 'F1-Rocks', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (292, 41, 1, 292, 'CRIAR', 301, 'f1rocks', 'F1-Rocks', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (293, 41, 1, 293, 'CRIAR', 301, 'fazsentido', 'Ate-que-faz-sentido', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (294, 41, 1, 294, 'CRIAR', 301, 'felipeneto', 'Ate-que-Faz-Sentido', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (295, 41, 1, 295, 'CRIAR', 301, 'festivaldemusicaswu', 'SWU-2010', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (296, 41, 1, 296, 'CRIAR', 301, 'festivalswu', 'SWU-2010', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (297, 41, 1, 297, 'CRIAR', 301, 'figuras', 'Os-Figuras', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (298, 41, 1, 298, 'CRIAR', 301, 'Figuras', 'Os-Figuras', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (299, 41, 1, 299, 'CRIAR', 301, 'filmecilada', 'Cilada-O-Filme', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (300, 41, 1, 300, 'CRIAR', 301, 'foliaecaos', 'Jota-Quest-Ao-Vivo-Folia-E-Caos', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (301, 41, 1, 301, 'CRIAR', 301, 'gaduaovivo', 'Maria-Gadu-Ao-Vivo', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (302, 41, 1, 302, 'CRIAR', 301, 'gaduecaetano', 'Gadu-e-Caetano-Ao-Vivo', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (303, 41, 1, 303, 'CRIAR', 301, 'gadu', 'Maria-Gadu-Ao-Vivo', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (304, 41, 1, 304, 'CRIAR', 301, 'gargalhada', 'Humor', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (305, 41, 1, 305, 'CRIAR', 301, 'Gargalhada', 'Humor', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (306, 41, 1, 306, 'CRIAR', 301, 'gargalha', 'Humor', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (307, 41, 1, 307, 'CRIAR', 301, 'Gargalha', 'Humor', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (308, 41, 1, 308, 'CRIAR', 301, 'gargalhatv', 'Gargalha-TV', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (309, 41, 1, 309, 'CRIAR', 301, 'garotadecinema', 'Garota-de-Cinema', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (310, 41, 1, 310, 'CRIAR', 301, 'Garotadecinema', 'Garota-de-Cinema', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (311, 41, 1, 311, 'CRIAR', 301, 'geleia2011', 'Geleia-do-Rock-2011', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (312, 41, 1, 312, 'CRIAR', 301, 'geleiadorock', 'Geleia-do-Rock-2011', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (313, 41, 1, 313, 'CRIAR', 301, 'geleia', 'Geleia-do-Rock-2011', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (314, 41, 1, 314, 'CRIAR', 301, 'gozadores', 'Os-Gozadores', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (315, 41, 1, 315, 'CRIAR', 301, 'horarios', 'Programacao/horarios.shtml', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (316, 41, 1, 316, 'CRIAR', 301, 'humor', 'Humor', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (317, 41, 1, 317, 'CRIAR', 301, 'ilove', 'I-Love-My-Nerd', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (318, 41, 1, 318, 'CRIAR', 301, 'ilovemynerd', 'I-Love-My-Nerd', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (319, 41, 1, 319, 'CRIAR', 301, 'intercambio', 'Intercambio', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (320, 41, 1, 320, 'CRIAR', 301, 'iphone', 'Materia/Multishow-lanca-aplicativo-para-iPhone-e-iPod--Ja-baixou-.shtml#fotogaleria=1', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (321, 41, 1, 321, 'CRIAR', 301, 'iveteaovivo', 'Ivete-Sangalo-Ao-Vivo', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (322, 41, 1, 322, 'CRIAR', 301, 'ivete', 'Ivete-Sangalo-Ao-Vivo', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (323, 41, 1, 323, 'CRIAR', 301, 'Ivete', 'Ivete-Sangalo-Ao-Vivo', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (324, 41, 1, 324, 'CRIAR', 301, 'iveteny', 'Ivete-Sangalo-Ao-Vivo', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (325, 41, 1, 325, 'CRIAR', 301, 'iveteNY', 'Ivete-Sangalo-Ao-Vivo', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (326, 41, 1, 326, 'CRIAR', 301, 'ivetesangaloaovivo', 'Ivete-Sangalo-Ao-Vivo', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (327, 41, 1, 327, 'CRIAR', 301, 'ivetesangalo', 'Ivete-Sangalo-Ao-Vivo', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (328, 41, 1, 328, 'CRIAR', 301, 'jack', 'Jack-Osbourne', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (330, 41, 1, 330, 'CRIAR', 301, 'janelas', 'Janelas', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (331, 41, 1, 331, 'CRIAR', 301, 'jotaquest', 'Jota-Quest-Ao-Vivo-Folia-E-Caos', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (332, 41, 1, 332, 'CRIAR', 301, 'kaiak', 'Kaiak', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (333, 41, 1, 333, 'CRIAR', 301, 'kayak', 'Kaiak', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (334, 41, 1, 334, 'CRIAR', 301, 'kidabelha', 'Show-Kid-Abelha', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (335, 41, 1, 335, 'CRIAR', 301, 'lendasdomma', 'Lendas-do-UFC', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (336, 41, 1, 336, 'CRIAR', 301, 'lendasdoufc', 'Lendas-do-UFC', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (337, 41, 1, 337, 'CRIAR', 301, 'Lendasdoufc', 'Lendas-do-UFC', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (338, 41, 1, 338, 'CRIAR', 301, 'lifeonmars', 'Life-On-Mars', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (339, 41, 1, 339, 'CRIAR', 301, 'lola', 'Lollapalooza-2012', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (340, 41, 1, 340, 'CRIAR', 301, 'Lola', 'Lollapalooza-2012', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (341, 41, 1, 341, 'CRIAR', 301, 'lolapallooza', 'Lollapalooza-2012', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (342, 41, 1, 342, 'CRIAR', 301, 'lolapalooza', 'Lollapalooza-2012', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (343, 41, 1, 343, 'CRIAR', 301, 'lolapalusa', 'Lollapalooza-2012', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (344, 41, 1, 344, 'CRIAR', 301, 'lolapaluza', 'Lollapalooza-2012', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (345, 41, 1, 345, 'CRIAR', 301, 'lolla', 'Lollapalooza-2012', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (346, 41, 1, 346, 'CRIAR', 301, 'Lolla', 'Lollapalooza-2012', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (347, 41, 1, 347, 'CRIAR', 301, 'lollapaloosa', 'Lollapalooza-2012', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (348, 41, 1, 348, 'CRIAR', 301, 'lollapalooza', 'Lollapalooza-2012', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (349, 41, 1, 349, 'CRIAR', 301, 'Lollapalooza', 'Lollapalooza-2012', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (350, 41, 1, 350, 'CRIAR', 301, 'LOLLAPALOOZA', 'Lollapalooza-2012', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (351, 41, 1, 351, 'CRIAR', 301, 'lualone', 'Lu-Alone', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (352, 41, 1, 352, 'CRIAR', 301, 'lugarincomum', 'Lugar-Incomum', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (353, 41, 1, 353, 'CRIAR', 301, 'lulapalusa', 'Lollapalooza-2012', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (354, 41, 1, 354, 'CRIAR', 301, 'maisvezesfavela', 'Mais-X-Favela', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (355, 41, 1, 355, 'CRIAR', 301, 'Maisvezesfavela', 'Mais-X-Favela', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (356, 41, 1, 356, 'CRIAR', 301, 'maisxfavela', 'Mais-X-Favela', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (357, 41, 1, 357, 'CRIAR', 301, 'malandro', 'Vida-de-Mallandro', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (358, 41, 1, 358, 'CRIAR', 301, 'malicia', 'Malicia', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (359, 41, 1, 359, 'CRIAR', 301, 'mapadopremio', 'Premio-Multishow-2011/Noticias/Saiba-como-chegar-a-premiacao.shtml', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (360, 41, 1, 360, 'CRIAR', 301, 'mariagaduaovivo', 'Maria-Gadu-Ao-Vivo', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (361, 41, 1, 361, 'CRIAR', 301, 'mariagadu', 'Maria-Gadu-Ao-Vivo', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (362, 41, 1, 362, 'CRIAR', 301, 'megarampa', 'Megarampa', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (363, 41, 1, 363, 'CRIAR', 301, 'meninasdapraia', 'Meninas-da-Praia', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (364, 41, 1, 364, 'CRIAR', 301, 'meninas', 'Meninas-da-Praia', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (365, 41, 1, 365, 'CRIAR', 301, 'miamello', 'Viajandona', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (366, 41, 1, 366, 'CRIAR', 301, 'miamelo', 'Viajandona', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (367, 41, 1, 367, 'CRIAR', 301, 'Miamelo', 'Viajandona', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (368, 41, 1, 368, 'CRIAR', 301, 'michaeljackson', 'Michael-Jackson', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (369, 41, 1, 369, 'CRIAR', 301, 'minhapraia', 'Minha-Praia', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (370, 41, 1, 370, 'CRIAR', 301, 'Minhapraia', 'Minha-Praia', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (371, 41, 1, 371, 'CRIAR', 301, 'MinhaPraia', 'Minha-Praia', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (372, 41, 1, 372, 'CRIAR', 301, 'mj', 'Michael-Jackson', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (373, 41, 1, 373, 'CRIAR', 301, 'mma', 'Lendas-do-UFC', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (374, 41, 1, 374, 'CRIAR', 301, 'MMA', 'Lendas-do-UFC', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (375, 41, 1, 375, 'CRIAR', 301, 'morando', 'Morando-Sozinho', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (376, 41, 1, 376, 'CRIAR', 301, 'morandosozinho', 'Morando-Sozinho', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (377, 41, 1, 377, 'CRIAR', 301, 'motorhome', 'Motorhome-SWU', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (378, 41, 1, 378, 'CRIAR', 301, 'motorhomeswu', 'Motorhome-SWU', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (379, 41, 1, 379, 'CRIAR', 301, 'motorhomeSWU', 'Motorhome-SWU', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (380, 41, 1, 380, 'CRIAR', 301, 'MotorHomeSWU', 'Motorhome-SWU', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (381, 41, 1, 381, 'CRIAR', 301, 'muitogiro', 'Muito-Giro', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (382, 41, 1, 382, 'CRIAR', 301, 'Muitogiro', 'Muito-Giro', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (383, 41, 1, 383, 'CRIAR', 301, 'mulheresbbb', 'Mulheres-BBB', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (384, 41, 1, 384, 'CRIAR', 301, 'mulheresBBB', 'Mulheres-BBB', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (385, 41, 1, 385, 'CRIAR', 301, 'Mulheresbbb', 'Mulheres-BBB', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (386, 41, 1, 386, 'CRIAR', 301, 'multishowmusiclive', 'Multishow-Music-Live', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (387, 41, 1, 387, 'CRIAR', 301, 'multishownxzeroaovivo', 'Nx-Zero', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (388, 41, 1, 388, 'CRIAR', 301, 'multishownxzero', 'Nx-Zero', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (389, 41, 1, 389, 'CRIAR', 301, 'musica', 'Musica', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (390, 41, 1, 390, 'CRIAR', 301, 'musiclive', 'Multishow-Music-Live', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (391, 41, 1, 391, 'CRIAR', 301, 'mynerd', 'I-Love-My-Nerd', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (392, 41, 1, 392, 'CRIAR', 301, 'nafamaenalama', 'Na-Fama-e-Na-Lama', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (393, 41, 1, 393, 'CRIAR', 301, 'nafama', 'Na-Fama-e-Na-Lama', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (394, 41, 1, 394, 'CRIAR', 301, 'nalu', 'Nalu-Pelo-Mundo', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (395, 41, 1, 395, 'CRIAR', 301, 'nalu-pelo-mundo', 'Nalu-Pelo-Mundo', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (396, 41, 1, 396, 'CRIAR', 301, 'nalupelomundo', 'Nalu-Pelo-Mundo', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (397, 41, 1, 397, 'CRIAR', 301, 'NaluPeloMundo', 'Nalu-Pelo-Mundo', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (398, 41, 1, 398, 'CRIAR', 301, 'naocontalaemcasa', 'Nao-Conta-La-em-Casa', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (399, 41, 1, 399, 'CRIAR', 301, 'Naocontalaemcasa', 'Nao-Conta-La-em-Casa', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (400, 41, 1, 400, 'CRIAR', 301, 'NaoContaLaEmCasa', 'Nao-Conta-La-em-Casa', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (401, 41, 1, 401, 'CRIAR', 301, 'naoconta', 'Nao-Conta-La-em-Casa', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (402, 41, 1, 402, 'CRIAR', 301, 'natrilhacerta', 'Na-Trilha-Certa', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (403, 41, 1, 403, 'CRIAR', 301, 'natrilha', 'Na-Trilha-Certa', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (404, 41, 1, 404, 'CRIAR', 301, 'nclc', 'Nao-Conta-La-em-Casa', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (405, 41, 1, 405, 'CRIAR', 301, 'NCLC', 'Nao-Conta-La-em-Casa', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (406, 41, 1, 406, 'CRIAR', 301, 'no-caminho', 'No-Caminho', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (407, 41, 1, 407, 'CRIAR', 301, 'nocaminho', 'No-Caminho', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (408, 41, 1, 408, 'CRIAR', 301, 'Nocaminho', 'No-Caminho', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (409, 41, 1, 409, 'CRIAR', 301, 'NoCaminho', 'No-Caminho', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (410, 41, 1, 410, 'CRIAR', 301, 'n..?o-conta-la-em-casa', 'Nao-Conta-La-em-Casa', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (411, 41, 1, 411, 'CRIAR', 301, 'nos3', 'Nos-3', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (412, 41, 1, 412, 'CRIAR', 301, 'nostres', 'Nos-3', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (413, 41, 1, 413, 'CRIAR', 301, 'nxzeroaovivo', 'Nx-Zero', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (414, 41, 1, 414, 'CRIAR', 301, 'oassuntoemusica', 'O-Assunto-e-Musica', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (415, 41, 1, 415, 'CRIAR', 301, 'olhaisso', 'Olha-Isso', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (416, 41, 1, 416, 'CRIAR', 301, 'olivias', 'Olivias-na-Tv', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (417, 41, 1, 417, 'CRIAR', 301, 'oliviasnatv', 'Olivias-na-Tv', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (418, 41, 1, 418, 'CRIAR', 301, 'oliviasnaTV', 'Olivias-na-Tv', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (419, 41, 1, 419, 'CRIAR', 301, 'openbar', 'Open-Bar', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (420, 41, 1, 420, 'CRIAR', 301, 'operacaos2', 'Operacao-S2', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (421, 41, 1, 421, 'CRIAR', 301, 'osbuchas', 'Os-Buchas', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (422, 41, 1, 422, 'CRIAR', 301, 'Osbuchas', 'Os-Buchas', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (423, 41, 1, 423, 'CRIAR', 301, 'oscarfreire279', 'Oscar-Freire-279', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (424, 41, 1, 424, 'CRIAR', 301, 'Oscarfreire279', 'Oscar-Freire-279', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (425, 41, 1, 425, 'CRIAR', 301, 'oscarfreire', 'Oscar-Freire-279', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (426, 41, 1, 426, 'CRIAR', 301, 'Oscarfreire', 'Oscar-Freire-279', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (427, 41, 1, 427, 'CRIAR', 301, 'osembarcados', 'Embarcados', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (428, 41, 1, 428, 'CRIAR', 301, 'osfiguras', 'Os-Figuras', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (429, 41, 1, 429, 'CRIAR', 301, 'Osfiguras', 'Os-Figuras', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (430, 41, 1, 430, 'CRIAR', 301, 'osgozadores', 'Os-Gozadores', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (431, 41, 1, 431, 'CRIAR', 301, 'ossoduro', 'Osso-Duro', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (432, 41, 1, 432, 'CRIAR', 301, 'outros500', 'Outros-500', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (433, 41, 1, 433, 'CRIAR', 301, 'Outros500', 'Outros-500', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (434, 41, 1, 434, 'CRIAR', 301, 'outroslugares', 'Outros-Lugares', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (435, 41, 1, 435, 'CRIAR', 301, 'palcopretinho', 'Planeta-Atlantida-2012/#alternativo', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (436, 41, 1, 436, 'CRIAR', 301, 'papo-calcinha', 'Papo-Calcinha', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (437, 41, 1, 437, 'CRIAR', 301, 'papocalcinha', 'Papo-Calcinha', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (438, 41, 1, 438, 'CRIAR', 301, 'Papocalcinha', 'Papo-Calcinha', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (439, 41, 1, 439, 'CRIAR', 301, 'PapoCalcinha', 'Papo-Calcinha', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (440, 41, 1, 440, 'CRIAR', 301, 'papodepolicia', 'Papo-de-Policia', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (441, 41, 1, 441, 'CRIAR', 301, 'paralamasaovivo', 'DVD-Paralamas-Ao-Vivo', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (442, 41, 1, 442, 'CRIAR', 301, 'paralamasdosucesso', 'DVD-Paralamas-Ao-Vivo', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (443, 41, 1, 443, 'CRIAR', 301, 'paralamas', 'DVD-Paralamas-Ao-Vivo', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (444, 41, 1, 444, 'CRIAR', 301, 'paralamasmultishow', 'DVD-Paralamas-Ao-Vivo', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (445, 41, 1, 445, 'CRIAR', 301, 'paulafernandesaovivo', 'Show-Paula-Fernandes', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (446, 41, 1, 446, 'CRIAR', 301, 'paulafernandes', 'Show-Paula-Fernandes', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (447, 41, 1, 447, 'CRIAR', 301, 'paulafernandezaovivo', 'Show-Paula-Fernandes', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (448, 41, 1, 448, 'CRIAR', 301, 'paulafernandez', 'Show-Paula-Fernandes', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (449, 41, 1, 449, 'CRIAR', 301, 'paullafernandesaovivo', 'Show-Paula-Fernandes', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (450, 41, 1, 450, 'CRIAR', 301, 'paullafernandes', 'Show-Paula-Fernandes', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (451, 41, 1, 451, 'CRIAR', 301, 'paullafernandezaovivo', 'Show-Paula-Fernandes', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (452, 41, 1, 452, 'CRIAR', 301, 'paullafernandez', 'Show-Paula-Fernandes', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (453, 41, 1, 453, 'CRIAR', 301, 'paulmccartney', 'Paul-McCartney', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (454, 41, 1, 454, 'CRIAR', 301, 'paul', 'Paul-McCartney', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (455, 41, 1, 455, 'CRIAR', 301, 'Paul', 'Paul-McCartney', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (456, 41, 1, 456, 'CRIAR', 301, 'pegadoras', 'As-Pegadoras', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (457, 41, 1, 457, 'CRIAR', 301, 'penochao', 'Pe-no-Chao', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (458, 41, 1, 458, 'CRIAR', 301, 'Penochao', 'Pe-no-Chao', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (459, 41, 1, 459, 'CRIAR', 301, 'pensanisso', 'Pensa-Nisso', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (460, 41, 1, 460, 'CRIAR', 301, 'planetaatlantida2011', 'Planeta-Atlantida-2011', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (461, 41, 1, 461, 'CRIAR', 301, 'planetaatlantida', 'Planeta-Atlantida-2012', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (462, 41, 1, 462, 'CRIAR', 301, 'Planeta-Atlantida', 'Planeta-Atlantida-2012', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (463, 41, 1, 463, 'CRIAR', 301, 'planeta', 'Planeta-Atlantida-2012', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (464, 41, 1, 464, 'CRIAR', 301, 'pmh', 'Premio-Multishow-de-Humor', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (465, 41, 1, 465, 'CRIAR', 301, 'pmmb11', 'Premio-Multishow-2011', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (466, 41, 1, 466, 'CRIAR', 301, 'pmmb', 'Premio-Multishow-2011', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (467, 41, 1, 467, 'CRIAR', 301, 'PMMB', 'Premio-Multishow-2011', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (468, 41, 1, 468, 'CRIAR', 301, 'policia', 'Papo-de-Policia', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (469, 41, 1, 469, 'CRIAR', 301, 'praia', 'Meninas-da-Praia', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (470, 41, 1, 470, 'CRIAR', 301, 'premiodehumor', 'Premio-Multishow-de-Humor', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (471, 41, 1, 471, 'CRIAR', 301, 'premiohumor', 'Premio-Multishow-de-Humor', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (472, 41, 1, 472, 'CRIAR', 301, 'premiomultishowdehumor', 'Premio-Multishow-de-Humor', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (473, 41, 1, 473, 'CRIAR', 301, 'premiomultishow', 'Premio-Multishow-2011', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (474, 41, 1, 474, 'CRIAR', 301, 'Premio-Multishow', 'Premio-Multishow-2011', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (475, 41, 1, 475, 'CRIAR', 301, 'premio', 'Premio-Multishow-2011', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (476, 41, 1, 476, 'CRIAR', 301, 'presencavip', 'Presenca-VIP', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (477, 41, 1, 477, 'CRIAR', 301, 'pretinho', 'Planeta-Atlantida-2012/#alternativo', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (478, 41, 1, 478, 'CRIAR', 301, 'programacao', 'Programacao/horarios.shtml', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (479, 41, 1, 479, 'CRIAR', 301, 'programao', 'Programao', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (480, 41, 1, 480, 'CRIAR', 301, 'programas', 'Programas', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (481, 41, 1, 481, 'CRIAR', 301, 'promocao', 'Promocoes', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (482, 41, 1, 482, 'CRIAR', 301, 'promocoes', 'Promocoes', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (483, 41, 1, 483, 'CRIAR', 301, 'quase-anonimos', 'Quase-Anonimos', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (484, 41, 1, 484, 'CRIAR', 301, 'quaseanonimos', 'Quase-Anonimos', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (485, 41, 1, 485, 'CRIAR', 301, 'Quaseanonimos', 'Quase-Anonimos', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (486, 41, 1, 486, 'CRIAR', 301, 'QuaseAnonimos', 'Quase-Anonimos', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (487, 41, 1, 487, 'CRIAR', 301, 'queroserumcineasta', 'Quero-ser-um-cineasta', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (488, 41, 1, 488, 'CRIAR', 301, 'Queroserumcineasta', 'Quero-ser-um-cineasta', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (489, 41, 1, 489, 'CRIAR', 301, 'raimundos', 'DVD-Raimundos-Roda-Viva', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (490, 41, 1, 490, 'CRIAR', 301, 'raimundosrodaviva', 'DVD-Raimundos-Roda-Viva', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (491, 41, 1, 491, 'CRIAR', 301, 'rir', 'Rock-in-Rio', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (492, 41, 1, 492, 'CRIAR', 301, 'Rir', 'Rock-in-Rio', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (493, 41, 1, 493, 'CRIAR', 301, 'rockestrada', 'Rock-Estrada', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (494, 41, 1, 494, 'CRIAR', 301, 'rockinrio', 'Rock-in-Rio', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (495, 41, 1, 495, 'CRIAR', 301, 'Rockinrio', 'Rock-in-Rio', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (496, 41, 1, 496, 'CRIAR', 301, 'rock', 'Rock-in-Rio', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (497, 41, 1, 497, 'CRIAR', 301, 'Rock', 'Rock-in-Rio', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (498, 41, 1, 498, 'CRIAR', 301, 'rockstrada', 'Rock-Estrada', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (499, 41, 1, 499, 'CRIAR', 301, 'sejoga', 'Se-Joga', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (500, 41, 1, 500, 'CRIAR', 301, 'semdestino', 'Sem-Destino', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (501, 41, 1, 501, 'CRIAR', 301, 'Semdestino', 'Sem-Destino', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (502, 41, 1, 502, 'CRIAR', 301, 'sensacionalista', 'Sensacionalista', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (503, 41, 1, 503, 'CRIAR', 301, 'sera', 'Sera-que-Faz-Sentido', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (504, 41, 1, 504, 'CRIAR', 301, 'seraquefazsentido', 'Sera-que-Faz-Sentido', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (505, 41, 1, 505, 'CRIAR', 301, 'sergiomalandro', 'Vida-de-Mallandro', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (506, 41, 1, 506, 'CRIAR', 301, 'sergiomallandro', 'Vida-de-Mallandro', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (507, 41, 1, 507, 'CRIAR', 301, 'sergueimultishow', 'Serguei-Rock-Show', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (508, 41, 1, 508, 'CRIAR', 301, 'serguei', 'Serguei-Rock-Show', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (509, 41, 1, 509, 'CRIAR', 301, 'sergueirock', 'Serguei-Rock-Show', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (510, 41, 1, 510, 'CRIAR', 301, 'sergueirockshow', 'Serguei-Rock-Show', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (511, 41, 1, 511, 'CRIAR', 301, 'serhumano', 'Ser-Humano', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (512, 41, 1, 512, 'CRIAR', 301, 'sexcetera', 'Sexcetera', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (513, 41, 1, 513, 'CRIAR', 301, 'sexo', 'Sexy', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (514, 41, 1, 514, 'CRIAR', 301, 'sexshakecabare', 'Sexshake-Cabare', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (515, 41, 1, 515, 'CRIAR', 301, 'Sexshakecabare', 'Sexshake-Cabare', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (516, 41, 1, 516, 'CRIAR', 301, 'sexy', 'Sexy', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (517, 41, 1, 517, 'CRIAR', 301, 'showagridoce', 'Show-Agridoce', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (518, 41, 1, 518, 'CRIAR', 301, 'showkidabelha', 'Show-Kid-Abelha', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (519, 41, 1, 519, 'CRIAR', 301, 'SHOWKIDABELHA', 'Show-Kid-Abelha', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (520, 41, 1, 520, 'CRIAR', 301, 'showpaulafernandes', 'Show-Paula-Fernandes', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (521, 41, 1, 521, 'CRIAR', 301, 'showpaulafernandez', 'Show-Paula-Fernandes', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (522, 41, 1, 522, 'CRIAR', 301, 'showpaullafernandes', 'Show-Paula-Fernandes', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (523, 41, 1, 523, 'CRIAR', 301, 'showsaovivo', 'Shows-Ao-Vivo', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (524, 41, 1, 524, 'CRIAR', 301, 'SHOWSAOVIVO', 'Shows-Ao-Vivo', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (525, 41, 1, 525, 'CRIAR', 301, 'showzecapagodinho', 'Show-Zeca-Pagodinho', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (526, 41, 1, 526, 'CRIAR', 301, 'skankaovivo', 'Skank-Ao-Vivo', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (527, 41, 1, 527, 'CRIAR', 301, 'skank', 'Skank-Ao-Vivo', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (528, 41, 1, 528, 'CRIAR', 301, 'skins', 'Skins', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (529, 41, 1, 529, 'CRIAR', 301, 'som&areia', 'Som-e-Areia', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (530, 41, 1, 530, 'CRIAR', 301, 'someareia', 'Som-e-Areia', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (531, 41, 1, 531, 'CRIAR', 301, 'Someareia', 'Som-e-Areia', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (532, 41, 1, 532, 'CRIAR', 301, 'sound', 'Sound', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (533, 41, 1, 533, 'CRIAR', 301, 'swu2011', 'SWU-2011', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (534, 41, 1, 534, 'CRIAR', 301, 'Swu2011', 'SWU-2011', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (535, 41, 1, 535, 'CRIAR', 301, 'swu', 'SWU-2011', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (536, 41, 1, 536, 'CRIAR', 301, 'Swu', 'SWU-2011', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (537, 41, 1, 537, 'CRIAR', 301, 'SWU', 'SWU-2011', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (538, 41, 1, 538, 'CRIAR', 301, 'thebeatles', 'Beatles', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (539, 41, 1, 539, 'CRIAR', 301, 'thecity', 'The-City', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (540, 41, 1, 540, 'CRIAR', 301, 'thehills', 'The-Hills', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (541, 41, 1, 541, 'CRIAR', 301, 'theultimatefightbrasil', 'The-Ultimate-Fighter-Brasil', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (542, 41, 1, 542, 'CRIAR', 301, 'theultimatefight', 'The-Ultimate-Fighter-Brasil', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (543, 41, 1, 543, 'CRIAR', 301, 'timbetalive', 'TIM-Beta-Live', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (544, 41, 1, 544, 'CRIAR', 301, 'tim', 'TIM-Beta-Live', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (545, 41, 1, 545, 'CRIAR', 301, 'TIM', 'TIM-Beta-Live', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (546, 41, 1, 546, 'CRIAR', 301, 'todomundo', 'Todo-Mundo', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (547, 41, 1, 547, 'CRIAR', 301, 'Todomundo', 'Todo-Mundo', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (548, 41, 1, 548, 'CRIAR', 301, 'tufbrasil', 'The-Ultimate-Fighter-Brasil', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (549, 41, 1, 549, 'CRIAR', 301, 'tuf', 'The-Ultimate-Fighter-Brasil', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (550, 41, 1, 550, 'CRIAR', 301, 'TUF', 'The-Ultimate-Fighter-Brasil', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (551, 41, 1, 551, 'CRIAR', 301, 'tvneja', 'TVNeja', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (552, 41, 1, 552, 'CRIAR', 301, 'tvze', 'TVZ', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (553, 41, 1, 553, 'CRIAR', 301, 'tvzepremio', 'TVZ', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (554, 41, 1, 554, 'CRIAR', 301, 'tvz', 'TVZ', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (555, 41, 1, 555, 'CRIAR', 301, 'tvz/tvze', 'TVZ', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (556, 41, 1, 556, 'CRIAR', 301, 'TVZ/TVZe', 'TVZ', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (557, 41, 1, 557, 'CRIAR', 301, 'u2360', 'U2-360', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (558, 41, 1, 558, 'CRIAR', 301, 'u2', 'U2-360', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (559, 41, 1, 559, 'CRIAR', 301, 'ufc', 'The-Ultimate-Fighter-Brasil', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (560, 41, 1, 560, 'CRIAR', 301, 'UFC', 'The-Ultimate-Fighter-Brasil', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (561, 41, 1, 561, 'CRIAR', 301, 'umchopcom', 'Um-chope-com', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (562, 41, 1, 562, 'CRIAR', 301, 'umchopecom', 'Um-chope-com', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (563, 41, 1, 563, 'CRIAR', 301, 'umchoppcom', 'Um-chope-com', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (564, 41, 1, 564, 'CRIAR', 301, 'urbano', 'Urbano', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (565, 41, 1, 565, 'CRIAR', 301, 'vaipraonde', 'Vai-Pra-Onde', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (566, 41, 1, 566, 'CRIAR', 301, 'vendemoscadeiras', 'Vendemos-Cadeiras', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (567, 41, 1, 567, 'CRIAR', 301, 'vendemos', 'Vendemos-Cadeiras', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (568, 41, 1, 568, 'CRIAR', 301, 'veraomultishow', 'Verao-Multishow', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (569, 41, 1, 569, 'CRIAR', 301, 'verao', 'Verao-Multishow', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (570, 41, 1, 570, 'CRIAR', 301, 'veraoquevem', 'Verao-Que-Vem', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (571, 41, 1, 571, 'CRIAR', 301, '+vezesfavela', 'Mais-X-Favela', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (572, 41, 1, 572, 'CRIAR', 301, 'viagem', 'Viagem', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (573, 41, 1, 573, 'CRIAR', 301, 'viagemsemfim', 'Viagem-Sem-Fim', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (574, 41, 1, 574, 'CRIAR', 301, 'viagens', 'Viagem', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (575, 41, 1, 575, 'CRIAR', 301, 'viajandona', 'Viajandona', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (576, 41, 1, 576, 'CRIAR', 301, 'vidademalandro', 'Vida-de-Mallandro', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (577, 41, 1, 577, 'CRIAR', 301, 'vidademallandro', 'Vida-de-Mallandro', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (578, 41, 1, 578, 'CRIAR', 301, 'videos', 'Videos', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (579, 41, 1, 579, 'CRIAR', 301, 'vip', 'Presenca-VIP', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (580, 41, 1, 580, 'CRIAR', 301, 'VIP', 'Presenca-VIP', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (581, 41, 1, 581, 'CRIAR', 301, 'voltaaomundo', 'Volta-ao-Mundo', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (582, 41, 1, 582, 'CRIAR', 301, 'vote', 'TVZ/Vote', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (583, 41, 1, 583, 'CRIAR', 301, '+xfavela', 'Mais-X-Favela', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (584, 41, 1, 584, 'CRIAR', 301, 'zecapagodinhoaovivo', 'Show-Zeca-Pagodinho', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (585, 41, 1, 585, 'CRIAR', 301, 'zecapagodinho', 'Show-Zeca-Pagodinho', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (586, 41, 1, 586, 'CRIAR', 301, 'zonadoagriao', 'Zona-do-Agriao', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (587, 41, 9, 587, 'CRIAR', 301, 'aplicativos', 'app', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (588, 41, 9, 588, 'CRIAR', 301, 'apps', 'app', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (589, 41, 9, 589, 'CRIAR', 301, 'Docs-Globosat-HD/Os-Kennedy--O-Destino-de-uma-Familia.shtml', 'GNT-doc/Os-Kennedy--O-Destino-de-uma-Familia.shtml', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (590, 41, 9, 590, 'CRIAR', 301, 'Edgard-no-Ar', 'Edgard-no-ar', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (591, 41, 9, 591, 'CRIAR', 301, 'faq', 'Conheca-o-Muu.shtml', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (592, 41, 9, 592, 'CRIAR', 301, 'faq', 'Perguntas-e-Respostas.shtml', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (593, 41, 9, 593, 'CRIAR', 301, 'Filmes/Aurora-Boreal--Dublado-.shtml', 'Filmes', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (594, 41, 9, 594, 'CRIAR', 301, 'Filmes/Aurora-Boreal--Legendado-.shtml', 'Filmes', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (595, 41, 9, 595, 'CRIAR', 301, 'Filmes/Caro-Diario--Legendado-.shtml', 'Filmes', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (596, 41, 9, 596, 'CRIAR', 301, 'Filmes/Chop-Shop--Legendado-.shtml', 'Filmes', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (597, 41, 9, 597, 'CRIAR', 301, 'Filmes/Eu-Realmente-Odeio-o-Meu-Trabalho--Legendado-.shtml', 'Filmes', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (598, 41, 9, 598, 'CRIAR', 301, 'Filmes/Lembrancas-de-uma-Vida--Legendado-.shtml', 'Filmes', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (599, 41, 9, 599, 'CRIAR', 301, 'Filmes/Mascara-de-Sangue--Legendado-.shtml', 'Filmes', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (600, 41, 9, 600, 'CRIAR', 301, 'Filmes/O-Assassinato-de-John-Lennon--Legendado-.shtml', 'Filmes', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (601, 41, 9, 601, 'CRIAR', 301, 'Filmes/Operacao-Moscou--Legendado-.shtml', 'Filmes', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (602, 41, 9, 602, 'CRIAR', 301, 'Filmes/O-Violino--Legendado-.shtml', 'Filmes', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (603, 41, 9, 603, 'CRIAR', 301, 'Filmes/Paixao-Suicida--Dublado-.shtml', 'Filmes', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (604, 41, 9, 604, 'CRIAR', 301, 'Filmes/Paixao-Suicida--Legendado-.shtml', 'Filmes', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (605, 41, 9, 605, 'CRIAR', 301, 'Filmes/Terra-e-Liberdade--Legendado-.shtml', 'Filmes', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (606, 41, 9, 606, 'CRIAR', 301, 'Filmes/Tickets--Legendado-.shtml', 'Filmes', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (607, 41, 9, 607, 'CRIAR', 301, 'Pe-no-Chao-Multishow', 'Pe-no-Chao', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (608, 41, 9, 608, 'CRIAR', 301, 'Rock-in-Rio', 'Especial-Rock-in-Rio', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (609, 41, 9, 609, 'CRIAR', 301, 'Rumo-a-Londres/Veja-a-historia-de-atletas-vencedores.shtml', 'Rumo-a-Londres', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (610, 41, 9, 610, 'CRIAR', 301, 'Um-mundo-pra-chamar-de-seu', 'Um-Mundo-pra-Chamar-de-Seu', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (611, 41, 7, 611, 'CRIAR', 301, 'abc', 'videos/abc', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (612, 41, 7, 612, 'CRIAR', 301, 'albumdobrasileirao', 'site/album.html', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (613, 41, 7, 613, 'CRIAR', 301, 'america-mg', 'videos/america-mg', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (614, 41, 7, 614, 'CRIAR', 301, 'americamg', 'videos/america-mg', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (615, 41, 7, 615, 'CRIAR', 301, 'americamineiro', 'videos/america-mg', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (616, 41, 7, 616, 'CRIAR', 301, 'americana', 'videos/americana', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (617, 41, 7, 617, 'CRIAR', 301, 'america', 'videos/america-mg', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (618, 41, 7, 618, 'CRIAR', 301, 'arena', 'site/programas/arena-sportv', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (619, 41, 7, 619, 'CRIAR', 301, 'arena-sportv', 'site/programas/arena-sportv', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (620, 41, 7, 620, 'CRIAR', 301, 'arenasportv', 'site/programas/arena-sportv', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (621, 41, 7, 621, 'CRIAR', 301, 'asa-arapiraca', 'videos/asa', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (622, 41, 7, 622, 'CRIAR', 301, 'asaarapiraca', 'videos/asa', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (623, 41, 7, 623, 'CRIAR', 301, 'asa-de-arapiraca', 'videos/asa', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (624, 41, 7, 624, 'CRIAR', 301, 'asa', 'videos/asa', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (625, 41, 7, 625, 'CRIAR', 301, 'atelticoparanaense', 'videos/atletico-pr', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (626, 41, 7, 626, 'CRIAR', 301, 'atleticogoianiense', 'videos/atletico-go', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (627, 41, 7, 627, 'CRIAR', 301, 'atletico-goiano', 'videos/atletico-go', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (628, 41, 7, 628, 'CRIAR', 301, 'atletico-go', 'videos/atletico-go', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (629, 41, 7, 629, 'CRIAR', 301, 'atleticogo', 'videos/atletico-go', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (630, 41, 7, 630, 'CRIAR', 301, 'atletico-mg', 'videos/atletico-mg', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (631, 41, 7, 631, 'CRIAR', 301, 'atleticomineiro', 'videos/atletico-mg', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (632, 41, 7, 632, 'CRIAR', 301, 'atletico-paranaense', 'videos/atletico-pr', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (633, 41, 7, 633, 'CRIAR', 301, 'atletico-pr', 'videos/atletico-pr', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (634, 41, 7, 634, 'CRIAR', 301, 'atleticopr', 'videos/atletico-pr', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (635, 41, 7, 635, 'CRIAR', 301, 'atletismo', 'videos/atletismo', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (636, 41, 7, 636, 'CRIAR', 301, 'avai', 'videos/avai', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (637, 41, 7, 637, 'CRIAR', 301, 'bahia', 'videos/bahia', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (638, 41, 7, 638, 'CRIAR', 301, 'bando-de-louco', 'videos/corinthians', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (639, 41, 7, 639, 'CRIAR', 301, 'basquete', 'videos/basquete', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (640, 41, 7, 640, 'CRIAR', 301, 'bem-amigos', 'site/programas/bem-amigos', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (641, 41, 7, 641, 'CRIAR', 301, 'bemamigos', 'site/programas/bem-amigos', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (642, 41, 7, 642, 'CRIAR', 301, 'blogdogaciba', 'platb/blog-do-gaciba', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (643, 41, 7, 643, 'CRIAR', 301, 'blogs', 'site/blogs', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (644, 41, 7, 644, 'CRIAR', 301, 'bolaocampeao', 'site/bolao', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (645, 41, 7, 645, 'CRIAR', 301, 'bolao-da-copa', 'site/bolao', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (646, 41, 7, 646, 'CRIAR', 301, 'bolao-dacopa', 'site/bolao', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (647, 41, 7, 647, 'CRIAR', 301, 'bolaoda-copa', 'site/bolao', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (648, 41, 7, 648, 'CRIAR', 301, 'bolaodacopa', 'site/bolao', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (649, 41, 7, 649, 'CRIAR', 301, 'bolao', 'site/bolao', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (650, 41, 7, 650, 'CRIAR', 301, 'botafogo', 'videos/botafogo', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (651, 41, 7, 651, 'CRIAR', 301, 'bragantino', 'videos/bragantino', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (652, 41, 7, 652, 'CRIAR', 301, 'brasil2012', 'site/programas/brasil-2012', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (653, 41, 7, 653, 'CRIAR', 301, 'camisa', 'camisas', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (654, 41, 7, 654, 'CRIAR', 301, 'cartolafc2010', 'cartola-fc', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (655, 41, 7, 655, 'CRIAR', 301, 'CARTOLAFC', 'cartola-fc', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (656, 41, 7, 656, 'CRIAR', 301, 'cartola-fc', 'site/cartola-fc', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (657, 41, 7, 657, 'CRIAR', 301, 'cartolafc', 'site/cartola-fc', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (658, 41, 7, 658, 'CRIAR', 301, 'CARTOLA', 'cartola-fc', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (659, 41, 7, 659, 'CRIAR', 301, 'cartola', 'site/cartola-fc', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (660, 41, 7, 660, 'CRIAR', 301, 'ceara', 'videos/ceara', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (661, 41, 7, 661, 'CRIAR', 301, 'chutecerto', 'site/bolao', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (662, 41, 7, 662, 'CRIAR', 301, 'coelho', 'videos/america-mg', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (663, 41, 7, 663, 'CRIAR', 301, 'colorado', 'videos/internacional', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (664, 41, 7, 664, 'CRIAR', 301, 'combate', 'site/eventos/combate', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (665, 41, 7, 665, 'CRIAR', 301, 'copaamericadebasquete', 'site/eventos/copa-america-de-basquete/index.html', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (666, 41, 7, 666, 'CRIAR', 301, 'copaamericadefutsal', 'site/eventos/copa-america-de-futsal', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (667, 41, 7, 667, 'CRIAR', 301, 'copadomundodeginastica', 'site/eventos/copa-do-mundo-de-ginastica', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (668, 41, 7, 668, 'CRIAR', 301, 'copa', 'videos/copa-2010', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (669, 41, 7, 669, 'CRIAR', 301, 'corinthians', 'videos/corinthians', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (670, 41, 7, 670, 'CRIAR', 301, 'coritiba', 'videos/coritiba', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (671, 41, 7, 671, 'CRIAR', 301, 'coxa', 'videos/coritiba', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (672, 41, 7, 672, 'CRIAR', 301, 'criciuma', 'videos/criciuma', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (673, 41, 7, 673, 'CRIAR', 301, 'cruzeiro', 'videos/cruzeiro', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (674, 41, 7, 674, 'CRIAR', 301, 'diariosdobonfa', 'site/programas/diarios-do-bonfa/index.html', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (675, 41, 7, 675, 'CRIAR', 301, 'duque-de-caxias', 'videos/duque-de-caxias', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (676, 41, 7, 676, 'CRIAR', 301, 'duquedecaxias', 'videos/duque-de-caxias', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (677, 41, 7, 677, 'CRIAR', 301, 'e-gol', 'site/programas/e-gol', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (678, 41, 7, 678, 'CRIAR', 301, 'egol', 'site/programas/e-gol', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (679, 41, 7, 679, 'CRIAR', 301, 'ehgol', 'site/programas/e-gol', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (680, 41, 7, 680, 'CRIAR', 301, 'esporte-bahia', 'videos/bahia', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (681, 41, 7, 681, 'CRIAR', 301, 'esportemotor', 'videos/esportes-a-motor', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (682, 41, 7, 682, 'CRIAR', 301, 'esportes-a-motor', 'videos/esportes-a-motor', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (683, 41, 7, 683, 'CRIAR', 301, 'esportes-aquaticos', 'videos/esportes-aquaticos', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (684, 41, 7, 684, 'CRIAR', 301, 'esportesaquaticos', 'videos/esportes-aquaticos', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (685, 41, 7, 685, 'CRIAR', 301, 'esportes-radicais', 'videos/esportes-radicais', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (686, 41, 7, 686, 'CRIAR', 301, 'expresso-do-esporte', 'site/programas/expresso-do-esporte', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (687, 41, 7, 687, 'CRIAR', 301, 'expressodoesporte', 'site/programas/expresso-do-esporte', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (688, 41, 7, 688, 'CRIAR', 301, 'falacampeao', 'fala-campeao', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (689, 41, 7, 689, 'CRIAR', 301, 'figueirense', 'videos/figueirense', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (690, 41, 7, 690, 'CRIAR', 301, 'flamengo', 'videos/flamengo', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (691, 41, 7, 691, 'CRIAR', 301, 'fla', 'videos/flamengo', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (692, 41, 7, 692, 'CRIAR', 301, 'fluminense', 'videos/fluminense', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (693, 41, 7, 693, 'CRIAR', 301, 'flu', 'videos/fluminense', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (694, 41, 7, 694, 'CRIAR', 301, 'fluzao', 'videos/fluminense', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (695, 41, 7, 695, 'CRIAR', 301, 'fogao', 'videos/botafogo', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (696, 41, 7, 696, 'CRIAR', 301, 'fora-do-eixo', 'site/programas/fora-do-eixo', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (697, 41, 7, 697, 'CRIAR', 301, 'foradoeixo', 'site/programas/fora-do-eixo', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (698, 41, 7, 698, 'CRIAR', 301, 'furacao', 'videos/atletico-pr', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (699, 41, 7, 699, 'CRIAR', 301, 'futebol-de-areia', 'site/eventos/torneios-internacionais-de-futebol-de-areia', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (700, 41, 7, 700, 'CRIAR', 301, 'futeboldeareia', 'site/eventos/torneios-internacionais-de-futebol-de-areia', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (701, 41, 7, 701, 'CRIAR', 301, 'futebol', 'videos/futebol', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (702, 41, 7, 702, 'CRIAR', 301, 'futsal', 'videos/futsal', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (703, 41, 7, 703, 'CRIAR', 301, 'galo', 'videos/atletico-mg', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (704, 41, 7, 704, 'CRIAR', 301, 'gavioes-da-fiel', 'videos/corinthians', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (705, 41, 7, 705, 'CRIAR', 301, 'ginastica', 'videos/ginastica', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (706, 41, 7, 706, 'CRIAR', 301, 'goiais', 'videos/goiais', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (707, 41, 7, 707, 'CRIAR', 301, 'golfe-brasil', 'site/programas/golfe-brasil', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (708, 41, 7, 708, 'CRIAR', 301, 'golfebrasil', 'site/programas/golfe-brasil', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (709, 41, 7, 709, 'CRIAR', 301, 'gremio-prudente', 'videos/prudente', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (710, 41, 7, 710, 'CRIAR', 301, 'gremio', 'videos/gremio', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (711, 41, 7, 711, 'CRIAR', 301, 'guarani', 'videos/guarani', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (712, 41, 7, 712, 'CRIAR', 301, 'icasa', 'videos/icasa', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (713, 41, 7, 713, 'CRIAR', 301, 'institucional', 'site/institucional.html', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (714, 41, 7, 714, 'CRIAR', 301, 'internacional', 'videos/internacional', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (715, 41, 7, 715, 'CRIAR', 301, 'inter', 'videos/internacional', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (716, 41, 7, 716, 'CRIAR', 301, 'ituiutaba', 'videos/ituiutaba', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (717, 41, 7, 717, 'CRIAR', 301, 'jogosmundiaismilitares', 'videos/jogos-mundiais-militares', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (718, 41, 7, 718, 'CRIAR', 301, 'judo', 'site/eventos/torneios-de-judo', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (719, 41, 7, 719, 'CRIAR', 301, 'lbf', 'site/eventos/liga-de-basquete-feminino', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (720, 41, 7, 720, 'CRIAR', 301, 'ligafutsal', 'site/eventos/liga-futsal', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (721, 41, 7, 721, 'CRIAR', 301, 'linha-de-chegada', 'site/programas/linha-de-chegada', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (722, 41, 7, 722, 'CRIAR', 301, 'linhadechegada', 'site/programas/linha-de-chegada', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (723, 41, 7, 723, 'CRIAR', 301, 'lutas', 'videos/lutas', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (724, 41, 7, 724, 'CRIAR', 301, 'masters1000', 'site/eventos/masters-1000', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (725, 41, 7, 725, 'CRIAR', 301, '"Match""^/chute-certo/?$"""', 'site/bolao', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (726, 41, 7, 726, 'CRIAR', 301, '"Match""^/programacao/?$"""', 'site/programacao', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (727, 41, 7, 727, 'CRIAR', 301, 'mengao', 'videos/flamengo', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (728, 41, 7, 728, 'CRIAR', 301, 'mengo', 'videos/flamengo', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (729, 41, 7, 729, 'CRIAR', 301, 'mineiro', 'videos/america-mg', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (730, 41, 7, 730, 'CRIAR', 301, 'mundialdeatletismo', 'site/eventos/mundial-indoor-de-atletismo', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (731, 41, 7, 731, 'CRIAR', 301, 'mundialdefutevolei', 'site/eventos/mundial-de-futevolei', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (732, 41, 7, 732, 'CRIAR', 301, 'mundialdemotovelocidade', 'site/eventos/mundial-de-motovelocidade', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (733, 41, 7, 733, 'CRIAR', 301, 'mundialjuvenildeatletismo', 'site/eventos/mundial-juvenil-de-atletismo', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (734, 41, 7, 734, 'CRIAR', 301, 'nautico', 'videos/nautico', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (735, 41, 7, 735, 'CRIAR', 301, 'news', 'site/programas/sportv-news', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (736, 41, 7, 736, 'CRIAR', 301, 'palmeiras', 'videos/palmeiras', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (737, 41, 7, 737, 'CRIAR', 301, 'parana', 'videos/parana', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (738, 41, 7, 738, 'CRIAR', 301, 'pegadinhadoarnaldo', 'pegadinha-do-arnaldo', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (739, 41, 7, 739, 'CRIAR', 301, 'ponte-preta', 'videos/ponte-preta', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (740, 41, 7, 740, 'CRIAR', 301, 'porco', 'videos/palmeiras', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (741, 41, 7, 741, 'CRIAR', 301, 'portuguesa', 'videos/portuguesa', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (742, 41, 7, 742, 'CRIAR', 301, 'programa-do-socio-pfc', 'videos/programa-do-socio-premiere-fc', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (743, 41, 7, 743, 'CRIAR', 301, 'redacao', 'site/programas/redacao-sportv', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (744, 41, 7, 744, 'CRIAR', 301, 'redacao-sportv', 'site/programas/redacao-sportv', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (745, 41, 7, 745, 'CRIAR', 301, 'redacaosportv', 'site/programas/redacao-sportv', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (746, 41, 7, 746, 'CRIAR', 301, 'reporter', 'site/programas/sportv-reporter', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (747, 41, 7, 747, 'CRIAR', 301, 'rugbi', 'site/eventos/sul-americano-de-rugbi-de-7', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (748, 41, 7, 748, 'CRIAR', 301, 'rumoalondres', 'site/programas/rumo-a-londres/index.html', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (749, 41, 7, 749, 'CRIAR', 301, 'salgueiro', 'videos/salgueiro-pe', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (750, 41, 7, 750, 'CRIAR', 301, 'santos', 'videos/santos', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (751, 41, 7, 751, 'CRIAR', 301, 'sao-caetano', 'videos/sao-caetano', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (752, 41, 7, 752, 'CRIAR', 301, 'sao-paulo', 'videos/sao-paulo', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (753, 41, 7, 753, 'CRIAR', 301, 'saopaulo', 'videos/sao-paulo', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (754, 41, 7, 754, 'CRIAR', 301, 'selecaosportv', 'site/programas/selecao-sportv/index.html', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (755, 41, 7, 755, 'CRIAR', 301, 'sem-barreiras', 'site/programas/sem-barreiras', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (756, 41, 7, 756, 'CRIAR', 301, 'sembarreiras', 'site/programas/sem-barreiras', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (757, 41, 7, 757, 'CRIAR', 301, 'sensei', 'site/programas/sensei-sportv', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (758, 41, 7, 758, 'CRIAR', 301, 'showbol', 'videos/showbol', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (759, 41, 7, 759, 'CRIAR', 301, 'sport', 'videos/sport', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (760, 41, 7, 760, 'CRIAR', 301, 'Sportv/2009/arena/0,,17049,00.html', 'arena', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (761, 41, 7, 761, 'CRIAR', 301, 'Sportv/2009/atletismo/0,,17045,00.html', 'atletismo', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (762, 41, 7, 762, 'CRIAR', 301, 'Sportv/2009/basquete/0,,17017,00.html', 'basquete', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (763, 41, 7, 763, 'CRIAR', 301, 'Sportv/2009/bemamigos/0,,17050,00.html', 'bemamigos', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (764, 41, 7, 764, 'CRIAR', 301, 'Sportv/2009/blogs/0,,17086,00.html', 'Blogs', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (765, 41, 7, 765, 'CRIAR', 301, 'Sportv/2009/campeonatoitaliano/0,,17188,00.html', 'campeonatoitaliano/index.shtml', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (766, 41, 7, 766, 'CRIAR', 301, 'Sportv/2009/cartolafc/0,,17026,00.html', 'cartola-fc', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (767, 41, 7, 767, 'CRIAR', 301, 'Sportv/2009/cartolafc', 'cartola-fc', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (768, 41, 7, 768, 'CRIAR', 301, 'Sportv/2009/dossiesportv/0,,17066,00.html', 'dossiesportv', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (769, 41, 7, 769, 'CRIAR', 301, 'Sportv/2009/egol/0,,17810,00.html', 'egol', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (770, 41, 7, 770, 'CRIAR', 301, 'Sportv/2009/esportemotor/0,,17018,00.html', 'esportemotor', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (771, 41, 7, 771, 'CRIAR', 301, 'Sportv/2009/esportesaquaticos/0,,17044,00.html', 'esportesaquaticos', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (772, 41, 7, 772, 'CRIAR', 301, 'Sportv/2009/expressodabola/0,,17059,00.html', 'expressodabola', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (773, 41, 7, 773, 'CRIAR', 301, 'Sportv/2009/foradoeixo/0,,17064,00.html', 'foradoeixo', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (774, 41, 7, 774, 'CRIAR', 301, 'Sportv/2009/futebol/0,,17020,00.html', 'futebol', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (775, 41, 7, 775, 'CRIAR', 301, 'Sportv/2009/futsal/0,,17021,00.html', 'futsal', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (776, 41, 7, 776, 'CRIAR', 301, 'Sportv/2009/ginastica/0,,17043,00.html', 'ginastica', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (777, 41, 7, 777, 'CRIAR', 301, 'Sportv/2009/golfebrasil/0,,17062,00.html', 'golfebrasil', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (778, 41, 7, 778, 'CRIAR', 301, 'Sportv/2009/home/0,,17009,00.html', 'index.shtml', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (779, 41, 7, 779, 'CRIAR', 301, 'Sportv/2009/home/0,,GEN1418-17941,00.html', 'barragcom', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (780, 41, 7, 780, 'CRIAR', 301, 'Sportv/2009/home/0,,MUL1414800-17009,00.html', 'Game.shtml', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (781, 41, 7, 781, 'CRIAR', 301, 'Sportv/2009/home/0,,MUL1588755-17009,00.html', 'fala-campeao/index.shtml', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (782, 41, 7, 782, 'CRIAR', 301, 'Sportv/2009/linhadechegada/0,,17056,00.html', 'linhadechegada', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (783, 41, 7, 783, 'CRIAR', 301, 'Sportv/2009/programacao/0,,17016,00.html', 'programacao', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (784, 41, 7, 784, 'CRIAR', 301, 'Sportv/2009/programacao/0,,17016,00.html', 'Programacao', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (785, 41, 7, 785, 'CRIAR', 301, 'Sportv/2009/redacao/0,,17051,00.html', 'redacaosportv', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (786, 41, 7, 786, 'CRIAR', 301, 'Sportv/2009/sembarreiras/0,,17060,00.html', 'sembarreiras', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (787, 41, 7, 787, 'CRIAR', 301, 'Sportv/2009/senseisportv/0,,17061,00.html', 'sensei', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (788, 41, 7, 788, 'CRIAR', 301, 'Sportv/2009/sportvcombate/0,,17727,00.html', 'combate', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (789, 41, 7, 789, 'CRIAR', 301, 'Sportv/2009/sportvnews/0,,17052,00.html', 'sportvnews', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (790, 41, 7, 790, 'CRIAR', 301, 'Sportv/2009/sportvreporter/0,,17065,00.html', 'sportvreporter', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (791, 41, 7, 791, 'CRIAR', 301, 'Sportv/2009/tanaarea/0,,17054,00.html', 'tanaarea', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (792, 41, 7, 792, 'CRIAR', 301, 'Sportv/2009/tenis/0,,17022,00.html', 'tenis', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (793, 41, 7, 793, 'CRIAR', 301, 'Sportv/2009/trocadepasses/0,,17053,00.html', 'trocadepasses', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (794, 41, 7, 794, 'CRIAR', 301, 'Sportv/2009/videos/0,,17088,00.html', 'videos', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (795, 41, 7, 795, 'CRIAR', 301, 'Sportv/2009/videos/0,,17943,00.html', 'fala-campeao/upload.shtml', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (796, 41, 7, 796, 'CRIAR', 301, 'Sportv/2009/volei/0,,17023,00.html', 'volei', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (797, 41, 7, 797, 'CRIAR', 301, 'Sportv/2009/zonadeimpacto/0,,17057,00.html', 'zonadeimpacto', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (798, 41, 7, 798, 'CRIAR', 301, 'Sportv/2010/chutecerto/0,,17941,00.html', 'chute-certo', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (799, 41, 7, 799, 'CRIAR', 301, 'sportv-news', 'site/programas/sportv-news', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (800, 41, 7, 800, 'CRIAR', 301, 'sportvnews', 'site/programas/sportv-news', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (801, 41, 7, 801, 'CRIAR', 301, 'sportv-reporter', 'site/programas/sportv-reporter', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (802, 41, 7, 802, 'CRIAR', 301, 'sportvreporter', 'site/programas/sportv-reporter', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (803, 41, 7, 803, 'CRIAR', 301, 'sportvtanaarea', 'site/programas/ta-na-area', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (804, 41, 7, 804, 'CRIAR', 301, 'taca-brasil-de-futsal', 'site/eventos/Taca-Brasil-de-Futsal', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (805, 41, 7, 805, 'CRIAR', 301, 'tacabrasildefutsal', 'site/eventos/Taca-Brasil-de-Futsal', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (806, 41, 7, 806, 'CRIAR', 301, 'ta-na-area', 'site/programas/ta-na-area', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (807, 41, 7, 807, 'CRIAR', 301, 'tanaarea', 'site/programas/ta-na-area', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (808, 41, 7, 808, 'CRIAR', 301, 'tenis', 'videos/tenis', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (809, 41, 7, 809, 'CRIAR', 301, 'timao', 'videos/corinthians', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (810, 41, 7, 810, 'CRIAR', 301, 'times', 'site/noticia/2012/02/sportv-lanca-aplicativo-sobre-os-principais-times-da-serie-2012.html', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (811, 41, 7, 811, 'CRIAR', 301, 'torneiosdefuteboldeareia', 'site/eventos/torneios-internacionais-de-futebol-de-areia', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (812, 41, 7, 812, 'CRIAR', 301, 'torneiosdejudo', 'site/eventos/torneios-de-judo', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (813, 41, 7, 813, 'CRIAR', 301, 'torneiosdeshowbol', 'site/eventos/showbol', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (814, 41, 7, 814, 'CRIAR', 301, 'torneiosshowbol', 'site/eventos/showbol', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (815, 41, 7, 815, 'CRIAR', 301, 'tricolor-das-laranjeiras', 'videos/fluminense', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (816, 41, 7, 816, 'CRIAR', 301, 'troca-de-passes', 'site/programas/troca-de-passes', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (817, 41, 7, 817, 'CRIAR', 301, 'trocadepasses', 'site/programas/troca-de-passes', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (818, 41, 7, 818, 'CRIAR', 301, 'urubuzada', 'videos/flamengo', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (819, 41, 7, 819, 'CRIAR', 301, 'usopen', 'site/eventos/US-Open', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (820, 41, 7, 820, 'CRIAR', 301, 'vasco', 'videos/vasco', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (821, 41, 7, 821, 'CRIAR', 301, 'vcnosportv', 'site/vc', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (822, 41, 7, 822, 'CRIAR', 301, 'vila-nova', 'videos/vila-nova', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (823, 41, 7, 823, 'CRIAR', 301, 'vitoria', 'videos/vitoria', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (824, 41, 7, 824, 'CRIAR', 301, 'voleidepraia', 'site/eventos/circuito-mundial-de-volei-de-praia', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (825, 41, 7, 825, 'CRIAR', 301, 'volei', 'videos/volei', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (826, 41, 7, 826, 'CRIAR', 301, 'wimbledon', 'site/eventos/Wimbledon', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (827, 41, 7, 827, 'CRIAR', 301, 'wtrio', 'site/eventos/wt-rj/index.html', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (828, 41, 7, 828, 'CRIAR', 301, 'WTRIO', 'site/eventos/wt-rj/index.html', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (829, 41, 7, 829, 'CRIAR', 301, 'wtrj', 'site/eventos/wt-rj/index.html', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (830, 41, 7, 830, 'CRIAR', 301, 'WTRJ', 'site/eventos/wt-rj/index.html', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (831, 41, 7, 831, 'CRIAR', 301, 'zona-de-impacto', 'site/programas/zona-de-impacto', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (832, 41, 7, 832, 'CRIAR', 301, 'zonadeimpacto', 'site/programas/zona-de-impacto', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (833, 41, 5, 833, 'CRIAR', 301, '3rivers', 'threerivers', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (834, 41, 5, 834, 'CRIAR', 301, 'bs', 'brothersandsisters', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (835, 41, 5, 835, 'CRIAR', 301, 'law', 'lawandorder', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (836, 41, 5, 836, 'CRIAR', 301, 'lo', 'lawandorder', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (837, 41, 5, 837, 'CRIAR', 301, 'lola', 'lawandorderla', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (838, 41, 5, 838, 'CRIAR', 301, 'theshattered', 'shattered', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (839, 41, 5, 839, 'CRIAR', 301, 'goodwife', 'thegoodwife', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (840, 41, 5, 840, 'CRIAR', 301, 'tgw', 'thegoodwife', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (841, 41, 5, 841, 'CRIAR', 301, 'tr', 'threerivers', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (842, 41, 5, 842, 'CRIAR', 301, 'videos', 'Videos', '2012-04-15 17:09:23.572417');
INSERT INTO historico_redirecionamento (id, id_usuario, id_sitio, id_redirecionamento, acao, status, url_antiga, url_nova, data) VALUES (843, 41, 5, 843, 'CRIAR', 301, 'wo', 'whatson', '2012-04-15 17:09:23.572417');


--
-- TOC entry 1973 (class 0 OID 17123)
-- Dependencies: 163
-- Data for Name: redirecionamento; Type: TABLE DATA; Schema: public; Owner: gcredirect
--

INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (1, 2, 301, '_4ingredientes/Episodios', '_4ingredientes/episodios');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (2, 2, 301, '_4ingredientes/Fotos', '_4ingredientes/fotos');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (3, 2, 301, '4ingredientes', '_4ingredientes');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (4, 2, 301, '_4ingredientes/QuemFaz', '_4ingredientes/quemfaz');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (5, 2, 301, '_4ingredientes/Receitas', '_4ingredientes/receitas');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (6, 2, 301, '_4ingredientes/Videos', '_4ingredientes/videos');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (7, 2, 301, 'acozinhacaseiradeannabel/Episodios', 'acozinhacaseiradeannabel/episodios');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (8, 2, 301, 'acozinhacaseiradeannabel/Fotos', 'acozinhacaseiradeannabel/fotos');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (9, 2, 301, 'acozinhacaseiradeannabel/QuemFaz', 'acozinhacaseiradeannabel/quemfaz');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (10, 2, 301, 'acozinhacaseiradeannabel/Receitas', 'acozinhacaseiradeannabel/receitas');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (11, 2, 301, 'acozinhacaseiradeannabel/Videos', 'acozinhacaseiradeannabel/videos');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (12, 2, 301, 'afamiliagoode', 'A-Familia-Goode');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (13, 2, 301, 'alternativasaude/Episodios', 'alternativasaude/episodios');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (14, 2, 301, 'alternativasaude/Fotos', 'alternativasaude/fotos');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (15, 2, 301, 'Alternativa--Saude', 'alternativasaude');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (16, 2, 301, 'alternativasaude/QuemFaz', 'alternativasaude/quemfaz');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (17, 2, 301, 'alternativasaude/Receitas', 'alternativasaude/receitas');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (18, 2, 301, 'alternativasaude/Videos', 'alternativasaude/videos');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (19, 2, 301, 'annabel', 'acozinhacaseiradeannabel');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (20, 2, 301, 'aovivo', 'ao-vivo');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (21, 2, 301, 'basealiada/Episodios', 'basealiada/episodios');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (22, 2, 301, 'basealiada/Fotos', 'basealiada/fotos');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (23, 2, 301, 'basealiada/QuemFaz', 'basealiada/quemfaz');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (24, 2, 301, 'basealiada/Receitas', 'basealiada/receitas');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (25, 2, 301, 'basealiada/Videos', 'basealiada/videos');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (26, 2, 301, 'beleza/index.rss_xml.xml', 'beleza/ultimas.rss_xml.xml');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (27, 2, 301, 'bemstar', 'BemStar');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (28, 2, 301, 'blogs', 'Blogs');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (29, 2, 301, 'boasvindas', 'boas-vindas');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (30, 2, 301, 'casabrasileira/Episodios', 'casabrasileira/episodios');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (31, 2, 301, 'casabrasileira/Fotos', 'casabrasileira/fotos');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (32, 2, 301, 'casabrasileira/QuemFaz', 'casabrasileira/quemfaz');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (33, 2, 301, 'casabrasileira/Receitas', 'casabrasileira/receitas');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (34, 2, 301, 'casabrasileira/Videos', 'casabrasileira/videos');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (35, 2, 301, 'casa-e-decoracao/index.rss_xml.xml', 'casa-e-decoracao/ultimas.rss_xml.xml');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (36, 2, 301, 'casa', 'casa-e-decoracao');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (37, 2, 301, 'casamentodoprincipe', 'maisdatv/Noticias/GNT-exibe-programacao-especial-sobre-o-casamento-do-principe-William-e-Kate-Middleton.shtml');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (38, 2, 301, 'casamentodoprincipe', 'williamekate');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (39, 2, 301, 'cea', 'C-A');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (40, 2, 301, 'chegadasepartidas/Episodios', 'chegadasepartidas/episodios');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (41, 2, 301, 'chegadasepartidas/Fotos', 'chegadasepartidas/fotos');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (42, 2, 301, 'chegadasepartidas/QuemFaz', 'chegadasepartidas/quemfaz');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (43, 2, 301, 'chegadasepartidas/Receitas', 'chegadasepartidas/receitas');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (44, 2, 301, 'chegadasepartidas/Videos', 'chegadasepartidas/videos');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (45, 2, 301, 'chuvadearroz', 'chuva-de-arroz/noticias/_-Chuva-de-arroz---conheca-o-novo-programa-do-GNT-sobre-casamento.shtml');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (46, 2, 301, 'closetgnt', 'moda/noticias/Closet-GNT--o-novo-aplicativo-de-moda-e-beleza-do-GNT-para-o-seu-iPad.shtml');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (47, 2, 301, 'comida', 'comidaorg');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (48, 2, 301, 'Comida-Org', 'comidaorg');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (49, 2, 301, 'comportamento/index.rss_xml.xml', 'comportamento/ultimas.rss_xml.xml');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (50, 2, 301, 'cozinhapratica', 'cozinha-pratica');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (51, 2, 301, 'criancas', 'assuntos/criancas.shtml');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (52, 2, 301, 'davidletterman', 'lateshow');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (53, 2, 301, 'Diario-do-Olivier', 'diariodoolivier');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (54, 2, 301, 'doc', 'gntdoc');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (55, 2, 301, 'emcasacomjamieoliver', 'Em-Casa-Com-Jamie-Oliver');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (56, 2, 301, 'estarbem', 'EstarBem');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (57, 2, 301, 'EstarBem/Materias/Afinal--o-que-e-Chiraoscuro--Pitty-.html', 'EstarBem/Materias/Afinal--o-que-e-Chiaroscuro--Pitty-.html');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (58, 2, 301, 'EstarBem/Materias', 'EstarBem/Noticias');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (59, 2, 301, 'Estilo/Desfiles/', 'moda/desfiles');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (60, 2, 301, 'Estilo/DicasDeBeleza/', 'beleza/dicas');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (61, 2, 301, 'Estilo/DicasDeModa/', 'moda/dicas');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (62, 2, 301, 'Estilo/Ensaios/', 'moda/ensaios');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (63, 2, 301, 'estilo', 'Estilo');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (64, 2, 301, 'Estilo/Looks/', 'moda/looks');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (65, 2, 301, 'Estilo/Materias', 'Estilo/Noticias');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (66, 2, 301, 'Estilo/ReviewDeProduto/', 'beleza/produtos');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (67, 2, 301, 'Expressao/Materias', 'Expressao/Noticias');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (68, 2, 301, 'faixadeareia', 'faixa-de-areia');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (69, 2, 301, 'Falando-de-Sexo-com-Sue-Johanson', 'falandodesexocomsuejohanson');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (70, 2, 301, 'falandodesexo', 'falandodesexocomsuejohanson');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (71, 2, 301, 'Fale-Conosco', 'index.fale_shtml.shtml');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (72, 2, 301, 'familiagoode', 'A-Familia-Goode');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (73, 2, 301, 'Fashion-Television', 'fashiontelevision');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (74, 2, 301, 'fernandayoung', 'irritandofernandayoung');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (75, 2, 301, 'foradecasa', 'Fora-de-Casa');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (76, 2, 301, 'garvinnaestrada', 'garvin');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (77, 2, 301, 'gentelesa', 'Gente-Lesa');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (78, 2, 301, 'GNT-Doc', 'gntdoc');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (79, 2, 301, 'GNT-Fashion', 'gntfashion');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (80, 2, 301, 'gnt', '');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (81, 2, 301, 'gourmet', 'Gourmet');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (82, 2, 301, 'Gourmet/Materias', 'Gourmet/Noticias');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (83, 2, 301, 'Gourmet/Noticias', 'receitas');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (84, 2, 301, 'Gourmet/Receitas', 'receitas');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (85, 2, 301, 'Gourmet/Videos', 'receitas/videos');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (86, 2, 301, 'Happy-Hour', 'happyhour');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (87, 2, 301, 'harmonize', 'Harmonize');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (88, 2, 301, 'Head-Case', 'headcase');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (89, 2, 301, 'Hollyscoop', 'hollyscoop');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (90, 2, 301, 'homenspossiveis', 'homens-possiveis');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (91, 2, 301, 'ify', 'irritandofernandayoung');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (92, 2, 301, 'index.rss_xml.xml', 'ultimas.rss_xml.xml');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (93, 2, 301, 'inspire-se', 'Inspire-se.shtml');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (94, 2, 301, 'inspirese', 'Inspire-se.shtml');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (95, 2, 301, 'Irritando-Fernanda-Young', 'irritandofernandayoung');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (96, 2, 301, 'Jamie-Oliver', 'jamieoliver');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (97, 2, 301, 'jimmy', 'olaboratoriogastronomicodejimmy');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (98, 2, 301, 'kennedy', 'maisdatv/Noticias/Serie-e-doc-ineditos-falam-sobre-a-vida-da-familia-Kennedy.shtml');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (99, 2, 301, 'kitchenightmares', 'kitchennightmares');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (100, 2, 301, 'Kitchen-Nightmares', 'kitchennightmares');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (329, 1, 301, 'jackosbourne', 'Jack-Osbourne');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (101, 2, 301, 'laboratoriodejimmy', 'olaboratoriogastronomicodejimmy');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (102, 2, 301, 'laboratoriogastronomicodejimmy', 'olaboratoriogastronomicodejimmy');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (103, 2, 301, 'Laboratorio-Gastronomico-de-Jimmy', 'olaboratoriogastronomicodejimmy');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (104, 2, 301, 'laboratoriogastronomico', 'olaboratoriogastronomicodejimmy');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (105, 2, 301, 'Late-Show-with-David-Letterman', 'lateshow');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (106, 2, 301, 'letterman', 'lateshow');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (107, 2, 301, 'maeemae', 'mae-e-mae');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (108, 2, 301, 'maes-e-filhos/index.rss_xml.xml', 'maes-e-filhos/ultimas.rss_xml.xml');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (109, 2, 301, 'maes', 'maes-e-filhos');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (110, 2, 301, 'Manhattan-Connection', 'manhattanconnection');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (111, 2, 301, 'manhattan', 'manhattanconnection');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (112, 2, 301, 'marialiagabriela', 'mariliagabrielaentrevista');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (113, 2, 301, 'Marilia-Gabriela-Entrevista', 'mariliagabrielaentrevista');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (114, 2, 301, 'mariliagabrielaentrevista/Noticias/Brigadeiro-do-William-Bonner--anote-a-receita.shtml', 'Gourmet/Receitas/Brigadeiro-do-William-Bonner--anote-a-receita.shtml');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (115, 2, 301, 'Menu-Confianca', 'menuconfianca');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (116, 2, 301, 'michaeljackson', 'Expressao/Materias/Programacao-Michael-Jackson---de-20-a-27-de-junho.shtml');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (117, 2, 301, 'minhamaquiagem', 'promocoes/index.colaborativo_shtml.shtml');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (118, 2, 301, 'moda/index.rss_xml.xml', 'moda/ultimas.rss_xml.xml');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (119, 2, 301, 'Mulheres-no-Cinema', 'mulheresnocinema');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (120, 2, 301, 'mulher', 'Estilo');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (121, 2, 301, 'Mulher', 'Estilo');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (122, 2, 301, 'Naked-Fashion', 'nakedfashion');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (123, 2, 301, 'newsletter', 'Newsletter');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (124, 2, 301, 'Nigella', 'nigella');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (125, 2, 301, 'Noivas-fora-de-forma', 'noivasforadeforma');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (126, 2, 301, 'novasfamilias', 'novas-familias');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (127, 2, 301, 'O-Chef-G--Garvin-na-Estrada', 'garvin');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (128, 2, 301, 'oifashionrocks', 'Oi-Fashion-Rocks');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (129, 2, 301, 'olivier', 'diariodoolivier');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (130, 2, 301, 'oprah', 'theoprahwinfreyshow');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (131, 2, 301, 'Os-Normais', 'osnormais');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (132, 2, 301, 'pecapiloto', 'Peca-Piloto');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (133, 2, 301, 'Plastica-Perfeita', 'plasticaperfeita');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (134, 2, 301, 'pretagil', 'vaievem');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (135, 2, 301, 'Programacao/index.grade.html', 'Programacao');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (136, 2, 301, 'Promocoes', 'promocoes');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (137, 2, 301, 'quemaravilha', 'quemarravilha');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (138, 2, 301, 'Que-Marravilha-', 'quemarravilha');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (139, 2, 301, 'Que-Marravilha', 'quemarravilha');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (140, 2, 301, 'Receitas-de-Chuck', 'receitasdechuck');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (141, 2, 301, 'Receitas-do-Chuck', 'receitasdechuck');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (142, 2, 301, 'receitas/index.rss_xml.xml', 'receitas/ultimas.rss_xml.xml');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (143, 2, 301, 'Romance-em-Hollywood', 'romanceemhollywood');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (144, 2, 301, 'Saia-Justa', 'saiajusta');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (145, 2, 301, 'saude/index.rss_xml.xml', 'saude/ultimas.rss_xml.xml');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (146, 2, 301, 'Semana-do-Jo', 'semanadojo');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (147, 2, 301, 'semanamesasp2011', 'semana-mesa-sp-2011');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (148, 2, 301, 'semfiltro', 'sem-filtro');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (149, 2, 301, 'Sexarama', 'sexarama');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (150, 2, 301, 'sorriso', 'Compatilhe-um-Sorriso.shtml');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (151, 2, 301, 'sorrisos', 'Compatilhe-um-Sorriso.shtml');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (152, 2, 301, 'spoons', 'Spoons');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (153, 2, 301, 'suejohanson', 'falandodesexocomsuejohanson');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (154, 2, 301, 'Superbonita', 'superbonita');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (155, 2, 301, 'Supernanny', 'supernanny');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (156, 2, 301, 'Tamanho-Unico', 'tamanhounico');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (157, 2, 301, 'Ta-na-Epoca', 'tanaepoca');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (158, 2, 301, 'The-Oprah-Winfrey-Show', 'theoprahwinfreyshow');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (159, 2, 301, 'Vai-e-Vem', 'vaievem');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (160, 2, 301, 'vaivem', 'vaievem');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (161, 2, 301, 'Viagem-Gastronomica', 'viagemgastronomica');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (162, 2, 301, 'Videos', 'videos');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (163, 2, 301, 'vivercomfe', 'viver-com-fe');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (164, 2, 301, 'Voce-e-o-Que-Voce-Come', 'voceeoquevocecome');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (165, 2, 301, 'Weeds', 'weeds');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (166, 2, 301, 'widgets', 'no-seu-site');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (167, 1, 301, '220v', '_220-Volts');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (168, 1, 301, '220voltes', '_220-Volts');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (169, 1, 301, '220volts', '_220-Volts');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (170, 1, 301, '220VOLTS', '_220-Volts');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (171, 1, 301, 'adoravel', 'Adoravel-Psicose');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (172, 1, 301, 'adoravelpsicose', 'Adoravel-Psicose');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (173, 1, 301, 'aeliminacao', 'A-eliminacao');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (174, 1, 301, 'amoraldahistoria', 'Amoral-da-Historia');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (175, 1, 301, 'amoral', 'Amoral-da-Historia');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (176, 1, 301, 'aovivo', 'Shows-Ao-Vivo');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (177, 1, 301, 'aquecimentobbb12', 'Aquecimento-BBB-12');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (178, 1, 301, 'aquecimentoBBB', 'Aquecimento-BBB');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (179, 1, 301, 'aquecimentobbb', 'Aquecimento-BBB-12');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (180, 1, 301, 'aquecimento', 'Aquecimento-BBB-12');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (181, 1, 301, 'asassumidas', 'As-Assumidas');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (182, 1, 301, 'Asassumidas', 'As-Assumidas');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (183, 1, 301, 'asgostosaseosgeeks', 'As-Gostosas-e-os-Geeks');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (184, 1, 301, 'asolivias', 'Olivias-na-Tv');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (185, 1, 301, 'aspegadoras', 'As-Pegadoras');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (186, 1, 301, 'assumidas', 'As-Assumidas');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (187, 1, 301, 'assuntoemusica', 'O-Assunto-e-Musica');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (188, 1, 301, 'atequefazsentido', 'Ate-que-faz-sentido');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (189, 1, 301, 'Atequefazsentido', 'Ate-que-faz-sentido');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (190, 1, 301, 'baladaperfeita', 'Em-Busca-da-Balada-Perfeita');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (191, 1, 301, 'barataflamejante', 'Barata-Flamejante');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (192, 1, 301, 'barata', 'Barata-Flamejante');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (193, 1, 301, 'baratasflamejantes', 'Barata-Flamejante');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (194, 1, 301, 'bastidores', 'Bastidores');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (195, 1, 301, 'batomeparafina', 'Batom-e-Parafina');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (196, 1, 301, 'Batomeparafina', 'Batom-e-Parafina');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (197, 1, 301, 'Batom-E-Parafina', 'Batom-e-Parafina');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (198, 1, 301, 'bbb11', 'Big-Brother-Brasil-11');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (199, 1, 301, 'BBB11', 'Big-Brother-Brasil-11');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (200, 1, 301, 'bbb12', 'Aquecimento-BBB-12');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (201, 1, 301, 'Bbb12', 'Aquecimento-BBB-12');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (202, 1, 301, 'BBB12', 'Aquecimento-BBB-12');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (203, 1, 301, 'bbb', 'A-eliminacao');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (204, 1, 301, 'BBB', 'A-eliminacao');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (205, 1, 301, 'beatles', 'Beatles');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (206, 1, 301, 'beijomeliga', 'Beijo-me-Liga');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (207, 1, 301, 'Beijomeliga', 'Beijo-me-Liga');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (208, 1, 301, 'beijo', 'Dia-do-Beijo');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (209, 1, 301, 'betalive', 'TIM-Beta-Live');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (210, 1, 301, 'beyonce', 'Beyonce');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (211, 1, 301, 'bicicletaemelancia', 'Bicicleta-e-Melancia');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (212, 1, 301, 'bicicleta', 'Bicicleta-e-Melancia');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (213, 1, 301, 'bigbrother11', 'Big-Brother-Brasil-11');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (214, 1, 301, 'bigbrother12', 'Aquecimento-BBB-12');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (215, 1, 301, 'bigbrotherbrasil11', 'Big-Brother-Brasil-11');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (216, 1, 301, 'bigbrotherbrasil12', 'Aquecimento-BBB-12');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (217, 1, 301, 'bigbrother', 'Big-Brother-Brasil-11');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (218, 1, 301, 'buchas', 'Os-Buchas');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (219, 1, 301, 'Buchas', 'Os-Buchas');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (220, 1, 301, 'cabare', 'Sexshake-Cabare');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (221, 1, 301, 'Cabare', 'Sexshake-Cabare');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (222, 1, 301, 'cabeloempe', 'De-Cabelo-em-Pe');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (223, 1, 301, 'caetanoegadu', 'Gadu-e-Caetano-Ao-Vivo');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (224, 1, 301, 'caetano', 'Gadu-e-Caetano-Ao-Vivo');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (225, 1, 301, 'caiaque', 'Kaiak');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (226, 1, 301, 'caralimpa', 'De-Cara-Limpa');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (227, 1, 301, 'carametade', 'Cara-Metade');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (228, 1, 301, 'casabonita2', 'Casa-Bonita-2');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (229, 1, 301, 'casabonita3', 'Casa-Bonita-3');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (230, 1, 301, 'casabonita4', 'Casa-Bonita-4');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (231, 1, 301, 'casabonitadois', 'Casa-Bonita-2');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (232, 1, 301, 'casabonita', 'Casa-Bonita-4');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (233, 1, 301, 'casosdepolicia', 'Papo-de-Policia');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (234, 1, 301, 'chopecom', 'Um-chope-com');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (235, 1, 301, 'chope', 'Um-chope-com');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (236, 1, 301, 'choppcom', 'Um-chope-com');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (237, 1, 301, 'chopp', 'Um-chope-com');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (238, 1, 301, 'cibernet', 'Cybernet');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (239, 1, 301, 'cidadenua', 'Cidade-Nua');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (240, 1, 301, 'cilada.com', 'Cilada-O-Filme');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (241, 1, 301, 'ciladacom', 'Cilada-O-Filme');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (242, 1, 301, 'ciladafilme', 'Cilada-O-Filme');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (243, 1, 301, 'cilada', 'Cilada');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (244, 1, 301, 'ciladaofilme', 'Cilada-O-Filme');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (245, 1, 301, 'comportamento', 'Comportamento');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (246, 1, 301, 'conexoes', 'Conexoes-Urbanas');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (247, 1, 301, 'conexoesurbanas', 'Conexoes-Urbanas');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (248, 1, 301, 'crametade', 'Cara-Metade');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (249, 1, 301, 'culturaurbana', 'Cultura-Urbana');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (250, 1, 301, 'cybernet', 'Cybernet');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (251, 1, 301, 'decabeloempe', 'De-Cabelo-em-Pe');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (252, 1, 301, 'Decabeloempe', 'De-Cabelo-em-Pe');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (253, 1, 301, 'decaralimpa', 'De-Cara-Limpa');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (254, 1, 301, 'desenrolaai', 'Desenrola-Ai');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (255, 1, 301, 'desenrola', 'Desenrola-Ai');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (256, 1, 301, 'desprogramado', 'Desprogramado');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (257, 1, 301, 'diadoamigo', 'TVZ/Materias/No-Dia-do-Amigo--20-de-julho--Multishow-traz-programacao-especial.shtml');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (258, 1, 301, 'diadobeijo', 'Dia-do-Beijo');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (259, 1, 301, 'diadorock', 'Dia-do-Rock');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (260, 1, 301, 'diadosexo', 'Sexy');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (261, 1, 301, 'diadosnamorados', 'Dia-dos-Namorados');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (262, 1, 301, 'diario', 'Diario-Quase-Secreto');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (263, 1, 301, 'diarioquasesecreto', 'Diario-Quase-Secreto');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (264, 1, 301, 'doiselementos', 'Dois-Elementos');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (265, 1, 301, 'Doiselementos', 'Dois-Elementos');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (266, 1, 301, 'dreamgirls', 'Dream-Girls');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (267, 1, 301, 'dvdgaduecaetano', 'Gadu-e-Caetano-Ao-Vivo');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (268, 1, 301, 'dvdparalamasaovivo', 'DVD-Paralamas-Ao-Vivo');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (269, 1, 301, 'dvdparalamas', 'DVD-Paralamas-Ao-Vivo');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (270, 1, 301, 'dvdpaulmccartney', 'Paul-McCartney');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (271, 1, 301, 'dvdraimundos', 'DVD-Raimundos-Roda-Viva');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (272, 1, 301, 'dvdraimundosrodaviva', 'DVD-Raimundos-Roda-Viva');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (273, 1, 301, 'dvdrodavida', 'DVD-Raimundos-Roda-Viva');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (274, 1, 301, 'edmorte', 'Ed-Mort');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (275, 1, 301, 'edmort', 'Ed-Mort');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (276, 1, 301, 'Edmort', 'Ed-Mort');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (277, 1, 301, 'ed', 'Ed-Mort');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (278, 1, 301, 'Ed', 'Ed-Mort');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (279, 1, 301, 'eliminacao', 'A-eliminacao');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (280, 1, 301, 'embarcados', 'Embarcados');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (281, 1, 301, 'embuscadabalada', 'Em-Busca-da-Balada-Perfeita');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (282, 1, 301, 'embuscadabaladaperfeita', 'Em-Busca-da-Balada-Perfeita');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (283, 1, 301, 'especiais', 'Especiais');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (284, 1, 301, 'exaltaaovivo', 'Exaltasamba-Ao-Vivo');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (285, 1, 301, 'exalta', 'Exaltasamba-Ao-Vivo');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (286, 1, 301, 'exaltasambaaovivo', 'Exaltasamba-Ao-Vivo');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (287, 1, 301, 'exaltasamba', 'Exaltasamba-Ao-Vivo');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (288, 1, 301, 'experimente', 'Experimente');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (289, 1, 301, 'extremos', 'Extremos');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (290, 1, 301, 'f1', 'F1-Rocks');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (291, 1, 301, 'f1rock', 'F1-Rocks');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (292, 1, 301, 'f1rocks', 'F1-Rocks');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (293, 1, 301, 'fazsentido', 'Ate-que-faz-sentido');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (294, 1, 301, 'felipeneto', 'Ate-que-Faz-Sentido');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (295, 1, 301, 'festivaldemusicaswu', 'SWU-2010');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (296, 1, 301, 'festivalswu', 'SWU-2010');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (297, 1, 301, 'figuras', 'Os-Figuras');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (298, 1, 301, 'Figuras', 'Os-Figuras');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (299, 1, 301, 'filmecilada', 'Cilada-O-Filme');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (300, 1, 301, 'foliaecaos', 'Jota-Quest-Ao-Vivo-Folia-E-Caos');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (301, 1, 301, 'gaduaovivo', 'Maria-Gadu-Ao-Vivo');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (302, 1, 301, 'gaduecaetano', 'Gadu-e-Caetano-Ao-Vivo');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (303, 1, 301, 'gadu', 'Maria-Gadu-Ao-Vivo');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (304, 1, 301, 'gargalhada', 'Humor');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (305, 1, 301, 'Gargalhada', 'Humor');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (306, 1, 301, 'gargalha', 'Humor');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (307, 1, 301, 'Gargalha', 'Humor');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (308, 1, 301, 'gargalhatv', 'Gargalha-TV');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (309, 1, 301, 'garotadecinema', 'Garota-de-Cinema');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (310, 1, 301, 'Garotadecinema', 'Garota-de-Cinema');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (311, 1, 301, 'geleia2011', 'Geleia-do-Rock-2011');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (312, 1, 301, 'geleiadorock', 'Geleia-do-Rock-2011');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (313, 1, 301, 'geleia', 'Geleia-do-Rock-2011');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (314, 1, 301, 'gozadores', 'Os-Gozadores');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (315, 1, 301, 'horarios', 'Programacao/horarios.shtml');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (316, 1, 301, 'humor', 'Humor');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (317, 1, 301, 'ilove', 'I-Love-My-Nerd');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (318, 1, 301, 'ilovemynerd', 'I-Love-My-Nerd');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (319, 1, 301, 'intercambio', 'Intercambio');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (320, 1, 301, 'iphone', 'Materia/Multishow-lanca-aplicativo-para-iPhone-e-iPod--Ja-baixou-.shtml#fotogaleria=1');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (321, 1, 301, 'iveteaovivo', 'Ivete-Sangalo-Ao-Vivo');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (322, 1, 301, 'ivete', 'Ivete-Sangalo-Ao-Vivo');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (323, 1, 301, 'Ivete', 'Ivete-Sangalo-Ao-Vivo');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (324, 1, 301, 'iveteny', 'Ivete-Sangalo-Ao-Vivo');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (325, 1, 301, 'iveteNY', 'Ivete-Sangalo-Ao-Vivo');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (326, 1, 301, 'ivetesangaloaovivo', 'Ivete-Sangalo-Ao-Vivo');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (327, 1, 301, 'ivetesangalo', 'Ivete-Sangalo-Ao-Vivo');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (328, 1, 301, 'jack', 'Jack-Osbourne');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (330, 1, 301, 'janelas', 'Janelas');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (331, 1, 301, 'jotaquest', 'Jota-Quest-Ao-Vivo-Folia-E-Caos');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (332, 1, 301, 'kaiak', 'Kaiak');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (333, 1, 301, 'kayak', 'Kaiak');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (334, 1, 301, 'kidabelha', 'Show-Kid-Abelha');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (335, 1, 301, 'lendasdomma', 'Lendas-do-UFC');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (336, 1, 301, 'lendasdoufc', 'Lendas-do-UFC');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (337, 1, 301, 'Lendasdoufc', 'Lendas-do-UFC');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (338, 1, 301, 'lifeonmars', 'Life-On-Mars');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (339, 1, 301, 'lola', 'Lollapalooza-2012');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (340, 1, 301, 'Lola', 'Lollapalooza-2012');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (341, 1, 301, 'lolapallooza', 'Lollapalooza-2012');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (342, 1, 301, 'lolapalooza', 'Lollapalooza-2012');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (343, 1, 301, 'lolapalusa', 'Lollapalooza-2012');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (344, 1, 301, 'lolapaluza', 'Lollapalooza-2012');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (345, 1, 301, 'lolla', 'Lollapalooza-2012');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (346, 1, 301, 'Lolla', 'Lollapalooza-2012');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (347, 1, 301, 'lollapaloosa', 'Lollapalooza-2012');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (348, 1, 301, 'lollapalooza', 'Lollapalooza-2012');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (349, 1, 301, 'Lollapalooza', 'Lollapalooza-2012');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (350, 1, 301, 'LOLLAPALOOZA', 'Lollapalooza-2012');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (351, 1, 301, 'lualone', 'Lu-Alone');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (352, 1, 301, 'lugarincomum', 'Lugar-Incomum');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (353, 1, 301, 'lulapalusa', 'Lollapalooza-2012');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (354, 1, 301, 'maisvezesfavela', 'Mais-X-Favela');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (355, 1, 301, 'Maisvezesfavela', 'Mais-X-Favela');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (356, 1, 301, 'maisxfavela', 'Mais-X-Favela');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (357, 1, 301, 'malandro', 'Vida-de-Mallandro');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (358, 1, 301, 'malicia', 'Malicia');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (359, 1, 301, 'mapadopremio', 'Premio-Multishow-2011/Noticias/Saiba-como-chegar-a-premiacao.shtml');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (360, 1, 301, 'mariagaduaovivo', 'Maria-Gadu-Ao-Vivo');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (361, 1, 301, 'mariagadu', 'Maria-Gadu-Ao-Vivo');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (362, 1, 301, 'megarampa', 'Megarampa');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (363, 1, 301, 'meninasdapraia', 'Meninas-da-Praia');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (364, 1, 301, 'meninas', 'Meninas-da-Praia');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (365, 1, 301, 'miamello', 'Viajandona');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (366, 1, 301, 'miamelo', 'Viajandona');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (367, 1, 301, 'Miamelo', 'Viajandona');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (368, 1, 301, 'michaeljackson', 'Michael-Jackson');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (369, 1, 301, 'minhapraia', 'Minha-Praia');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (370, 1, 301, 'Minhapraia', 'Minha-Praia');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (371, 1, 301, 'MinhaPraia', 'Minha-Praia');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (372, 1, 301, 'mj', 'Michael-Jackson');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (373, 1, 301, 'mma', 'Lendas-do-UFC');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (374, 1, 301, 'MMA', 'Lendas-do-UFC');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (375, 1, 301, 'morando', 'Morando-Sozinho');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (376, 1, 301, 'morandosozinho', 'Morando-Sozinho');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (377, 1, 301, 'motorhome', 'Motorhome-SWU');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (378, 1, 301, 'motorhomeswu', 'Motorhome-SWU');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (379, 1, 301, 'motorhomeSWU', 'Motorhome-SWU');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (380, 1, 301, 'MotorHomeSWU', 'Motorhome-SWU');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (381, 1, 301, 'muitogiro', 'Muito-Giro');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (382, 1, 301, 'Muitogiro', 'Muito-Giro');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (383, 1, 301, 'mulheresbbb', 'Mulheres-BBB');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (384, 1, 301, 'mulheresBBB', 'Mulheres-BBB');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (385, 1, 301, 'Mulheresbbb', 'Mulheres-BBB');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (386, 1, 301, 'multishowmusiclive', 'Multishow-Music-Live');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (387, 1, 301, 'multishownxzeroaovivo', 'Nx-Zero');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (388, 1, 301, 'multishownxzero', 'Nx-Zero');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (389, 1, 301, 'musica', 'Musica');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (390, 1, 301, 'musiclive', 'Multishow-Music-Live');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (391, 1, 301, 'mynerd', 'I-Love-My-Nerd');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (392, 1, 301, 'nafamaenalama', 'Na-Fama-e-Na-Lama');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (393, 1, 301, 'nafama', 'Na-Fama-e-Na-Lama');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (394, 1, 301, 'nalu', 'Nalu-Pelo-Mundo');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (395, 1, 301, 'nalu-pelo-mundo', 'Nalu-Pelo-Mundo');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (396, 1, 301, 'nalupelomundo', 'Nalu-Pelo-Mundo');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (397, 1, 301, 'NaluPeloMundo', 'Nalu-Pelo-Mundo');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (398, 1, 301, 'naocontalaemcasa', 'Nao-Conta-La-em-Casa');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (399, 1, 301, 'Naocontalaemcasa', 'Nao-Conta-La-em-Casa');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (400, 1, 301, 'NaoContaLaEmCasa', 'Nao-Conta-La-em-Casa');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (401, 1, 301, 'naoconta', 'Nao-Conta-La-em-Casa');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (402, 1, 301, 'natrilhacerta', 'Na-Trilha-Certa');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (403, 1, 301, 'natrilha', 'Na-Trilha-Certa');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (404, 1, 301, 'nclc', 'Nao-Conta-La-em-Casa');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (405, 1, 301, 'NCLC', 'Nao-Conta-La-em-Casa');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (406, 1, 301, 'no-caminho', 'No-Caminho');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (407, 1, 301, 'nocaminho', 'No-Caminho');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (408, 1, 301, 'Nocaminho', 'No-Caminho');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (409, 1, 301, 'NoCaminho', 'No-Caminho');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (410, 1, 301, 'n..?o-conta-la-em-casa', 'Nao-Conta-La-em-Casa');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (411, 1, 301, 'nos3', 'Nos-3');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (412, 1, 301, 'nostres', 'Nos-3');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (413, 1, 301, 'nxzeroaovivo', 'Nx-Zero');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (414, 1, 301, 'oassuntoemusica', 'O-Assunto-e-Musica');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (415, 1, 301, 'olhaisso', 'Olha-Isso');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (416, 1, 301, 'olivias', 'Olivias-na-Tv');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (417, 1, 301, 'oliviasnatv', 'Olivias-na-Tv');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (418, 1, 301, 'oliviasnaTV', 'Olivias-na-Tv');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (419, 1, 301, 'openbar', 'Open-Bar');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (420, 1, 301, 'operacaos2', 'Operacao-S2');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (421, 1, 301, 'osbuchas', 'Os-Buchas');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (422, 1, 301, 'Osbuchas', 'Os-Buchas');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (423, 1, 301, 'oscarfreire279', 'Oscar-Freire-279');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (424, 1, 301, 'Oscarfreire279', 'Oscar-Freire-279');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (425, 1, 301, 'oscarfreire', 'Oscar-Freire-279');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (426, 1, 301, 'Oscarfreire', 'Oscar-Freire-279');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (427, 1, 301, 'osembarcados', 'Embarcados');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (428, 1, 301, 'osfiguras', 'Os-Figuras');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (429, 1, 301, 'Osfiguras', 'Os-Figuras');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (430, 1, 301, 'osgozadores', 'Os-Gozadores');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (431, 1, 301, 'ossoduro', 'Osso-Duro');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (432, 1, 301, 'outros500', 'Outros-500');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (433, 1, 301, 'Outros500', 'Outros-500');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (434, 1, 301, 'outroslugares', 'Outros-Lugares');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (435, 1, 301, 'palcopretinho', 'Planeta-Atlantida-2012/#alternativo');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (436, 1, 301, 'papo-calcinha', 'Papo-Calcinha');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (437, 1, 301, 'papocalcinha', 'Papo-Calcinha');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (438, 1, 301, 'Papocalcinha', 'Papo-Calcinha');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (439, 1, 301, 'PapoCalcinha', 'Papo-Calcinha');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (440, 1, 301, 'papodepolicia', 'Papo-de-Policia');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (441, 1, 301, 'paralamasaovivo', 'DVD-Paralamas-Ao-Vivo');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (442, 1, 301, 'paralamasdosucesso', 'DVD-Paralamas-Ao-Vivo');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (443, 1, 301, 'paralamas', 'DVD-Paralamas-Ao-Vivo');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (444, 1, 301, 'paralamasmultishow', 'DVD-Paralamas-Ao-Vivo');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (445, 1, 301, 'paulafernandesaovivo', 'Show-Paula-Fernandes');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (446, 1, 301, 'paulafernandes', 'Show-Paula-Fernandes');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (447, 1, 301, 'paulafernandezaovivo', 'Show-Paula-Fernandes');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (448, 1, 301, 'paulafernandez', 'Show-Paula-Fernandes');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (449, 1, 301, 'paullafernandesaovivo', 'Show-Paula-Fernandes');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (450, 1, 301, 'paullafernandes', 'Show-Paula-Fernandes');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (451, 1, 301, 'paullafernandezaovivo', 'Show-Paula-Fernandes');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (452, 1, 301, 'paullafernandez', 'Show-Paula-Fernandes');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (453, 1, 301, 'paulmccartney', 'Paul-McCartney');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (454, 1, 301, 'paul', 'Paul-McCartney');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (455, 1, 301, 'Paul', 'Paul-McCartney');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (456, 1, 301, 'pegadoras', 'As-Pegadoras');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (457, 1, 301, 'penochao', 'Pe-no-Chao');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (458, 1, 301, 'Penochao', 'Pe-no-Chao');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (459, 1, 301, 'pensanisso', 'Pensa-Nisso');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (460, 1, 301, 'planetaatlantida2011', 'Planeta-Atlantida-2011');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (461, 1, 301, 'planetaatlantida', 'Planeta-Atlantida-2012');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (462, 1, 301, 'Planeta-Atlantida', 'Planeta-Atlantida-2012');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (463, 1, 301, 'planeta', 'Planeta-Atlantida-2012');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (464, 1, 301, 'pmh', 'Premio-Multishow-de-Humor');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (465, 1, 301, 'pmmb11', 'Premio-Multishow-2011');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (466, 1, 301, 'pmmb', 'Premio-Multishow-2011');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (467, 1, 301, 'PMMB', 'Premio-Multishow-2011');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (468, 1, 301, 'policia', 'Papo-de-Policia');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (469, 1, 301, 'praia', 'Meninas-da-Praia');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (470, 1, 301, 'premiodehumor', 'Premio-Multishow-de-Humor');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (471, 1, 301, 'premiohumor', 'Premio-Multishow-de-Humor');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (472, 1, 301, 'premiomultishowdehumor', 'Premio-Multishow-de-Humor');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (473, 1, 301, 'premiomultishow', 'Premio-Multishow-2011');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (474, 1, 301, 'Premio-Multishow', 'Premio-Multishow-2011');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (475, 1, 301, 'premio', 'Premio-Multishow-2011');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (476, 1, 301, 'presencavip', 'Presenca-VIP');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (477, 1, 301, 'pretinho', 'Planeta-Atlantida-2012/#alternativo');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (478, 1, 301, 'programacao', 'Programacao/horarios.shtml');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (479, 1, 301, 'programao', 'Programao');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (480, 1, 301, 'programas', 'Programas');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (481, 1, 301, 'promocao', 'Promocoes');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (482, 1, 301, 'promocoes', 'Promocoes');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (483, 1, 301, 'quase-anonimos', 'Quase-Anonimos');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (484, 1, 301, 'quaseanonimos', 'Quase-Anonimos');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (485, 1, 301, 'Quaseanonimos', 'Quase-Anonimos');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (486, 1, 301, 'QuaseAnonimos', 'Quase-Anonimos');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (487, 1, 301, 'queroserumcineasta', 'Quero-ser-um-cineasta');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (488, 1, 301, 'Queroserumcineasta', 'Quero-ser-um-cineasta');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (489, 1, 301, 'raimundos', 'DVD-Raimundos-Roda-Viva');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (490, 1, 301, 'raimundosrodaviva', 'DVD-Raimundos-Roda-Viva');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (491, 1, 301, 'rir', 'Rock-in-Rio');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (492, 1, 301, 'Rir', 'Rock-in-Rio');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (493, 1, 301, 'rockestrada', 'Rock-Estrada');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (494, 1, 301, 'rockinrio', 'Rock-in-Rio');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (495, 1, 301, 'Rockinrio', 'Rock-in-Rio');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (496, 1, 301, 'rock', 'Rock-in-Rio');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (497, 1, 301, 'Rock', 'Rock-in-Rio');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (498, 1, 301, 'rockstrada', 'Rock-Estrada');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (499, 1, 301, 'sejoga', 'Se-Joga');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (500, 1, 301, 'semdestino', 'Sem-Destino');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (501, 1, 301, 'Semdestino', 'Sem-Destino');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (502, 1, 301, 'sensacionalista', 'Sensacionalista');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (503, 1, 301, 'sera', 'Sera-que-Faz-Sentido');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (504, 1, 301, 'seraquefazsentido', 'Sera-que-Faz-Sentido');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (505, 1, 301, 'sergiomalandro', 'Vida-de-Mallandro');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (506, 1, 301, 'sergiomallandro', 'Vida-de-Mallandro');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (507, 1, 301, 'sergueimultishow', 'Serguei-Rock-Show');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (508, 1, 301, 'serguei', 'Serguei-Rock-Show');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (509, 1, 301, 'sergueirock', 'Serguei-Rock-Show');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (510, 1, 301, 'sergueirockshow', 'Serguei-Rock-Show');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (511, 1, 301, 'serhumano', 'Ser-Humano');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (512, 1, 301, 'sexcetera', 'Sexcetera');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (513, 1, 301, 'sexo', 'Sexy');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (514, 1, 301, 'sexshakecabare', 'Sexshake-Cabare');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (515, 1, 301, 'Sexshakecabare', 'Sexshake-Cabare');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (516, 1, 301, 'sexy', 'Sexy');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (517, 1, 301, 'showagridoce', 'Show-Agridoce');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (518, 1, 301, 'showkidabelha', 'Show-Kid-Abelha');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (519, 1, 301, 'SHOWKIDABELHA', 'Show-Kid-Abelha');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (520, 1, 301, 'showpaulafernandes', 'Show-Paula-Fernandes');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (521, 1, 301, 'showpaulafernandez', 'Show-Paula-Fernandes');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (522, 1, 301, 'showpaullafernandes', 'Show-Paula-Fernandes');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (523, 1, 301, 'showsaovivo', 'Shows-Ao-Vivo');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (524, 1, 301, 'SHOWSAOVIVO', 'Shows-Ao-Vivo');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (525, 1, 301, 'showzecapagodinho', 'Show-Zeca-Pagodinho');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (526, 1, 301, 'skankaovivo', 'Skank-Ao-Vivo');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (527, 1, 301, 'skank', 'Skank-Ao-Vivo');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (528, 1, 301, 'skins', 'Skins');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (529, 1, 301, 'som&areia', 'Som-e-Areia');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (530, 1, 301, 'someareia', 'Som-e-Areia');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (531, 1, 301, 'Someareia', 'Som-e-Areia');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (532, 1, 301, 'sound', 'Sound');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (533, 1, 301, 'swu2011', 'SWU-2011');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (534, 1, 301, 'Swu2011', 'SWU-2011');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (535, 1, 301, 'swu', 'SWU-2011');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (536, 1, 301, 'Swu', 'SWU-2011');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (537, 1, 301, 'SWU', 'SWU-2011');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (538, 1, 301, 'thebeatles', 'Beatles');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (539, 1, 301, 'thecity', 'The-City');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (540, 1, 301, 'thehills', 'The-Hills');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (541, 1, 301, 'theultimatefightbrasil', 'The-Ultimate-Fighter-Brasil');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (542, 1, 301, 'theultimatefight', 'The-Ultimate-Fighter-Brasil');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (543, 1, 301, 'timbetalive', 'TIM-Beta-Live');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (544, 1, 301, 'tim', 'TIM-Beta-Live');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (545, 1, 301, 'TIM', 'TIM-Beta-Live');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (546, 1, 301, 'todomundo', 'Todo-Mundo');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (547, 1, 301, 'Todomundo', 'Todo-Mundo');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (548, 1, 301, 'tufbrasil', 'The-Ultimate-Fighter-Brasil');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (549, 1, 301, 'tuf', 'The-Ultimate-Fighter-Brasil');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (550, 1, 301, 'TUF', 'The-Ultimate-Fighter-Brasil');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (551, 1, 301, 'tvneja', 'TVNeja');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (552, 1, 301, 'tvze', 'TVZ');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (553, 1, 301, 'tvzepremio', 'TVZ');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (554, 1, 301, 'tvz', 'TVZ');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (555, 1, 301, 'tvz/tvze', 'TVZ');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (556, 1, 301, 'TVZ/TVZe', 'TVZ');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (557, 1, 301, 'u2360', 'U2-360');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (558, 1, 301, 'u2', 'U2-360');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (559, 1, 301, 'ufc', 'The-Ultimate-Fighter-Brasil');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (560, 1, 301, 'UFC', 'The-Ultimate-Fighter-Brasil');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (561, 1, 301, 'umchopcom', 'Um-chope-com');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (562, 1, 301, 'umchopecom', 'Um-chope-com');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (563, 1, 301, 'umchoppcom', 'Um-chope-com');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (564, 1, 301, 'urbano', 'Urbano');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (565, 1, 301, 'vaipraonde', 'Vai-Pra-Onde');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (566, 1, 301, 'vendemoscadeiras', 'Vendemos-Cadeiras');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (567, 1, 301, 'vendemos', 'Vendemos-Cadeiras');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (568, 1, 301, 'veraomultishow', 'Verao-Multishow');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (569, 1, 301, 'verao', 'Verao-Multishow');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (570, 1, 301, 'veraoquevem', 'Verao-Que-Vem');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (571, 1, 301, '+vezesfavela', 'Mais-X-Favela');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (572, 1, 301, 'viagem', 'Viagem');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (573, 1, 301, 'viagemsemfim', 'Viagem-Sem-Fim');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (574, 1, 301, 'viagens', 'Viagem');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (575, 1, 301, 'viajandona', 'Viajandona');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (576, 1, 301, 'vidademalandro', 'Vida-de-Mallandro');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (577, 1, 301, 'vidademallandro', 'Vida-de-Mallandro');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (578, 1, 301, 'videos', 'Videos');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (579, 1, 301, 'vip', 'Presenca-VIP');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (580, 1, 301, 'VIP', 'Presenca-VIP');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (581, 1, 301, 'voltaaomundo', 'Volta-ao-Mundo');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (582, 1, 301, 'vote', 'TVZ/Vote');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (583, 1, 301, '+xfavela', 'Mais-X-Favela');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (584, 1, 301, 'zecapagodinhoaovivo', 'Show-Zeca-Pagodinho');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (585, 1, 301, 'zecapagodinho', 'Show-Zeca-Pagodinho');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (586, 1, 301, 'zonadoagriao', 'Zona-do-Agriao');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (587, 9, 301, 'aplicativos', 'app');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (588, 9, 301, 'apps', 'app');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (589, 9, 301, 'Docs-Globosat-HD/Os-Kennedy--O-Destino-de-uma-Familia.shtml', 'GNT-doc/Os-Kennedy--O-Destino-de-uma-Familia.shtml');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (590, 9, 301, 'Edgard-no-Ar', 'Edgard-no-ar');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (591, 9, 301, 'faq', 'Conheca-o-Muu.shtml');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (592, 9, 301, 'faq', 'Perguntas-e-Respostas.shtml');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (593, 9, 301, 'Filmes/Aurora-Boreal--Dublado-.shtml', 'Filmes');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (594, 9, 301, 'Filmes/Aurora-Boreal--Legendado-.shtml', 'Filmes');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (595, 9, 301, 'Filmes/Caro-Diario--Legendado-.shtml', 'Filmes');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (596, 9, 301, 'Filmes/Chop-Shop--Legendado-.shtml', 'Filmes');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (597, 9, 301, 'Filmes/Eu-Realmente-Odeio-o-Meu-Trabalho--Legendado-.shtml', 'Filmes');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (598, 9, 301, 'Filmes/Lembrancas-de-uma-Vida--Legendado-.shtml', 'Filmes');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (599, 9, 301, 'Filmes/Mascara-de-Sangue--Legendado-.shtml', 'Filmes');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (600, 9, 301, 'Filmes/O-Assassinato-de-John-Lennon--Legendado-.shtml', 'Filmes');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (601, 9, 301, 'Filmes/Operacao-Moscou--Legendado-.shtml', 'Filmes');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (602, 9, 301, 'Filmes/O-Violino--Legendado-.shtml', 'Filmes');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (603, 9, 301, 'Filmes/Paixao-Suicida--Dublado-.shtml', 'Filmes');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (604, 9, 301, 'Filmes/Paixao-Suicida--Legendado-.shtml', 'Filmes');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (605, 9, 301, 'Filmes/Terra-e-Liberdade--Legendado-.shtml', 'Filmes');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (606, 9, 301, 'Filmes/Tickets--Legendado-.shtml', 'Filmes');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (607, 9, 301, 'Pe-no-Chao-Multishow', 'Pe-no-Chao');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (608, 9, 301, 'Rock-in-Rio', 'Especial-Rock-in-Rio');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (609, 9, 301, 'Rumo-a-Londres/Veja-a-historia-de-atletas-vencedores.shtml', 'Rumo-a-Londres');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (610, 9, 301, 'Um-mundo-pra-chamar-de-seu', 'Um-Mundo-pra-Chamar-de-Seu');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (611, 7, 301, 'abc', 'videos/abc');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (612, 7, 301, 'albumdobrasileirao', 'site/album.html');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (613, 7, 301, 'america-mg', 'videos/america-mg');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (614, 7, 301, 'americamg', 'videos/america-mg');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (615, 7, 301, 'americamineiro', 'videos/america-mg');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (616, 7, 301, 'americana', 'videos/americana');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (617, 7, 301, 'america', 'videos/america-mg');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (618, 7, 301, 'arena', 'site/programas/arena-sportv');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (619, 7, 301, 'arena-sportv', 'site/programas/arena-sportv');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (620, 7, 301, 'arenasportv', 'site/programas/arena-sportv');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (621, 7, 301, 'asa-arapiraca', 'videos/asa');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (622, 7, 301, 'asaarapiraca', 'videos/asa');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (623, 7, 301, 'asa-de-arapiraca', 'videos/asa');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (624, 7, 301, 'asa', 'videos/asa');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (625, 7, 301, 'atelticoparanaense', 'videos/atletico-pr');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (626, 7, 301, 'atleticogoianiense', 'videos/atletico-go');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (627, 7, 301, 'atletico-goiano', 'videos/atletico-go');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (628, 7, 301, 'atletico-go', 'videos/atletico-go');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (629, 7, 301, 'atleticogo', 'videos/atletico-go');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (630, 7, 301, 'atletico-mg', 'videos/atletico-mg');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (631, 7, 301, 'atleticomineiro', 'videos/atletico-mg');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (632, 7, 301, 'atletico-paranaense', 'videos/atletico-pr');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (633, 7, 301, 'atletico-pr', 'videos/atletico-pr');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (634, 7, 301, 'atleticopr', 'videos/atletico-pr');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (635, 7, 301, 'atletismo', 'videos/atletismo');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (636, 7, 301, 'avai', 'videos/avai');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (637, 7, 301, 'bahia', 'videos/bahia');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (638, 7, 301, 'bando-de-louco', 'videos/corinthians');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (639, 7, 301, 'basquete', 'videos/basquete');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (640, 7, 301, 'bem-amigos', 'site/programas/bem-amigos');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (641, 7, 301, 'bemamigos', 'site/programas/bem-amigos');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (642, 7, 301, 'blogdogaciba', 'platb/blog-do-gaciba');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (643, 7, 301, 'blogs', 'site/blogs');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (644, 7, 301, 'bolaocampeao', 'site/bolao');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (645, 7, 301, 'bolao-da-copa', 'site/bolao');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (646, 7, 301, 'bolao-dacopa', 'site/bolao');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (647, 7, 301, 'bolaoda-copa', 'site/bolao');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (648, 7, 301, 'bolaodacopa', 'site/bolao');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (649, 7, 301, 'bolao', 'site/bolao');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (650, 7, 301, 'botafogo', 'videos/botafogo');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (651, 7, 301, 'bragantino', 'videos/bragantino');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (652, 7, 301, 'brasil2012', 'site/programas/brasil-2012');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (653, 7, 301, 'camisa', 'camisas');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (654, 7, 301, 'cartolafc2010', 'cartola-fc');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (655, 7, 301, 'CARTOLAFC', 'cartola-fc');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (656, 7, 301, 'cartola-fc', 'site/cartola-fc');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (657, 7, 301, 'cartolafc', 'site/cartola-fc');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (658, 7, 301, 'CARTOLA', 'cartola-fc');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (659, 7, 301, 'cartola', 'site/cartola-fc');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (660, 7, 301, 'ceara', 'videos/ceara');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (661, 7, 301, 'chutecerto', 'site/bolao');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (662, 7, 301, 'coelho', 'videos/america-mg');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (663, 7, 301, 'colorado', 'videos/internacional');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (664, 7, 301, 'combate', 'site/eventos/combate');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (665, 7, 301, 'copaamericadebasquete', 'site/eventos/copa-america-de-basquete/index.html');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (666, 7, 301, 'copaamericadefutsal', 'site/eventos/copa-america-de-futsal');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (667, 7, 301, 'copadomundodeginastica', 'site/eventos/copa-do-mundo-de-ginastica');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (668, 7, 301, 'copa', 'videos/copa-2010');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (669, 7, 301, 'corinthians', 'videos/corinthians');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (670, 7, 301, 'coritiba', 'videos/coritiba');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (671, 7, 301, 'coxa', 'videos/coritiba');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (672, 7, 301, 'criciuma', 'videos/criciuma');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (673, 7, 301, 'cruzeiro', 'videos/cruzeiro');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (674, 7, 301, 'diariosdobonfa', 'site/programas/diarios-do-bonfa/index.html');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (675, 7, 301, 'duque-de-caxias', 'videos/duque-de-caxias');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (676, 7, 301, 'duquedecaxias', 'videos/duque-de-caxias');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (677, 7, 301, 'e-gol', 'site/programas/e-gol');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (678, 7, 301, 'egol', 'site/programas/e-gol');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (679, 7, 301, 'ehgol', 'site/programas/e-gol');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (680, 7, 301, 'esporte-bahia', 'videos/bahia');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (681, 7, 301, 'esportemotor', 'videos/esportes-a-motor');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (682, 7, 301, 'esportes-a-motor', 'videos/esportes-a-motor');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (683, 7, 301, 'esportes-aquaticos', 'videos/esportes-aquaticos');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (684, 7, 301, 'esportesaquaticos', 'videos/esportes-aquaticos');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (685, 7, 301, 'esportes-radicais', 'videos/esportes-radicais');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (686, 7, 301, 'expresso-do-esporte', 'site/programas/expresso-do-esporte');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (687, 7, 301, 'expressodoesporte', 'site/programas/expresso-do-esporte');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (688, 7, 301, 'falacampeao', 'fala-campeao');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (689, 7, 301, 'figueirense', 'videos/figueirense');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (690, 7, 301, 'flamengo', 'videos/flamengo');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (691, 7, 301, 'fla', 'videos/flamengo');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (692, 7, 301, 'fluminense', 'videos/fluminense');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (693, 7, 301, 'flu', 'videos/fluminense');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (694, 7, 301, 'fluzao', 'videos/fluminense');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (695, 7, 301, 'fogao', 'videos/botafogo');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (696, 7, 301, 'fora-do-eixo', 'site/programas/fora-do-eixo');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (697, 7, 301, 'foradoeixo', 'site/programas/fora-do-eixo');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (698, 7, 301, 'furacao', 'videos/atletico-pr');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (699, 7, 301, 'futebol-de-areia', 'site/eventos/torneios-internacionais-de-futebol-de-areia');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (700, 7, 301, 'futeboldeareia', 'site/eventos/torneios-internacionais-de-futebol-de-areia');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (701, 7, 301, 'futebol', 'videos/futebol');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (702, 7, 301, 'futsal', 'videos/futsal');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (703, 7, 301, 'galo', 'videos/atletico-mg');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (704, 7, 301, 'gavioes-da-fiel', 'videos/corinthians');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (705, 7, 301, 'ginastica', 'videos/ginastica');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (706, 7, 301, 'goiais', 'videos/goiais');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (707, 7, 301, 'golfe-brasil', 'site/programas/golfe-brasil');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (708, 7, 301, 'golfebrasil', 'site/programas/golfe-brasil');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (709, 7, 301, 'gremio-prudente', 'videos/prudente');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (710, 7, 301, 'gremio', 'videos/gremio');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (711, 7, 301, 'guarani', 'videos/guarani');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (712, 7, 301, 'icasa', 'videos/icasa');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (713, 7, 301, 'institucional', 'site/institucional.html');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (714, 7, 301, 'internacional', 'videos/internacional');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (715, 7, 301, 'inter', 'videos/internacional');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (716, 7, 301, 'ituiutaba', 'videos/ituiutaba');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (717, 7, 301, 'jogosmundiaismilitares', 'videos/jogos-mundiais-militares');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (718, 7, 301, 'judo', 'site/eventos/torneios-de-judo');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (719, 7, 301, 'lbf', 'site/eventos/liga-de-basquete-feminino');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (720, 7, 301, 'ligafutsal', 'site/eventos/liga-futsal');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (721, 7, 301, 'linha-de-chegada', 'site/programas/linha-de-chegada');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (722, 7, 301, 'linhadechegada', 'site/programas/linha-de-chegada');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (723, 7, 301, 'lutas', 'videos/lutas');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (724, 7, 301, 'masters1000', 'site/eventos/masters-1000');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (725, 7, 301, 'Match"^/chute-certo/?$"', 'site/bolao');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (726, 7, 301, 'Match"^/programacao/?$"', 'site/programacao');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (727, 7, 301, 'mengao', 'videos/flamengo');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (728, 7, 301, 'mengo', 'videos/flamengo');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (729, 7, 301, 'mineiro', 'videos/america-mg');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (730, 7, 301, 'mundialdeatletismo', 'site/eventos/mundial-indoor-de-atletismo');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (731, 7, 301, 'mundialdefutevolei', 'site/eventos/mundial-de-futevolei');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (732, 7, 301, 'mundialdemotovelocidade', 'site/eventos/mundial-de-motovelocidade');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (733, 7, 301, 'mundialjuvenildeatletismo', 'site/eventos/mundial-juvenil-de-atletismo');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (734, 7, 301, 'nautico', 'videos/nautico');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (735, 7, 301, 'news', 'site/programas/sportv-news');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (736, 7, 301, 'palmeiras', 'videos/palmeiras');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (737, 7, 301, 'parana', 'videos/parana');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (738, 7, 301, 'pegadinhadoarnaldo', 'pegadinha-do-arnaldo');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (739, 7, 301, 'ponte-preta', 'videos/ponte-preta');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (740, 7, 301, 'porco', 'videos/palmeiras');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (741, 7, 301, 'portuguesa', 'videos/portuguesa');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (742, 7, 301, 'programa-do-socio-pfc', 'videos/programa-do-socio-premiere-fc');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (743, 7, 301, 'redacao', 'site/programas/redacao-sportv');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (744, 7, 301, 'redacao-sportv', 'site/programas/redacao-sportv');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (745, 7, 301, 'redacaosportv', 'site/programas/redacao-sportv');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (746, 7, 301, 'reporter', 'site/programas/sportv-reporter');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (747, 7, 301, 'rugbi', 'site/eventos/sul-americano-de-rugbi-de-7');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (748, 7, 301, 'rumoalondres', 'site/programas/rumo-a-londres/index.html');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (749, 7, 301, 'salgueiro', 'videos/salgueiro-pe');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (750, 7, 301, 'santos', 'videos/santos');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (751, 7, 301, 'sao-caetano', 'videos/sao-caetano');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (752, 7, 301, 'sao-paulo', 'videos/sao-paulo');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (753, 7, 301, 'saopaulo', 'videos/sao-paulo');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (754, 7, 301, 'selecaosportv', 'site/programas/selecao-sportv/index.html');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (755, 7, 301, 'sem-barreiras', 'site/programas/sem-barreiras');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (756, 7, 301, 'sembarreiras', 'site/programas/sem-barreiras');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (757, 7, 301, 'sensei', 'site/programas/sensei-sportv');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (758, 7, 301, 'showbol', 'videos/showbol');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (759, 7, 301, 'sport', 'videos/sport');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (760, 7, 301, 'Sportv/2009/arena/0,,17049,00.html', 'arena');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (761, 7, 301, 'Sportv/2009/atletismo/0,,17045,00.html', 'atletismo');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (762, 7, 301, 'Sportv/2009/basquete/0,,17017,00.html', 'basquete');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (763, 7, 301, 'Sportv/2009/bemamigos/0,,17050,00.html', 'bemamigos');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (764, 7, 301, 'Sportv/2009/blogs/0,,17086,00.html', 'Blogs');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (765, 7, 301, 'Sportv/2009/campeonatoitaliano/0,,17188,00.html', 'campeonatoitaliano/index.shtml');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (766, 7, 301, 'Sportv/2009/cartolafc/0,,17026,00.html', 'cartola-fc');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (767, 7, 301, 'Sportv/2009/cartolafc', 'cartola-fc');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (768, 7, 301, 'Sportv/2009/dossiesportv/0,,17066,00.html', 'dossiesportv');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (769, 7, 301, 'Sportv/2009/egol/0,,17810,00.html', 'egol');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (770, 7, 301, 'Sportv/2009/esportemotor/0,,17018,00.html', 'esportemotor');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (771, 7, 301, 'Sportv/2009/esportesaquaticos/0,,17044,00.html', 'esportesaquaticos');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (772, 7, 301, 'Sportv/2009/expressodabola/0,,17059,00.html', 'expressodabola');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (773, 7, 301, 'Sportv/2009/foradoeixo/0,,17064,00.html', 'foradoeixo');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (774, 7, 301, 'Sportv/2009/futebol/0,,17020,00.html', 'futebol');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (775, 7, 301, 'Sportv/2009/futsal/0,,17021,00.html', 'futsal');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (776, 7, 301, 'Sportv/2009/ginastica/0,,17043,00.html', 'ginastica');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (777, 7, 301, 'Sportv/2009/golfebrasil/0,,17062,00.html', 'golfebrasil');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (778, 7, 301, 'Sportv/2009/home/0,,17009,00.html', 'index.shtml');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (779, 7, 301, 'Sportv/2009/home/0,,GEN1418-17941,00.html', 'barragcom');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (780, 7, 301, 'Sportv/2009/home/0,,MUL1414800-17009,00.html', 'Game.shtml');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (781, 7, 301, 'Sportv/2009/home/0,,MUL1588755-17009,00.html', 'fala-campeao/index.shtml');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (782, 7, 301, 'Sportv/2009/linhadechegada/0,,17056,00.html', 'linhadechegada');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (783, 7, 301, 'Sportv/2009/programacao/0,,17016,00.html', 'programacao');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (784, 7, 301, 'Sportv/2009/programacao/0,,17016,00.html', 'Programacao');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (785, 7, 301, 'Sportv/2009/redacao/0,,17051,00.html', 'redacaosportv');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (786, 7, 301, 'Sportv/2009/sembarreiras/0,,17060,00.html', 'sembarreiras');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (787, 7, 301, 'Sportv/2009/senseisportv/0,,17061,00.html', 'sensei');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (788, 7, 301, 'Sportv/2009/sportvcombate/0,,17727,00.html', 'combate');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (789, 7, 301, 'Sportv/2009/sportvnews/0,,17052,00.html', 'sportvnews');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (790, 7, 301, 'Sportv/2009/sportvreporter/0,,17065,00.html', 'sportvreporter');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (791, 7, 301, 'Sportv/2009/tanaarea/0,,17054,00.html', 'tanaarea');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (792, 7, 301, 'Sportv/2009/tenis/0,,17022,00.html', 'tenis');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (793, 7, 301, 'Sportv/2009/trocadepasses/0,,17053,00.html', 'trocadepasses');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (794, 7, 301, 'Sportv/2009/videos/0,,17088,00.html', 'videos');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (795, 7, 301, 'Sportv/2009/videos/0,,17943,00.html', 'fala-campeao/upload.shtml');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (796, 7, 301, 'Sportv/2009/volei/0,,17023,00.html', 'volei');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (797, 7, 301, 'Sportv/2009/zonadeimpacto/0,,17057,00.html', 'zonadeimpacto');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (798, 7, 301, 'Sportv/2010/chutecerto/0,,17941,00.html', 'chute-certo');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (799, 7, 301, 'sportv-news', 'site/programas/sportv-news');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (800, 7, 301, 'sportvnews', 'site/programas/sportv-news');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (801, 7, 301, 'sportv-reporter', 'site/programas/sportv-reporter');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (802, 7, 301, 'sportvreporter', 'site/programas/sportv-reporter');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (803, 7, 301, 'sportvtanaarea', 'site/programas/ta-na-area');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (804, 7, 301, 'taca-brasil-de-futsal', 'site/eventos/Taca-Brasil-de-Futsal');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (805, 7, 301, 'tacabrasildefutsal', 'site/eventos/Taca-Brasil-de-Futsal');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (806, 7, 301, 'ta-na-area', 'site/programas/ta-na-area');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (807, 7, 301, 'tanaarea', 'site/programas/ta-na-area');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (808, 7, 301, 'tenis', 'videos/tenis');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (809, 7, 301, 'timao', 'videos/corinthians');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (810, 7, 301, 'times', 'site/noticia/2012/02/sportv-lanca-aplicativo-sobre-os-principais-times-da-serie-2012.html');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (811, 7, 301, 'torneiosdefuteboldeareia', 'site/eventos/torneios-internacionais-de-futebol-de-areia');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (812, 7, 301, 'torneiosdejudo', 'site/eventos/torneios-de-judo');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (813, 7, 301, 'torneiosdeshowbol', 'site/eventos/showbol');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (814, 7, 301, 'torneiosshowbol', 'site/eventos/showbol');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (815, 7, 301, 'tricolor-das-laranjeiras', 'videos/fluminense');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (816, 7, 301, 'troca-de-passes', 'site/programas/troca-de-passes');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (817, 7, 301, 'trocadepasses', 'site/programas/troca-de-passes');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (818, 7, 301, 'urubuzada', 'videos/flamengo');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (819, 7, 301, 'usopen', 'site/eventos/US-Open');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (820, 7, 301, 'vasco', 'videos/vasco');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (821, 7, 301, 'vcnosportv', 'site/vc');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (822, 7, 301, 'vila-nova', 'videos/vila-nova');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (823, 7, 301, 'vitoria', 'videos/vitoria');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (824, 7, 301, 'voleidepraia', 'site/eventos/circuito-mundial-de-volei-de-praia');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (825, 7, 301, 'volei', 'videos/volei');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (826, 7, 301, 'wimbledon', 'site/eventos/Wimbledon');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (827, 7, 301, 'wtrio', 'site/eventos/wt-rj/index.html');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (828, 7, 301, 'WTRIO', 'site/eventos/wt-rj/index.html');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (829, 7, 301, 'wtrj', 'site/eventos/wt-rj/index.html');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (830, 7, 301, 'WTRJ', 'site/eventos/wt-rj/index.html');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (831, 7, 301, 'zona-de-impacto', 'site/programas/zona-de-impacto');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (832, 7, 301, 'zonadeimpacto', 'site/programas/zona-de-impacto');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (833, 5, 301, '3rivers', 'threerivers');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (834, 5, 301, 'bs', 'brothersandsisters');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (835, 5, 301, 'law', 'lawandorder');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (836, 5, 301, 'lo', 'lawandorder');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (837, 5, 301, 'lola', 'lawandorderla');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (838, 5, 301, 'theshattered', 'shattered');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (839, 5, 301, 'goodwife', 'thegoodwife');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (840, 5, 301, 'tgw', 'thegoodwife');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (841, 5, 301, 'tr', 'threerivers');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (842, 5, 301, 'videos', 'Videos');
INSERT INTO redirecionamento (id, id_sitio, status, url_antiga, url_nova) VALUES (843, 5, 301, 'wo', 'whatson');


--
-- TOC entry 1974 (class 0 OID 17129)
-- Dependencies: 165
-- Data for Name: regra; Type: TABLE DATA; Schema: public; Owner: gcredirect
--

INSERT INTO regra (id, nome) VALUES (1, 'ROLE_ADMIN');
INSERT INTO regra (id, nome) VALUES (2, 'ROLE_USER');
INSERT INTO regra (id, nome) VALUES (3, 'ROLE_EDITOR');


--
-- TOC entry 1975 (class 0 OID 17134)
-- Dependencies: 167
-- Data for Name: regra_usuario; Type: TABLE DATA; Schema: public; Owner: gcredirect
--

INSERT INTO regra_usuario (id_regra, id_usuario) VALUES (1, 41);
INSERT INTO regra_usuario (id_regra, id_usuario) VALUES (1, 1);
INSERT INTO regra_usuario (id_regra, id_usuario) VALUES (3, 2);
INSERT INTO regra_usuario (id_regra, id_usuario) VALUES (3, 3);
INSERT INTO regra_usuario (id_regra, id_usuario) VALUES (3, 4);
INSERT INTO regra_usuario (id_regra, id_usuario) VALUES (1, 5);
INSERT INTO regra_usuario (id_regra, id_usuario) VALUES (3, 6);
INSERT INTO regra_usuario (id_regra, id_usuario) VALUES (3, 7);
INSERT INTO regra_usuario (id_regra, id_usuario) VALUES (3, 8);
INSERT INTO regra_usuario (id_regra, id_usuario) VALUES (1, 9);
INSERT INTO regra_usuario (id_regra, id_usuario) VALUES (3, 10);
INSERT INTO regra_usuario (id_regra, id_usuario) VALUES (3, 11);
INSERT INTO regra_usuario (id_regra, id_usuario) VALUES (3, 12);
INSERT INTO regra_usuario (id_regra, id_usuario) VALUES (3, 13);
INSERT INTO regra_usuario (id_regra, id_usuario) VALUES (1, 14);
INSERT INTO regra_usuario (id_regra, id_usuario) VALUES (3, 15);
INSERT INTO regra_usuario (id_regra, id_usuario) VALUES (3, 16);
INSERT INTO regra_usuario (id_regra, id_usuario) VALUES (3, 17);
INSERT INTO regra_usuario (id_regra, id_usuario) VALUES (3, 18);
INSERT INTO regra_usuario (id_regra, id_usuario) VALUES (1, 19);
INSERT INTO regra_usuario (id_regra, id_usuario) VALUES (3, 20);
INSERT INTO regra_usuario (id_regra, id_usuario) VALUES (3, 21);
INSERT INTO regra_usuario (id_regra, id_usuario) VALUES (3, 22);
INSERT INTO regra_usuario (id_regra, id_usuario) VALUES (1, 23);
INSERT INTO regra_usuario (id_regra, id_usuario) VALUES (3, 24);
INSERT INTO regra_usuario (id_regra, id_usuario) VALUES (3, 25);
INSERT INTO regra_usuario (id_regra, id_usuario) VALUES (3, 26);
INSERT INTO regra_usuario (id_regra, id_usuario) VALUES (3, 27);
INSERT INTO regra_usuario (id_regra, id_usuario) VALUES (1, 28);
INSERT INTO regra_usuario (id_regra, id_usuario) VALUES (3, 29);
INSERT INTO regra_usuario (id_regra, id_usuario) VALUES (3, 31);
INSERT INTO regra_usuario (id_regra, id_usuario) VALUES (3, 32);
INSERT INTO regra_usuario (id_regra, id_usuario) VALUES (3, 33);
INSERT INTO regra_usuario (id_regra, id_usuario) VALUES (1, 34);
INSERT INTO regra_usuario (id_regra, id_usuario) VALUES (3, 35);
INSERT INTO regra_usuario (id_regra, id_usuario) VALUES (3, 36);
INSERT INTO regra_usuario (id_regra, id_usuario) VALUES (3, 37);
INSERT INTO regra_usuario (id_regra, id_usuario) VALUES (3, 44);
INSERT INTO regra_usuario (id_regra, id_usuario) VALUES (3, 45);


--
-- TOC entry 1976 (class 0 OID 17137)
-- Dependencies: 168
-- Data for Name: sitio; Type: TABLE DATA; Schema: public; Owner: gcredirect
--

INSERT INTO sitio (id, nome, sigla, url_sitio, caminho_arquivo_redirecionamento, arquivo_redirecionamento) VALUES (1, 'Multishow', 'MSW', 'multishow.globo.com', '/mnt/app_fe/apache_comeum/farm01/redirect/', 'multishow.conf');
INSERT INTO sitio (id, nome, sigla, url_sitio, caminho_arquivo_redirecionamento, arquivo_redirecionamento) VALUES (2, 'GNT', 'GNT', 'gnt.globo.com', '/mnt/app_fe/apache_comeum/farm01/redirect/', 'gnt.conf');
INSERT INTO sitio (id, nome, sigla, url_sitio, caminho_arquivo_redirecionamento, arquivo_redirecionamento) VALUES (3, 'Combate', 'PRC', 'combate.globo.com', '/mnt/app_fe/apache_comeum/farm01/redirect/', 'combate.conf');
INSERT INTO sitio (id, nome, sigla, url_sitio, caminho_arquivo_redirecionamento, arquivo_redirecionamento) VALUES (4, 'Sexyhot', 'SHY', 'www.sexyhot.com.br', '/mnt/app_fe/apache_comeum/farm02/redirect/', 'sexyhot.conf');
INSERT INTO sitio (id, nome, sigla, url_sitio, caminho_arquivo_redirecionamento, arquivo_redirecionamento) VALUES (5, 'Universal', 'UNI', 'uc.globo.com', '/mnt/app_fe/apache_comeum/farm01/redirect/', 'universal.conf');
INSERT INTO sitio (id, nome, sigla, url_sitio, caminho_arquivo_redirecionamento, arquivo_redirecionamento) VALUES (7, 'Sportv', 'SPO', 'sportv.globo.com', '/mnt/app_fe/apache_comeum/farm01/redirect/', 'sportv.conf');
INSERT INTO sitio (id, nome, sigla, url_sitio, caminho_arquivo_redirecionamento, arquivo_redirecionamento) VALUES (8, 'Comercial Multishow', 'COM_MSW', 'cmultishow.globo.com', '/mnt/app_fe/apache_comeum/farm01/redirect/', 'comercial.multishow.conf');
INSERT INTO sitio (id, nome, sigla, url_sitio, caminho_arquivo_redirecionamento, arquivo_redirecionamento) VALUES (9, 'MUU', 'MUU', 'muu.globo.com', '/mnt/app_fe/apache_comeum/farm01/redirect/', 'muu.conf');


--
-- TOC entry 1977 (class 0 OID 17145)
-- Dependencies: 170
-- Data for Name: sitio_usuario; Type: TABLE DATA; Schema: public; Owner: gcredirect
--

INSERT INTO sitio_usuario (id_sitio, id_usuario) VALUES (3, 1);
INSERT INTO sitio_usuario (id_sitio, id_usuario) VALUES (3, 2);
INSERT INTO sitio_usuario (id_sitio, id_usuario) VALUES (3, 3);
INSERT INTO sitio_usuario (id_sitio, id_usuario) VALUES (3, 4);
INSERT INTO sitio_usuario (id_sitio, id_usuario) VALUES (8, 5);
INSERT INTO sitio_usuario (id_sitio, id_usuario) VALUES (8, 6);
INSERT INTO sitio_usuario (id_sitio, id_usuario) VALUES (8, 7);
INSERT INTO sitio_usuario (id_sitio, id_usuario) VALUES (8, 8);
INSERT INTO sitio_usuario (id_sitio, id_usuario) VALUES (2, 9);
INSERT INTO sitio_usuario (id_sitio, id_usuario) VALUES (2, 10);
INSERT INTO sitio_usuario (id_sitio, id_usuario) VALUES (2, 11);
INSERT INTO sitio_usuario (id_sitio, id_usuario) VALUES (2, 12);
INSERT INTO sitio_usuario (id_sitio, id_usuario) VALUES (2, 13);
INSERT INTO sitio_usuario (id_sitio, id_usuario) VALUES (1, 14);
INSERT INTO sitio_usuario (id_sitio, id_usuario) VALUES (1, 15);
INSERT INTO sitio_usuario (id_sitio, id_usuario) VALUES (1, 16);
INSERT INTO sitio_usuario (id_sitio, id_usuario) VALUES (1, 17);
INSERT INTO sitio_usuario (id_sitio, id_usuario) VALUES (1, 18);
INSERT INTO sitio_usuario (id_sitio, id_usuario) VALUES (9, 19);
INSERT INTO sitio_usuario (id_sitio, id_usuario) VALUES (9, 20);
INSERT INTO sitio_usuario (id_sitio, id_usuario) VALUES (9, 21);
INSERT INTO sitio_usuario (id_sitio, id_usuario) VALUES (9, 22);
INSERT INTO sitio_usuario (id_sitio, id_usuario) VALUES (4, 23);
INSERT INTO sitio_usuario (id_sitio, id_usuario) VALUES (4, 24);
INSERT INTO sitio_usuario (id_sitio, id_usuario) VALUES (4, 25);
INSERT INTO sitio_usuario (id_sitio, id_usuario) VALUES (4, 26);
INSERT INTO sitio_usuario (id_sitio, id_usuario) VALUES (4, 27);
INSERT INTO sitio_usuario (id_sitio, id_usuario) VALUES (7, 28);
INSERT INTO sitio_usuario (id_sitio, id_usuario) VALUES (7, 29);
INSERT INTO sitio_usuario (id_sitio, id_usuario) VALUES (7, 31);
INSERT INTO sitio_usuario (id_sitio, id_usuario) VALUES (7, 32);
INSERT INTO sitio_usuario (id_sitio, id_usuario) VALUES (7, 33);
INSERT INTO sitio_usuario (id_sitio, id_usuario) VALUES (5, 34);
INSERT INTO sitio_usuario (id_sitio, id_usuario) VALUES (5, 35);
INSERT INTO sitio_usuario (id_sitio, id_usuario) VALUES (5, 36);
INSERT INTO sitio_usuario (id_sitio, id_usuario) VALUES (5, 37);
INSERT INTO sitio_usuario (id_sitio, id_usuario) VALUES (1, 41);
INSERT INTO sitio_usuario (id_sitio, id_usuario) VALUES (2, 41);
INSERT INTO sitio_usuario (id_sitio, id_usuario) VALUES (3, 41);
INSERT INTO sitio_usuario (id_sitio, id_usuario) VALUES (4, 41);
INSERT INTO sitio_usuario (id_sitio, id_usuario) VALUES (5, 41);
INSERT INTO sitio_usuario (id_sitio, id_usuario) VALUES (7, 41);
INSERT INTO sitio_usuario (id_sitio, id_usuario) VALUES (8, 41);
INSERT INTO sitio_usuario (id_sitio, id_usuario) VALUES (9, 41);
INSERT INTO sitio_usuario (id_sitio, id_usuario) VALUES (1, 44);
INSERT INTO sitio_usuario (id_sitio, id_usuario) VALUES (2, 44);
INSERT INTO sitio_usuario (id_sitio, id_usuario) VALUES (3, 44);
INSERT INTO sitio_usuario (id_sitio, id_usuario) VALUES (4, 44);
INSERT INTO sitio_usuario (id_sitio, id_usuario) VALUES (5, 44);
INSERT INTO sitio_usuario (id_sitio, id_usuario) VALUES (7, 44);
INSERT INTO sitio_usuario (id_sitio, id_usuario) VALUES (8, 44);
INSERT INTO sitio_usuario (id_sitio, id_usuario) VALUES (9, 44);
INSERT INTO sitio_usuario (id_sitio, id_usuario) VALUES (1, 45);
INSERT INTO sitio_usuario (id_sitio, id_usuario) VALUES (2, 45);
INSERT INTO sitio_usuario (id_sitio, id_usuario) VALUES (3, 45);
INSERT INTO sitio_usuario (id_sitio, id_usuario) VALUES (4, 45);
INSERT INTO sitio_usuario (id_sitio, id_usuario) VALUES (5, 45);
INSERT INTO sitio_usuario (id_sitio, id_usuario) VALUES (7, 45);
INSERT INTO sitio_usuario (id_sitio, id_usuario) VALUES (8, 45);
INSERT INTO sitio_usuario (id_sitio, id_usuario) VALUES (9, 45);


--
-- TOC entry 1978 (class 0 OID 17148)
-- Dependencies: 171
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: gcredirect
--

INSERT INTO usuario (id, nome, email, senha, usuario, ativo, telefone) VALUES (1, 'admin_prc', 'admin_prc@globosat.com.br', '14089a0c054f490b8af25cea83ce8161', 'admin_prc', true, '21457201');
INSERT INTO usuario (id, nome, email, senha, usuario, ativo, telefone) VALUES (3, 'dextra', 'dextracms@globosat.com.br', '7e0fd8dcd036cc00711be1ca5b077796', 'dextracms', true, '21457203');
INSERT INTO usuario (id, nome, email, senha, usuario, ativo, telefone) VALUES (4, 'gsat_mrodrigues', 'gsat_mrodrigues@globosat.com.br', '1f82d0e318af74c0ee1e3f0f7a65818f', 'gsat_mrodrigues', true, '21457204');
INSERT INTO usuario (id, nome, email, senha, usuario, ativo, telefone) VALUES (5, 'admin_com_msw', 'admin_com_msw@globosat.com.br', 'c56560e36f8305402b40f823924754ed', 'admin_com_msw', true, '21457205');
INSERT INTO usuario (id, nome, email, senha, usuario, ativo, telefone) VALUES (6, 'contente', 'contente@globosat.com.br', '913fcfe2e70e8bc2fa58fa67df762b81', 'contente', true, '21457206');
INSERT INTO usuario (id, nome, email, senha, usuario, ativo, telefone) VALUES (7, 'Dextra Editor', 'dextraeditor@globosat.com.br', '3188557047e8da14fd329153c2c79646', 'dextraeditor', true, '21457207');
INSERT INTO usuario (id, nome, email, senha, usuario, ativo, telefone) VALUES (8, 'mrodrigues', 'mrodrigues@globosat.com.br', 'b799a5890314686bb3a774fd4f9bc9e9', 'mrodrigues', true, '21457209');
INSERT INTO usuario (id, nome, email, senha, usuario, ativo, telefone) VALUES (9, 'admin_gnt', 'admin_gnt@globosat.com.br', 'd29250df69ff6d2271e8b64b957a8df2', 'admin_gnt', true, '21457211');
INSERT INTO usuario (id, nome, email, senha, usuario, ativo, telefone) VALUES (11, 'Ana Carolina Simões', 'acsimoes@gmail.com', '7b035153373064afe8e935d41e9cf534', 'acsimoes', true, '21457231');
INSERT INTO usuario (id, nome, email, senha, usuario, ativo, telefone) VALUES (12, 'Bruna Capistrano', 'bcapistrano@globosat.com.br', '24f5fe76e2c4cdde35ac2836ff337971', 'bcapistrano', true, '21457241');
INSERT INTO usuario (id, nome, email, senha, usuario, ativo, telefone) VALUES (13, 'Carla Purcino', 'cpurcino@globosat.com.br', 'b36a6ad96f1a5aa342a6d27b5c9a6b21', 'cpurcino', true, '21457251');
INSERT INTO usuario (id, nome, email, senha, usuario, ativo, telefone) VALUES (14, 'admin_msw', 'admin_msw@globosat.com.br', '6f732cd28add6c7fbfac34df8e260989', 'admin_msw', true, '21457261');
INSERT INTO usuario (id, nome, email, senha, usuario, ativo, telefone) VALUES (15, 'Amanda Henriques', 'ahenriques@globosat.com.br', 'af46bf1984b3c44875525febbab1205a', 'ahenriques', true, '21457271');
INSERT INTO usuario (id, nome, email, senha, usuario, ativo, telefone) VALUES (16, 'Andréa Thompson', 'athompson@globosat.com.br', '851a120dd0833cbc43dc5896aac9ee5e', 'athompson', true, '21457281');
INSERT INTO usuario (id, nome, email, senha, usuario, ativo, telefone) VALUES (17, 'Bruna Senos', 'bsenos@globosat.com.br', '50eab84b1287be378371f4c0dbf3ac44', 'bsenos', false, '21457291');
INSERT INTO usuario (id, nome, email, senha, usuario, ativo, telefone) VALUES (18, 'Caio Nolasco', 'cnolasco@globosat.com.br', '1ae7c879e6a28ced71e02071a33f27e6', 'cnolasco', true, '21457301');
INSERT INTO usuario (id, nome, email, senha, usuario, ativo, telefone) VALUES (19, 'admin_muu', 'admin_muu@globosat.com.br', 'da5448d53fb532dacd300837057ec26a', 'admin_muu', true, '21457401');
INSERT INTO usuario (id, nome, email, senha, usuario, ativo, telefone) VALUES (20, 'Aline Luz', 'aline@globosat.com.br', '8d3152ebd103cea3509c7dcfad8f8c10', 'aline', true, '21457501');
INSERT INTO usuario (id, nome, email, senha, usuario, ativo, telefone) VALUES (21, 'Amanda Henriques', 'amanda@gmail.com', '6209804952225ab3d14348307b5a4a27', 'amanda', false, '21457601');
INSERT INTO usuario (id, nome, email, senha, usuario, ativo, telefone) VALUES (22, 'berna', 'berna@globosat.com.br', '37e88497879ff524a6ff546462e44e2b', 'berna', true, '21457701');
INSERT INTO usuario (id, nome, email, senha, usuario, ativo, telefone) VALUES (23, 'admin_shy', 'admin_shy@globosat.com.br', 'f3e79718c63210f0753e134196b81404', 'admin_shy', true, '21457901');
INSERT INTO usuario (id, nome, email, senha, usuario, ativo, telefone) VALUES (24, 'Ana Paula Falquer', 'anapaula@globosat.com.br', '53d26ee8c0d182ea21e142ca477427f4', 'anapaula', true, '21457911');
INSERT INTO usuario (id, nome, email, senha, usuario, ativo, telefone) VALUES (25, 'Antonia Canto', 'acanto@globosat.com.br', '7dd12d28be9cdb4e8ebd25771e98bf70', 'acanto', true, '21457921');
INSERT INTO usuario (id, nome, email, senha, usuario, ativo, telefone) VALUES (26, 'Dash TI', 'dashti@dash.com.br', '6663ae554f7b961c941034d2b418a27b', 'dashti', true, '21457931');
INSERT INTO usuario (id, nome, email, senha, usuario, ativo, telefone) VALUES (27, 'DashTI', 'dash@dash.com.br', 'b999a7c3bcc5535b4c8e277e18b7b6e1', 'dash', true, '21457941');
INSERT INTO usuario (id, nome, email, senha, usuario, ativo, telefone) VALUES (28, 'admin_spo', 'admin_spo@globosat.com.br', '9749ef2c4da50ab1679ed443464dee1a', 'admin_spo', true, '21457951');
INSERT INTO usuario (id, nome, email, senha, usuario, ativo, telefone) VALUES (29, 'Alexandre Massi', 'alex_poiese@globosat.com.br', '66273d5a42b4ee2323a3abdcc5426ace', 'alex_poiese', true, '21457961');
INSERT INTO usuario (id, nome, email, senha, usuario, ativo, telefone) VALUES (31, 'Andre Cintra', 'gsat_acintra@globosat.com.br', 'a0e8262a6f720181559025f52660c8d8', 'gsat_acintra', true, '21457971');
INSERT INTO usuario (id, nome, email, senha, usuario, ativo, telefone) VALUES (32, 'Andre dexheimer', 'adexheimer@globosat.com.br', '8e684a49e56c8d69485748dc3a0f9261', 'adexheimer', true, '21457981');
INSERT INTO usuario (id, nome, email, senha, usuario, ativo, telefone) VALUES (33, 'Bernardo de Sá', 'gsat_bernardo@globosat.com.br', 'ba0a1fb4ec9e8f0be2d6834a8c24b48e', 'gsat_bernardo', true, '21457991');
INSERT INTO usuario (id, nome, email, senha, usuario, ativo, telefone) VALUES (34, 'admin_uni', 'admin_uni@globosat.com.br', '67e44f0bc1f543012905991128a41131', 'admin_uni', true, '21457311');
INSERT INTO usuario (id, nome, email, senha, usuario, ativo, telefone) VALUES (35, 'Alessandra Lago (Predileta)', 'predileta_alago@globosat.com.br', 'abfdcd52bb33c7e12f2680505ab0d229', 'predileta_alago', true, '21457321');
INSERT INTO usuario (id, nome, email, senha, usuario, ativo, telefone) VALUES (36, 'Bernardo Cury (Predileta)', 'predileta_bcury@globosat.com.br', '0b13c0c4ca8381aa4c96b176b252fa6f', 'predileta_bcury', true, '21457331');
INSERT INTO usuario (id, nome, email, senha, usuario, ativo, telefone) VALUES (37, 'Carlo Serra', 'cserra@globosat.com.br', '6bf08b4b4615514f4be476dca48555b3', 'cserra', true, '21457341');
INSERT INTO usuario (id, nome, email, senha, usuario, ativo, telefone) VALUES (2, 'Adriana Pacheco', 'adrianap@globosat.com.br', 'dc477e40627a71f1380a04fe9fc6ec2f', 'adrianap', true, '21457202');
INSERT INTO usuario (id, nome, email, senha, usuario, ativo, telefone) VALUES (10, 'Adriana Penna', 'penna@globosat.com.br', '0ec0b9e04fac01d8a16b4b845372d2ac', 'penna', true, '21457221');
INSERT INTO usuario (id, nome, email, senha, usuario, ativo, telefone) VALUES (41, 'Marcelo Rezende Módolo', 'modolo@globosat.com.br', 'da88c0892568cc3d584975f9301fbb1d', 'modolo', true, '21457238');
INSERT INTO usuario (id, nome, email, senha, usuario, ativo, telefone) VALUES (45, 'Érico Corrêa Torres
', 'erico.torres@prof.infnet.edu.br', '080f04c94b418375331c97a822945156', 'etorres', true, '85270783');
INSERT INTO usuario (id, nome, email, senha, usuario, ativo, telefone) VALUES (44, 'Tomás de Aquino Tinoco Botelho
', 'aquino.botelho@infnet.edu.br', 'f22633067de7598c31a1044b6bad8692', 'abotelho', true, '82390101');


--
-- TOC entry 1952 (class 2606 OID 17163)
-- Dependencies: 168 168
-- Name: canal_nome_key; Type: CONSTRAINT; Schema: public; Owner: gcredirect; Tablespace: 
--

ALTER TABLE ONLY sitio
    ADD CONSTRAINT canal_nome_key UNIQUE (nome);


--
-- TOC entry 1954 (class 2606 OID 17165)
-- Dependencies: 168 168
-- Name: canal_pkey; Type: CONSTRAINT; Schema: public; Owner: gcredirect; Tablespace: 
--

ALTER TABLE ONLY sitio
    ADD CONSTRAINT canal_pkey PRIMARY KEY (id);


--
-- TOC entry 1956 (class 2606 OID 17167)
-- Dependencies: 168 168
-- Name: canal_sigla_key; Type: CONSTRAINT; Schema: public; Owner: gcredirect; Tablespace: 
--

ALTER TABLE ONLY sitio
    ADD CONSTRAINT canal_sigla_key UNIQUE (sigla);


--
-- TOC entry 1958 (class 2606 OID 17169)
-- Dependencies: 168 168
-- Name: canal_url_sitio_key; Type: CONSTRAINT; Schema: public; Owner: gcredirect; Tablespace: 
--

ALTER TABLE ONLY sitio
    ADD CONSTRAINT canal_url_sitio_key UNIQUE (url_sitio);


--
-- TOC entry 1960 (class 2606 OID 17171)
-- Dependencies: 170 170 170
-- Name: canal_usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: gcredirect; Tablespace: 
--

ALTER TABLE ONLY sitio_usuario
    ADD CONSTRAINT canal_usuario_pkey PRIMARY KEY (id_sitio, id_usuario);


--
-- TOC entry 1935 (class 2606 OID 17173)
-- Dependencies: 161 161 161
-- Name: historico_redirecionamento_id_redirecionamento_acao_key; Type: CONSTRAINT; Schema: public; Owner: gcredirect; Tablespace: 
--

ALTER TABLE ONLY historico_redirecionamento
    ADD CONSTRAINT historico_redirecionamento_id_redirecionamento_acao_key UNIQUE (id_redirecionamento, acao);


--
-- TOC entry 1942 (class 2606 OID 17175)
-- Dependencies: 163 163 163 163
-- Name: idx_redirecionamento_0; Type: CONSTRAINT; Schema: public; Owner: gcredirect; Tablespace: 
--

ALTER TABLE ONLY redirecionamento
    ADD CONSTRAINT idx_redirecionamento_0 UNIQUE (id_sitio, url_antiga, url_nova);


--
-- TOC entry 1939 (class 2606 OID 17177)
-- Dependencies: 161 161
-- Name: pk_historico_redirecionamento; Type: CONSTRAINT; Schema: public; Owner: gcredirect; Tablespace: 
--

ALTER TABLE ONLY historico_redirecionamento
    ADD CONSTRAINT pk_historico_redirecionamento PRIMARY KEY (id);


--
-- TOC entry 1944 (class 2606 OID 17179)
-- Dependencies: 163 163
-- Name: pk_redirecionamento; Type: CONSTRAINT; Schema: public; Owner: gcredirect; Tablespace: 
--

ALTER TABLE ONLY redirecionamento
    ADD CONSTRAINT pk_redirecionamento PRIMARY KEY (id);


--
-- TOC entry 1946 (class 2606 OID 17181)
-- Dependencies: 165 165
-- Name: regra_nome_key; Type: CONSTRAINT; Schema: public; Owner: gcredirect; Tablespace: 
--

ALTER TABLE ONLY regra
    ADD CONSTRAINT regra_nome_key UNIQUE (nome);


--
-- TOC entry 1948 (class 2606 OID 17183)
-- Dependencies: 165 165
-- Name: regra_pkey; Type: CONSTRAINT; Schema: public; Owner: gcredirect; Tablespace: 
--

ALTER TABLE ONLY regra
    ADD CONSTRAINT regra_pkey PRIMARY KEY (id);


--
-- TOC entry 1950 (class 2606 OID 17185)
-- Dependencies: 167 167 167
-- Name: regra_usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: gcredirect; Tablespace: 
--

ALTER TABLE ONLY regra_usuario
    ADD CONSTRAINT regra_usuario_pkey PRIMARY KEY (id_regra, id_usuario);


--
-- TOC entry 1962 (class 2606 OID 17187)
-- Dependencies: 171 171
-- Name: usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: gcredirect; Tablespace: 
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- TOC entry 1964 (class 2606 OID 17189)
-- Dependencies: 171 171
-- Name: usuario_usuario_key; Type: CONSTRAINT; Schema: public; Owner: gcredirect; Tablespace: 
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_usuario_key UNIQUE (usuario);


--
-- TOC entry 1936 (class 1259 OID 17190)
-- Dependencies: 161
-- Name: idx_historico_redirecionamento; Type: INDEX; Schema: public; Owner: gcredirect; Tablespace: 
--

CREATE INDEX idx_historico_redirecionamento ON historico_redirecionamento USING btree (id_usuario);


--
-- TOC entry 1937 (class 1259 OID 17191)
-- Dependencies: 161
-- Name: idx_historico_redirecionamento_0; Type: INDEX; Schema: public; Owner: gcredirect; Tablespace: 
--

CREATE INDEX idx_historico_redirecionamento_0 ON historico_redirecionamento USING btree (id_sitio);


--
-- TOC entry 1940 (class 1259 OID 17192)
-- Dependencies: 163
-- Name: idx_redirecionamento; Type: INDEX; Schema: public; Owner: gcredirect; Tablespace: 
--

CREATE INDEX idx_redirecionamento ON redirecionamento USING btree (id_sitio);


--
-- TOC entry 1970 (class 2606 OID 17193)
-- Dependencies: 168 1953 170
-- Name: canal_usuario_id_canal_fkey; Type: FK CONSTRAINT; Schema: public; Owner: gcredirect
--

ALTER TABLE ONLY sitio_usuario
    ADD CONSTRAINT canal_usuario_id_canal_fkey FOREIGN KEY (id_sitio) REFERENCES sitio(id);


--
-- TOC entry 1971 (class 2606 OID 17198)
-- Dependencies: 171 170 1961
-- Name: canal_usuario_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: gcredirect
--

ALTER TABLE ONLY sitio_usuario
    ADD CONSTRAINT canal_usuario_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES usuario(id);


--
-- TOC entry 1965 (class 2606 OID 17203)
-- Dependencies: 161 1961 171
-- Name: fk_historico_redirecionamento; Type: FK CONSTRAINT; Schema: public; Owner: gcredirect
--

ALTER TABLE ONLY historico_redirecionamento
    ADD CONSTRAINT fk_historico_redirecionamento FOREIGN KEY (id_usuario) REFERENCES usuario(id) ON DELETE CASCADE;


--
-- TOC entry 1966 (class 2606 OID 17208)
-- Dependencies: 1953 168 161
-- Name: fk_historico_redirecionamento_canal; Type: FK CONSTRAINT; Schema: public; Owner: gcredirect
--

ALTER TABLE ONLY historico_redirecionamento
    ADD CONSTRAINT fk_historico_redirecionamento_canal FOREIGN KEY (id_sitio) REFERENCES sitio(id) ON DELETE CASCADE;


--
-- TOC entry 1967 (class 2606 OID 17213)
-- Dependencies: 163 168 1953
-- Name: fk_redirecionamento_canal; Type: FK CONSTRAINT; Schema: public; Owner: gcredirect
--

ALTER TABLE ONLY redirecionamento
    ADD CONSTRAINT fk_redirecionamento_canal FOREIGN KEY (id_sitio) REFERENCES sitio(id) ON DELETE CASCADE;


--
-- TOC entry 1968 (class 2606 OID 17218)
-- Dependencies: 1947 165 167
-- Name: regra_usuario_id_regra_fkey; Type: FK CONSTRAINT; Schema: public; Owner: gcredirect
--

ALTER TABLE ONLY regra_usuario
    ADD CONSTRAINT regra_usuario_id_regra_fkey FOREIGN KEY (id_regra) REFERENCES regra(id);


--
-- TOC entry 1969 (class 2606 OID 17223)
-- Dependencies: 1961 167 171
-- Name: regra_usuario_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: gcredirect
--

ALTER TABLE ONLY regra_usuario
    ADD CONSTRAINT regra_usuario_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES usuario(id);


--
-- TOC entry 1983 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2012-04-20 07:26:19 BRT

--
-- PostgreSQL database dump complete
--

