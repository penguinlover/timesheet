# Timesheet

USE

Timesheet record the start and end time of tasks, or just the duration. It may contain a breakdown of tasks accomplished throughout the project or program. This informaiton may be used for payroll, client billing, and increasingly for project planning, estimation, tracking and managemnet.

Timesheet can also used to compare planned costs versus actual costs, as well as measuring employee performance and identifying problematic tasks. This knowledge can drive corporate strategy as users stop performing or reassign unprofitable work.

Have you ever seen timecards before? People usually use a 'time card' and 'punch in' by inserting their card into an automatic timestamp machine. Our goal is to use software to manage this activity.

## Overall Requirements

1.  Rails on Heroku

2.  Bootstrap & Backbone.js

3.  Store the data in backend into the force.com data model [Piyush wants to have ability to run reports using salesforce reporting functionality]. So we will have to setup a DE org and define our data model there using Salesforce custom objects. We could use databasedotcom gem or use SFDC rest API directly whatever works better. Once we get it working with a DE org we should be able to point the app to another org that Piyush can create using partner portal for Testing/Production.

4.  We need to support login/user management on our own [we can use something like Janrain that can allow comity guys to login using their Google Apps account for comity]. If they are using comity gmail account it is ok to auto provision their user on our web app but otherwise someone needs to provision them before they can login to the web app [so that Piyush can have control over who can login and setup new employees].

* There are two ways to register(sign up) an user into the system
  + A n user can only be created manually by Administrator, the user has the ability to create his/her own password.
  + An user can register by authenticating him/her-self via google app oauth, this way this user does not need to create any password in the system, but a user record is automatically created according to google account information.

* There are two mechanisms to sign in a user
  + User type in his/her email and password.
  + User uses google app account to login using oauth strategy.

5.  Also, we need to keep in mind data security by user role so that they can only see their own timesheets and not other people's timesheets etc. We will have to define this more once we have better data model.

* For new administrator will be able to go to admin page through http-basic-authentication, what's great about this is that the authentication is very elegant, the downside is that administrator has to close browser in order to kill the session.

## How Rails + Backbone.js works

Both Rails, Backbone.js follow MVC pattern, but there is some significent diferences

Here is which matches which

Rails     - |Model|•| Controller  |•|  View  |
Backbone  - |Model|•|Router • View|•|Template|

Here is a high level request-response flow

* -Start-
* A request from a user comes in; the **Rails router** identifies what should handle the request, based on the URL
* The **Rails controller** action to handle the request is called; some initial processing may be performed
* The **Rails view template** rendered and returned to the user's browser
* The **Rails view template** will include Backbone initialization; usually this is populating some _Backbone collections_ as sets of Backbone models with JSON data provided by the **Rails view**
* The **Backbone router** determines which of its methods should handle the display, based on the URL
* The **Backbone router** calls that method; some inital processing may be performed, and one or more **Backbone views** are rendered
* The **Backbone view** reads **templates** and uses **Backbone** models to render itself onto the page
* -Done Interface Ready-

User interactions

User can interacting with elements on the page at these levels: **Backbone model**, **Bakcbon view**, **Backbone routers**, requests to remote server.

* Normal requests that don't hit Backbone and trigger a full page load/reload
* Normal Ajax requests, not using Backbone at all.
* Ajax requests from the **Backbone model** or **Backbone collections**, communicating with Rails via JSON


## References & Resources

[Backbone peepcode](https://peepcode.com/products/backbone-js)

Backbone fundamentals - @addyosmani  
[1](http://addyosmani.com/blog/backbone-fundamentals)  
[2](http://addyosmani.github.com/backbone-fundamentals/)  
[3](http://addyosmani.github.com/backbone-fundamentals/#backboneboilerplate)  
[4](https://github.com/addyosmani/todomvc/tree/gh-pages/architecture-examples/backbone/js)  
[Backbone-boilerplate](https://github.com/tbranyen/backbone-boilerplate)  
[backbone-boilerplate doc](http://backboneboilerplate.com)  
[backbone-boilerplate installation](https://github.com/tbranyen/backbone-boilerplate/wiki/Installation)  
[grunt-bbb](https://github.com/backbone-boilerplate/grunt-bbb)  

Javascript - namespacing  
[1](http://elegantcode.com/2011/01/26/basic-javascript-part-8-namespaces)  
[2](http://addyosmani.com/blog/essential-js-namespacing)  

Backbone tutorials  
[Backbone patterns - partials](http://ricostacruz.com/backbone-patterns/#partials)  
[Backbone lessons learned](http://coenraets.org/blog/2012/01/backbone-js-lessons-learned-and-improved-sample-app)  
[Backbone tutorial - Wine-Cellar](https://github.com/joezimjs/Wine-Cellar)  
[Backbone Introduction](http://www.joezimjs.com/javascript/backbone-js-application-walkthrough-part-2-views-and-templates-video-tutorial)  
[Backbone app walkthrough part III](http://www.joezimjs.com/javascript/backbone-js-application-walkthrough-part-3-new-view-and-external-templating-video-tutorial)  
[Backbone data persistence](http://stackoverflow.com/questions/9816274/ways-to-save-backbone-js-model-data)  
[Backbone event binding issue](http://stackoverflow.com/questions/6831362/backbone-js-view-cant-unbind-events-properly)  
[JSfiddle](http://jsfiddle.net/GX8WJ/3)  
