Descripción de los módulos que integran la web app de Zenodo
============



modules
    ├── auditor  
    ├── communities
    ├── deposit
    ├── exporter
    ├── fixtures
    ├── frontpage
    ├── github
    ├── indexer
    ├── jsonschemas
    ├── openaire
    ├── records
    ├── redirector
    ├── rest
    ├── search_ui
    ├── sipstore
    ├── sitemap
    ├── spam
    ├── stats
    ├── support
    ├── theme
    └── utils




Carpeta auditor: 

modules
    ├── auditor  
        ├── api.py 
        ├── cli.py
        ├── ext.py
        ├── __init__.py
        ├── oai.py
        ├── records.py
        ├── tasks.py
        └── utils.py


Carpeta jsonschemas:

El módulo ejecuta las siguientes tareas:



La carpeta se compone de 6 scripts de python.
	a) __init__.py 
	b) cli.py
	c) compilers.py
	d) config.py
	e) ext.py
	f) utils.py





Carpeta sipstore:

Contiene los scripts que relacionan los recursos subidos por los 
usuarios con la api de DataCite para la citación, generación y 
enlazamiento de DOI's.

Contiene una subcarpeta llamada 'jsonschemas' que a su vez
contiene otra subcarpeta llamada 'sipstore'.

Sipstore contiene el template del json que se usará para el registro que
se guardará en la base de datos. Zenodo tiene dos json templates:

	a) githubclient
	b) webclient

Dado que no está contemplado el uso del template githubclient, se
utiliza webclient y se almacena en la base de datos de la
siguiente manera:

Nombre de la tabla: sipstore_sip
Campo: agent
Tipo de dato: json
Relaciones de éste campo: null
Ejemplo de registro: 
{
  "$schema": "https://zenodo.org/schemas/sipstore/agent-webclient-v1.0.0.json",
  "ip_address": "172.18.0.12",
  "email": "tskore88@gmail.com"
}


Nombre de la tabla: sipstore_sipmetadata
Campo: content
Tipo de dato: text
Relaciones de éste campo: null
Ejemplo de registro: 
{
  "embargo_date": "2019-08-22",
  "conceptrecid": "7",
  "thesis": {
    "university": "Universidad Nacional Autónoma de México"
  },
  "keywords": [
    "dataset, no admin"
  ],
  "$schema": "https://zenodo.org/schemas/records/record-v1.0.0.json",
  "conceptdoi": "10.5072/zenodo.7",
  "title": "Dataset usuario no admin",
  "_files": [
    {
      "checksum": "md5:d0243e9e3e9ddf7975d8099bff7117dc",
      "bucket": "497621ae-ee27-4327-8655-4a93f2f3d065",
      "version_id": "d2bf7aa7-a40d-4fc0-ae1c-f127663e3635",
      "file_id": "82297411-fc2e-4d8d-a1f7-e224269ef6d9",
      "key": "arena_team.tsv",
      "type": "tsv",
      "size": 1665
    }
  ],
  "version": "1",
  "_deposit": {
    "status": "published",
    "owners": [
      3
    ],
    "pid": {
      "revision_id": 0,
      "type": "recid",
      "value": "8"
    },
    "id": "8",
    "created_by": 3
  },
  "access_right": "embargoed",
  "description": "<p>Ejemplo de dataset cargado por usuario no administrador.</p>",
  "_oai": {
    "id": "oai:zenodo.org:8"
  },
  "publication_date": "2019-08-20",
  "owners": [
    3
  ],
  "doi": "10.5072/zenodo.8",
  "_buckets": {
    "record": "497621ae-ee27-4327-8655-4a93f2f3d065",
    "deposit": "b28f9d2c-ce47-4e12-95e8-bf7767c6a5ae"
  },
  "language": "spa",
  "license": {
    "$ref": "https://dx.zenodo.org/licenses/apache2.0"
  },
  "recid": 8,
  "creators": [
    {
      "name": "Usuario no admin"
    }
  ],
  "resource_type": {
    "type": "dataset"
  }
}







