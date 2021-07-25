
El contingut adaptat del fitxer de properties s'ha de copiar dins el servidor i referenciar-lo
amb la propietat de sistema "es.caib.plabedu.properties".

Això és pot fer a dins el fitxer de configuració
    JBOSS_HOME\standalone\configuration\standalone.xml o equivalent
a dins l'apartat de <system-properties>:

    ...
    <system-properties>
        <property name="es.caib.plabedu.properties" value="/ruta/cap/al/fitxer/plabedu.properties"/>
    </system-properties>
    ...
