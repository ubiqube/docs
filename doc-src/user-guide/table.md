+-----------------------+-----------------------+-----------------------+
| Field Name            | Description           | Mandatory             |
+=======================+=======================+=======================+
| Name                  | A free text field to  | Yes                   |
|                       | specify a name for    |                       |
|                       | the device.           |                       |
+-----------------------+-----------------------+-----------------------+
| External reference    | A unique value that   | No                    |
|                       | can be used to        |                       |
|                       | identify the device.  |                       |
|                       |                       |                       |
|                       | Usually used for      |                       |
|                       | integration with      |                       |
|                       | third party tools.    |                       |
+-----------------------+-----------------------+-----------------------+
| Management IP address | The IP address used   | Yes                   |
|                       | by the MSActivator to |                       |
|                       | manage and monitor    |                       |
|                       | the device.           |                       |
+-----------------------+-----------------------+-----------------------+
| Management interface  | The MSActivator       | No                    |
| name                  | polling engine will   |                       |
|                       | use this information  |                       |
|                       | to look into the MIB  |                       |
|                       | for the OID of        |                       |
|                       | traffic monitoring    |                       |
|                       | information.          |                       |
+-----------------------+-----------------------+-----------------------+
| Hostname              | The hostname of the   | No                    |
|                       | device that will be   |                       |
|                       | used by the syslog    |                       |
|                       | collector to match    |                       |
|                       | the syslog to a       |                       |
|                       | device in the         |                       |
|                       | MSActivator database. |                       |
+-----------------------+-----------------------+-----------------------+
| User name             | The login used by the | Yes                   |
|                       | MSActivator           |                       |
|                       | configuration module  |                       |
|                       | to execute            |                       |
|                       | configuration actions |                       |
|                       | on the device.        |                       |
+-----------------------+-----------------------+-----------------------+
| User Password         | The password for the  | Yes                   |
|                       | login.                |                       |
+-----------------------+-----------------------+-----------------------+
| Silver Monitoring     | Activate SNMP based   | No                    |
|                       | monitoring.           |                       |
+-----------------------+-----------------------+-----------------------+
| SNMP community        | The community to use  | Yes                   |
|                       | by the MSActivator to |                       |
|                       | execute SNMP requests | (if Silver monitoring |
|                       | on the device.        | is enabled)           |
+-----------------------+-----------------------+-----------------------+
| Monitoring port       | Default is SNMP port  | Yes                   |
|                       | 161, but it can be    |                       |
|                       | customized if         | (if Silver monitoring |
|                       | required.             | is enabled)           |
+-----------------------+-----------------------+-----------------------+
| Gold Monitoring       | Activate to enable    | No                    |
|                       | syslog collecting     |                       |
|                       | without parsing the   |                       |
|                       | syslogs.              |                       |
+-----------------------+-----------------------+-----------------------+
| Security Reports      | Activate syslog       | No                    |
|                       | collecting and        |                       |
|                       | parsing.              |                       |
+-----------------------+-----------------------+-----------------------+
