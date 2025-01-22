<!--
Ohart ongi: README hau automatikoki sortu da <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>ri esker
EZ editatu eskuz.
-->

# Nextcloud Signaling YunoHost-erako

[![Integrazio maila](https://apps.yunohost.org/badge/integration/nextcloud-signaling)](https://ci-apps.yunohost.org/ci/apps/nextcloud-signaling/)
![Funtzionamendu egoera](https://apps.yunohost.org/badge/state/nextcloud-signaling)
![Mantentze egoera](https://apps.yunohost.org/badge/maintained/nextcloud-signaling)

[![Instalatu Nextcloud Signaling YunoHost-ekin](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=nextcloud-signaling)

*[Irakurri README hau beste hizkuntzatan.](./ALL_README.md)*

> *Pakete honek Nextcloud Signaling YunoHost zerbitzari batean azkar eta zailtasunik gabe instalatzea ahalbidetzen dizu.*  
> *YunoHost ez baduzu, kontsultatu [gida](https://yunohost.org/install) nola instalatu ikasteko.*

## Aurreikuspena

Improve performances and reliability of Nextcloud Talk. You should be able to make video calls with more than 3 persons.


**Paketatutako bertsioa:** 2.0.0~ynh2

## Pantaila-argazkiak

![Nextcloud Signaling(r)en pantaila-argazkia](./doc/screenshots/nextcloud-hub7-talk-preview.webp)

## Dokumentazioa eta baliabideak

- Jatorrizko aplikazioaren kode-gordailua: <https://github.com/strukturag/nextcloud-spreed-signaling>
- YunoHost Denda: <https://apps.yunohost.org/app/nextcloud-signaling>
- Eman errore baten berri: <https://github.com/YunoHost-Apps/nextcloud-signaling_ynh/issues>

## Garatzaileentzako informazioa

Bidali `pull request`a [`testing` abarrera](https://github.com/YunoHost-Apps/nextcloud-signaling_ynh/tree/testing).

`testing` abarra probatzeko, ondorengoa egin:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/nextcloud-signaling_ynh/tree/testing --debug
edo
sudo yunohost app upgrade nextcloud-signaling -u https://github.com/YunoHost-Apps/nextcloud-signaling_ynh/tree/testing --debug
```

**Informazio gehiago aplikazioaren paketatzeari buruz:** <https://yunohost.org/packaging_apps>
