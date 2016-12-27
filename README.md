Multicraft-installer-custom-centos-7 Version 1.5
===================

Multicraft custom installer for centos 7. This script will install all the components and packages, dependencies multicraft needs to run. No support this script is intended for megabyte hosting and blueleaf hosting but you're free to use it at your own risk!

I have attached PocketMine, Genisys, ImagicalMine Phar, Config Files Also Included the php binarys files working

Pull Requests
=============
PHP accepts pull requests via github. Discussions are done on github, but
depending on the topic can also be relayed to the official developer
mailing list david.brockway@megabytehosting.net
New features require approval and must be accepted by the developers.

Bug fixes **do not** require an issue, to be open a a developher will
give you support and try to fix the issue you have. 
                         
Instructions Step 1
===================
1. Conect to your ftp server.
2. Upload the script to the server /root directory.
4. Open putty ssh conection to your server.
5. Change the script file permition with this command. chmod 777 /root/mc-installer.sh
6. Run the following command to start the script ./mc-installer.sh
7. Let the installer run and follow the instructions it tells you to complete.

PocketMine, Genisys, ImagicalMine installation instructions. Step 2
===================

1. Downalod MCPE Jars ,PHP Files,Pocketmine, Genisys, Imagicalmine.zip to you pc.
2. Extraxct MCPE Jars ,PHP Files,Pocketmine, Genisys, Imagicalminezip file to your pc download folder.
3. open the folder called MCPE Jars ,PHP Files,Pocketmine, Genisys, Imagicalmine.zip
4. Conect to your ftp server.
5. Go to the following directory /home/minecraft/multicraft/jar
6. Open putty ssh conection to your server
7. Run the following command. chmod go+x /home/minecraft/multicraft/jar/bin/php7/bin

Troubleshooting Multicarft problmes
===================

Error 500 CDbConnection failed to open the DB connection

If you are using SQLite
This might be a permission issue or a problem with the PHP "open_basedir" setting. When running the front end installer you will get a more detailed error message.
Please make sure that the web user can access the database file
Another problem could be that your PHP installation lacks SQLite support. In this case installing the PHP5 SQLite PDO support (in Debian using "aptitude install php5-sqlite") followed by a restart of the webserver should help.
If you are using MySQL
Your PHP installation needs MySQL PDO support, please check that this core extension is enabled
Please make sure the username/password combination is correct and has enough privileges to access the specified database
If you're using "localhost" as the database host try "127.0.0.1" and vice versa

Can't connect to Minecraft bridge! (110/111: Connection refused/timed out)
===================

Please check the following:
The daemon is running
Check the Multicraft status under "Settings"->"Multicraft Status", the IP and Port shown there have to match the IP/Port the daemon listens on
You can connect to the daemon from the machine running the front end by running "telnet IP PORT", where where IP and PORT are the values you use in the config file.
The daemon is not blocked by any firewall
Your panel machine can connect to the daemon machine. This requires PHP to be able to open outgoing TCP connections using "pfsockopen". If the panel is hosted with a hosting provider please contact them to check if this is possible.
Some explanation on the "ip" setting in "multicraft.conf":
The "ip" setting specifies which interface the daemon will listen on, the "externalIp" setting specifies which IP the control panel will try to connect to. If "ip" is set to "127.0.0.1" only a control panel on the same machine can connect to the daemon. To listen on all interfaces you can set "ip" to "0.0.0.0", however, you will have to set "externalIp" when you do that so the control panel knows where to connect.

Unable to access jarfile /home/minecraft/multicraft/jar/craftbukkit.jar
===================

This means that the user running the Minecraft servers can't access the JAR file because of the way the file permissions are set. The user needs to be able to traverse all intermediate directories up to the JAR file, so they need "execute" permissions for the directories "/home", "/home/minecraft" and "/home/minecraft/multicraft". Usually the setup.sh script takes care of that but when upgrading or installing without using the script the permissions could still be wrong. Most of the time the following command will fix the issue:

    chmod go+x /home/minecraft/multicraft/jar
    
Replace "/home/minecraft/" with your installation directory if it's different. Also take care not to give anyone but root read access to your configuration files.

    
Couldn't X: No connection for daemon 1
===================

This means that either the panel and the daemon are not using the same database or that the daemon has failed to connect to the database or that the daemon is simply not running.

During the daemon setup (the setup.sh script) you are asked to enter your database information which is then written to the multicraft.conf. The same database information has to be used in the panel installer (install.php) as the "Daemon database" (not to be confused with the "Panel Database"). The information set during the panel installer can be changed later in "protected/config/config.php".

Please make sure you have started the daemon as described in the installation instructions.
Sometimes this error can also point to a startup issue, for example when running a 32bit program on a 64bit server with the 32bit libraries missing. To make sure it starts up fine you can start Multicraft in the foreground by using the "-nv" switch, e.g.:
    
    /home/minecraft/multicraft/bin/multicraft -nv start

The server restarts / The console shows ping timeout
===================

This can be caused by Minecraft crashing or by misbehaving plugins. When a Minecraft server doesn't respond to commands anymore for a certain period of time the server will be restarted. If you think it's just your machine being overloaded and Minecraft hasn't really crashed you can try increasing the "Minecraft Response Timeout" under "Settings"->"Show advanced options".

The same issue can be caused by a plugin that either blocks the server from responding or alters the way the Minecraft console commands are named or what they return. Multicraft comes with support for Craftbukkit as well as several popular plugins but there can always be other plugins that are not yet compatible.

To run a server that prints the player list in an unrecognized format you can change the setting "Assume Minecraft is still running on" to "Any console output" under "Settings"->"Show Advanced Options". You can also disable the response timeout altogether by setting it to 0. This will effectively disable this kind of crash detection.

Support for such plugins can be added dynamically by altering the .jar.conf file as the whole interaction between Minecraft and Multicraft can be re-mapped in there. If you can identify the plugin causing issues we can evaluate adding support for it to the main release or if it's a niche plugin support can be added specifically for your setup.

I can't access http://localhost/ or I see error 504 under Windows
===================

Your system might be missing the Visual C++ 2008 runtime, you can download it from here:
Visual C++ 2008 Redistributable Package
Install this package then run stop.bat and then start.bat again to see if that fixes your issue.

If this did not help then this most likely means that there is already something running on port 80 so the built-in webserver can't start. You can change the port the built-in Nginx server uses:
Edit "Multicraft\nginx\conf\nginx.conf" line 16, change 80 to 8080, then run "stop.bat", then run "start.bat" then go to http://localhost:8080/

The server uses 32bit Java and can't allocate more than 1GB/2GB of memory
===================


The 32bit version of Java is very limited in terms of memory consumption. You need to install 64bit Java to allocate more memory for your server.
If it is installed and you still have issues please see the troubleshooting entry for "[Error 2] The system cannot find the file specified".

[Error 2] The system cannot find the file specified
===================

Under Linux this means that you don't have Java installed or accessible by the user running Minecraft. Please consult your system documentation on how to install Java.
Under Windows this means that either Java is not installed or it can't be found by Multicraft because the path to Java is not in the PATH environment variable for 32bit applications. You change the path Multicraft uses to start Java by editing your multicraft.conf and changing the "java =" line to:

    java = C:\Program Files\Java\jre7\bin\java.exe

Replace the path with the path to your Java.exe.

The panel takes longer than usual to display the server list
===================

A few possibilities for this are listed below, if they don't help with your issue, please contact support.
PHP might be getting too many requests, please check that your PHP installation can handle multiple requests at once or disable AJAX updates in the last step of the front end installer to alleviate the issue
SQLite corruption, if the panel takes a very long time to respond and you're using SQLite for the front end or the daemon database it could be a database corruption. Please contact support to help resolve this issue.
If other pages on the same webserver are still responding normally, check the daemon connection using "telnet IP PORT" where IP and PORT are the connection details to your daemon. This could be a network related issue.
Check that the system has enough available resources to handle http requests efficiently

Authentication failed! (incorrect authorization or invalid signature)
===================

The front end showing "incorrect authorization" means that the password specified in the "multicraft.conf" as the setting "password" does not match the "Daemon Password" specified in the last step of front end installer.
You can re-run the installer (install.php) to change that, it won't break anything if you just click "Continue". Alternatively you can manually edit the file "protected/config/config.php" in your front end directory and set the value of "daemon_password" accordingly.

This can also be caused by a wrong daemon entry in the database. Check all entries under "Settings"->"Multicraft Status" to make sure these daemons actually exist and that they match the daemon ID of the daemon running on that IP/port.

The error "invalid signature" means that you are most probably using a new 2.0.0 panel to connect to an old daemon. You can either upgrade your daemon to 2.0.0 as well (recommended) or enable the setting "Support Legacy Daemons" under "Settings"->"Panel Configuration" in the advanced settings.

Nothing happens when trying to run Multicraft on Linux (no error message)
===================

This can happen if you unpack the archive under Windows and then upload the files to Linux. The "bin/multicraft" file will be 0 bytes in size. To fix this download and unpack the archive directly on the Linux machine.

The server doesn't start/the player list doesn't work
===================

A Craftbukkit JAR file needs a compatible .jar.conf file. In case you have manually downloaded a different JAR file you can copy the default craftbukkit.jar.conf to the name of your new JAR file. More information on custom JARs is available here.

Trying to update Craftbukkit gives error 404
===================

The download location of the Craftbukkit snapshot has changed and thus an update via the control panel will give a 404 error. To fix this update the ".conf" file first (click Download and Install) and then update the JAR file. This will make sure that the up to date download link from the new conf file is used for downloading the JAR file.

CRITICAL Failed to connect to MySQL: (2002, "Can't connect to local MySQL server through socket '/var/run/mysqld/mysqld.sock' (2)")
===================

Please use "127.0.0.1" instead of "localhost" as the database host if you get this error. The MySQL client library included with Multicraft expects the MySQL socket to be in that location, by using "127.0.0.1" you can avoid using Unix socket connections.

Can't connect to Minecraft bridge! (13: Permission denied)
===================

Most probably you have SELinux installed. Multicraft needs to be able to connect to the daemon by opening a socket connection. To allow this run the following:

    setsebool -P httpd_can_network_connect 1
    setsebool -P httpd_can_network_connect_db 1

Uploading JAR files doesn't work: "Permission denied (file type access restricted)"
===================

By default JAR files are not allowed to be uploaded for security reasons (the setup.sh asks for this if you're using Linux). You can change the "forbiddenFiles" setting to an empty value in your multicraft.conf and then restart the daemon if you want to allow the upload of these files. 

The multicraft.log shows: "Query timed out, abandoning database thread"
===================

Here's a list of things that could be causing your queries to time out:
Firewall blocking the request either on the daemon or the MySQL server machine
Network connectivity issue resulting in a connection timeout
IP conflict on the network resulting in responses being sent to the wrong machine
Wrong or inexistent reverse DNS entry, the DNS resolution then times out the query

The "protected" directory is accessible through the webserver
===================

The "protected" folder contains a .htaccess file that will usually tell the webserver to prevent all access to this folder. On some systems this functionality is disabled and the .htaccess file has no effect.

You can check whether this applies to you by visiting your panel and replacing "index.php" with "protected/data/panel/schema.mysql.sql". For example:
http://example.com/multicraft/index.php
becomes
http://example.com/multicraft/protected/data/panel/schema.mysql.sql

If this downloads a file or shows some SQL statements then you must do either a) or b) until it doesn't display anything anymore.

Suggested solutions:
a) Enable the webserver to use the .htaccess file. This is usually done in your main Apache config file or in the config file of your website (apache2/sites-enabled/X) by changing "AllowOverride None" to "AllowOverride All" for your www directory or just adding this statement if it doesn't exist yet. A restart/reload of Apache is required after this.
For users of other webservers a different method might apply, please consult your webserver documentation for this. For example, with Nginx, adding the following code to the configuration should work:

    location /protected {
        deny all;
        return 404;
    }

b) Move the "protected" folder outside of the web accessible directories and change all paths in your index.php and api.php accordingly so the application still runs as usual.

The BukGet browser shows error 500 or an error with the database connection
===================

The BukGet browser uses a temporary SQLite database to cache the plugin list. Make sure your PHP installation supports the PDO SQLite extension, it is required for this feature. You should see a message about that when re-running the install.php.

The log shows "Failed to initialize server"
===================

This error message can have multiple causes, you will find a more detailed error message in the multicraft.log of your daemon.
The most common cause is that the files in the server directory of that server have the wrong owner. Please make sure the files are owned by the user/group mcX:mcX where X is the server ID. For example, the files of server 1 should be owned by mc1:mc1, so the example command to fix the permissions for server1 with the base directory "server1" would be:

    chown -R mc1:mc1 /home/minecraft/multicraft/servers/server1

Please note that a recursive chown on untrusted files is not safe and that these paths might be different for your installation.

If the multicraft.log shows an error with the "useragent.conf" please see the entry below.

The multicraft.log shows "useragent.conf: Permission denied"
===================

This means that the program bin/useragent doesn't have the correct permissions to access the config file mentioned. Please make sure the file bin/useragent is owned by root with the group set to the Multicraft user and that it has the correct permissions. For example:

    # chown root:minecraft bin/useragent
    # chmod 4550 bin/useragent

Please note that the order of these commands is important. Doing the chown afterwards will alter the permissions set using the chmod.

No resource display. The multicraft.log shows "Failed to calculate resource usage"
===================

The resource display can be disabled by setting "Minimum time between two resource checks" to 0 in the panel under "Settings" in the advanced options. You should make sure that this is not the case.

Another possibility is that your system does not allow the user running Multicraft to access the files in /proc/PID (PID is the process ID of the Minecraft server, so for example /proc/517/status. Access to these files is required for calculating the resource usage and by default this should not be a problem on any Linux system.
You can check whether this is a problem on your system by running the following command:

    su - minecraft -c 'cat /proc/123/stat'

Where "minecraft" would be the user running the daemon and "123" would be the PID of a Minecraft server (you can see the PID in the panel server view).

It is possible that your dedicated server uses a different kernel that doesn't allow access to these files for other processes. Please contact your server provider if this might be the case.
Another possibility is that you have special kernel additions called grsecurity installed on your system. These additions have the option to restrict access in this folder. Please also contact your server provider for help with this.

Windows servers show: Error writing to server: [Errno 28] No space left on device
===================

This is an issue with the JAR file used not emptying the standard input buffers. Most likely the .jar.conf file used is not compatible with this JAR file. Make sure your .conf files are up to date under Settings->Update Minecraft and that you're using a Craftbukkit compatible .conf file for CB JARs (this includes mod loaders like Forge).
More information on custom JARs can be found here

Most importantly: The Java command line needs to include the "--nojline" option.

Error X: Server not found (Y)
===================

If you have connected multiple daemons to the same panel you need to make sure that every daemon has a different daemon ID set in the multicraft.conf (setting "id").

Only the Dynamic license supports daemon IDs other than 1 so please also make sure that the Dynamic license has been correctly installed and that your license is currently active.

Another possible cause for this is a wrong "ip" setting or a wrong "id" setting in one of your daemons. Having the IP configured wrong will cause all requests for this daemon to go to a different IP and that IP will not know the server the request is for. Having the daemon ID wrong will cause it to replace the database entry of another daemon and cause all requests for that other daemon to go to the daemon with the wrong "id" setting.

If the issue persists then this troubleshooting entry should be able to help you.

The player list gets too big/Player names include times
===================

Make sure your .conf and JAR files are up to date under Settings->Update Minecraft, outdated conf files can cause display issues.

The server stays offline/The server status stays "changing"
===================

Make sure your .conf and JAR files are up to date under Settings->Update Minecraft, outdated conf files can cause display issues.

[SEVERE] java.lang.OutOfMemoryError: PermGen space
===================

Some mods require additional PermGen space, you can increase the default limit by adding the following to the "command" setting in the .jar.conf file used by your server:

    -XX:PermSize=256M -XX:MaxPermSize=512M

You can try different values instead of 256M and 512M to see what works best for your server.

For example, the default "command" setting for Craftbukkit would be:

    [start]
    command = "{JAVA}" -Xmx{MAX_MEMORY}M -Xms{START_MEMORY}M -Djline.terminal=jline.UnsupportedTerminal -jar "{JAR}" nogui

For a modpack with additional PermGen space requirements you could change that to:

    [start]
    command = "{JAVA}" -Xmx{MAX_MEMORY}M -Xms{START_MEMORY}M -XX:PermSize=256M -XX:MaxPermSize=512M -   Djline.terminal=jline.UnsupportedTerminal -jar "{JAR}" nogui

CException: Application runtime path "protected/runtime" is not valid
===================

This means that the webserver cannot write to the directory mentioned. To fix this, please make sure that:
The directory has the permissions set to 770
The directory is owned by the webserver user ("www-data" for Debian/Ubuntu, "apache" for CentOS, "nobody" on some other systems)
SELinux can also cause this error, to fix this you can either disable SELinux or run the following command on your front end files:
chcon -u user_u -r object_r -t httpd_sys_content_t /var/www/multicraft
Replace "/var/www/multicraft" with the path to your panel if it's different. 
