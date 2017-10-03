/*
Navicat MySQL Data Transfer

Source Server         : aliyun_for_me
Source Server Version : 50637
Source Host           : 47.95.250.36:3306
Source Database       : blog

Target Server Type    : MYSQL
Target Server Version : 50637
File Encoding         : 65001

Date: 2017-09-28 18:05:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for blog_article
-- ----------------------------
DROP TABLE IF EXISTS `blog_article`;
CREATE TABLE `blog_article` (
  `article_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '标题',
  `type` int(11) DEFAULT NULL,
  `label` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `content` longtext CHARACTER SET utf8,
  `create_time` datetime DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='文章';

-- ----------------------------
-- Records of blog_article
-- ----------------------------
INSERT INTO `blog_article` VALUES ('2', '解决tomcat启动卡住的问题', '1', 'tomcat', '<p style=\"text-align: left;\">第一次遇到Tomcat在Linux服务器启动卡住的情况，情况很简单，tomcat启动以后卡在INFO: Deploying web application directory ......这句话，具体会卡多久就没测试了。google、baidu都没找到解决方法。</p>\r\n<p style=\"text-align: left;\">幸亏UCloud的技术支持人员给出了解决方案。</p>\r\n<p style=\"text-align: left;\">找到jdk1.x.x_xx/jre/lib/security/java.security文件，在文件中找到securerandom.source这个设置项，将其改为：</p>\r\n<p style=\"text-align: left;\">securerandom.source=file:/dev/./urandom 如下图所示:</p>\r\n<p><img src=\"http://yakai.oss-cn-beijing.aliyuncs.com/article_img/java.security.png\" alt=\"\" /></p>\r\n<p style=\"text-align: left;\">这时候根据修改内容就可以查到因为此原因不仅可以造成tomcat卡住，也会造成weblogic启动缓慢，</p>\r\n<p style=\"text-align: left;\">linux或者部分unix系统提供随机数设备是/dev/random 和/dev/urandom ，两个有区别，urandom安全性没有random高，但random需要时间间隔生成随机数。jdk默认调用random。</p>', '2017-09-19 15:59:20', '2017-09-19 15:59:22');
INSERT INTO `blog_article` VALUES ('3', 'CentOS7安装mysql', '3', 'linux', '<h3>本人用的服务器是CentOS7.3 64位,想在本机上安装mysql,网上一般给的答案都是</h3>\r\n<pre>#yum install mysql \r\n\r\n#yum install mysql-server\r\n\r\n#yum install mysql-devel</pre>\r\n<h3>安装mysql和mysql-devel都成功，但是安装mysql-server失败，如下：</h3>\r\n<pre>[root@yl-web yl]# yum install mysql-server\r\nLoaded plugins: fastestmirror\r\nLoading mirror speeds from cached hostfile\r\n * base: mirrors.sina.cn\r\n * extras: mirrors.sina.cn\r\n * updates: mirrors.sina.cn\r\nNo package mysql-server available.\r\nError: Nothing to do\r\n\r\n</pre>\r\n<h3>但是我还是喜欢用Mysql,所以上网查了下Centos7安装mysql的资料,整理如下:</h3>\r\n<pre>mkdir /mysoft \r\n\r\ncd /mysoft\r\n\r\n yum install mysql\r\n\r\nyum install mysql-devel \r\n\r\nwget <a href=\"http://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm\">http://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm</a> \r\n\r\nrpm -ivh mysql-community-release-el7-5.noarch.rpm \r\n\r\nyum install mysql-community-server \r\n\r\nservice mysqld restart</pre>\r\n<h3>安装好后,初始没有密码</h3>\r\n<h3></h3>\r\n<h3>设置密码,修改字符集,允许远程登录</h3>\r\n<pre>set password = password(\'yourpassword\'); \r\ngrant all privileges on *.* to root@\'%\'identified by \'yourpassword\'; \r\nflush privileges;</pre>\r\n<h3>修改字符集</h3>\r\n<h3>mysql配置文件为/etc/my.cnf</h3>\r\n<p>\r\n加上编码设置这里的字符编码必须和/usr/share/mysql/charsets/Index.xml中一致.\r\n</p>\r\n<h3><img src=\"http://yakai.oss-cn-beijing.aliyuncs.com/article_img/my.cnf_.png\" alt=\"\" /></h3>\r\n<h3>如需数据库对外开放,需要的打开3306端口,这里不再赘述.</h3>\r\n', '2017-09-19 16:22:13', '2017-09-19 16:22:15');
INSERT INTO `blog_article` VALUES ('4', 'Java中的异常和处理(转)', '1', 'java异常', '<p style=\"text-align: left;\">程序运行时，发生的不被期望的事件，它阻止了程序按照程序员的预期正常执行，这就是异常。异常发生时，是任程序自生自灭，立刻退出终止，还是输出错误给用户？</p>\r\n<p style=\"text-align: left;\">Java提供了更加优秀的解决办法：异常处理机制。</p>\r\n<p style=\"text-align: left;\">异常处理机制能让程序在异常发生时，按照代码的预先设定的异常处理逻辑，针对性地处理异常，让程序尽最大可能恢复正常并继续执行，且保持代码的清晰。</p>\r\n<p style=\"text-align: left;\">Java中的异常可以是函数中的语句执行时引发的，也可以是程序员通过throw 语句手动抛出的，只要在Java程序中产生了异常，就会用一个对应类型的异常对象来封装异常，JRE就会试图寻找异常处理程序来处理异常。</p>\r\n<p style=\"text-align: left;\">Throwable类是Java异常类型的顶层父类，一个对象只有是 Throwable 类的（直接或者间接）实例，他才是一个异常对象，才能被异常处理机制识别。JDK中内建了一些常用的异常类，我们也可以自定义异常。</p>\r\n<p style=\"text-align: left;\"><span style=\"color: #ff0000;\"><strong>Java异常的分类和类结构图</strong></span></p>\r\n<img src=\"http://yakai.oss-cn-beijing.aliyuncs.com/article_img/Exception.jpg\"/>\r\n<p style=\"text-align: left;\">Java标准裤内建了一些通用的异常，这些类以Throwable为顶层父类。</p>\r\n<p style=\"text-align: left;\">Throwable又派生出Error类和Exception类。</p>\r\n<p style=\"text-align: left;\">错误：Error类以及他的子类的实例，代表了JVM本身的错误。错误不能被程序员通过代码处理，Error很少出现。因此，程序员应该关注Exception为父类的分支下的各种异常类。</p>\r\n<p style=\"text-align: left;\">异常：Exception以及他的子类，代表程序运行时发送的各种不期望发生的事件。可以被Java异常处理机制使用，是异常处理的核心。</p>\r\n<p style=\"text-align: left;\">总体上我们根据Javac对异常的处理要求，将异常类分为2类。</p>\r\n<p style=\"text-align: left;\">非检查异常（unckecked exception）：Error 和 RuntimeException 以及他们的子类。javac在编译时，不会提示和发现这样的异常，不要求在程序处理这些异常。所以如果愿意，我们可以编写代码处理（使用try…catch…finally）这样的异常，也可以不处理。对于这些异常，我们应该修正代码，而不是去通过异常处理器处理 。这样的异常发生的原因多半是代码写的有问题。如除0错误ArithmeticException，错误的强制类型转换错误ClassCastException，数组索引越界ArrayIndexOutOfBoundsException，使用了空对象NullPointerException等等。</p>\r\n<p style=\"text-align: left;\">检查异常（checked exception）：除了Error 和 RuntimeException的其它异常。javac强制要求程序员为这样的异常做预备处理工作（使用try…catch…finally或者throws）。在方法中要么用try-catch语句捕获它并处理，要么用throws子句声明抛出它，否则编译不会通过。这样的异常一般是由程序的运行环境导致的。因为程序可能被运行在各种未知的环境下，而程序员无法干预用户如何使用他编写的程序，于是程序员就应该为这样的异常时刻准备着。如SQLException , IOException,ClassNotFoundException 等。</p>\r\n<p style=\"text-align: left;\">需要明确的是：检查和非检查是对于javac来说的，这样就很好理解和区分了。</p>\r\n<p style=\"text-align: left;\"><span style=\"color: #ff0000;\"><strong>初识异常</strong></span></p>\r\n<p style=\"text-align: left;\">异常是在执行某个函数时引发的，而函数又是层级调用，形成调用栈的，因为，只要一个函数发生了异常，那么他的所有的caller都会被异常影响。当这些被影响的函数以异常信息输出时，就形成的了异常追踪栈。</p>\r\n<p style=\"text-align: left;\">异常最先发生的地方，叫做异常抛出点。</p>\r\n<p style=\"text-align: left;\">从上面的例子可以看出，当devide函数发生除0异常时，devide函数将抛出ArithmeticException异常，因此调用他的CMDCalculate函数也无法正常完成，因此也发送异常，而CMDCalculate的caller——main 因为CMDCalculate抛出异常，也发生了异常，这样一直向调用栈的栈底回溯。这种行为叫做异常的冒泡，异常的冒泡是为了在当前发生异常的函数或者这个函数的caller中找到最近的异常处理程序。由于这个例子中没有使用任何异常处理机制，因此异常最终由main函数抛给JRE，导致程序终止。</p>\r\n<p style=\"text-align: left;\">上面的代码不使用异常处理机制，也可以顺利编译，因为2个异常都是非检查异常。但是下面的例子就必须使用异常处理机制，因为异常是检查异常。</p>\r\n<p style=\"text-align: left;\">代码中我选择使用throws声明异常，让函数的调用者去处理可能发生的异常。但是为什么只throws了IOException呢？因为FileNotFoundException是IOException的子类，在处理范围内。</p>\r\n<pre>@Test\r\npublic void testException() throws IOException\r\n{\r\n    //FileInputStream的构造函数会抛出FileNotFoundException\r\n    FileInputStream fileIn = new FileInputStream(\"E:a.txt\");\r\n    int word;\r\n    //read方法会抛出IOException\r\n\r\n    while((word =  fileIn.read())!=-1) \r\n\r\n    {\r\n\r\n        System.out.print((char)word);\r\n\r\n    }\r\n\r\n    //close方法会抛出IOException\r\n\r\n    fileIn.clos\r\n\r\n}</pre>\r\n<p style=\"text-align: left;\"><span style=\"color: #ff0000;\"><strong>异常处理的基本语法</strong></span></p>\r\n<p style=\"text-align: left;\">在编写代码处理异常时，对于检查异常，有2种不同的处理方式：使用try…catch…finally语句块处理它。或者，在函数签名中使用throws 声明交给函数调用者caller去解决。</p>\r\n<p style=\"text-align: left;\">try…catch…finally语句块</p>\r\n\r\n<pre>try{\r\n\r\n     //try块中放可能发生异常的代码。\r\n\r\n     //如果执行完try且不发生异常，则接着去执行finally块和finally后面的代码（如果有的话）。\r\n\r\n     //如果发生异常，则尝试去匹配catch块。\r\n\r\n\r\n\r\n}catch(SQLException SQLexception){\r\n\r\n    //每一个catch块用于捕获并处理一个特定的异常，或者这异常类型的子类。Java7中可以将多个异常声明在一个catch中。\r\n\r\n    //catch后面的括号定义了异常类型和异常参数。如果异常与之匹配且是最先匹配到的，则虚拟机将使用这个catch块来处理异常。\r\n\r\n    //在catch块中可以使用这个块的异常参数来获取异常的相关信息。异常参数是这个catch块中的局部变量，其它块不能访问。\r\n\r\n    //如果当前try块中发生的异常在后续的所有catch中都没捕获到，则先去执行finally，然后到这个函数的外部caller中去匹配异常处理器。\r\n\r\n    //如果try中没有发生异常，则所有的catch块将被忽略。\r\n\r\n\r\n\r\n}catch(Exception exception){\r\n\r\n    //...\r\n\r\n}finally{\r\n\r\n    \r\n\r\n    //finally块通常是可选的。\r\n\r\n   //无论异常是否发生，异常是否匹配被处理，finally都会执行。\r\n\r\n   //一个try至少要有一个catch块，否则， 至少要有1个finally块。但是finally不是用来处理异常的，finally不会捕获异常。\r\n\r\n  //finally主要做一些清理工作，如流的关闭，数据库连接的关闭等。 \r\n\r\n}</pre>\r\n<p style=\"text-align: left;\"><span style=\"color: #800000;\"><strong>需要注意的地方</strong></span></p>\r\n<p style=\"text-align: left;\">1、try块中的局部变量和catch块中的局部变量（包括异常变量），以及finally中的局部变量，他们之间不可共享使用。</p>\r\n<p style=\"text-align: left;\">2、每一个catch块用于处理一个异常。异常匹配是按照catch块的顺序从上往下寻找的，只有第一个匹配的catch会得到执行。匹配时，不仅运行精确匹配，也支持父类匹配，因此，如果同一个try块下的多个catch异常类型有父子关系，应该将子类异常放在前面，父类异常放在后面，这样保证每个catch块都有存在的意义。</p>\r\n<p style=\"text-align: left;\">3、java中，异常处理的任务就是将执行控制流从异常发生的地方转移到能够处理这种异常的地方去。也就是说：当一个函数的某条语句发生异常时，这条语句的后面的语句不会再执行，它失去了焦点。执行流跳转到最近的匹配的异常处理catch代码块去执行，异常被处理完后，执行流会接着在“处理了这个异常的catch代码块”后面接着执行。</p>\r\n<p style=\"text-align: left;\">有的编程语言当异常被处理后，控制流会恢复到异常抛出点接着执行，这种策略叫做：resumption model of exception handling（恢复式异常处理模式 ）</p>\r\n<p style=\"text-align: left;\">而Java则是让执行流恢复到处理了异常的catch块后接着执行，这种策略叫做：termination model of exception handling（终结式异常处理模式）</p>\r\n<p style=\"text-align: left;\">public static void main(String[] args){</p>\r\n\r\n<pre>try {\r\n\r\n            foo();\r\n\r\n        }catch(ArithmeticException ae) {\r\n\r\n            System.out.println(\"处理异常\");\r\n\r\n        }\r\n\r\n}\r\n\r\npublic static void foo(){\r\n\r\n        int a = 5/0;  //异常抛出点\r\n\r\n        System.out.println(\"为什么还不给我涨工资!!!\");  //////////////////////不会执行\r\n\r\n}</pre>\r\n<p style=\"text-align: left;\">throws 函数声明</p>\r\n<p style=\"text-align: left;\">throws声明：如果一个方法内部的代码会抛出检查异常（checked exception），而方法自己又没有完全处理掉，则javac保证你必须在方法的签名上使用throws关键字声明这些可能抛出的异常，否则编译不通过。</p>\r\n<p style=\"text-align: left;\">throws是另一种处理异常的方式，它不同于try…catch…finally，throws仅仅是将函数中可能出现的异常向调用者声明，而自己则不具体处理。</p>\r\n<p style=\"text-align: left;\">采取这种异常处理的原因可能是：方法本身不知道如何处理这样的异常，或者说让调用者处理更好，调用者需要为可能发生的异常负责。</p>\r\n<p style=\"text-align: left;\"><span style=\"color: #ff0000;\"><strong>finally块</strong></span></p>\r\n<p style=\"text-align: left;\">finally块不管异常是否发生，只要对应的try执行了，则它一定也执行。只有一种方法让finally块不执行：System.exit()。因此finally块通常用来做资源释放操作：关闭文件，关闭数据库连接等等。</p>\r\n<p style=\"text-align: left;\">良好的编程习惯是：在try块中打开资源，在finally块中清理释放这些资源。</p>\r\n<p style=\"text-align: left;\">需要注意的地方:</p>\r\n<p style=\"text-align: left;\">1、finally块没有处理异常的能力。处理异常的只能是catch块。</p>\r\n<p style=\"text-align: left;\">2、在同一try…catch…finally块中 ，如果try中抛出异常，且有匹配的catch块，则先执行catch块，再执行finally块。如果没有catch块匹配，则先执行finally，然后去外面的调用者中寻找合适的catch块。</p>\r\n<p style=\"text-align: left;\">3、在同一try…catch…finally块中 ，try发生异常，且匹配的catch块中处理异常时也抛出异常，那么后面的finally也会执行：首先执行finally块，然后去外围调用者中寻找合适的catch块。</p>\r\n<p style=\"text-align: left;\">这是正常的情况，但是也有特例。关于finally有很多恶心，偏、怪、难的问题，我在本文最后统一介绍了，电梯速达-&gt;：finally块和return</p>\r\n<p style=\"text-align: left;\"><span style=\"color: #ff0000;\"><strong>throw 异常抛出语句</strong></span></p>\r\n<p style=\"text-align: left;\">throw exceptionObject</p>\r\n<p style=\"text-align: left;\">程序员也可以通过throw语句手动显式的抛出一个异常。throw语句的后面必须是一个异常对象。</p>\r\n<p style=\"text-align: left;\">throw 语句必须写在函数中，执行throw 语句的地方就是一个异常抛出点，它和由JRE自动形成的异常抛出点没有任何差别。</p>\r\n<p style=\"text-align: left;\"><span style=\"color: #ff0000;\"><strong>异常的链化</strong></span></p>\r\n<p style=\"text-align: left;\">在一些大型的，模块化的软件开发中，一旦一个地方发生异常，则如骨牌效应一样，将导致一连串的异常。假设B模块完成自己的逻辑需要调用A模块的方法，如果A模块发生异常，则B也将不能完成而发生异常，但是B在抛出异常时，会将A的异常信息掩盖掉，这将使得异常的根源信息丢失。异常的链化可以将多个模块的异常串联起来，使得异常信息不会丢失。</p>\r\n<p style=\"text-align: left;\">异常链化:以一个异常对象为参数构造新的异常对象。新的异对象将包含先前异常的信息。这项技术主要是异常类的一个带Throwable参数的函数来实现的。这个当做参数的异常，我们叫他根源异常（cause）。</p>\r\n<p style=\"text-align: left;\">查看Throwable类源码，可以发现里面有一个Throwable字段cause，就是它保存了构造时传递的根源异常参数。这种设计和链表的结点类设计如出一辙，因此形成链也是自然的了。</p>\r\n<p style=\"text-align: left;\"><span style=\"color: #ff0000;\"><strong>自定义异常</strong></span></p>\r\n<p style=\"text-align: left;\">如果要自定义异常类，则扩展Exception类即可，因此这样的自定义异常都属于检查异常（checked exception）。如果要自定义非检查异常，则扩展自RuntimeException。</p>\r\n<p style=\"text-align: left;\">按照国际惯例，自定义的异常应该总是包含如下的构造函数：</p>\r\n<ul class=\"list-paddingleft-2\">\r\n 	<li style=\"text-align: left;\">一个无参构造函数</li>\r\n 	<li style=\"text-align: left;\">一个带有String参数的构造函数，并传递给父类的构造函数。</li>\r\n 	<li style=\"text-align: left;\">一个带有String参数和Throwable参数，并都传递给父类构造函数</li>\r\n</ul>	\r\n<p style=\"text-align: left;\">一个带有Throwable 参数的构造函数，并传递给父类的构造函数。</p>\r\n<p style=\"text-align: left;\"><span style=\"color: #ff0000;\"><strong>异常的注意事项</strong></span></p>\r\n<p style=\"text-align: left;\">1、当子类重写父类的带有 throws声明的函数时，其throws声明的异常必须在父类异常的可控范围内——用于处理父类的throws方法的异常处理器，必须也适用于子类的这个带throws方法 。这是为了支持多态。</p>\r\n<p style=\"text-align: left;\">例如，父类方法throws 的是2个异常，子类就不能throws 3个及以上的异常。父类throws IOException，子类就必须throws IOException或者IOException的子类。</p>\r\n<p style=\"text-align: left;\">2、Java程序可以是多线程的。每一个线程都是一个独立的执行流，独立的函数调用栈。如果程序只有一个线程，那么没有被任何代码处理的异常 会导致程序终止。如果是多线程的，那么没有被任何代码处理的异常仅仅会导致异常所在的线程结束。</p>\r\n<p style=\"text-align: left;\">也就是说，Java中的异常是线程独立的，线程的问题应该由线程自己来解决，而不要委托到外部，也不会直接影响到其它线程的执行。</p>\r\n<p style=\"text-align: left;\"><span style=\"color: #ff0000;\"><strong>finally块和return</strong></span></p>\r\n<p style=\"text-align: left;\">首先一个不容易理解的事实：在 try块中即便有return，break，continue等改变执行流的语句，finally也会执行。</p>\r\n<p style=\"text-align: left;\">也就是说：try…catch…finally中的return 只要能执行，就都执行了，他们共同向同一个内存地址（假设地址是0×80）写入返回值，后执行的将覆盖先执行的数据，而真正被调用者取的返回值就是最后一次写入的。那么，按照这个思想，下面的这个例子也就不难理解了。</p>\r\n<p style=\"text-align: left;\">finally中的return 会覆盖 try 或者catch中的返回值。</p>\r\nfinally中的return会抑制（消灭）前面try或者catch块中的异常 并且finally中的异常会覆盖（消灭）前面try或者catch中的异常\r\n<p style=\"text-align: left;\">因此建议：</p>\r\n<p style=\"text-align: left;\">不要在fianlly中使用return。</p>\r\n<p style=\"text-align: left;\">不要在finally中抛出异常。</p>\r\n<p style=\"text-align: left;\">减轻finally的任务，不要在finally中做一些其它的事情，finally块仅仅用来释放资源是最合适的。</p>\r\n<p style=\"text-align: left;\">将尽量将所有的return写在函数的最后面，而不是try … catch … finally中。</p>\r\n\r\n', '2017-09-20 11:33:07', '2017-09-20 11:33:09');

-- ----------------------------
-- Table structure for blog_type
-- ----------------------------
DROP TABLE IF EXISTS `blog_type`;
CREATE TABLE `blog_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_type
-- ----------------------------
INSERT INTO `blog_type` VALUES ('1', 'JAVA技术');
INSERT INTO `blog_type` VALUES ('2', 'JAVA框架');
INSERT INTO `blog_type` VALUES ('3', 'Linux技术');
INSERT INTO `blog_type` VALUES ('4', 'WEB前端');
INSERT INTO `blog_type` VALUES ('5', '代码管理');
INSERT INTO `blog_type` VALUES ('6', '代码质量');
INSERT INTO `blog_type` VALUES ('7', '微服务');
INSERT INTO `blog_type` VALUES ('8', '数据存储');
INSERT INTO `blog_type` VALUES ('9', '服务器');
INSERT INTO `blog_type` VALUES ('10', '消息队列');
INSERT INTO `blog_type` VALUES ('11', '其他');
