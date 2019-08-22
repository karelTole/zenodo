Instalación
============

Zenodo depende de PostgreSQL, Elasticsearch 2.x, Redis y RabbitMQ.

Si solo está interesado en ejecutar Zenodo localmente, siga el Docker
guía de instalación a continuación. Si planea desarrollar eventualmente el código de Zenodo,
continúe con la instalación de desarrollo para descubrir cómo configurar el
instancia local para facilitar el desarrollo del código.

Para esta guía necesitará instalar
`docker <https://docs.docker.com/engine/installation/>` _ junto con el
`docker-compose <https://docs.docker.com/compose/>` _ herramienta.

La instalación de Docker no es necesaria, aunque muy recomendable.

Si no puede usar Docker, puede ejecutar Zenodo y todos los servicios requeridos
directamente en su sistema. Echa un vistazo a
`docker-compose.yml <https://github.com/zenodo/zenodo/blob/master/docker-compose.yml/>` _
archivo para averiguar qué se requiere y cómo se ve la configuración.
Para el desarrollo necesitará configurar y configurar
cuatro servicios: PostgreSQL (`` db``), Elasticsearch (`` es``),
Redis (`` caché '') y RabbitMQ (`` mq '').

Instalación de Docker
-------------------
La forma más fácil de ejecutar Zenodo localmente es usar el docker-compose proporcionado
configuración que contiene la pila completa de Zenodo. Primero revisa el código fuente,
construya todas las imágenes de la ventana acoplable e inícielas usando `` docker-compose '':

.. code-block:: console

    $ git clone https://github.com/zenodo/zenodo.git
    $ cd zenodo
    $ git checkout master
    $ docker-compose build
    $ docker-compose up


Mantenga viva la sesión con el docker-compose anterior y en un nuevo shell
ejecuta el script de inicio que crea las tablas de la base de datos, busca índices
y algunos accesorios de datos:

.. code-block:: console

    $ cd zenodo
    $ docker-compose run --rm web bash /code/zenodo/scripts/init.sh
    $ docker-compose run --rm web bash /code/zenodo/scripts/index.sh

Ahora visite la siguiente URL en su navegador:

.. code-block:: console

    https://<docker ip>

.. note::

    Si está ejecutando Docker en Linux o sistemas Mac OS X más nuevos,
    el `` <docker ip> `` suele ser el host local. Para Mac OS X y versiones anteriores
    Los sistemas Windows que ejecutan docker a través de `` docker-machine``, pueden encontrar
    la IP con:

    .. code-block:: console

        $ docker-machine ip <machine-name>


Puede usar la siguiente interfaz web para inspeccionar Elasticsearch y RabbitMQ:

- Elasticsearch: http://<docker ip>:9200/_plugin/hq/
- RabbitMQ: http://<docker ip>:15672/ (guest/guest)
- HAProxy: http://<docker ip>:8080/ (guest/guest)

Además, los siguientes puertos están expuestos en el host Docker:

- ``80``: HAProxy
- ``81``: Nginx
- ``443``: HAProxy
- ``444``: Nginx
- ``5000``: Zenodo
- ``5432``: PostgreSQL
- ``5672``: RabbitMQ
- ``6379``: Redis
- ``8080``: HAProxy stats
- ``9200``: Elasticsearch
- ``9300``: Elasticsearch
- ``15672``: RabbitMQ management console


Instalación de desarrollo
------------------------

Para la configuración de desarrollo, reutilizaremos la imagen del acoplador de Zenodo de
sección anterior para ejecutar solo servicios esenciales de Zenodo y ejecutar el
código de aplicación y el trabajador de apio fuera de la ventana acoplable: querrás
tener fácil acceso al código y al entorno virtual en el que será
instalado.

.. note::

    Dado que Docker asignará los servicios al sistema predeterminado
    puertos en localhost, asegúrese de que no está ejecutando PostgreSQL,
    Redis, RabbitMQ o Elasticsearch en esos puertos en su sistema.

De manera similar a cómo ejecutamos previamente `` docker-compose up '' para ejecutar full-stack
Zenodo, esta vez solo ejecutamos cuatro nodos docker con la base de datos,
Elasticsearch, Redis y RabbitMQ:

.. code-block:: console

    $ docker-compose up db es cache mq

Mantenga la sesión docker-compose anterior viva y en un shell separado, cree un
nuevo entorno virtual de Python usando virtualenvwrapper
(`virtualenvwrapper <https://virtualenvwrapper.readthedocs.io/en/latest/>` _),
en el que instalaremos el código de Zenodo y sus dependencias:

.. code-block:: console

    $ mkvirtualenv zenodo
    (zenodo)$

.. note::

    Zenodo funciona tanto en Python 2.7 como en 3.5+. Sin embargo, en caso de que necesite
    use la interfaz de almacenamiento XRootD, necesitará Python 2.7 como
    Las bibliotecas subyacentes aún no son compatibles con Python 3.5+.

A continuación, instale Zenodo y codifique las dependencias:

.. code-block:: console

    (zenodo)$ cd zenodo
    (zenodo)$ pip install -r requirements.txt --src ~/src/ --pre --upgrade
    (zenodo)$ pip install -e .[all,postgresql,elasticsearch2]

.. note::

    ``--src ~/src/`` El parámetro verificará las versiones de desarrollo de
    ciertas extensiones de Invenio en ``~/src/``.

.. note::

    Usuarios del shell Z: envuelva la parte ``. [all, postgresql, elasticsearch2] `` entre comillas:


    .. code-block:: console

        (zenodo)$ pip install -e ".[all,postgresql,elasticsearch2]"

Media assets
~~~~~~~~~~~~

Luego, necesitamos construir los activos para la aplicación Zenodo.

Para compilar los activos de Zenodo necesitaremos instalar:

* NodeJS **7.4** and NPM **4.0.5**

* Asset-building dependencies: SASS **3.8.0**, CleanCSS **3.4.19**, UglifyJS **2.7.3** and RequireJS **2.2.0**

Si los paquetes del sistema proporcionan NodeJS y NPM en las versiones enumeradas anteriormente, usted
puede instalar las herramientas de activos en todo el sistema (con `` sudo``), ejecutando:

.. code-block:: console

   (zenodo)$ sudo ./scripts/setup-npm.sh

Eche un vistazo en el script anterior para ver qué comandos se están ejecutando.
Se requiere el uso de `` sudo`` debido a la bandera `` -g`` para la instalación global.

Alternativamente, puede instalar NodeJS, NPM y otras dependencias usando
NVM (administrador de versión de nodo), que es similar al virtualenv de Python.

Para hacer eso, primero debe instalar NVM desde
`https://github.com/creationix/nvm <https://github.com/creationix/nvm/>` _
o desde el repositorio de paquetes específico de su sistema operativo:

* NVM on `Arch Linux AUR <https://aur.archlinux.org/packages/nvm/>`_

* Brew on OS X: ``brew install nvm``

Nota: Si instala NVM desde los paquetes del sistema, aún necesita obtenerlo
en su `` .bashrc`` o `` .zshrc``. Consulte el repositorio NVM para más detalles.

Una vez que NVM esté instalado, configúrelo para usar NodeJS en la versión 7.4:

.. code-block:: console

   (zenodo)$ nvm use 7.4
   Now using node v7.4.0 (npm v4.0.5)

Como antes, instale los requisitos de npm, esta vez sin `` sudo '':

.. code-block:: console

   (zenodo)$ ./scripts/setup-npm.sh

los paquetes se instalarán en el entorno NVM de su usuario local.

Después de haber instalado los paquetes NPM en todo el sistema o con NVM, puede
finalmente descargue y cree los recursos multimedia para Zenodo. Hay un guion
que hace eso:

.. code-block:: console

   (zenodo)$ ./scripts/setup-assets.sh


Servicios en uso
~~~~~~~~~~~~~~~~

Para ejecutar Zenodo localmente, necesitará tener algunos servicios ejecutándose en su máquina.
Como mínimo, debe tener PostgreSQL, Elasticsearch 2.x, Redis y RabbitMQ.
Puede instalarlos desde el administrador de paquetes del sistema y ejecutar
directamente o mejor: use la imagen acoplada proporcionada como antes.

** La imagen Docker es el método recomendado para el desarrollo. **

.. Nota::

   Si ejecuta los servicios localmente, asegúrese de estar ejecutando
   Elasticsearch ** 2.x **. Elasticsearch ** 5.x ** aún NO es compatible.


Para ejecutar solo los servicios esenciales con Docker, ejecute lo siguiente:

.. code-block :: consola

    $ cd ~ / src / zenodo
    $ docker-compose up db es mq cache

Esto debería mostrar cuatro nodos Docker con PostgreSQL (db), Elasticsearch (es),
RabbitMQ (mq) y Redis (caché). Mantenga viva esta sesión de shell.


Inicialización
~~~~~~~~~~~~~~
Ahora que los servicios se están ejecutando, es hora de inicializar la base de datos de Zenodo
y el índice Elasticsearch.

Cree la base de datos, índices Elasticsearch, colas de mensajes y varios
accesorios para licencias, subvenciones, comunidades y usuarios en una nueva sesión de shell:

.. code-block:: console

   $ cd ~/src/zenodo
   $ workon zenodo
   (zenodo)$ ./scripts/init.sh

También ejecutemos el trabajador Celery en una sesión de shell diferente:

.. code-block :: console

   $ cd ~ / src / zenodo
   $ workon zenodo
   (zenodo) $ trabajador de apio -A zenodo.celery -l INFO --purge

.. note::

    Aquí asumimos que los cuatro servicios (db, es, mq, caché) están vinculados a localhost
    (vea `zenodo / config.py <https://github.com/zenodo/zenodo/blob/master/zenodo/config.py/>` _).
    Si no puede conectar esos servicios, es probable
    está ejecutando docker a través de `` docker-machine`` y esos servicios son
    vinculado a otras direcciones IP. En este caso, puede redirigir los puertos localhost
    a los puertos acoplables de la siguiente manera.

    `` ssh -L 6379: localhost: 6379 -L 5432: localhost: 5432 -L 9200: localhost: 9200 -L 5672: localhost: 5672 docker @ $ (docker-machine ip) ``

    El problema generalmente ocurre entre usuarios de Mac y Windows. Una mejor solución
    es instalar las aplicaciones nativas `Docker para Mac <https://docs.docker.com/docker-for-mac/>` _
    o `Docker para Windows <https://docs.docker.com/docker-for-windows/>` _
    (disponible desde Docker v1.12) si es posible,
    que une docker a localhost de forma predeterminada.

Cargando datos
~~~~~~~~~~~~

A continuación, carguemos algunos datos externos (solo licencias por el momento). Cargando
de estos datos de demostración se realiza de forma asincrónica con Celery, pero depende de internet
acceso ya que implica la recolección de API externas OAI-PMH o REST.

Asegúrese de mantener viva la sesión con el trabajador de Apio. Lanzar los datos
cargar comandos en un shell separado:

.. code-block:: console

   $ cd ~/src/zenodo
   $ workon zenodo
   (zenodo)$ zenodo opendefinition loadlicenses -s opendefinition
   (zenodo)$ zenodo opendefinition loadlicenses -s spdx
   (zenodo)$ ./scripts/index.sh

Finalmente, ejecute el servidor de desarrollo de Zenodo en modo de depuración. Puedes hacer eso por
configurar la bandera del entorno:

.. code-block:: console

    (zenodo)$ export FLASK_DEBUG=True
    (zenodo)$ zenodo run

Si va a http: // localhost: 5000, debería ver una instancia de Zenodo,
similar a la instancia de producción en https://zenodo.org.

Insignias
~~~~~~
Para que las insignias DOI funcionen, debe tener la biblioteca Cairo SVG y el
Fuente DejaVu Sans instalada en su sistema. Por favor, consulte `Invenio-Formatter
<http://pythonhosted.org/invenio-formatter/installation.html> `_ para más detalles.
