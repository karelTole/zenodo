<!----- Conversion time: 18.951 seconds.


Using this Markdown file:

1. Cut and paste this output into your source file.
2. See the notes and action items below regarding this conversion run.
3. Check the rendered output (headings, lists, code blocks, tables) for proper
   formatting and use a linkchecker before you publish this page.

Conversion notes:

* Docs to Markdown version 1.0β17
* Fri Sep 20 2019 13:59:09 GMT-0700 (PDT)
* Source doc: https://docs.google.com/a/ccud.unam.mx/open?id=181ARtEzBf5mCgBXVx5aVPbTdTxi7GSHODAsDsVfsxBk

WARNING:
Inline drawings not supported: look for ">>>>>  gd2md-html alert:  inline drawings..." in output.

* This document has images: check for >>>>>  gd2md-html alert:  inline image link in generated source and store images to your server.

WARNING:
You have 5 H1 headings. You may want to use the "H1 -> H2" option to demote all headings by one level.

----->




**Zenodo como tecnología para la Plataforma de Datos Abiertos de Investigación de la DGRU-UNAM.**


# Acerca de Zenodo

Zenodo es una plataforma desarrollada y mantenida por OpenAIRE y CERN (Organización Europea para la Investigación Nuclear) para cubrir la necesidad de tener un repositorio donde los datos obtenidos por los diversos grupos de investigación científica estuviera disponible al público a través de una interfaz intuitiva y donde se pudiera citar desde los artículos científicos, hasta el conjunto de datos utilizado, de ésta manera contribuyendo al movimiento de ciencia reproducible. Así mismo Zenodo cuenta con comunidades que le permiten que grupos con temas similares puedan ser agrupados en las facetas de búsqueda.

La plataforma Zenodo, al ser de código abierto, permite la personalización y adaptación a las diferentes necesidades de desarrollo de plataformas de datos abiertos de investigación.

A continuación se presenta la guía que describe de manera general la instalación y la navegación por la plataforma Zenodo adaptada a un ambiente de desarrollo local. 


[alt_text](images/zenodo_inicio.png "image_tooltip")



# 1. Instalación


## 	1.1 Instalación por Docker.

La instalación de Zenodo desde el contendeor Docker es la versión recomendada para reproducir una versión estable de Zenodo que se puede usar en ambientes de prueba o producción. Instala en un contenedor virtual todos los archivos, software requerido y dependencias de Invenio para un funcionamiento estable de Zenodo sin alterar las configuraciones nativas de el equipo donde se instala. 

El único software necesario para correr el contenedor Docker es:



1. Git (permite clonar el repositorio, modificar el repositorio original, acceder a las actualizaciones).
2. Docker (es necesario para ejecutar el contendor y virtualizar la aplicación).
3. Docker - compose (Docker compose permite que distintas instancias se encuentren en imágenes virtualizadas autónomas pero que pueden comunicarse entre si, por ejemplo el servidor web, la API,  la base de datos en Postgresql, pueden instalarse en imágenes Docker diferentes y comunicarse entre sí). 

Los pasos para instalar la versión de Docker se listan y describen a continuación:



1. Clonar el repositorio.

    $ git clone https://github.com/zenodo/zenodo.git

2. Construir la imagen del contenedor Docker.

    $ docker-compose -f docker-compose.full.yml build

3. Ejecutar la aplicación.

	$ docker-compose -f docker-compose.full.yml up -d



4. Crear los índices y levantar la base de datos.

$ docker-compose -f docker-compose.full.yml run --rm web bash /code/zenodo/scripts/init.sh

Posteriormente se puede ingresar a la ip del servidor local para ver Zenodo ejecutándose.

	


## 	1.3 Comparativa versión Docker vs versión de desarrollo.

**Table 3**. Tabla comparativa de instalación con Docker contra instalación de desarrollo.


<table>
  <tr>
   <td><strong>Docker</strong>
   </td>
   <td><strong>Desarrollo</strong>
   </td>
  </tr>
  <tr>
   <td>Se requieren menos instalaciones extra. Sólo se necesita tener git, Docker y Docker Compose previamente instalados.
   </td>
   <td>Son necesarias instalaciones extra: Docker, Virtualenvwrapper, Invenio, NodeJS, SASS, CleanCSS, UglifyJS and RequireJS.
   </td>
  </tr>
  <tr>
   <td>Utilizado para instalaciones rápidas. Contiene los elementos suficientes para ser ejecutada en un ambiente de producción. 
   </td>
   <td>Se utiliza principalmente para desarrolladores, principalmente aquellos que contribuyen al código de Zenodo en GitHub.
   </td>
  </tr>
  <tr>
   <td>Se necesita modificar el código para agregar funcionalidades como autenticación con aplicaciones externas.
   </td>
   <td>Al igual que la versión Docker, se necesita modificar el código para agregar funcionalidades como autenticación con aplicaciones externas.
   </td>
  </tr>
</table>



# 2. Interfaz gráfica


## 2.1 Recursos


### 	2.1.1. Interfaz de consulta y exploración.



1. La página de inicio de Zenodo muestra archivos que han sido subidos recientemente.
2. Otros desarrollos basados en Zenodo como Rodare, muestran la misma interfaz como página de inicio.
3. Al realizar una búsqueda, se nos muestra una interfaz denominada “faceta de búsqueda” que en el lado izquierdo muestra categorías de agrupamiento jerarquizadas, y en la parte central de la interfaz muestra recursos con la opción de poder ser agrupados por relevancia, fecha de carga, visualizaciones, ordén alfabético, principalmente.


### 	2.1.2. Subir un nuevo recurso.


#### 		2.1.2.1. Registro de usuario.


### **Crear cuenta e inicio de sesión.**

Para poder subir nuestros datos, primero se debe crear una cuenta haciendo clic en la esquina superior derecha en el encabezado de la página de inicio. Una vez teniendo una cuenta de acceso, sólo es necesario ingresar el correo y contraseña que se ha registrado.

Figura 2. Botón Iniciar sesión / Registro:


[alt_text](images/navegacion/pagina_inicio/login_signup_button.png "image_tooltip")


Nota: se debe tener una cuenta para poder cargar datos y crear comunidades. Sin embargo, se pueden explorar los archivos en la plataforma sin necesidad de iniciar sesión.


### **Carga manual de datos **

Para comenzar el proceso de carga, busque el botón de carga que se encuentra en el encabezado de la página web. La figura 3 a continuación muestra la ubicación del botón de carga.

Figura 3. Menú para subida de archivos.

[alt_text](images/navegacion/subir_documentos/zenodo_upload_01.png "image_tooltip")


Una vez dirigido a la nueva página de carga, elija un archivo para cargar, ya sea haciendo clic en el botón "elegir archivos" o arrastrando los archivos desde el explorador de archivos de su computadora.

Figura 4. Interfaz de carga de archivos.

Después de elegir los archivos que desea cargar, seleccione el tipo de datos. Las opciones disponibles en la versión inicial de la plataforma incluyen: publicación, póster, presentación, conjunto de datos, imagen, video, audio, software y lección educativa. 


#### **Información básica**

El siguiente paso en el proceso de carga es proporcionar información básica sobre la carga del archivo. La Figura 5 muestra la interfaz gráfica de usuario de Zenodo para ingresar información básica sobre el archivo que se está cargando. La Tabla 1 describe la información que debe agregar a esta sección.

**Tabla 1**: Información básica para ingresar un recurso.


<table>
  <tr>
   <td>Campo
   </td>
   <td>Descripción
   </td>
  </tr>
  <tr>
   <td>Identificador de Objeto Digital
   </td>
   <td>Si existe se puede ingresar manualmente. Si el DOI no es especificado por el usuario, Zenodo registrará uno por éste. Los dentificadores de objetos digitales ayudan a otros a citar los recursos subidos de manera fácil e inequívoca.
   </td>
  </tr>
  <tr>
   <td>Fecha de publicación.
   </td>
   <td>Ingresar la fecha en la que el recurso es publicado en formato YYYY-MM-DD. Hay que observar que se debe asignar la fecha en que el recurso fue publicado y no en la que fue ingresado a la plataforma.
   </td>
  </tr>
  <tr>
   <td>Título
   </td>
   <td>Se ingresa un título que describe adecuadamente los datos del registro y que permite a otros usuarios encontrarlo en su búsqueda.
   </td>
  </tr>
  <tr>
   <td>Autor(es)
   </td>
   <td>Ingresar el nombre de los autores que hayan trabajado en colectar los datos del recurso.
   </td>
  </tr>
  <tr>
   <td>Descripción
   </td>
   <td>Ingresar una descripción clara de los datos del recurso que permita a otros usuarios entender la información que contiene.
   </td>
  </tr>
  <tr>
   <td>Palabras clave.
   </td>
   <td>Opcionalmente se pueden ingresar las palabras clave que facilitarán la aparición del recurso en la faceta de búsqueda.
   </td>
  </tr>
  <tr>
   <td>Notas adicionales
   </td>
   <td>Opcionalmente se pueden añadir notas adicionales que pueden especificar detalles particulares del recurso de interés para los usuarios que lo consulten y hagan uso de éste.
   </td>
  </tr>
</table>


Figura 5. Interfaz de carga de archivos (continuación).



[alt_text](images/navegacion/subir_documentos/zenodo_upload_01.png "image_tooltip")



#### **Licencias de uso.**

Parte de la información requerida para cargar un archivo es la sección de “Licencia”. Si bien Zenodo fomenta que todos los datos se compartan, también permite diferentes niveles de visibilidad, incluidos el acceso abierto, acceso con embargo, acceso restringido y el acceso cercano. El acceso abierto requiere un nombre de licencia, el acceso con embargo requiere un nombre de licencia y una fecha de embargo, el acceso restringido requiere condiciones para otorgar a otros usuarios acceso a los datos publicados, y el acceso cerrado no requiere información adicional. 


[alt_text](images/Datos-Abiertos4.png "image_tooltip")


Posteriormente en la sección de carga de datos se incluyen otros apartados que son: comunidades, financiamiento e identificadores alternativos. 



*   Las comunidades permiten que los grupos tengan archivos cargados y agrupados. Las comunidades permiten que los grupos tengan su propio repositorio digital.
*   Información sobre financiamiento. Si tiene alguna subvención que da financiamiento a su investigación, puede ingresarla en esta sección. 
*   Finalmente tenemos identificaciones alternativos. En esta sección debe incluir identificadores para cualquier información relacionada con la que está cargando. 


[alt_text](images/Datos-Abiertos5.png "image_tooltip")



#### **Información opcional**

La parte final del proceso de carga incluye información opcional que el usuario puede ingresar. 


[alt_text](images/Datos-Abiertos6.png "image_tooltip")



### **Interfaz de búsqueda**



[alt_text](images/Datos-Abiertos7.png "image_tooltip")


Con la funcionalidad de búsqueda, el usuario puede buscar un conjunto específico de datos dentro del archivo de datos. El usuario puede buscar un archivo buscando los metadatos específicos que se ingresaron durante la carga de ese archivo. Así mismo el uso de palabras clave durante la carga de los datos permite agilizar la búsqueda y exploración de los archivos. Los resultados de la búsqueda muestran la siguiente información: fecha publicada, tipo de datos, tipo de acceso, título, descripción y fecha de carga. También puede hacer clic en el botón de vista para ver los datos en ese cuadro de búsqueda. En el lado izquierdo de la interfaz de búsqueda y exploración hay varias facetas que se utilizan para filtrar la cantidad de registros devueltos en la búsqueda.


### **Ejemplo de carga de metadatos con Dublin Core.**

La arquitectura de Zenodo permite etiquetar los datos cargados hacia un conjunto de metadatos. Una vez que se ha depositado un conjunto de datos, Zenodo proporciona una herramienta para exportar sus metadatos correspondientes en varios formatos. En el siguiente ejemplo se muestra la exportación de un conjunto de datos en el estándar Dublin Core, el cual contiene etiquetas para campos como creador, fecha, descripción y asunto, todos los cuales se proporcionan en formato .xml. 



[alt_text](images/Datos-Abiertos8.png "image_tooltip")


Para acceder a la sección de exportación, haga lo siguiente:



1. Encuentre el archivo que desea ver.
2. Haga clic en la vista para ir a la página del documento.
3. Busque el cuadro de exportación.
4. Haga clic en Dublin Core.




[alt_text](images/Datos-Abiertos9.png "image_tooltip")



### **Tablero de administración:**



1. Manejo de usuarios
2. Manejo de registros
3. Manejo de comunidades
4. Cosecha de metadatos entre repositorios (OAI-PMH).





[alt_text](images/Datos-Abiertos10.png "image_tooltip")



### **Autenticación con número de cuenta.**


### **Control de versiones de la plataforma.**


# 3. Comunidades


### **Comunidades **

Las comunidades de Zenodo fueron pensadas en la colaboración de grupos de investigación que trabajan temáticas similares. Con las comunidades, los grupos pueden tener archivos cargados y agrupados, permitiendo que cada grupo pueda tener “sub - repositorios”. El botón de comunidades se encuentra en el encabezado al lado del botón de carga. 

Así mismo la interfaz web de las Comunidades tiene una barra de búsqueda que permite hacer la búsqueda de comunidades por medio de palabras clave o por su nombre.


#### **Crear una comunidad**

Para crear una comunidad es necesario que el usuario esté registrado en la plataforma e inicie sesión.



1. Vaya a la página web de comunidades en el sitio web de Zenodo.


[alt_text](images/Datos-Abiertos11.png "image_tooltip")




1. Haga clic en el botón "Nuevo" ubicado en el lado derecho de la pantalla.

     


[alt_text](images/Datos-Abiertos12.png "image_tooltip")



    	

1. Posteriormente se le dirigirá a un formulario para completar la siguiente información:
    1. Identificador: identifica la comunidad y se incluye en la URL de la comunidad. Éste paso no se puede modificar más adelante.
    2. Título: un título para su comunidad
    3. Descripción (opcional): permite asignar una breve descripción de la comunidad.
    4. Curación (opcional): describe la política en la que aceptará y rechazará la ingesta de nuevos datos en la comunidad.
    5. Página (opcional): una descripción larga de la comunidad que se mostrará en una página separada vinculada en el índice.
    6. Logo - Una imagen para ayudar y promover el reconocimiento público. 
2. Haga clic en Crear y la comunidad podrá verse de manera pública en la interfaz web.


#### **Editar una comunidad**



1. Hacer clic en el botón Comunidades.
2. Encuentre su comunidad en el panel de la derecha.
3. Haga clic en el menú desplegable de acciones y seleccione Editar.






[alt_text](images/Datos-Abiertos13.png "image_tooltip")


La información que puede ser editada en una comunidad ya existente es la siguiente: Título, Descripción, Política de Curación, Página y Logotipo. 


#### **Eliminar una comunidad**

También puede eliminar la comunidad en esta página. El botón Eliminar se encuentra en la parte inferior de la página. 





[alt_text](images/Datos-Abiertos14.png "image_tooltip")



#### **Comunidades**

También se puede acceder a cualquiera de las tareas sobre comunidades por medio de los enlaces que Zenodo les asigna:






[alt_text](images/Datos-Abiertos15.png "image_tooltip")



#### **Curar comunidades**



1. Hacer clic en el botón Comunidades.
2. Encontrar la comunidad a curar en el panel de la derecha.
3. Haga clic en el menú desplegable de acciones y seleccionar.




[alt_text](images/Datos-Abiertos16.png "image_tooltip")


En esta página puede seleccionar un archivo ya cargado y aceptar o rechazar el archivo para que aparezca como parte de la comunidad.


#### **Ver comunidades**



1. Hacer clic en los botones de Comunidades. 
2. Encuentre la comunidad a editar en el panel de la derecha.
3. Haga clic en el menú desplegable y seleccione Ver.


## 



[alt_text](images/Datos-Abiertos17.png "image_tooltip")


En esta sección se puede ver información sobre su comunidad y cualquier archivo que se cargue en su comunidad.





[alt_text](images/Datos-Abiertos18.png "image_tooltip")


	Registro e iniciar sesión



[alt_text](images/Datos-Abiertos19.png "image_tooltip")


	Subir documentos

[alt_text](images/navegacion/subir_documentos/zenodo_upload_01.png "image_tooltip")



[alt_text](images/Datos-Abiertos21.png "image_tooltip")


	Editar documentos






[alt_text](images/Datos-Abiertos22.png "image_tooltip")



[alt_text](images/Datos-Abiertos23.png "image_tooltip")



[alt_text](images/Datos-Abiertos24.png "image_tooltip")


	Comunidades




[alt_text](images/Datos-Abiertos25.png "image_tooltip")


[alt_text](images/Datos-Abiertos26.png "image_tooltip")


	

Crear comunidades



[alt_text](images/Datos-Abiertos27.png "image_tooltip")


	Administrar comunidades



[alt_text](images/Datos-Abiertos28.png "image_tooltip")


	Administrar usuarios



[alt_text](images/Datos-Abiertos29.png "image_tooltip")


Versiones:



[alt_text](images/Datos-Abiertos30.png "image_tooltip")


Compartir recurso:



[alt_text](images/Datos-Abiertos31.png "image_tooltip")


Exportar recurso:



[alt_text](images/Datos-Abiertos32.png "image_tooltip")


Exportar como formato BibTex:



[alt_text](images/Datos-Abiertos33.png "image_tooltip")


Exportar como formato CSL:




[alt_text](images/Datos-Abiertos34.png "image_tooltip")


Exportar como formato DataCite:



[alt_text](images/Datos-Abiertos35.png "image_tooltip")


Exportar como formato Dublin Core:



[alt_text](images/Datos-Abiertos36.png "image_tooltip")


Exportar como formato JSON:



[alt_text](images/Datos-Abiertos37.png "image_tooltip")


Exportar como formato JSON-LD:



[alt_text](images/Datos-Abiertos38.png "image_tooltip")



# 4. Arquitectura Backend


## 	4.1. ¿Cómo son los datos almacenados en el servidor?


Pie de imagen.
[drawing](https://docs.google.com/a/google.com/drawings/d/12345/export/png)


## 4.2. Acuñación del DOI.


## 4.3. Autenticación del usuario.


## 4.4. Búsqueda de recursos con Elasticsearch.


# 5. Interacción con Zenodo por medio de la API.


## 	5.1. Ingesta de datos desde Python.


## 	5.2. Consumo de datos desde Python.


## 	5.3. Ingesta de datos desde R.


## 	5.4. Consumo de datos desde R.


<!-- Docs to Markdown version 1.0β17 -->

