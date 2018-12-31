-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 14, 2018 at 06:40 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlinetutorialdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `belongs`
--

CREATE TABLE `belongs` (
  `GroupName` varchar(30) NOT NULL,
  `Username` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `belongs`
--

INSERT INTO `belongs` (`GroupName`, `Username`) VALUES
('Admin', 'shadab'),
('Faculty', 'Faculty'),
('Faculty', 'obaid'),
('Faculty', 'test'),
('Student', 'rehan');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `CID` int(11) NOT NULL,
  `dept_id` int(11) NOT NULL,
  `CName` varchar(100) NOT NULL,
  `COutcome` longtext NOT NULL,
  `CDuration` varchar(30) NOT NULL,
  `CPreq` varchar(100) DEFAULT NULL,
  `Last_Modified` timestamp(2) NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`CID`, `dept_id`, `CName`, `COutcome`, `CDuration`, `CPreq`, `Last_Modified`) VALUES
(5, 1, 'JSP', 'To be a great Web developer', '52-hr', 'HTML and CSS', '2018-10-13 17:23:53.00'),
(6, 1, 'PHP', 'To be a great Web developer ', '52-hr', 'HTML , CSS and javascript', '2018-10-13 17:24:13.00'),
(7, 1, 'ASP', 'something', '52-hr', 'something', '2018-10-13 19:32:53.00'),
(9, 1, 'something1', 'something1', '52-hr', 'something1', '2018-10-14 16:08:03.00'),
(10, 1, 'test', 'test', '52-hr', 'test', '2018-10-14 16:37:50.00');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `dept_id` int(11) NOT NULL,
  `dept_name` varchar(30) NOT NULL,
  `hod` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`dept_id`, `dept_name`, `hod`) VALUES
(1, 'Computer', NULL),
(2, 'Civil', NULL),
(3, 'Pharmarcy', NULL),
(4, 'Electronics', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dummy`
--

CREATE TABLE `dummy` (
  `id` int(11) NOT NULL,
  `Media` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dummy`
--

INSERT INTO `dummy` (`id`, `Media`) VALUES
(1, '1'),
(2, '2'),
(3, 'D:/DBMSMini/OnlineTutorial/WebContent/MediaFiles/test.mp4'),
(4, 'Mediafiles/test.mp4'),
(5, 'Mediafiles/test.mp4'),
(6, 'Mediafiles/test.mp4'),
(7, 'Mediafiles/test1.mp4'),
(8, 'Mediafiles/test.mp4'),
(9, 'Mediafiles/test1.mp4'),
(10, 'Mediafiles/test.mp4'),
(11, 'Mediafiles/test1.mp4'),
(12, 'MediaFiles/test.mp4'),
(13, 'MediaFiles/test.mp4'),
(14, 'MediaFiles/test.mp4');

-- --------------------------------------------------------

--
-- Table structure for table `enquiry`
--

CREATE TABLE `enquiry` (
  `ID` int(11) NOT NULL,
  `Name` char(100) NOT NULL,
  `Contact` varchar(15) NOT NULL,
  `Email` varchar(60) NOT NULL,
  `Subject` varchar(50) NOT NULL,
  `Mesg` longtext NOT NULL,
  `Time` timestamp(2) NOT NULL DEFAULT CURRENT_TIMESTAMP
) ;

--
-- Dumping data for table `enquiry`
--

INSERT INTO `enquiry` (`ID`, `Name`, `Contact`, `Email`, `Subject`, `Mesg`, `Time`, `GroupName`) VALUES
(13, 'demo', '8898115263', 'demo@gmail.com', 'hiie', 'this is testing', '2018-10-13 19:28:04.00', 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `FID` int(11) NOT NULL,
  `Designation` varchar(25) NOT NULL,
  `Qualification` varchar(100) NOT NULL,
  `Specialization` varchar(255) NOT NULL,
  `Experience` varchar(10) NOT NULL,
  `DOJ` date NOT NULL,
  `dept_id` int(11) DEFAULT NULL,
  `LastModified` timestamp(2) NULL DEFAULT NULL,
  `Username` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`FID`, `Designation`, `Qualification`, `Specialization`, `Experience`, `DOJ`, `dept_id`, `LastModified`, `Username`) VALUES
(3, 'Asst. Prof', 'B.E', 'Data Structure', '3', '2018-10-13', 1, '2018-10-13 10:30:04.00', 'obaid'),
(4, 'Asst. Prof', 'B.E', 'Data Structure', '3', '2018-10-14', 1, '2018-10-13 19:32:36.00', 'Faculty'),
(7, 'Ass.tProf', 'B.E', 'Data', '3', '2018-10-14', 1, '2018-10-14 16:37:36.00', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `GroupName` varchar(30) NOT NULL,
  `CreationTime` timestamp(2) NOT NULL DEFAULT CURRENT_TIMESTAMP
) ;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`GroupName`, `CreationTime`) VALUES
('Admin', '2018-10-11 03:28:00.00'),
('Faculty', '2018-10-11 03:28:30.00'),
('Student', '2018-10-11 03:30:11.12');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `RNO` int(11) NOT NULL,
  `Year` varchar(20) NOT NULL,
  `DOA` date DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  `Username` varchar(30) DEFAULT NULL,
  `Last_Modified` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`RNO`, `Year`, `DOA`, `dept_id`, `Username`, `Last_Modified`) VALUES
(3, '2018', '2018-10-13', 1, 'rehan', '2018-10-13 18:23:26'),
(6, '2018', '2018-10-14', 1, 'Student', '2018-10-14 16:38:45');

-- --------------------------------------------------------

--
-- Table structure for table `takes`
--

CREATE TABLE `takes` (
  `RNO` int(11) NOT NULL,
  `CID` int(11) NOT NULL,
  `Year` varchar(20) NOT NULL,
  `Percentage` decimal(5,2) DEFAULT NULL,
  `Grade` varchar(2) DEFAULT NULL,
  `EnrollTime` timestamp(2) NOT NULL DEFAULT CURRENT_TIMESTAMP
) ;

--
-- Dumping data for table `takes`
--

INSERT INTO `takes` (`RNO`, `CID`, `Year`, `Percentage`, `Grade`, `EnrollTime`, `Progress`) VALUES
(3, 5, '2018', '0.00', '0', '2018-10-13 18:23:26.00', '0'),
(6, 10, '2018', '0.00', '0', '2018-10-14 16:38:45.00', '0');

-- --------------------------------------------------------

--
-- Table structure for table `teaches`
--

CREATE TABLE `teaches` (
  `CID` int(11) NOT NULL,
  `FID` int(11) NOT NULL,
  `Year` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teaches`
--

INSERT INTO `teaches` (`CID`, `FID`, `Year`) VALUES
(5, 3, '2018'),
(6, 3, '2018'),
(7, 4, '2018'),
(10, 7, '2018');

-- --------------------------------------------------------

--
-- Table structure for table `tutorial`
--

CREATE TABLE `tutorial` (
  `CID` int(11) NOT NULL,
  `Year` varchar(20) NOT NULL,
  `Topic` varchar(300) NOT NULL,
  `content` longtext NOT NULL,
  `Name` mediumtext NOT NULL,
  `Weightage` int(11) NOT NULL,
  `Media` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tutorial`
--

INSERT INTO `tutorial` (`CID`, `Year`, `Topic`, `content`, `Name`, `Weightage`, `Media`) VALUES
(5, '2018', 'Advance concept, Latet trending syntax', '<p>A JSP becomes a servlet. You don&rsquo;t directly create servlet, it is generated by&nbsp;<strong>Container</strong>&nbsp;only. Container takes what you have written in your JSP, translates it into a servlet class source file then compiles that into a java servlet class. And this code would execute in the same as it were written in java file.</p>\r\n\r\n<h2>JSP Elements</h2>\r\n\r\n<p>There are 4 basic JSP elements.</p>\r\n\r\n<ul>\r\n	<li>Scriptlet</li>\r\n	<li>Directive</li>\r\n	<li>Expression</li>\r\n	<li>Declaration</li>\r\n</ul>\r\n\r\n<hr />\r\n<h3>Scriptlet</h3>\r\n\r\n<p>You might face the situation where you have to add&nbsp;<strong>Java code</strong>&nbsp;in JSP. You can use&nbsp;<em><strong>scriptlet</strong></em>.</p>\r\n\r\n<ol>\r\n	<li>&lt;%</li>\r\n	<li>&lt;a href=&quot;http://www.php.net/system&quot;&gt;system&lt;/a&gt;.out.println(&quot;Hello&quot;);</li>\r\n	<li>%&gt;</li>\r\n</ol>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<hr />\r\n<h3>Directive</h3>\r\n\r\n<h4>Type of Directive</h4>\r\n\r\n<p>Its a way to give instruction to Container on at page translation time. Type of Directive</p>\r\n\r\n<ul>\r\n	<li>page</li>\r\n	<li>include</li>\r\n	<li>taglib</li>\r\n</ul>\r\n\r\n<h5>Page Directive</h5>\r\n\r\n<p>There might be situation where you need to import some package in JSP like you do in java file. You can use directive for this purpose.</p>\r\n\r\n<h5>Syntax</h5>\r\n\r\n<ol>\r\n	<li>&lt;%@ %&gt;</li>\r\n</ol>\r\n\r\n<h5>Single package import</h5>\r\n\r\n<ol>\r\n	<li>&lt;%@ page import=&quot;java.lang.*&quot; %&gt;</li>\r\n</ol>\r\n\r\n<h5>Multiple package Import</h5>\r\n\r\n<ol>\r\n	<li>&lt;%@ page import=&quot;java.lang.*,java.lang.util.*&quot; %&gt;</li>\r\n</ol>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<hr />\r\n<h3>Expression</h3>\r\n\r\n<p>Expression is used when you want to provide some argument to statement that prints to the implicit response PrintWriter out. Expression becomes the argument to an out.print().</p>\r\n\r\n<h4>Syntax</h4>\r\n\r\n<p>Method parameter</p>\r\n\r\n<ol>\r\n	<li>&lt;%= contact.getName()%&gt;</li>\r\n</ol>\r\n\r\n<p>variable access</p>\r\n\r\n<ol>\r\n	<li>&lt;%= x %&gt;</li>\r\n</ol>\r\n\r\n<p><strong>Note:</strong>&nbsp;If there are local variable as well as instance variable then above statement will print the value of local variable if you want to print the instance variable then use&nbsp;<strong>this</strong>&nbsp;like below.</p>\r\n\r\n<ol>\r\n	<li>&lt;%= this.x %&gt;</li>\r\n</ol>\r\n\r\n<p>Here contact.getName will be provided as the argument to out implicit object as it is.&nbsp;<strong>Note:</strong>&nbsp;DO not place&nbsp;<em><strong>&rdquo;;&rdquo;</strong></em>&nbsp;in the end of expression.<br />\r\n<em><strong>Note:</strong></em>&nbsp;All scriptlet and expression code lands in a&nbsp;<strong>service method</strong>. So all the variables declared in scriptlet will be a&nbsp;<strong>local variable</strong>. To make a&nbsp;<strong>class level variable</strong>&nbsp;JSP declaration can be used.</p>\r\n\r\n<hr />\r\n<h3>Declaration</h3>\r\n\r\n<p>JSP declaration defined inside the class but outside the service method. It means declaration is for static and instance variable and methods.</p>\r\n\r\n<h4>Syntax</h4>\r\n\r\n<p>Variable declaration</p>\r\n\r\n<ol>\r\n	<li>&lt;%! int i=0;%&gt;</li>\r\n</ol>\r\n\r\n<p>Method Declaration</p>\r\n\r\n<ol>\r\n	<li>&lt;%! String getName()</li>\r\n	<li>{</li>\r\n	<li>String name = &quot;JBT&quot;;</li>\r\n	<li>return name;</li>\r\n	<li>}</li>\r\n	<li>%&gt;</li>\r\n</ol>\r\n\r\n<p><strong>Note:</strong>&nbsp;Here we are using&nbsp;<strong>&rdquo;;&rdquo;</strong>&nbsp;in the end as it be statment in generated java file. So it is required.</p>\r\n\r\n<h2>Implicit Object</h2>\r\n\r\n<p>There are some implicit object which container will provide to use directly in JSP these are called Implicit Object. There are 9 implicit Object in JSP</p>\r\n\r\n<ul>\r\n	<li>out</li>\r\n	<li>request</li>\r\n	<li>response</li>\r\n	<li>session</li>\r\n	<li>application</li>\r\n	<li>config</li>\r\n	<li>exception</li>\r\n	<li>pageContext</li>\r\n	<li>page</li>\r\n</ul>\r\n\r\n<p>These implicit objects are map to Object from Servlet/JSP&nbsp;API.</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th>\r\n			<h1>JSP Tutorial</h1>\r\n			<img alt="JSP tutorial with example" height="150" src="https://www.javatpoint.com/images/jsp/jsp2.jpg" width="150" />\r\n			<p><strong>JSP</strong>&nbsp;technology is used to create web application just like Servlet technology. It can be thought of as an extension to Servlet because it provides more functionality than servlet such as expression language, JSTL, etc.</p>\r\n\r\n			<p>A JSP page consists of HTML tags and JSP tags. The JSP pages are easier to maintain than Servlet because we can separate designing and development. It provides some additional features such as Expression Language, Custom Tags, etc.</p>\r\n\r\n			<h3>Advantages of JSP over Servlet</h3>\r\n\r\n			<p>There are many advantages of JSP over the Servlet. They are as follows:</p>\r\n\r\n			<h4>1) Extension to Servlet</h4>\r\n\r\n			<p>JSP technology is the extension to Servlet technology. We can use all the features of the Servlet in JSP. In addition to, we can use implicit objects, predefined tags, expression language and Custom tags in JSP, that makes JSP development easy.</p>\r\n\r\n			<h4>2) Easy to maintain</h4>\r\n\r\n			<p>JSP can be easily managed because we can easily separate our business logic with presentation logic. In Servlet technology, we mix our business logic with the presentation logic.</p>\r\n\r\n			<h4>3) Fast Development: No need to recompile and redeploy</h4>\r\n\r\n			<p>If JSP page is modified, we don&#39;t need to recompile and redeploy the project. The Servlet code needs to be updated and recompiled if we have to change the look and feel of the application.</p>\r\n\r\n			<h4>4) Less code than Servlet</h4>\r\n\r\n			<p>In JSP, we can use many tags such as action tags, JSTL, custom tags, etc. that reduces the code. Moreover, we can use EL, implicit objects, etc.</p>\r\n\r\n			<hr />\r\n			<h3>The Lifecycle of a JSP Page</h3>\r\n\r\n			<p>The JSP pages follow these phases:</p>\r\n\r\n			<ul>\r\n				<li>Translation of JSP Page</li>\r\n				<li>Compilation of JSP Page</li>\r\n				<li>Classloading (the classloader loads class file)</li>\r\n				<li>Instantiation (Object of the Generated Servlet is created).</li>\r\n				<li>Initialization ( the container invokes jspInit() method).</li>\r\n				<li>Request processing ( the container invokes _jspService() method).</li>\r\n				<li>Destroy ( the container invokes jspDestroy() method).</li>\r\n			</ul>\r\n\r\n			<h4>Note: jspInit(), _jspService() and jspDestroy() are the life cycle methods of JSP.</h4>\r\n			<img alt="How JSP is converted into Servlet" src="https://www.javatpoint.com/images/jspflow.JPG" />\r\n			<p>As depicted in the above diagram, JSP page is translated into Servlet by the help of JSP translator. The JSP translator is a part of the web server which is responsible for translating the JSP page into Servlet. After that, Servlet page is compiled by the compiler and gets converted into the class file. Moreover, all the processes that happen in Servlet are performed on JSP later like initialization, committing response to the browser and destroy.</p>\r\n\r\n			<hr />\r\n			<h3>Creating a simple JSP Page</h3>\r\n\r\n			<p>To create the first JSP page, write some HTML code as given below, and save it by .jsp extension. We have saved this file as index.jsp. Put it in a folder and paste the folder in the web-apps directory in apache tomcat to run the JSP page.</p>\r\n			<strong>index.jsp</strong>\r\n\r\n			<p>Let&#39;s see the simple example of JSP where we are using the scriptlet tag to put Java code in the JSP page. We will learn scriptlet tag later.</p>\r\n\r\n			<ol start="1">\r\n				<li>&lt;html&gt;&nbsp;&nbsp;</li>\r\n				<li>&lt;body&gt;&nbsp;&nbsp;</li>\r\n				<li>&lt;%&nbsp;out.print(2*5);&nbsp;%&gt;&nbsp;&nbsp;</li>\r\n				<li>&lt;/body&gt;&nbsp;&nbsp;</li>\r\n				<li>&lt;/html&gt;&nbsp;&nbsp;</li>\r\n			</ol>\r\n\r\n			<p>It will print&nbsp;<strong>10</strong>&nbsp;on the browser.</p>\r\n\r\n			<h3>How to run a simple JSP Page?</h3>\r\n\r\n			<p>Follow the following steps to execute this JSP page:</p>\r\n\r\n			<ul>\r\n				<li>Start the server</li>\r\n				<li>Put the JSP file in a folder and deploy on the server</li>\r\n				<li>Visit the browser by the URL http://localhost:portno/contextRoot/jspfile, for example, http://localhost:8888/myapplication/index.jsp</li>\r\n			</ul>\r\n\r\n			<hr />\r\n			<h3>Do I need to follow the directory structure to run a simple JSP?</h3>\r\n\r\n			<p>No, there is no need of directory structure if you don&#39;t have class files or TLD files. For example, put JSP files in a folder directly and deploy that folder. It will be running fine. However, if you are using Bean class, Servlet or TLD file, the directory structure is required.</p>\r\n\r\n			<hr />\r\n			<h3>The Directory structure of JSP</h3>\r\n\r\n			<p>The directory structure of JSP page is same as Servlet. We contain the JSP page outside the WEB-INF folder or in any directory.</p>\r\n			<img alt="The directory structure of JSP" src="https://www.javatpoint.com/images/jspdirectory.JPG" />\r\n			<hr />\r\n			<p>Topics of JSP Tutorial</p>\r\n\r\n			<table>\r\n				<tbody>\r\n					<tr>\r\n						<td>\r\n						<ol>\r\n							<li><a href="https://www.javatpoint.com/jsp">JSP with Lifecycle</a></li>\r\n							<li><a href="https://www.javatpoint.com/jsp-api">JSP API</a></li>\r\n							<li><a href="https://www.javatpoint.com/creating-jsp-in-eclipse-ide">JSP in Eclipse</a></li>\r\n							<li>Scripting elements\r\n							<ul>\r\n								<li><a href="https://www.javatpoint.com/jsp-scriptlet-tag">Scriptlet tag</a></li>\r\n								<li><a href="https://www.javatpoint.com/jsp-expression-tag">Expression tag</a></li>\r\n								<li><a href="https://www.javatpoint.com/jsp-declaration-tag">Declaration tag</a></li>\r\n							</ul>\r\n							</li>\r\n							<li><a href="https://www.javatpoint.com/jsp-implicit-objects">Implicit Objects</a></li>\r\n							<li>Directive elements\r\n							<ul>\r\n								<li><a href="https://www.javatpoint.com/jsp-page-directive">Page directive</a></li>\r\n								<li><a href="https://www.javatpoint.com/jsp-include-directive">Include directive</a></li>\r\n								<li><a href="https://www.javatpoint.com/jsp-taglib-directive">Taglib directive</a></li>\r\n							</ul>\r\n							</li>\r\n							<li><a href="https://www.javatpoint.com/exception-handling-in-jsp">Exception Handling</a></li>\r\n							<li><a href="https://www.javatpoint.com/jsp-action-tags-forward-action">Action Elements</a></li>\r\n							<li><a href="https://www.javatpoint.com/EL-expression-in-jsp">Expression Language</a></li>\r\n							<li><a href="https://www.javatpoint.com/MVC-in-jsp">MVC in JSP</a></li>\r\n							<li><a href="https://www.javatpoint.com/jstl">JSTL</a></li>\r\n							<li><a href="https://www.javatpoint.com/custom-tags">Custom tags</a></li>\r\n							<li><a href="https://www.javatpoint.com/registration-form-in-jsp">Development in JSP</a></li>\r\n						</ol>\r\n						</td>\r\n					</tr>\r\n				</tbody>\r\n			</table>\r\n			</th>\r\n			<th>&nbsp;</th>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h2>JSP Comment</h2>\r\n\r\n<p>You can put comments in JSP and there are two type of comments in JSP.</p>\r\n', 'Chapter 2 - Advanced Concept', 20, 'MediaFiles/test1.mp4'),
(5, '2018', 'Some basics about JSP', '<p>A JSP becomes a servlet. You don&rsquo;t directly create servlet, it is generated by&nbsp;<strong>Container</strong>&nbsp;only. Container takes what you have written in your JSP, translates it into a servlet class source file then compiles that into a java servlet class. And this code would execute in the same as it were written in java file.</p>\r\n\r\n<h2>JSP Elements</h2>\r\n\r\n<p>There are 4 basic JSP elements.</p>\r\n\r\n<ul>\r\n	<li>Scriptlet</li>\r\n	<li>Directive</li>\r\n	<li>Expression</li>\r\n	<li>Declaration</li>\r\n</ul>\r\n\r\n<hr />\r\n<h3>Scriptlet</h3>\r\n\r\n<p>You might face the situation where you have to add&nbsp;<strong>Java code</strong>&nbsp;in JSP. You can use&nbsp;<em><strong>scriptlet</strong></em>.</p>\r\n\r\n<ol>\r\n	<li>&lt;%</li>\r\n	<li>&lt;a href=&quot;http://www.php.net/system&quot;&gt;system&lt;/a&gt;.out.println(&quot;Hello&quot;);</li>\r\n	<li>%&gt;</li>\r\n</ol>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<hr />\r\n<h3>Directive</h3>\r\n\r\n<h4>Type of Directive</h4>\r\n\r\n<p>Its a way to give instruction to Container on at page translation time. Type of Directive</p>\r\n\r\n<ul>\r\n	<li>page</li>\r\n	<li>include</li>\r\n	<li>taglib</li>\r\n</ul>\r\n\r\n<h5>Page Directive</h5>\r\n\r\n<p>There might be situation where you need to import some package in JSP like you do in java file. You can use directive for this purpose.</p>\r\n\r\n<h5>Syntax</h5>\r\n\r\n<ol>\r\n	<li>&lt;%@ %&gt;</li>\r\n</ol>\r\n\r\n<h5>Single package import</h5>\r\n\r\n<ol>\r\n	<li>&lt;%@ page import=&quot;java.lang.*&quot; %&gt;</li>\r\n</ol>\r\n\r\n<h5>Multiple package Import</h5>\r\n\r\n<ol>\r\n	<li>&lt;%@ page import=&quot;java.lang.*,java.lang.util.*&quot; %&gt;</li>\r\n</ol>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<hr />\r\n<h3>Expression</h3>\r\n\r\n<p>Expression is used when you want to provide some argument to statement that prints to the implicit response PrintWriter out. Expression becomes the argument to an out.print().</p>\r\n\r\n<h4>Syntax</h4>\r\n\r\n<p>Method parameter</p>\r\n\r\n<ol>\r\n	<li>&lt;%= contact.getName()%&gt;</li>\r\n</ol>\r\n\r\n<p>variable access</p>\r\n\r\n<ol>\r\n	<li>&lt;%= x %&gt;</li>\r\n</ol>\r\n\r\n<p><strong>Note:</strong>&nbsp;If there are local variable as well as instance variable then above statement will print the value of local variable if you want to print the instance variable then use&nbsp;<strong>this</strong>&nbsp;like below.</p>\r\n\r\n<ol>\r\n	<li>&lt;%= this.x %&gt;</li>\r\n</ol>\r\n\r\n<p>Here contact.getName will be provided as the argument to out implicit object as it is.&nbsp;<strong>Note:</strong>&nbsp;DO not place&nbsp;<em><strong>&rdquo;;&rdquo;</strong></em>&nbsp;in the end of expression.<br />\r\n<em><strong>Note:</strong></em>&nbsp;All scriptlet and expression code lands in a&nbsp;<strong>service method</strong>. So all the variables declared in scriptlet will be a&nbsp;<strong>local variable</strong>. To make a&nbsp;<strong>class level variable</strong>&nbsp;JSP declaration can be used.</p>\r\n\r\n<hr />\r\n<h3>Declaration</h3>\r\n\r\n<p>JSP declaration defined inside the class but outside the service method. It means declaration is for static and instance variable and methods.</p>\r\n\r\n<h4>Syntax</h4>\r\n\r\n<p>Variable declaration</p>\r\n\r\n<ol>\r\n	<li>&lt;%! int i=0;%&gt;</li>\r\n</ol>\r\n\r\n<p>Method Declaration</p>\r\n\r\n<ol>\r\n	<li>&lt;%! String getName()</li>\r\n	<li>{</li>\r\n	<li>String name = &quot;JBT&quot;;</li>\r\n	<li>return name;</li>\r\n	<li>}</li>\r\n	<li>%&gt;</li>\r\n</ol>\r\n\r\n<p><strong>Note:</strong>&nbsp;Here we are using&nbsp;<strong>&rdquo;;&rdquo;</strong>&nbsp;in the end as it be statment in generated java file. So it is required.</p>\r\n\r\n<h2>Implicit Object</h2>\r\n\r\n<p>There are some implicit object which container will provide to use directly in JSP these are called Implicit Object. There are 9 implicit Object in JSP</p>\r\n\r\n<ul>\r\n	<li>out</li>\r\n	<li>request</li>\r\n	<li>response</li>\r\n	<li>session</li>\r\n	<li>application</li>\r\n	<li>config</li>\r\n	<li>exception</li>\r\n	<li>pageContext</li>\r\n	<li>page</li>\r\n</ul>\r\n\r\n<p>These implicit objects are map to Object from Servlet/JSP&nbsp;API.</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th>IMPLICIT OBJECT</th>\r\n			<th>API</th>\r\n		</tr>\r\n		<tr>\r\n			<td>out</td>\r\n			<td>JspWriter</td>\r\n		</tr>\r\n		<tr>\r\n			<td>request</td>\r\n			<td>HttpServletRequest</td>\r\n		</tr>\r\n		<tr>\r\n			<td>response</td>\r\n			<td>HttpServletResponse</td>\r\n		</tr>\r\n		<tr>\r\n			<td>session</td>\r\n			<td>HttpSession</td>\r\n		</tr>\r\n		<tr>\r\n			<td>application</td>\r\n			<td>ServletContext</td>\r\n		</tr>\r\n		<tr>\r\n			<td>config</td>\r\n			<td>ServletConfig</td>\r\n		</tr>\r\n		<tr>\r\n			<td>exception</td>\r\n			<td>Throwable</td>\r\n		</tr>\r\n		<tr>\r\n			<td>pageContext</td>\r\n			<td>PageContext</td>\r\n		</tr>\r\n		<tr>\r\n			<td>page</td>\r\n			<td>Object</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h2>JSP Comment</h2>\r\n\r\n<p>You can put comments in JSP and there are two type of comments in JSP.</p>\r\n', 'Chapter 1 - Intro', 10, 'MediaFiles/test.mp4'),
(7, '2018', 'something', '<p><strong>hiieieiieie</strong></p>\r\n', 'chp1', 10, 'MediaFiles/test.mp4'),
(9, '2018', 'something', '<p>something</p>\r\n', 'something', 20, 'MediaFiles/test.mp4'),
(10, '2018', 'test', '<p>test</p>\r\n', 'test', 20, 'MediaFiles/test.mp4');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `Username` varchar(30) NOT NULL,
  `Password` text NOT NULL,
  `Fname` char(20) NOT NULL,
  `Mname` char(20) DEFAULT NULL,
  `Lname` char(20) DEFAULT NULL,
  `EmailID` varchar(60) NOT NULL,
  `ContactNo` varchar(20) NOT NULL,
  `Address` mediumtext NOT NULL,
  `DOB` varchar(30) NOT NULL,
  `Age` int(11) NOT NULL,
  `Quest` varchar(100) NOT NULL,
  `Ans` varchar(100) DEFAULT NULL,
  `CreationTime` timestamp(2) NOT NULL DEFAULT CURRENT_TIMESTAMP
) ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`Username`, `Password`, `Fname`, `Mname`, `Lname`, `EmailID`, `ContactNo`, `Address`, `DOB`, `Age`, `Quest`, `Ans`, `CreationTime`, `LastModified`) VALUES
('Faculty', '4321', 'Faculty', 'Faculty', 'Faculty', 'faculty1@gmail.com', '8879411425', 'kalina', '1998-11-12', 23, 'What is Your Car Numbers', '8108', '2018-10-13 19:32:36.07', '2018-10-13 19:32:11.00'),
('obaid', 'Faculty@1234', 'Obaid', 'abdul', 'kazi', 'obaidkazi03@gmail.com', '7208377337', 'mumbai', '1998-11-12', 21, 'What is the first name of your best friend in high school', 'SD', '2018-10-13 10:30:04.74', '2018-10-13 09:38:21.00'),
('rehan', 'Student@1234', 'Rehan', 'noorul', 'khan', 'rehankhan@gmail.com', '8898112335', 'kalina', '1998-11-12', 20, 'What is Your Car Numbers', '8108', '2018-10-13 08:00:48.52', '2018-10-13 07:28:50.00'),
('shadab', 'Admin@1234', 'Shadab', 'Murad', 'Shaikh', 'shaikhshadabali2@gmail.com', '7506455707', 'Kalina', '1998-11-12', 20, 'What is the first name of your best friend in high school', 'RH', '2018-10-02 05:48:17.67', '2018-10-02 01:34:12.00'),
('Student', '4321', 'Student', 'Student', 'Student', 'student@gmail.com', '8898115263', 'kalina', '1998-11-12', 25, 'What is the first name of your best friend in high school', 'RH', '2018-10-13 19:35:21.32', '2018-10-13 19:29:09.00'),
('test', 'test', 'test', 'test', 'test', 'testing@gmail.com', '8898112236', 'mumbai', '1998-11-12', 20, 'What is Your Car Numbers', 'SD', '2018-10-14 16:37:21.00', '2018-10-14 16:37:21.00'),
('testing', '4321', 'test', 'test', 'test', 'test@gmail.com', '8898111136', 'kalina', '1998-11-12', 32, 'What is Your Car Numbers', '8108', '2018-10-14 16:07:40.24', '2018-10-14 16:06:30.00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `belongs`
--
ALTER TABLE `belongs`
  ADD PRIMARY KEY (`GroupName`,`Username`),
  ADD KEY `fk_Groups_has_Users_Users1_idx` (`Username`),
  ADD KEY `fk_Groups_has_Users_Groups_idx` (`GroupName`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`CID`),
  ADD UNIQUE KEY `CPreq_UNIQUE` (`CPreq`),
  ADD KEY `fk_dept_id` (`dept_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`dept_id`),
  ADD UNIQUE KEY `dept_name_UNIQUE` (`dept_name`),
  ADD KEY `fk_Department_Faculty_idx` (`hod`);

--
-- Indexes for table `dummy`
--
ALTER TABLE `dummy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`FID`),
  ADD KEY `Facult_Users_FK_idx` (`Username`),
  ADD KEY `fk_Faculty_Department_idx` (`dept_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`RNO`),
  ADD KEY `fk_Student_Users1_idx` (`Username`),
  ADD KEY `fk_Student_Department_idx` (`dept_id`);

--
-- Indexes for table `teaches`
--
ALTER TABLE `teaches`
  ADD PRIMARY KEY (`CID`,`FID`,`Year`),
  ADD KEY `fk_Course_has_Faculty_Faculty1_idx` (`FID`),
  ADD KEY `fk_Course_has_Faculty_Course1_idx` (`CID`);

--
-- Indexes for table `tutorial`
--
ALTER TABLE `tutorial`
  ADD PRIMARY KEY (`CID`,`Year`,`Topic`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `CID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `dept_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `dummy`
--
ALTER TABLE `dummy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `enquiry`
--
ALTER TABLE `enquiry`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `faculty`
--
ALTER TABLE `faculty`
  MODIFY `FID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `RNO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `belongs`
--
ALTER TABLE `belongs`
  ADD CONSTRAINT `fk_Groups_has_Users_Groups` FOREIGN KEY (`GroupName`) REFERENCES `groups` (`GroupName`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Groups_has_Users_Users1` FOREIGN KEY (`Username`) REFERENCES `users` (`Username`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `fk_dept_id` FOREIGN KEY (`dept_id`) REFERENCES `department` (`dept_id`);

--
-- Constraints for table `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `fk_Department_Faculty` FOREIGN KEY (`hod`) REFERENCES `faculty` (`FID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `faculty`
--
ALTER TABLE `faculty`
  ADD CONSTRAINT `fk_Faculty_Department` FOREIGN KEY (`dept_id`) REFERENCES `department` (`dept_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Faculty_Users` FOREIGN KEY (`Username`) REFERENCES `users` (`Username`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `fk_Student_Department` FOREIGN KEY (`dept_id`) REFERENCES `department` (`dept_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Student_Users1` FOREIGN KEY (`Username`) REFERENCES `users` (`Username`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `teaches`
--
ALTER TABLE `teaches`
  ADD CONSTRAINT `fk_Course_has_Faculty_Course1` FOREIGN KEY (`CID`) REFERENCES `course` (`CID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Course_has_Faculty_Faculty1` FOREIGN KEY (`FID`) REFERENCES `faculty` (`FID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tutorial`
--
ALTER TABLE `tutorial`
  ADD CONSTRAINT `fk_Tutorial_Course` FOREIGN KEY (`CID`) REFERENCES `course` (`CID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
