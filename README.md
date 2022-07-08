# OpossumBot v.2
[![deploy-to-host](https://github.com/Contrastellar/OpossumBot/actions/workflows/deploy.yml/badge.svg)](https://github.com/Contrastellar/OpossumBot/actions/workflows/deploy.yml)

OpossumBot v.2 is a rework of contrastellar's original PossumBot Discord text bot. This bot is primarily made for fun, and with the idea of having fun and learning new things in Node.JS and in software development as a whole.

## Known Problems
The deploy task does not function as intented! Currently this bot is in a >PRERELEASE< state. This will be fixed later.

## Features
* A variety of self-hosted Opossum pictures
* Funny commands
* A 24/7 uptime bot
* My love and affection (mostly for Opossums) poured into a Discord bot

## Invite OpossumBot
[Go here!](http://invite.contrastellar.com "Redirect to a Discord Invite Page")

## Hosting
Currently, Opossumbot is hosted on a droplet in DigitalOcean. I'm currently paying ~$12/month for this, and it is constantly up. The host runs `apt-get dist-upgrade` at 05z (UTC), and reboots at 06z. Hourly `apt upgrades` are run as well. If you *manage* to crash the bot, the bot is configured in `systemd` vaugely according to the `OpossumBot.service` file that is in `./etc/`, which includes automatically restarting the `node` task.

## Contribute
Suggestions for the bot are always welcome, please either start an issue, or fork and make a pull request! I'll take a look at it as soon as I can!
To run locally, you do need to pull the requisite NPM Dependencies (as listed below). In the future, I'm working to set up a system that permits you to test your changes against a "duplicate" database that's separate from production, and lets users do small-scale testing. Or, of course, you can test against your own MySQL Database, running either your own schema, or using the sample files provided in `./etc/*.mysql`

This is supposed to be a fun project, and I'm always happy to take suggestions!

## Dependencies 
* discord.js v.13.8.0
* fs v.0.0.1-security
* mysql2 v.2.3.3
* node-fetch v.3.2.6
* ping v.0.4.2
* ws v.8.8.0
* yargs v.17.5.1

## Special Thanks
* MTU Huskies Discord for the original idea, and the triple-dog dare in order to even make this at all. Their continuous harassment of my bot has been a great motivator to make it better.
* NFreak and Scholarr_ (on twitter) for their ideas and suggestions when I rewrote this bot in 2020.
* @jeongm-in (Plep) for being a lil development buddy and giving me ideas for DB management and (hopefully) setting up GitHub Actions
* @MiGhTyMech12 for spell-checking the README.
* to ethan, who is solely responsible.
