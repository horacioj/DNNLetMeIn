# Evotiva - DNN LetMeIn
## DNN Emergency Create Host User Tool

## Description

OMG! Someone changed the super user password and now nobody knows how to access the site!
(ugh!, there was a single super user account created on the DNN instance) 

OMG! I've restored (with DNNBackup, of course) this site, but I don't know any user I can use to login!

OMG! The user is not configured to allow new user registrations, and anyway I don't have direct access to the database to make the 'issuperuser=true' trick!

Don't worry, download this "LetMeIn.aspx" page and upload it to the root of your web site. Then execute it by calling it in the browser (http://www.example.com/LetMeIn.aspx). You'll get a simple form like seen in the screenshot below. Create a new host (super)user and you'll be able to access your site.

Remember to delete "LetMeIn.aspx" as soon as you've finished!

![Evotiva LetMeIn](https://www.evotiva.com/Portals/0/images/LetMeIn_small.jpg "Evotiva Let Me In")

## How to use
- Copy the LetMeIn.aspx file to your web site's root folder.
- Open  n a web browser this URL: <yourwebsite>/LetMeIn.aspx 
- Use the web form (see the LetMeIn.jpg screenshot) to create a new host user.
- **IMPORTANT:** Delete the LetMeIn.aspx file from your web site's root folder.
- You can now login into your web site using the newly created host user account.
- Once you have normal access to the web site (and created or recovered true host, admin and whatever user accounts), you can delete the newly created host user account.

## Version History

- Created : Aug 10, 2010 
- Last Updated: Jul 10, 2017

## Project Sponsor

![Evotiva](https://www.evotiva.com/Portals/0/images/Logo-Evotiva-wbg.png "Evotiva")

This project was donated by [Evotiva](https://www.evotiva.com), makers of [DNN Backup](https://www.evotiva.com/Products/DNNBackup) DNN's premier backup/clone module, [DNN Upgrade](https://www.evotiva.com/Products/DNNUpgrade) accelerator tool, [DNN Global Storage](https://www.evotiva.com/Products/DNNGlobalStorage) (file system providers); which allows you to easily tie-in cloud-based external and local file systems, [DNN GlobalGallery](https://www.evotiva.com/Products/DNNGlobalGallery) The best way to create galleries of media you already have in your web site or favorite cloud storage provider, and [DNN UserFiles](https://www.evotiva.com/Products/DNN-User-Files), a flexible (template-based) Files and Documents manager with many unique and powerful options powered by DNN Global Storage or any other DNN folder provider, including DNN's default built-in providers: standard, secure and database.
