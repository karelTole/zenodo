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


<p style="color: red; font-weight: bold">>>>>>  gd2md-html alert:  ERRORs: 0; WARNINGs: 2; ALERTS: 40.</p>
<ul style="color: red; font-weight: bold"><li>See top comment block for details on ERRORs and WARNINGs. <li>In the converted Markdown or HTML, search for inline alerts that start with >>>>>  gd2md-html alert:  for specific instances that need correction.</ul>

<p style="color: red; font-weight: bold">Links to alert messages:</p><a href="#gdcalert1">alert1</a>
<a href="#gdcalert2">alert2</a>
<a href="#gdcalert3">alert3</a>
<a href="#gdcalert4">alert4</a>
<a href="#gdcalert5">alert5</a>
<a href="#gdcalert6">alert6</a>
<a href="#gdcalert7">alert7</a>
<a href="#gdcalert8">alert8</a>
<a href="#gdcalert9">alert9</a>
<a href="#gdcalert10">alert10</a>
<a href="#gdcalert11">alert11</a>
<a href="#gdcalert12">alert12</a>
<a href="#gdcalert13">alert13</a>
<a href="#gdcalert14">alert14</a>
<a href="#gdcalert15">alert15</a>
<a href="#gdcalert16">alert16</a>
<a href="#gdcalert17">alert17</a>
<a href="#gdcalert18">alert18</a>
<a href="#gdcalert19">alert19</a>
<a href="#gdcalert20">alert20</a>
<a href="#gdcalert21">alert21</a>
<a href="#gdcalert22">alert22</a>
<a href="#gdcalert23">alert23</a>
<a href="#gdcalert24">alert24</a>
<a href="#gdcalert25">alert25</a>
<a href="#gdcalert26">alert26</a>
<a href="#gdcalert27">alert27</a>
<a href="#gdcalert28">alert28</a>
<a href="#gdcalert29">alert29</a>
<a href="#gdcalert30">alert30</a>
<a href="#gdcalert31">alert31</a>
<a href="#gdcalert32">alert32</a>
<a href="#gdcalert33">alert33</a>
<a href="#gdcalert34">alert34</a>
<a href="#gdcalert35">alert35</a>
<a href="#gdcalert36">alert36</a>
<a href="#gdcalert37">alert37</a>
<a href="#gdcalert38">alert38</a>
<a href="#gdcalert39">alert39</a>
<a href="#gdcalert40">alert40</a>

<p style="color: red; font-weight: bold">>>>>> PLEASE check and correct alert issues and delete this message and the inline alerts.<hr></p>


**Zenodo como tecnología para la Plataforma de Datos Abiertos de Investigación de la DGRU-UNAM.**


# Acerca de Zenodo

Zenodo es una plataforma desarrollada y mantenida por OpenAIRE y CERN (Organización Europea para la Investigación Nuclear) para cubrir la necesidad de tener un repositorio donde los datos obtenidos por los diversos grupos de investigación científica estuviera disponible al público a través de una interfaz intuitiva y donde se pudiera citar desde los artículos científicos, hasta el conjunto de datos utilizado, de ésta manera contribuyendo al movimiento de ciencia reproducible. Así mismo Zenodo cuenta con comunidades que le permiten que grupos con temas similares puedan ser agrupados en las facetas de búsqueda.

La plataforma Zenodo, al ser de código abierto, permite la personalización y adaptación a las diferentes necesidades de desarrollo de plataformas de datos abiertos de investigación.

A continuación se presenta la guía que describe de manera general la instalación y la navegación por la plataforma Zenodo adaptada a un ambiente de desarrollo local. 


[TOC]




<p id="gdcalert1" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/Datos-Abiertos0.png). Store image on your image server and adjust path/filename if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert2">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/Datos-Abiertos0.png "image_tooltip")



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



<p id="gdcalert2" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/Datos-Abiertos1.png). Store image on your image server and adjust path/filename if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert3">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/Datos-Abiertos1.png "image_tooltip")


Nota: se debe tener una cuenta para poder cargar datos y crear comunidades. Sin embargo, se pueden explorar los archivos en la plataforma sin necesidad de iniciar sesión.


### **Carga manual de datos **

Para comenzar el proceso de carga, busque el botón de carga que se encuentra en el encabezado de la página web. La figura 3 a continuación muestra la ubicación del botón de carga.

Figura 3. Menú para subida de archivos.



<p id="gdcalert3" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/Datos-Abiertos2.png). Store image on your image server and adjust path/filename if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert4">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/Datos-Abiertos2.png "image_tooltip")


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



<p id="gdcalert4" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/Datos-Abiertos3.png). Store image on your image server and adjust path/filename if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert5">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/Datos-Abiertos3.png "image_tooltip")



#### **Licencias de uso.**

Parte de la información requerida para cargar un archivo es la sección de “Licencia”. Si bien Zenodo fomenta que todos los datos se compartan, también permite diferentes niveles de visibilidad, incluidos el acceso abierto, acceso con embargo, acceso restringido y el acceso cercano. El acceso abierto requiere un nombre de licencia, el acceso con embargo requiere un nombre de licencia y una fecha de embargo, el acceso restringido requiere condiciones para otorgar a otros usuarios acceso a los datos publicados, y el acceso cerrado no requiere información adicional. 



<p id="gdcalert5" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/Datos-Abiertos4.png). Store image on your image server and adjust path/filename if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert6">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/Datos-Abiertos4.png "image_tooltip")


Posteriormente en la sección de carga de datos se incluyen otros apartados que son: comunidades, financiamiento e identificadores alternativos. 



*   Las comunidades permiten que los grupos tengan archivos cargados y agrupados. Las comunidades permiten que los grupos tengan su propio repositorio digital.
*   Información sobre financiamiento. Si tiene alguna subvención que da financiamiento a su investigación, puede ingresarla en esta sección. 
*   Finalmente tenemos identificaciones alternativos. En esta sección debe incluir identificadores para cualquier información relacionada con la que está cargando. 



<p id="gdcalert6" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/Datos-Abiertos5.png). Store image on your image server and adjust path/filename if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert7">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/Datos-Abiertos5.png "image_tooltip")



#### **Información opcional**

La parte final del proceso de carga incluye información opcional que el usuario puede ingresar. 



<p id="gdcalert7" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/Datos-Abiertos6.png). Store image on your image server and adjust path/filename if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert8">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/Datos-Abiertos6.png "image_tooltip")



### **Interfaz de búsqueda**



<p id="gdcalert8" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/Datos-Abiertos7.png). Store image on your image server and adjust path/filename if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert9">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/Datos-Abiertos7.png "image_tooltip")


Con la funcionalidad de búsqueda, el usuario puede buscar un conjunto específico de datos dentro del archivo de datos. El usuario puede buscar un archivo buscando los metadatos específicos que se ingresaron durante la carga de ese archivo. Así mismo el uso de palabras clave durante la carga de los datos permite agilizar la búsqueda y exploración de los archivos. Los resultados de la búsqueda muestran la siguiente información: fecha publicada, tipo de datos, tipo de acceso, título, descripción y fecha de carga. También puede hacer clic en el botón de vista para ver los datos en ese cuadro de búsqueda. En el lado izquierdo de la interfaz de búsqueda y exploración hay varias facetas que se utilizan para filtrar la cantidad de registros devueltos en la búsqueda.


### **Ejemplo de carga de metadatos con Dublin Core.**

La arquitectura de Zenodo permite etiquetar los datos cargados hacia un conjunto de metadatos. Una vez que se ha depositado un conjunto de datos, Zenodo proporciona una herramienta para exportar sus metadatos correspondientes en varios formatos. En el siguiente ejemplo se muestra la exportación de un conjunto de datos en el estándar Dublin Core, el cual contiene etiquetas para campos como creador, fecha, descripción y asunto, todos los cuales se proporcionan en formato .xml. 



<p id="gdcalert9" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/Datos-Abiertos8.png). Store image on your image server and adjust path/filename if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert10">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/Datos-Abiertos8.png "image_tooltip")


Para acceder a la sección de exportación, haga lo siguiente:



1. Encuentre el archivo que desea ver.
2. Haga clic en la vista para ir a la página del documento.
3. Busque el cuadro de exportación.
4. Haga clic en Dublin Core.



<p id="gdcalert10" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/Datos-Abiertos9.png). Store image on your image server and adjust path/filename if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert11">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/Datos-Abiertos9.png "image_tooltip")



### **Tablero de administración:**



1. Manejo de usuarios
2. Manejo de registros
3. Manejo de comunidades
4. Cosecha de metadatos entre repositorios (OAI-PMH).



<p id="gdcalert11" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/Datos-Abiertos10.png). Store image on your image server and adjust path/filename if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert12">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/Datos-Abiertos10.png "image_tooltip")



### **Autenticación con número de cuenta.**


### **Control de versiones de la plataforma.**


# 3. Comunidades


### **Comunidades **

Las comunidades de Zenodo fueron pensadas en la colaboración de grupos de investigación que trabajan temáticas similares. Con las comunidades, los grupos pueden tener archivos cargados y agrupados, permitiendo que cada grupo pueda tener “sub - repositorios”. El botón de comunidades se encuentra en el encabezado al lado del botón de carga. 

Así mismo la interfaz web de las Comunidades tiene una barra de búsqueda que permite hacer la búsqueda de comunidades por medio de palabras clave o por su nombre.


#### **Crear una comunidad**

Para crear una comunidad es necesario que el usuario esté registrado en la plataforma e inicie sesión.



1. Vaya a la página web de comunidades en el sitio web de Zenodo.



<p id="gdcalert12" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/Datos-Abiertos11.png). Store image on your image server and adjust path/filename if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert13">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/Datos-Abiertos11.png "image_tooltip")




2. Haga clic en el botón "Nuevo" ubicado en el lado derecho de la pantalla.

     

<p id="gdcalert13" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/Datos-Abiertos12.png). Store image on your image server and adjust path/filename if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert14">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/Datos-Abiertos12.png "image_tooltip")



    	

3. Posteriormente se le dirigirá a un formulario para completar la siguiente información:
    1. Identificador: identifica la comunidad y se incluye en la URL de la comunidad. Éste paso no se puede modificar más adelante.
    2. Título: un título para su comunidad
    3. Descripción (opcional): permite asignar una breve descripción de la comunidad.
    4. Curación (opcional): describe la política en la que aceptará y rechazará la ingesta de nuevos datos en la comunidad.
    5. Página (opcional): una descripción larga de la comunidad que se mostrará en una página separada vinculada en el índice.
    6. Logo - Una imagen para ayudar y promover el reconocimiento público. 
4. Haga clic en Crear y la comunidad podrá verse de manera pública en la interfaz web.


#### **Editar una comunidad**



1. Hacer clic en el botón Comunidades.
2. Encuentre su comunidad en el panel de la derecha.
3. Haga clic en el menú desplegable de acciones y seleccione Editar.



<p id="gdcalert14" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/Datos-Abiertos13.png). Store image on your image server and adjust path/filename if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert15">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/Datos-Abiertos13.png "image_tooltip")


La información que puede ser editada en una comunidad ya existente es la siguiente: Título, Descripción, Política de Curación, Página y Logotipo. 


#### **Eliminar una comunidad**

También puede eliminar la comunidad en esta página. El botón Eliminar se encuentra en la parte inferior de la página. 



<p id="gdcalert15" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/Datos-Abiertos14.png). Store image on your image server and adjust path/filename if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert16">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/Datos-Abiertos14.png "image_tooltip")



#### **Comunidades**

También se puede acceder a cualquiera de las tareas sobre comunidades por medio de los enlaces que Zenodo les asigna:



<p id="gdcalert16" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/Datos-Abiertos15.png). Store image on your image server and adjust path/filename if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert17">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/Datos-Abiertos15.png "image_tooltip")



#### **Curar comunidades**



1. Hacer clic en el botón Comunidades.
2. Encontrar la comunidad a curar en el panel de la derecha.
3. Haga clic en el menú desplegable de acciones y seleccionar.



<p id="gdcalert17" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/Datos-Abiertos16.png). Store image on your image server and adjust path/filename if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert18">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/Datos-Abiertos16.png "image_tooltip")


En esta página puede seleccionar un archivo ya cargado y aceptar o rechazar el archivo para que aparezca como parte de la comunidad.


#### **Ver comunidades**



1. Hacer clic en los botones de Comunidades. 
2. Encuentre la comunidad a editar en el panel de la derecha.
3. Haga clic en el menú desplegable y seleccione Ver.


## 

<p id="gdcalert18" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/Datos-Abiertos17.png). Store image on your image server and adjust path/filename if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert19">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/Datos-Abiertos17.png "image_tooltip")


En esta sección se puede ver información sobre su comunidad y cualquier archivo que se cargue en su comunidad.



<p id="gdcalert19" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/Datos-Abiertos18.png). Store image on your image server and adjust path/filename if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert20">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/Datos-Abiertos18.png "image_tooltip")


	Registro e iniciar sesión



<p id="gdcalert20" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/Datos-Abiertos19.png). Store image on your image server and adjust path/filename if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert21">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/Datos-Abiertos19.png "image_tooltip")


	Subir documentos

<p id="gdcalert21" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/Datos-Abiertos20.png). Store image on your image server and adjust path/filename if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert22">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/Datos-Abiertos20.png "image_tooltip")




<p id="gdcalert22" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/Datos-Abiertos21.png). Store image on your image server and adjust path/filename if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert23">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/Datos-Abiertos21.png "image_tooltip")


	Editar documentos



<p id="gdcalert23" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/Datos-Abiertos22.png). Store image on your image server and adjust path/filename if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert24">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/Datos-Abiertos22.png "image_tooltip")




<p id="gdcalert24" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/Datos-Abiertos23.png). Store image on your image server and adjust path/filename if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert25">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/Datos-Abiertos23.png "image_tooltip")




<p id="gdcalert25" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/Datos-Abiertos24.png). Store image on your image server and adjust path/filename if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert26">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/Datos-Abiertos24.png "image_tooltip")


	Comunidades



<p id="gdcalert26" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/Datos-Abiertos25.png). Store image on your image server and adjust path/filename if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert27">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/Datos-Abiertos25.png "image_tooltip")




<p id="gdcalert27" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/Datos-Abiertos26.png). Store image on your image server and adjust path/filename if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert28">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/Datos-Abiertos26.png "image_tooltip")


	

Crear comunidades



<p id="gdcalert28" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/Datos-Abiertos27.png). Store image on your image server and adjust path/filename if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert29">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/Datos-Abiertos27.png "image_tooltip")


	Administrar comunidades



<p id="gdcalert29" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/Datos-Abiertos28.png). Store image on your image server and adjust path/filename if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert30">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/Datos-Abiertos28.png "image_tooltip")


	Administrar usuarios



<p id="gdcalert30" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/Datos-Abiertos29.png). Store image on your image server and adjust path/filename if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert31">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/Datos-Abiertos29.png "image_tooltip")


Versiones:



<p id="gdcalert31" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/Datos-Abiertos30.png). Store image on your image server and adjust path/filename if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert32">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/Datos-Abiertos30.png "image_tooltip")


Compartir recurso:



<p id="gdcalert32" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/Datos-Abiertos31.png). Store image on your image server and adjust path/filename if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert33">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/Datos-Abiertos31.png "image_tooltip")


Exportar recurso:



<p id="gdcalert33" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/Datos-Abiertos32.png). Store image on your image server and adjust path/filename if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert34">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/Datos-Abiertos32.png "image_tooltip")


Exportar como formato BibTex:



<p id="gdcalert34" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/Datos-Abiertos33.png). Store image on your image server and adjust path/filename if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert35">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/Datos-Abiertos33.png "image_tooltip")


Exportar como formato CSL:



<p id="gdcalert35" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/Datos-Abiertos34.png). Store image on your image server and adjust path/filename if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert36">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/Datos-Abiertos34.png "image_tooltip")


Exportar como formato DataCite:



<p id="gdcalert36" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/Datos-Abiertos35.png). Store image on your image server and adjust path/filename if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert37">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/Datos-Abiertos35.png "image_tooltip")


Exportar como formato Dublin Core:



<p id="gdcalert37" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/Datos-Abiertos36.png). Store image on your image server and adjust path/filename if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert38">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/Datos-Abiertos36.png "image_tooltip")


Exportar como formato JSON:



<p id="gdcalert38" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/Datos-Abiertos37.png). Store image on your image server and adjust path/filename if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert39">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/Datos-Abiertos37.png "image_tooltip")


Exportar como formato JSON-LD:



<p id="gdcalert39" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/Datos-Abiertos38.png). Store image on your image server and adjust path/filename if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert40">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/Datos-Abiertos38.png "image_tooltip")



# 4. Arquitectura Backend


## 	4.1. ¿Cómo son los datos almacenados en el servidor?



<p id="gdcalert40" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline drawings not supported directly from Docs. You may want to copy the inline drawing to a standalone drawing and export by reference. See <a href="https://github.com/evbacher/gd2md-html/wiki/Google-Drawings-by-reference">Google Drawings by reference</a> for details. The img URL below is a placeholder. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert41">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![drawing](https://docs.google.com/a/google.com/drawings/d/12345/export/png)


## 4.2. Acuñación del DOI.


## 4.3. Autenticación del usuario.


## 4.4. Búsqueda de recursos con Elasticsearch.


# 5. Interacción con Zenodo por medio de la API.


## 	5.1. Ingesta de datos desde Python.


## 	5.2. Consumo de datos desde Python.


## 	5.3. Ingesta de datos desde R.


## 	5.4. Consumo de datos desde R.


<!-- Docs to Markdown version 1.0β17 -->

