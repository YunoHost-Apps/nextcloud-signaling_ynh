Don't forget to bind this High Performance backend signaling server to your Nextcloud instance, by following thoses steps:
 
 * In the config panel of this app, click on the `Display passwords` button
 * Copy the shared secret related to `__BACKENDS_URLS__`
 * Go on [the Nextcloud talk administration page](https://__BACKENDS_URLS__/settings/admin/talk)
 * In High performance infrastructure section, fill
    * URL: `wss://__DOMAIN____PATH__`
    * Check SSL certificate: `yes`
    * Shared secret: paste here the shared secret you copied at step 2
 * Try to create a Nextcloud Talk conversation, if it doesn't work at all, your signaling server probably don't work or doesn't authorize your instance as expected.

Important: If you don't do it before, you should also configured STURN and TURN.


A complete guide on how to install Nextcloud High Performance Backend (Nextcloud Signaling + CoTurn), can be found in YunoHost forum:
https://forum.yunohost.org/t/guide-to-install-nextcloud-hpb-high-performance-backend-nextcloud-signaling-coturn/42513
