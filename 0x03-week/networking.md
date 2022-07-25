<p>REFERENCE: https://medium.com/@ogunbodetimi/what-happens-when-you-type-https-www-google-com-in-your-browser-and-press-enter-e7418806de5c<p>

<h2>Questions</h2>
<ul>
  <li> What is the OSI model? </li>
  <li> Explain the different layers of the OSI model. </li>
  <li> What do you mean by the TCP/IP Model? </li>
  <li> What do you mean by HTTP, TCP and UDP </li>
  <li> What is a Firewall? </li>
  <li> Explain DNS </li>
  <li> Serve a simple application running on any random port (eg: 3000) via Nginx </li>
  <li> Install SSL/TLS certificate in Nginx to load application over HTTPS </li>
</ul>


<ul>
  <li>
  <h1>1.</h1>
    <p>
      Simply put, the OSI (Open System Interconection) model is a set of rules/guidelines set in place for computers to communicate with one another regardless of their underlying structures.
    </p>
  </li>

  <li>
    <h1>2.</h1>
    <p>
      There a seven different layers that the OSI model follows for every communication 
      that takes place.
    </p>
    <p></p>
    <p> 1. Physical layer </p>
    <p> 2. Data link layer </p>
    <p> 3. Network layer </p>
    <p> 4. Transport layer </p>
    <p> 5. Session layer </p>
    <p> 6. Presentation layer </p>
    <p> 7. Application layer </p>
    <p></p>
    <p>
      To explain the seven layers, it is helpful that we start from layer 7 since that layer
      is closest to the user and cummunication is initiated by the user.
    </p>
    <p></p>
    <p>
      7. Application layer - This layer is responsible for defining the protocols that the data is transmitted with. This could be HTTP, SMTP, DNS, FTP. These different protocols have thier different   applications. So basically, when a communication is requested by a client (lets assume visiting a website for this scenerio) the protocol for this usually would be HTTPS and it is defined at the application layer.
    </p>
    <p></p>
    <p>
      6. Presentation layer - There are three main functions for the presentation layer. Translation, encrytpion/decryption and compression of data. 
        <p> - Translation is used to convert the incoming data to the required format on the client machine. </p>
        <p> - Encryption is used to protect data being sent over the client Network and the reverse (decrytion) happens for incoming traffic. </p>
        <p> - Compression is used to reduce the size of data being transmited to improve efficiency and speed of communication. </p>
        <p></p>         
        <p>
          continuing with our scenerio, at this layer, data is translated (lets assume to UTF-8 format). Then the data to be sent is encrypted (lets assume with the use of an SSL certificate) and finally, the data is compressed using a data compression algorithm.
        </p>
    </p>
    <p></p>
    <p>
      5. Session layer -  This layer controls the session for the requested connection. It primarily controls the opening and closing of ports on the client machine and closes it once the request has been fulfilled by the host. This layer is also responsible for synchronizing data with checkpoints to ensure continuity in an event of a break in transmission. In our scenerio, the port responsible for this would be 443 for HTTPS and 80 for HTTP protocols. So the session layer manages the opening and closing of these ports per request.
    </p>
    <p></p>
    <p>
      4. Transport layer - This layer is responsible for breaking the data being sent into chunks called segments before sending it further down the chain. It is also responsible for control flow. This is basically to ensure optimal connection speeds such that a sender with a very fast transmission speed doesnt overwhelm a reciever with slower connections.
    </p>
    <p></p>
    <p>
      3. Network layer - This layer is essential for communication hapenning over differnt networks. It also breaks down data from the Transport layer (segments) into even smaller pieces called packets. It does the reverse (reassemble) packets on the recievers end. It is also responsible for routing (which determines the best path from source to destination) and Logical addressing which places the ip addresses of both sender and reciever on the request header which helps distinguish both devices uniquely and universally.
    </p>
    <p></p>
    <p>
      2. Data-link layer - This layer ensures data transfer is error free from one node to another. It further breaks data into smaller units called frames.
    </p>
    <p></p>
    <p>
      1. Physical layer - Finally, the physical layer is responsible for breaking down data into bits of 1's and 0's. This is the lowest level of the chain and it performs operations such as bit synchronization and bit rate control.
    </p>
  </li>

  <li>
    <h1>3.</h1>
    <p> 
      TCP/IP or Transmission Control Protocol/Internet Protocol as the names imply, are a set of rules/guidelines that interconnect network devices over the internet. It is also used in private network of devices.
    <p>
  </li>

  <li>
    <h1>4.</h1>
    <p>
      HTTP, TCP and UDP all perform one function which is to define a set of rules in order to send data over the internet.
    </p>
    <ul>
      <li>
        HTTP - The Hyper Text Transfer Protocol is used for transfer of data throught Hyper text links. It is mainly used for web pages. As described earlier, it is an application layer protocol.
      </li>
      <li>
        UDP - The User Datagram Protocol is mainly used for transfer of real time data. This protocol is ideal for videos because during transmission, some data packets are lost but not significant enough to distort relevant information. This protocol is mainly used because of its speed.
      </li>
    </ul>
  </li>
  <p></p>
  <li>
    <h1>5.</h1>
    <p>
      A firewall is put in place by the server being requested and its purpose is to monitor every incoming and outgoing traffic and filters out unwanted/unauthorised traffic from getting into the server An example of an unwanted traffic would be a hacker who is trying to access information from a database of a company. The firewall filters out such requests and prevents relevant information from getting into the wrong hands.
    </p>
  </li>
  <p></p>
  <li>
    <h1>6.</h1>
    <p>
      DNS is an abbreviation for Domain Name System. The domain naming system is responsible for resolving a domain name to a an IP address. For more context, it resolves “google.com” to the IP address of google’s servers. In a lot of cases, Domain name points directly to a load balancer which then distributes the requests to the web/application servers. There are several steps the browser takes in order to get the appropriate IP address.
    <p>
    <ul>
      <li>
        Browser cache memory: The browser first checks its cache memory for the requested domain name. If the site has been visited recently by your web browser, it is most likely the case that your browser has the IP address of the domain name (google.com) in its cache memory. This allows for greater speeds when browsing the internet.
      </li>
      <li>
        Operating System: If the browser doesn’t find the IP address for the domain name in the cache memory, it goes ahead to request the IP address from the Operating System of your computer. The computer then checks it’s cache memory for the IP address. If the IP address is found in the cache of the OS, the OS returns the IP address to the browser otherwise a request is made to a resolver.
      </li>
      <li>
        Resolver: The resolver is usually you Internet Service Provider (ISP). The resolver checks it’s cache memory first and returns the IP address if it is found. If the IP address is not found, the resolver forwards the request to the root server. The resolver always has the IP address of the root server.
      </li>
      <li>
        Root Server: Again, the root server checks its cache memory for the IP address and if it is found the IP address is returned to the resolver. If it is not found, it stores the information first and then ask’s the Top Level Domain (TLD) server. In this case the “.com” server.
      </li>
      <li>
        Top Level Domain server: The domain name always have relevant information because when a domain name is purchased by a company, it is registered with the TLD registrar and the TLD communicates with the Authoritative name servers (ANS). The domain name is searched and all corresponding authoritative name servers are returned to the resolver. The resolver then makes a request to any of the ANS and the ip address for that request is provided.
      </li>
    </ul>
      <p> The resolver then returns the IP to the OS and the OS saves the information in it’s cache memory. And finally, the IP address is communicated to the browser. </p>
  <p></p>
  <li>
    <h1>7.</h1>
    <h2>Steps to install Nginx (on mac using homebrew) and run an app on port 3000</h2>
    <ul>
      <li>
        install nginx on mac by running command "brew install nginx"
      </li>
      <li>
        Start nginx as a deamon process by running command "sudo nginx"
      </li>
      <li>
        To configure nginx to listen on port 3000,
        <ul>
          <li> Run command "sudo nginx -s stop" to stop the process from running </li>
          <li> Next, use any text editor of your choice and open the configuration file "/usr/local/etc/nginx/nginx.conf" </li>
          <li> Now locate the "server {}" block and change the number on the "listen" line to "3000" </li>
          <li> Save the file and run nginx again</li>
        </ul>
        To serve static html files through Nginx,
        <ul>
          <li> Run command "sudo nginx -s stop" to stop the process from running </li>
          <li> Inside the "server {}" block, locate the "location" block and add your file path</li>
          <li> it should be in the format "root /dir/.../file.html"</li>
          <li> Save the file and run nginx again</li>
        </ul>
        <p> You should have something like this after making changes to the configuration file </p>
        <img src='server-conf1' width='350'>
      </li>
    </ul>
  </li>
  <li>
    <h1>8.</h1>
  </li>
</ul>
